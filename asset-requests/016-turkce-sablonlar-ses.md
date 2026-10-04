# 016 · Faz 4a Türkçe şablonları: sayfa çevirme sesi

**Öncelik: DÜŞÜK** (Faz 4a). `story` (hikâye) şablonunda sayfa çevrilirken ve sorudan hikâyeye dönülürken çalan kısa efekt. Yoksa oyun sessiz geçer. Harf izleme (`trace`) ve hece kurma (`syllable_build`) mevcut efektleri kullanır (`sfx.tap`, `sfx.drop`, `sfx.correct`; parti 006).

Nano Banana ses üretmez. CC0 paketler önerilir (ör. **Kenney** ses paketleri, kenney.nl, CC0) ya da freesound.org'da **yalnızca CC0** lisanslı sesler. Kullandığın dosyanın kaynağını ve lisansını `assets/audio/LICENSES.md` dosyasına yaz (dosya adı, kaynak bağlantısı, lisans).

## Efektler (kısa, ≤1 sn)

| Kimlik | Dosya yolu | Ne |
|---|---|---|
| `sfx.page_turn` | `assets/audio/sfx/page_turn.ogg` | Kitap sayfası çevirme: yumuşak, kısa kâğıt "fışş"; sert ya da yüksek değil |

Notlar:
- `.ogg` (Vorbis), 44.1 kHz; ses seviyesi 006'daki efektlere yakın.

---
## Teslim kontrol listesi
- [ ] Dosya adı tablodaki ile birebir aynı
- [ ] Lisans `assets/audio/LICENSES.md`'ye yazıldı (yalnızca CC0 ya da açık kaynakla uyumlu lisanslar)
- [ ] Oyunda kontrol: hikâyede "sonraki" okuna basınca ses çalıyor, anlatımı bastırmıyor
- [ ] Commit: `assets: 016 sayfa çevirme sesi`
