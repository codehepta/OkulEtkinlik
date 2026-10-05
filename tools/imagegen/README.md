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

# Referanslı öğeler (ör. Bilge pozları) ya da stil referansıyla üretim
uv run --project tools/imagegen python tools/imagegen/generate.py 001 --items 2-10 --model klein
uv run --project tools/imagegen python tools/imagegen/generate.py 040 --model klein --style-ref assets/images/items/oyuncak/kup.png

# Seçilenleri yerleştir: öğe=tohum[:model]
uv run --project tools/imagegen python tools/imagegen/approve.py 060 1=1000 3=1001:klein

# Testler
cd tools/imagegen && uv run python -m unittest discover -s tests -t .
```

Çıktılar `build/imagegen/<parti>/<anahtar>/` altına gider: `s<tohum>_<model>.png` ham görsel, `_cut.png` arka planı silinmiş hâli, `.json` üretim kaydı. Her parti için `sheet_<model>.png` seçim sayfası oluşur.

`assets/` içinde zaten bulunan öğeler atlanır (`--force` ile yeniden üretilir). Referans görseli henüz olmayan öğeler (ör. `sheet.png` yokken Bilge pozları) atlanır.

## Kaynak kaydı
`approve.py` her onaylı görsel için model, sürüm, tohum, prompt ve referansları `docs/assets/image-provenance.jsonl` dosyasına ekler. Bu kayıt lisans takibi ve gerektiğinde aynı görseli yeniden üretmek içindir.
