"""Sayı / saat / para / tek kelime: yalnızca düz biçimler ('X!' ve 'X.'). Sahip, giriş cümleli kesimler yerine
düz biçimin iyi tohumunu seçti (Cam şişe, Zübeyde Hanım, Kâğıt kutusu, Sepeti seç)."""
import rules
def variants(key, text):
    v = rules.variants(key, text)
    plain = [x for x in v if not x["carrier"]][:2]
    return plain or v  # yalnız giriş cümleli biçimi olanlar (kart eki, soru eki) kalıpla üretilir
heard_ok = rules.heard_ok
CARRIER = rules.CARRIER
