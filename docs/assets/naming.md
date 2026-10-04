# Asset İsimlendirme Sözleşmesi

Oyun, asset dosyalarını **mantıksal anahtardan** otomatik olarak bulur. Dosyayı doğru klasöre doğru isimle koymak yeterlidir; kod değişikliği gerekmez.

## Kurallar
- Dosya ve klasör adları: küçük harf, İngilizce karakter, kelimeler `_` ile ayrılır. Türkçe karakter kullanılmaz (`ı→i, ğ→g, ü→u, ş→s, ö→o, ç→c`).
- Görsel formatı: **PNG**. Sprite'larda şeffaf arka plan zorunlu, arka planlarda şeffaflık yok.
- Ses formatı: `.ogg` (tercih), `.wav` ya da `.mp3`. Oyun bu sırayla arar.
- Anahtardaki noktalar klasör ayırıcısına dönüşür. İlk parça kök klasörü belirler.

## Anahtar → yol tablosu

| Anahtar öneki | Örnek anahtar | Dosya yolu |
|---|---|---|
| `char.` | `char.bilge.happy` | `assets/images/characters/bilge/happy.png` |
| `avatar.` | `avatar.tavsan` | `assets/images/avatars/tavsan.png` |
| `region.` | `region.sayi_ormani.bg` | `assets/images/regions/sayi_ormani/bg.png` |
| `map.` | `map.island` | `assets/images/map/island.png` |
| `item.` | `item.meyve.elma` | `assets/images/items/meyve/elma.png` |
| `ui.` | `ui.star` | `assets/images/ui/star.png` |
| `st.` | `st.matematik.elma` | `assets/images/stickers/matematik/elma.png` |
| `decor.` | `decor.lamba` | `assets/images/decor/lamba.png` |
| `vo.` | `vo.genel.aferin_1` | `assets/audio/voice/genel/aferin_1.ogg` |
| `music.` | `music.sayi_ormani` | `assets/audio/music/sayi_ormani.ogg` |
| `sfx.` | `sfx.correct` | `assets/audio/sfx/correct.ogg` |

Ses satırlarında (`vo.`) birden fazla parça varsa ilk parçadan sonrası alt klasörlere dönüşür: `vo.g1.matematik.u01.n01.intro` → `assets/audio/voice/g1/matematik/u01/n01/intro.ogg`.

## Bölge klasör adları
`sayi_ormani`, `harf_vadisi`, `hayat_kasabasi`, `kesif_laboratuvari`, `agac_ev`
