# Yerel görsel üretimi (`tools/imagegen`)

`asset-requests/NNN-*.md` partilerindeki görseller için Mac'te yerel ve ücretsiz **aday** üretir. Adaylar `assets/`'e kendiliğinden girmez: sahip seçer, `approve.py` seçilenleri yerleştirir.

Yalnızca geliştirici aracıdır, uygulamaya girmez. Godot bu klasörü `.gdignore` sayesinde taramaz.

## Bileşenler ve lisanslar
| Bileşen | Sürüm | Lisans | Görev |
|---|---|---|---|
| [mflux](https://github.com/filipstrand/mflux) | 0.20.0 (sabit) | MIT | Apple MLX üzerinde model çalıştırma |
| Z-Image Turbo (`Tongyi-MAI/Z-Image-Turbo`) | — | Apache 2.0 | Metinden görsel (varsayılan) |
| FLUX.2 [klein] 4B (`black-forest-labs/FLUX.2-klein-4B`) | — | Apache 2.0 | Referans görselle üretim (Bilge pozları, stil referansı) |
| BiRefNet (`ZhengPeng7/BiRefNet`) | commit `e2bf8e4` (sabit) | MIT | Arka plan silme |

"Ticari olmayan" ya da "araştırma" lisanslı modeller (FLUX.2 klein 9B / dev, Qwen-Image-2.1 vb.) **kullanılmaz**: `assets/` CC BY 4.0'dır.

## Kurulum (bir kez)
```bash
cd tools/imagegen && uv sync
```
Model ağırlıkları ilk kullanımda Hugging Face önbelleğine (`~/.cache/huggingface`) iner: Z-Image ~33 GB, klein 4B ~24 GB, BiRefNet ~0,4 GB. Apple Silicon ve en az 48 GB bellek önerilir (Z-Image tepe kullanımı ~32 GB).

## Kullanım (repo kökünden)
```bash
# 060 partisinin 1–5. öğeleri, öğe başına 2 aday
uv run --project tools/imagegen python tools/imagegen/generate.py 060 --items 1-5

# Nesne ve sahne görselleri: klein, referanssız (önerilen; ~10 sn/görsel)
uv run --project tools/imagegen python tools/imagegen/generate.py 060 --model klein

# Referanslı öğeler (ör. Bilge pozları, karakter sayfası referans olur)
uv run --project tools/imagegen python tools/imagegen/generate.py 001 --items 2-10 --model klein

# Isınmayı sınırlamak için iş/dinlenme döngüsü (model molada bellekte kalır)
uv run --project tools/imagegen python tools/imagegen/generate.py 060 --model klein --work-minutes 12 --rest-minutes 18

# Geometrik öğeler (sekil/cisim/blok) difüzyona gönderilmez; Blender'da üretilir:
/Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup -P tools/imagegen/blender_geometry.py -- --pause 20

# Seçilenleri yerleştir: öğe=tohum[:model]
uv run --project tools/imagegen python tools/imagegen/approve.py 060 1=1000:klein 3=1001:klein
uv run --project tools/imagegen python tools/imagegen/approve.py 040 9=0:blender

# Yerleştirmeden sonra: içe aktar, APK ayarlarını uygula, yeniden içe aktar
godot --headless --path . --import
uv run --project tools/imagegen python tools/imagegen/import_presets.py
godot --headless --path . --import

# Testler
cd tools/imagegen && uv run python -m unittest discover -s tests -t .
```

Çıktılar `build/imagegen/<parti>/<anahtar>/` altına gider: `s<tohum>_<model>.png` ham görsel, `_cut.png` arka planı silinmiş hâli, `.json` üretim kaydı. Her parti için `sheet_<model>.png` seçim sayfası oluşur.

**Stil referansı uyarısı:** klein'ın düzenleme modu referans görseli "düzenlenecek görsel" sayar. İlgisiz onaylı görselleri stil referansı olarak vermek içeriğe sızar: ırmak, rüzgâr ve robot görsellerine elma ve civciv girdi, "yalnızca stil" talimatı da bunu engellemedi. Nesneler referanssız üretilir; ev stilinin tutarlılığı için onaylı görsellerle LoRA eğitilir.

Blender öğeleri sabit kamera ölçeğiyle çekilir ve `approve.py` bunları kırpmaz. Böylece "küçük kare / büyük kare" ve onluk/yüzlük arasındaki boyut farkı görselde korunur.

`assets/` içinde zaten bulunan öğeler atlanır (`--force` ile yeniden üretilir). Referans görseli henüz olmayan öğeler (ör. `sheet.png` yokken Bilge pozları) atlanır.

## APK boyutu
Kaynak PNG'ler 1024 px ve kayıpsızdır; doğrudan pakete girerse APK bütçeyi (150 MB) aşar: 244 görselle 196 MB olmuştu. `import_presets.py` her görselin Godot içe aktarma ayarını kayıplı WebP (kalite 0.8) ve uzun kenar sınırına çeker: nesne, ikon ve çıkartmalarda 512 px, karakterlerde 768 px, arka planlarda 2048 px. Pakete giren doku 145 MB'tan 6,4 MB'a iner ve görsel fark gözle seçilmez. Her yerleştirmeden sonra çalıştırılır.

## Kaynak kaydı
`approve.py` her onaylı görsel için model, sürüm, tohum, prompt ve referansları `docs/assets/image-provenance.jsonl` dosyasına ekler. Bu kayıt lisans takibi ve gerektiğinde aynı görseli yeniden üretmek içindir.
