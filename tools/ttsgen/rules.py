"""Seslendirme yazım kuralları (pilotta sahibin onayladığı desenler).

- Sesli harf (a, e, ı, i, o, ö, u, ü): 'Aaa.' ve 'A!' biçimleri.
- Sessiz harf: harfin adı 'Ne.' biçiminde (sessiz + e); ğ için 'Yumuşak ge.'.
- Hece: giriş cümlesi 'Şimdi okuyalım: an.' ile üretilir, son kelime kesilir.
- Kısa satır (≤ 2 kelime): ilk harf büyük; '!' ve '.' biçimleri; tek kelimede ayrıca giriş cümlesi.
- Okunuş düzeltmeleri SAY_AS ile (altmış → atmış).
- Zor harf/kelimelerde (ı, ö, c, arı) sahip giriş cümleli kesimi seçti.
- Uzun satır: metin olduğu gibi.
Her biçim birden çok tohumla üretilir; Whisper doğru duyan ve kesik olmayan adayı seçer.
"""
VOWELS = set("aeıioöuü")
# Okunuş düzeltmeleri: yazılış korunur, ses bu biçimle üretilir (sahibin kulağıyla bulundu).
SAY_AS = {"altmış": "atmış"}
CARRIER = "Şimdi okuyalım: "

def cap(t: str) -> str:
    return t[:1].upper() + t[1:]

def variants(key: str, text: str) -> list[dict]:
    t = text.strip()
    for a, b in SAY_AS.items():
        t = t.replace(a, b)
    if ".ses." in key and len(t) == 1:
        if t in VOWELS:
            u = cap(t)
            return [{"say": f"{u}{t}{t}.", "carrier": False}, {"say": f"{u}!", "carrier": False},
                    {"say": f"{CARRIER}{t}.", "carrier": True}]
        if t == "ğ":
            return [{"say": "Yumuşak ge.", "carrier": False}]
        return [{"say": f"{cap(t)}e.", "carrier": False}, {"say": f"{cap(t)}e!", "carrier": False},
                {"say": f"{CARRIER}{t}e.", "carrier": True}]
    if ".hece." in key:
        return [{"say": f"{CARRIER}{t}.", "carrier": True}]
    if len(t.split()) <= 2:
        base = cap(t.rstrip(".!?"))
        out = [{"say": base + "!", "carrier": False}, {"say": base + ".", "carrier": False}]
        if len(t.split()) == 1:  # zor tek kelimelerde (arı) giriş cümlesi kazandı
            out.append({"say": f"{CARRIER}{t.rstrip('.!?')}.", "carrier": True})
        return out
    return [{"say": t, "carrier": False}]

ONES = {"sıfır": 0, "bir": 1, "iki": 2, "üç": 3, "dört": 4, "beş": 5, "altı": 6, "yedi": 7, "sekiz": 8, "dokuz": 9}
TENS = {"on": 10, "yirmi": 20, "otuz": 30, "kırk": 40, "elli": 50, "altmış": 60, "yetmiş": 70, "seksen": 80, "doksan": 90}

def words_to_int(s: str):
    total, cur, seen = 0, 0, False
    for w in s.lower().replace(",", " ").split():
        if w in ONES: cur += ONES[w]; seen = True
        elif w in TENS: cur += TENS[w]; seen = True
        elif w == "yüz": cur = (cur or 1) * 100; seen = True
        elif w == "bin": total += (cur or 1) * 1000; cur = 0; seen = True
        else: return None
    return total + cur if seen else None

ONES_W = ["", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz"]
TENS_W = ["", "on", "yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan"]

def int_to_tr(n: int) -> str:
    if n == 0: return "sıfır"
    out = []
    if n >= 1000: out += ([] if n // 1000 == 1 else [int_to_tr(n // 1000)]) + ["bin"]; n %= 1000
    if n >= 100: out += ([] if n // 100 == 1 else [ONES_W[n // 100]]) + ["yüz"]; n %= 100
    if n >= 10: out.append(TENS_W[n // 10]); n %= 10
    if n: out.append(ONES_W[n])
    return " ".join(out)

def digits_to_words(s: str) -> str:
    """Whisper sayıları rakamla yazar ('Saat 10.30', '9-4'): karşılaştırmadan önce sözcüğe çevir."""
    import re
    s = re.sub(r"(\d+)[.:]30\b", lambda m: int_to_tr(int(m.group(1))) + " buçuk", s)
    s = re.sub(r"(\d+)[.:]00\b", lambda m: int_to_tr(int(m.group(1))), s)
    s = re.sub(r"(\d+)-(\d+)", lambda m: f"{m.group(1)} eksi {m.group(2)}", s)
    s = re.sub(r"(\d+)'?(\w*)", lambda m: int_to_tr(int(m.group(1))) + (m.group(2) and "" ), s)
    return s

def norm(s: str) -> str:
    import re
    return re.sub(r"[^\wçğıöşü ]", "", s.lower().replace("İ", "i").replace("I", "ı")).strip()

def heard_ok(expected: str, say: str, asr: str) -> bool:
    n = words_to_int(expected)
    a = norm(asr)
    if n is not None:
        digits = "".join(ch for ch in asr if ch.isdigit())
        return digits == str(n) or words_to_int(a) == n
    a = norm(digits_to_words(asr))
    e = norm(say.replace(CARRIER, ""))
    if len(expected.strip()) == 1:                      # harf: ilk harf eşleşsin yeter
        return a[:1] == norm(expected)[:1] or a.startswith(e[:2])
    if len(expected.split()) > 2:                       # cümle: küçük Whisper hatalarını tolere et
        import difflib
        return difflib.SequenceMatcher(None, a, norm(digits_to_words(expected))).ratio() >= 0.85
    return a == norm(expected) or a == e
