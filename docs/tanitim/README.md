# Tanıtım malzemeleri

Öğretmenlerin veli gruplarında paylaşması için hazırlanan malzemeler. Hepsi tek bir adrese yönlendirir:

**https://codehepta.github.io/OkulEtkinlik/** (kaynağı `site/`, yayın: `.github/workflows/pages.yml`)

Sayfa iPhone kullanıcısını App Store'a, Android kullanıcısını Google Play'e götürür. Adres hiç değişmeyeceği için görsel ve QR kod yeniden üretilmeden kullanılabilir.

| Dosya | Ne işe yarar |
|---|---|
| `ogretmen.png` | 1080×1350 WhatsApp görseli (kaynağı `ogretmen.html`). Kopyası `site/ogretmen.jpg`, sayfadaki "görseli indir" düğmesi bunu verir. |
| `onizleme.png` | 1200×630 bağlantı önizlemesi (kaynağı `onizleme.html`). Kopyası `site/img/onizleme.jpg` (`og:image`). |
| `qr.svg`, `qr.png` | Sayfa adresinin QR kodu (hata düzeltme H). Baskı için `qr.svg`. |

## Yeniden üretme

```bash
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CH" --headless=new --hide-scrollbars --force-device-scale-factor=1 --allow-file-access-from-files \
  --window-size=1080,1350 --virtual-time-budget=3000 \
  --screenshot="$PWD/docs/tanitim/ogretmen.png" "file://$PWD/docs/tanitim/ogretmen.html"
"$CH" --headless=new --hide-scrollbars --force-device-scale-factor=1 --allow-file-access-from-files \
  --window-size=1200,630 --virtual-time-budget=3000 \
  --screenshot="$PWD/docs/tanitim/onizleme.png" "file://$PWD/docs/tanitim/onizleme.html"
sips -s format jpeg -s formatOptions 88 docs/tanitim/ogretmen.png --out site/ogretmen.jpg
sips -s format jpeg -s formatOptions 85 docs/tanitim/onizleme.png --out site/img/onizleme.jpg
```

QR kod: `uv run --no-project --with segno python -c "import segno; q=segno.make('https://codehepta.github.io/OkulEtkinlik/', error='h'); q.save('docs/tanitim/qr.svg', scale=10, border=2, dark='#16161a', light=None)"`

Sayfayı yerelde görmek için: `python3 -m http.server 8767 --directory site`

## Google Play herkese açılınca

`site/index.html` içinde "Google Play: çok yakında" öğesini, hemen üstündeki yorumda duran bağlantıyla değiştir. "Android sürümü çok yakında" notunu (`.android-note`) da kaldır. Görsel ve QR kod değişmez.

## Hazır mesajlar

**Öğretmene gönderilecek mesaj:**

> Merhaba hocam, 1–3. sınıflar için MEB öğretim programlarıyla uyumlu, ücretsiz ve reklamsız bir eğitim oyunu hazırladım: Bilgi Adası. Uygulama internete bağlanmıyor, veri toplamıyor, satın alma da yok. Uygun görürseniz velilerinizle paylaşabilirsiniz; aşağıdaki görsel ve metin hazır.

**Öğretmenin veli grubuna atacağı mesaj (görselle birlikte):**

> Sevgili veliler, çocuklarımızın evde okul programına uygun şekilde tekrar yapabileceği ücretsiz bir eğitim oyunu: **Bilgi Adası**. Matematik, Türkçe, Hayat Bilgisi ve Fen Bilimleri etkinlikleri var; bütün yönergeler seslendirildiği için okumayı yeni öğrenen çocuklar da kendi başına oynayabiliyor. Reklam ve satın alma yok, internet gerektirmiyor.
> iPhone ve Android için: https://codehepta.github.io/OkulEtkinlik/
