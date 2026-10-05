# 082 · Hayat Bilgisi 3. sınıf görselleri

**Öncelik: ORTA** (Faz 5b, Hayat Kasabası). `content/g3/hayat_bilgisi/` ünitelerinde kullanılan nesne, davranış kartı ve sahne görselleri (149 sprite + 33 sahne). Önceki partilerde istenmiş nesneler (ör. `item.meyve.elma`, `item.hayvan.kus`) burada tekrar edilmez.

- **Davranış kartları** (`item.davranis.*`, `item.trafik.*` vb.) senaryo ve sınıflandırma oyunlarında yan yana durur; çocuk yazıyı okumadan, yalnızca resme bakarak davranışı anlamalı. Aynı çocuk figürünü (kil, tombul, büyük gözlü) bütün kartlarda kullanmaya çalış.
- **Sahneler** (16:9) durumu anlatan arka planlardır; arka planları silinmez. Hayat Kasabası paleti (sarı, gök mavisi, tuğla kırmızısı) kullanılır.
- Korkutucu, şiddet içeren ya da gerçek kişilere benzeyen görsel istenmez. Atatürk konulu görsellerde portre yok; yerler ve semboller var.
- Bütün sprite'ların arka planı silinir, şeffaf PNG kaydedilir.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SPRITE` ve `STYLE_SCENE` (promptların sonunda tam metin olarak yer alıyor).

> **Krokiler:** `item.kroki.park`, `item.kroki.okul` (sahne) ve `item.kroki.*_k` (kart) aynı mahalle çizimidir; yalnızca kırmızı yıldızın yeri değişir. Önce birini üret, diğerlerini aynı görseli referans vererek yıldızı taşıyarak üret.

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/simge/hak.png` | 1:1 | — | Hak |
| 2 | `assets/images/items/simge/sorumluluk.png` | 1:1 | — | Sorumluluk |
| 3 | `assets/images/items/hak/egitim.png` | 1:1 | — | Eğitim hakkı |
| 4 | `assets/images/items/hak/oyun.png` | 1:1 | — | Oyun hakkı |
| 5 | `assets/images/items/hak/saglik.png` | 1:1 | — | Sağlık hakkı |
| 6 | `assets/images/items/sorumluluk/odev.png` | 1:1 | — | Ödevini yapmak |
| 7 | `assets/images/items/sorumluluk/sinifi_temiz.png` | 1:1 | — | Sınıfı temiz tutmak |
| 8 | `assets/images/items/sorumluluk/kitabi_koru.png` | 1:1 | — | Kitaplara özen göstermek |
| 9 | `assets/images/items/sorumluluk/zamaninda_ver.png` | 1:1 | — | Kitabı zamanında vermek |
| 10 | `assets/images/items/sorumluluk/kitabi_unut.png` | 1:1 | — | Kitabı unutmak |
| 11 | `assets/images/items/sorumluluk/kitabi_yirt.png` | 1:1 | — | Kitabı yıpratmak |
| 12 | `assets/images/items/sahne/kutuphane_teslim.png` | 16:9 | — | Sahne: Kitap teslim günü |
| 13 | `assets/images/items/hak/oy_kullan.png` | 1:1 | — | Oy kullanmak |
| 14 | `assets/images/items/hak/oyunu_ver.png` | 1:1 | — | Oyunu başkasına vermek |
| 15 | `assets/images/items/hak/bahceye_cik.png` | 1:1 | — | Bahçeye çıkmak |
| 16 | `assets/images/items/sahne/sinif_secimi.png` | 16:9 | — | Sahne: Sınıf başkanlığı seçimi |
| 17 | `assets/images/items/hak/sirayla_oyna.png` | 1:1 | — | Sırayla oynamak |
| 18 | `assets/images/items/hak/topu_kap.png` | 1:1 | — | Topu kapmak |
| 19 | `assets/images/items/hak/oyunu_birak.png` | 1:1 | — | Oyundan küsüp gitmek |
| 20 | `assets/images/items/sahne/top_paylasilmiyor.png` | 16:9 | — | Sahne: Topu paylaşmayan arkadaş |
| 21 | `assets/images/items/saglik/mevsime_gore.png` | 1:1 | — | Mevsime göre giyinmek |
| 22 | `assets/images/items/saglik/duzenli_uyku.png` | 1:1 | — | Düzenli uyumak |
| 23 | `assets/images/items/saglik/el_yika.png` | 1:1 | — | Elleri yıkamak |
| 24 | `assets/images/items/saglik/ince_giyinmek.png` | 1:1 | — | Kışın ince giyinmek |
| 25 | `assets/images/items/saglik/yikanmamis_meyve.png` | 1:1 | — | Yıkanmamış meyve yemek |
| 26 | `assets/images/items/saglik/gec_ekran.png` | 1:1 | — | Geceleri ekrana bakmak |
| 27 | `assets/images/items/sahne/kar_sabah.png` | 16:9 | — | Sahne: Karlı sabah |
| 28 | `assets/images/items/saglik/disarida_oyna.png` | 1:1 | — | Dışarıda oynamak |
| 29 | `assets/images/items/saglik/ekrana_devam.png` | 1:1 | — | Ekrana devam etmek |
| 30 | `assets/images/items/saglik/cips_ye.png` | 1:1 | — | Cips yemek |
| 31 | `assets/images/items/sahne/ekran_yorgunu.png` | 16:9 | — | Sahne: Ekran başında yorulmak |
| 32 | `assets/images/items/guvenlik/priz.png` | 1:1 | — | Prize çatal sokmak |
| 33 | `assets/images/items/guvenlik/kask.png` | 1:1 | — | Kaskla bisiklete binmek |
| 34 | `assets/images/items/guvenlik/kitap_oku.png` | 1:1 | — | Kitap okumak |
| 35 | `assets/images/items/sahne/ev_ici.png` | 16:9 | — | Sahne: Evin içi |
| 36 | `assets/images/items/guvenlik/yangin_merdiven.png` | 1:1 | — | Yangında merdiveni kullanmak |
| 37 | `assets/images/items/guvenlik/ilac_buyuk.png` | 1:1 | — | İlacı büyüğünden almak |
| 38 | `assets/images/items/guvenlik/kapi_sor.png` | 1:1 | — | Kapıyı açmadan sormak |
| 39 | `assets/images/items/guvenlik/yangin_asansor.png` | 1:1 | — | Yangında asansöre binmek |
| 40 | `assets/images/items/guvenlik/ilac_seker.png` | 1:1 | — | İlacı şeker sanmak |
| 41 | `assets/images/items/guvenlik/yabanciya_ac.png` | 1:1 | — | Tanımadığına kapıyı açmak |
| 42 | `assets/images/items/guvenlik/aileyi_ara.png` | 1:1 | — | Kapıyı açmayıp ailesini aramak |
| 43 | `assets/images/items/guvenlik/adres_soyle.png` | 1:1 | — | Kapının arkasından konuşmak |
| 44 | `assets/images/items/sahne/kapi_caldi.png` | 16:9 | — | Sahne: Kapı çaldı |
| 45 | `assets/images/items/sonuc/guvenli_gecis.png` | 1:1 | — | Güvenle karşıya geçmek |
| 46 | `assets/images/items/sonuc/aceleci.png` | 1:1 | — | Acele edip koşmak |
| 47 | `assets/images/items/sonuc/oyun_oyna.png` | 1:1 | — | Yolda oyun oynamak |
| 48 | `assets/images/items/trafik/kavsak.png` | 16:9 | — | Sahne: Kavşak |
| 49 | `assets/images/items/sonuc/koltukta_kalir.png` | 1:1 | — | Ani frende güvende kalmak |
| 50 | `assets/images/items/trafik/kask_tak.png` | 1:1 | — | Kask takmak |
| 51 | `assets/images/items/sonuc/kafa_korunur.png` | 1:1 | — | Başı korunur |
| 52 | `assets/images/items/sonuc/araclar_durur.png` | 1:1 | — | Araçlar durur |
| 53 | `assets/images/items/trafik/yelek.png` | 1:1 | — | Yansıtıcı yelek giymek |
| 54 | `assets/images/items/sonuc/gece_gorunur.png` | 1:1 | — | Gece görünür olmak |
| 55 | `assets/images/items/simge/aile.png` | 1:1 | — | Aile |
| 56 | `assets/images/items/simge/toplum.png` | 1:1 | — | Toplum |
| 57 | `assets/images/items/aile/sofra.png` | 1:1 | — | Aile sofrası |
| 58 | `assets/images/items/aile/kardes_oyun.png` | 1:1 | — | Kardeşlerle oyun |
| 59 | `assets/images/items/aile/bebek_bakimi.png` | 1:1 | — | Bebek bakımı |
| 60 | `assets/images/items/toplum/pazar.png` | 1:1 | — | Mahalle pazarı |
| 61 | `assets/images/items/toplum/toren.png` | 1:1 | — | Okul töreni |
| 62 | `assets/images/items/toplum/park.png` | 1:1 | — | Kalabalık park |
| 63 | `assets/images/items/aile/evde_paylas.png` | 1:1 | — | Evde paylaşmak |
| 64 | `assets/images/items/toplum/paylas.png` | 1:1 | — | Komşularla paylaşmak |
| 65 | `assets/images/items/aile/evi_temizle.png` | 1:1 | — | Evi birlikte temizlemek |
| 66 | `assets/images/items/toplum/park_temizle.png` | 1:1 | — | Parkı birlikte temizlemek |
| 67 | `assets/images/items/aile/buyuge_saygi.png` | 1:1 | — | Evde büyüklere saygı |
| 68 | `assets/images/items/toplum/mahalle.png` | 1:1 | — | Mahalle ve toplum |
| 69 | `assets/images/items/toplum/tek_ev.png` | 1:1 | — | Tek başına bir ev |
| 70 | `assets/images/items/toplum/bos_sokak.png` | 1:1 | — | Boş sokak |
| 71 | `assets/images/items/sahne/aileler.png` | 16:9 | — | Sahne: Bir araya gelen aileler |
| 72 | `assets/images/items/meslek/firinci.png` | 1:1 | — | Fırıncı |
| 73 | `assets/images/items/meslek/doktor.png` | 1:1 | — | Doktor |
| 74 | `assets/images/items/meslek/sofor.png` | 1:1 | — | Şoför |
| 75 | `assets/images/items/meslek/ogretmen.png` | 1:1 | — | Öğretmen |
| 76 | `assets/images/items/meslek/itfaiyeci.png` | 1:1 | — | İtfaiyeci |
| 77 | `assets/images/items/meslek/kasaba_sabah.png` | 16:9 | — | Sahne: Kasabada sabah |
| 78 | `assets/images/items/sahne/temiz_sokak.png` | 1:1 | — | Tertemiz sokak |
| 79 | `assets/images/items/sahne/copler_kucuk.png` | 1:1 | — | Çöpler birikti |
| 80 | `assets/images/items/meslek/temizlik.png` | 16:9 | — | Sahne: Temizlik işçileri |
| 81 | `assets/images/items/sahne/copler_birikti.png` | 16:9 | — | Sahne: Çöpler birikmiş |
| 82 | `assets/images/items/meslek/ciftci.png` | 1:1 | — | Çiftçi |
| 83 | `assets/images/items/katki/yiyecek.png` | 1:1 | — | Yiyecek yetiştirir |
| 84 | `assets/images/items/katki/iyilesme.png` | 1:1 | — | İyileştirir |
| 85 | `assets/images/items/katki/yangin_sondu.png` | 1:1 | — | Yangını söndürür |
| 86 | `assets/images/items/katki/ogrenme.png` | 1:1 | — | Öğretir |
| 87 | `assets/images/items/koruma/cope_at.png` | 1:1 | — | Çöpünü kutuya atmak |
| 88 | `assets/images/items/koruma/yolda_yuru.png` | 1:1 | — | Yürüyüş yolundan çıkmamak |
| 89 | `assets/images/items/koruma/rehber.png` | 1:1 | — | Rehberi dinlemek |
| 90 | `assets/images/items/koruma/duvara_cizmek.png` | 1:1 | — | Tarihî duvara çizmek |
| 91 | `assets/images/items/koruma/cicek_koparmak.png` | 1:1 | — | Çiçek koparmak |
| 92 | `assets/images/items/koruma/ates_birakmak.png` | 1:1 | — | Ateşi söndürmeden bırakmak |
| 93 | `assets/images/items/koruma/vazgecir.png` | 1:1 | — | Arkadaşını vazgeçirmek |
| 94 | `assets/images/items/koruma/kazimak.png` | 1:1 | — | Taşa kazımak |
| 95 | `assets/images/items/koruma/tas_al.png` | 1:1 | — | Taş parçası almak |
| 96 | `assets/images/items/sahne/tarihi_kale.png` | 16:9 | — | Sahne: Tarihî kale |
| 97 | `assets/images/items/sahne/korunmus_tarih.png` | 1:1 | — | Korunan tarihî mekân |
| 98 | `assets/images/items/sahne/yikik_kale.png` | 1:1 | — | Yıkılmış tarihî mekân |
| 99 | `assets/images/items/sahne/kirli_dere.png` | 1:1 | — | Kirlenmiş dere |
| 100 | `assets/images/items/sahne/korursak.png` | 16:9 | — | Sahne: Hepimiz korursak |
| 101 | `assets/images/items/sahne/yonetim_arastirma.png` | 16:9 | — | Sahne: Yönetim şeklini araştırmak |
| 102 | `assets/images/items/kaynak/tbmm.png` | 1:1 | — | TBMM binası |
| 103 | `assets/images/items/kaynak/lunapark.png` | 1:1 | — | Lunapark |
| 104 | `assets/images/items/sahne/meclis_merak.png` | 16:9 | — | Sahne: Meclisi merak etmek |
| 105 | `assets/images/items/ataturk/kurtulus.png` | 16:9 | — | Sahne: Kurtuluş Savaşı |
| 106 | `assets/images/items/ataturk/harf.png` | 16:9 | — | Sahne: Millet Mektepleri |
| 107 | `assets/images/items/simge/guclendirir.png` | 1:1 | — | Birliği güçlendirir |
| 108 | `assets/images/items/simge/guclendirmez.png` | 1:1 | — | Birliği güçlendirmez |
| 109 | `assets/images/items/birlik/bayram.png` | 1:1 | — | Bayramı birlikte kutlamak |
| 110 | `assets/images/items/birlik/mac.png` | 1:1 | — | Millî takımı desteklemek |
| 111 | `assets/images/items/birlik/afet_yardim.png` | 1:1 | — | Afette dayanışmak |
| 112 | `assets/images/items/birlik/yalniz.png` | 1:1 | — | Etkinliğe katılmamak |
| 113 | `assets/images/items/birlik/alay.png` | 1:1 | — | Farklılıklarla alay etmek |
| 114 | `assets/images/items/birlik/yardimdan_kac.png` | 1:1 | — | Yardımdan kaçmak |
| 115 | `assets/images/items/birlik/koli.png` | 1:1 | — | Yardım kolisine katkı |
| 116 | `assets/images/items/birlik/ilgisiz.png` | 1:1 | — | İlgilenmemek |
| 117 | `assets/images/items/sahne/yardim_kampanyasi.png` | 16:9 | — | Sahne: Yardım kampanyası |
| 118 | `assets/images/items/sahne/yesil_bahce.png` | 1:1 | — | Yemyeşil bahçe |
| 119 | `assets/images/items/sahne/bos_bahce.png` | 1:1 | — | Çorak bahçe |
| 120 | `assets/images/items/sahne/fidan_dikim.png` | 16:9 | — | Sahne: Sınıfça fidan dikmek |
| 121 | `assets/images/items/yiyecek/bal.png` | 1:1 | — | Bal |
| 122 | `assets/images/items/yiyecek/peynir.png` | 1:1 | — | Peynir |
| 123 | `assets/images/items/doga/temiz_hava.png` | 1:1 | — | Temiz hava |
| 124 | `assets/images/items/doga/orman_sahne.png` | 16:9 | — | Sahne: Orman |
| 125 | `assets/images/items/yiyecek/yumurta.png` | 1:1 | — | Yumurta |
| 126 | `assets/images/items/doga/toprak.png` | 1:1 | — | Toprak |
| 127 | `assets/images/items/doga/ciftlik.png` | 16:9 | — | Sahne: Çiftlik |
| 128 | `assets/images/items/hayvan/inek.png` | 1:1 | — | İnek |
| 129 | `assets/images/items/yer/park.png` | 1:1 | — | Park |
| 130 | `assets/images/items/yer/okul.png` | 1:1 | — | Okul |
| 131 | `assets/images/items/yer/firin.png` | 1:1 | — | Fırın |
| 132 | `assets/images/items/kroki/park.png` | 16:9 | — | Sahne: Kroki: yıldız parkta |
| 133 | `assets/images/items/kroki/okul.png` | 16:9 | — | Sahne: Kroki: yıldız okulda |
| 134 | `assets/images/items/kroki/firin_k.png` | 1:1 | — | Fırının yanı |
| 135 | `assets/images/items/kroki/park_k.png` | 1:1 | — | Parkın içi |
| 136 | `assets/images/items/kroki/okul_k.png` | 1:1 | — | Okulun önü |
| 137 | `assets/images/items/simge/afet_oncesi.png` | 1:1 | — | Afet öncesi |
| 138 | `assets/images/items/simge/afet_ani.png` | 1:1 | — | Afet anı |
| 139 | `assets/images/items/afet/canta_hazirla.png` | 1:1 | — | Afet çantası hazırlamak |
| 140 | `assets/images/items/afet/dolap_sabitle.png` | 1:1 | — | Eşyaları sabitlemek |
| 141 | `assets/images/items/afet/cok_kapan.png` | 1:1 | — | Çök, kapan, tutun |
| 142 | `assets/images/items/afet/masa_alti.png` | 1:1 | — | Sıranın altına sığınmak |
| 143 | `assets/images/items/simge/afet_sonrasi.png` | 1:1 | — | Afet sonrası |
| 144 | `assets/images/items/afet/toplanma_ogren.png` | 1:1 | — | Toplanma alanını öğrenmek |
| 145 | `assets/images/items/afet/toplanma_git.png` | 1:1 | — | Toplanma alanına gitmek |
| 146 | `assets/images/items/afet/binaya_girme.png` | 1:1 | — | Hasarlı binaya girmemek |
| 147 | `assets/images/items/kaynak/cevre_uzmani.png` | 1:1 | — | Çevre uzmanı |
| 148 | `assets/images/items/sahne/su_koruma.png` | 16:9 | — | Sahne: Suyu korumak |
| 149 | `assets/images/items/kaynak/ogretmen.png` | 1:1 | — | Öğretmen |
| 150 | `assets/images/items/kaynak/bebek_kardes.png` | 1:1 | — | Bebek kardeş |
| 151 | `assets/images/items/sahne/sifir_atik.png` | 16:9 | — | Sahne: Okulda sıfır atık |
| 152 | `assets/images/items/kaynak/karsilastir.png` | 1:1 | — | Güvenilir kaynaklarla karşılaştırmak |
| 153 | `assets/images/items/kaynak/hemen_inan.png` | 1:1 | — | Hemen inanmak |
| 154 | `assets/images/items/kaynak/herkese_yay.png` | 1:1 | — | Herkese yaymak |
| 155 | `assets/images/items/sahne/internet_bilgi.png` | 16:9 | — | Sahne: İnternette bir bilgi |
| 156 | `assets/images/items/tek/asi_sahne.png` | 16:9 | — | Sahne: Aşı |
| 157 | `assets/images/items/sahne/aydinlik_ev.png` | 1:1 | — | Aydınlık ev |
| 158 | `assets/images/items/tek/elektrik_sahne.png` | 16:9 | — | Sahne: Elektrik |
| 159 | `assets/images/items/tek/asi.png` | 1:1 | — | Aşı |
| 160 | `assets/images/items/sahne/saglikli_cocuk.png` | 1:1 | — | Sağlıklı çocuk |
| 161 | `assets/images/items/tek/buzdolabi.png` | 1:1 | — | Buzdolabı |
| 162 | `assets/images/items/yiyecek/taze.png` | 1:1 | — | Taze yiyecekler |
| 163 | `assets/images/items/simge/eski.png` | 1:1 | — | Eski |
| 164 | `assets/images/items/simge/yeni.png` | 1:1 | — | Yeni |
| 165 | `assets/images/items/tek/daktilo.png` | 1:1 | — | Daktilo |
| 166 | `assets/images/items/tek/mektup.png` | 1:1 | — | Mektup |
| 167 | `assets/images/items/tek/bilgisayar.png` | 1:1 | — | Bilgisayar |
| 168 | `assets/images/items/tek/eposta.png` | 1:1 | — | E-posta |
| 169 | `assets/images/items/tek/at_arabasi.png` | 1:1 | — | At arabası |
| 170 | `assets/images/items/tek/otomobil.png` | 1:1 | — | Otomobil |
| 171 | `assets/images/items/tek/camasir_legen.png` | 1:1 | — | Leğende çamaşır yıkamak |
| 172 | `assets/images/items/tek/camasir_makinesi.png` | 1:1 | — | Çamaşır makinesi |
| 173 | `assets/images/items/sahne/ailece_vakit.png` | 1:1 | — | Ailece vakit geçirmek |
| 174 | `assets/images/items/sahne/yorgun_yikama.png` | 1:1 | — | Saatlerce elde yıkamak |
| 175 | `assets/images/items/tek/camasir_sahne.png` | 16:9 | — | Sahne: Çamaşır makinesi çalışıyor |
| 176 | `assets/images/items/kaynak/muze.png` | 1:1 | — | Müze |
| 177 | `assets/images/items/kaynak/market.png` | 1:1 | — | Market |
| 178 | `assets/images/items/sanat/osman_hamdi.png` | 16:9 | — | Sahne: Resim sergisi |
| 179 | `assets/images/items/kaynak/sanat_kitabi.png` | 1:1 | — | Sanat kitabı |
| 180 | `assets/images/items/sanat/asik_veysel.png` | 16:9 | — | Sahne: Türkü dinlemek |
| 181 | `assets/images/items/kaynak/eser_gezisi.png` | 1:1 | — | Eseri yerinde görmek |
| 182 | `assets/images/items/sanat/mimar_sinan.png` | 16:9 | — | Sahne: Mimar Sinan'ın eseri |

## Promptlar

### 1. `assets/images/items/simge/hak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hak

```
a glowing heart held inside two open hands, symbol of children's rights. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/simge/sorumluluk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sorumluluk

```
a small school backpack with a big check-mark shaped ribbon tied on it, symbol of responsibility. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/hak/egitim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eğitim hakkı

```
a cute small clay child learning at a desk with books in a classroom. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/hak/oyun.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyun hakkı

```
children playing happily in a schoolyard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/hak/saglik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlık hakkı

```
a school nurse kindly checking a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/sorumluluk/odev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ödevini yapmak

```
a cute small clay child doing homework neatly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/sorumluluk/sinifi_temiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfı temiz tutmak

```
a cute small clay child tidying the classroom shelf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/sorumluluk/kitabi_koru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitaplara özen göstermek

```
a cute small clay child covering a library book carefully with a protective cover. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/sorumluluk/zamaninda_ver.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitabı zamanında vermek

```
a cute small clay child returning a book at the library desk with a smile. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/sorumluluk/kitabi_unut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitabı unutmak

```
a cute small clay child with the book forgotten under the bed at home. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/sorumluluk/kitabi_yirt.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitabı yıpratmak

```
a cute small clay child with a torn book, pages falling out. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/sahne/kutuphane_teslim.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kitap teslim günü

```
a school library diorama with a return desk and a stack of books, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/hak/oy_kullan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oy kullanmak

```
a cute small clay child dropping a folded paper into a ballot box. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/hak/oyunu_ver.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyunu başkasına vermek

```
a cute small clay child handing the ballot paper to a friend. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/hak/bahceye_cik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bahçeye çıkmak

```
a cute small clay child walking out of the classroom to the yard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/sahne/sinif_secimi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sınıf başkanlığı seçimi

```
a classroom diorama with a small ballot box on the teacher's table and children in line, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/hak/sirayla_oyna.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sırayla oynamak

```
children taking turns kicking one ball in a line. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/hak/topu_kap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Topu kapmak

```
a cute small clay child snatching the ball. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/hak/oyunu_birak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyundan küsüp gitmek

```
a cute small clay child walking away from the game sadly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/sahne/top_paylasilmiyor.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Topu paylaşmayan arkadaş

```
a schoolyard diorama with one child holding the only ball while others wait, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/saglik/mevsime_gore.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mevsime göre giyinmek

```
a cute small clay child wearing a warm coat, scarf and hat in the snow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/saglik/duzenli_uyku.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Düzenli uyumak

```
a cute small clay child sleeping peacefully at bedtime. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/saglik/el_yika.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elleri yıkamak

```
a cute small clay child washing hands with soap. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/saglik/ince_giyinmek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kışın ince giyinmek

```
a cute small clay child in a T-shirt and shorts shivering in the snow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/saglik/yikanmamis_meyve.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yıkanmamış meyve yemek

```
a cute small clay child eating an unwashed muddy apple. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/saglik/gec_ekran.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geceleri ekrana bakmak

```
a cute small clay child staring at a phone in bed late at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/sahne/kar_sabah.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Karlı sabah

```
a snowy morning street diorama in front of a house, school bag by the door, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/saglik/disarida_oyna.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dışarıda oynamak

```
a cute small clay child playing outside in fresh air with a kite. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/saglik/ekrana_devam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ekrana devam etmek

```
a cute small clay child still gaming with red tired eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/saglik/cips_ye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cips yemek

```
a cute small clay child eating chips on the sofa. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/sahne/ekran_yorgunu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Ekran başında yorulmak

```
a living room diorama with a child rubbing tired eyes in front of a screen, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/guvenlik/priz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Prize çatal sokmak

```
a cute small clay child poking a fork toward a wall socket. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/guvenlik/kask.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaskla bisiklete binmek

```
a cute small clay child wearing a helmet riding a bicycle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/guvenlik/kitap_oku.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitap okumak

```
a cute small clay child reading on the sofa. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/sahne/ev_ici.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Evin içi

```
a cozy living room diorama with a wall socket, a sofa and toys, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/guvenlik/yangin_merdiven.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangında merdiveni kullanmak

```
people calmly walking down stairs during a fire alarm, no elevator. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/guvenlik/ilac_buyuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İlacı büyüğünden almak

```
a parent giving medicine with a spoon to a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/guvenlik/kapi_sor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kapıyı açmadan sormak

```
a cute small clay child asking a parent before opening the front door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/guvenlik/yangin_asansor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangında asansöre binmek

```
a person pressing an elevator button with smoke nearby. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/guvenlik/ilac_seker.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İlacı şeker sanmak

```
a cute small clay child opening a medicine box thinking pills are candy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/guvenlik/yabanciya_ac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tanımadığına kapıyı açmak

```
a cute small clay child opening the front door to an unknown person. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/guvenlik/aileyi_ara.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kapıyı açmayıp ailesini aramak

```
a cute small clay child staying inside and calling a parent on the phone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/guvenlik/adres_soyle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kapının arkasından konuşmak

```
a cute small clay child shouting through the door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/sahne/kapi_caldi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kapı çaldı

```
a home hallway diorama with a closed front door and a ringing doorbell symbol, a child alone inside, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/sonuc/guvenli_gecis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvenle karşıya geçmek

```
children crossing safely on a green pedestrian light while cars wait. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/sonuc/aceleci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Acele edip koşmak

```
a cute small clay child running across between moving cars. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/sonuc/oyun_oyna.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yolda oyun oynamak

```
children playing tag on the road. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/trafik/kavsak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kavşak

```
a town intersection diorama with traffic lights, a zebra crossing and children waiting, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/sonuc/koltukta_kalir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ani frende güvende kalmak

```
a cute small clay child sitting safely in a car seat while the car stops suddenly, held by the belt. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/trafik/kask_tak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kask takmak

```
a cute small clay child putting on a bicycle helmet. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/sonuc/kafa_korunur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Başı korunur

```
a bicycle helmet protecting a child's head after a small fall. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/sonuc/araclar_durur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Araçlar durur

```
cars stopping at a zebra crossing for walking people. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/trafik/yelek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yansıtıcı yelek giymek

```
a cute small clay child wearing a reflective vest walking in the evening. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/sonuc/gece_gorunur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece görünür olmak

```
a car's headlights shining on a child in a glowing reflective vest. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/simge/aile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aile

```
a single cozy small house with a heart on the door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/simge/toplum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toplum

```
a cluster of many small colorful houses around a little town square tree. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/aile/sofra.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aile sofrası

```
a family having dinner together at home. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/aile/kardes_oyun.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kardeşlerle oyun

```
two siblings playing together at home. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/aile/bebek_bakimi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bebek bakımı

```
a parent rocking a baby in a cradle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/toplum/pazar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mahalle pazarı

```
a busy neighborhood open-air market with stalls. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/toplum/toren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okul töreni

```
a school ceremony with many families and flags. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/toplum/park.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kalabalık park

```
many families enjoying a big park. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/aile/evde_paylas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Evde paylaşmak

```
a family sharing a plate of fruit at home. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/toplum/paylas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Komşularla paylaşmak

```
neighbors sharing food at a street table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 65. `assets/images/items/aile/evi_temizle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Evi birlikte temizlemek

```
a family cleaning the house together. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 66. `assets/images/items/toplum/park_temizle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Parkı birlikte temizlemek

```
volunteers cleaning a park together. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 67. `assets/images/items/aile/buyuge_saygi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Evde büyüklere saygı

```
a cute small clay child pouring tea for a grandmother at home. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 68. `assets/images/items/toplum/mahalle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mahalle ve toplum

```
a lively neighborhood with many houses and people. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 69. `assets/images/items/toplum/tek_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tek başına bir ev

```
one lonely house in an empty field. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 70. `assets/images/items/toplum/bos_sokak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Boş sokak

```
an empty quiet street. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 71. `assets/images/items/sahne/aileler.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Bir araya gelen aileler

```
a diorama of many different families walking toward a neighborhood square, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 72. `assets/images/items/meslek/firinci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırıncı

```
a friendly baker holding fresh bread. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 73. `assets/images/items/meslek/doktor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Doktor

```
a friendly doctor with a stethoscope. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 74. `assets/images/items/meslek/sofor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şoför

```
a friendly bus driver at the wheel. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 75. `assets/images/items/meslek/ogretmen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Öğretmen

```
a friendly teacher pointing at a blank board. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 76. `assets/images/items/meslek/itfaiyeci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İtfaiyeci

```
a friendly firefighter with a helmet and hose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 77. `assets/images/items/meslek/kasaba_sabah.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kasabada sabah

```
a small town morning diorama with a bakery, a school bus and a school, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 78. `assets/images/items/sahne/temiz_sokak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tertemiz sokak

```
a clean street with flowers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 79. `assets/images/items/sahne/copler_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöpler birikti

```
overflowing trash bags piled on a street. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 80. `assets/images/items/meslek/temizlik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Temizlik işçileri

```
a town street diorama where cleaning workers collect trash bags into a garbage truck, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 81. `assets/images/items/sahne/copler_birikti.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Çöpler birikmiş

```
a town street diorama with overflowing trash bags piled up, flies, gloomy, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 82. `assets/images/items/meslek/ciftci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiftçi

```
a friendly farmer holding a basket of vegetables. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 83. `assets/images/items/katki/yiyecek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yiyecek yetiştirir

```
a basket of fresh vegetables and wheat. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 84. `assets/images/items/katki/iyilesme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İyileştirir

```
a cute small clay child healthy and smiling, holding a little bandage. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 85. `assets/images/items/katki/yangin_sondu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangını söndürür

```
a house with the fire put out and water drops, safe. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 86. `assets/images/items/katki/ogrenme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Öğretir

```
a child reading and learning letters on blocks without letters, happy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 87. `assets/images/items/koruma/cope_at.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöpünü kutuya atmak

```
a cute small clay child putting litter in a bin at a historic site. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 88. `assets/images/items/koruma/yolda_yuru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yürüyüş yolundan çıkmamak

```
a family walking on a marked path in a nature park. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 89. `assets/images/items/koruma/rehber.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rehberi dinlemek

```
a group of children listening to a guide at a historic castle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 90. `assets/images/items/koruma/duvara_cizmek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tarihî duvara çizmek

```
a cute small clay child scribbling with a marker on an old stone wall. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 91. `assets/images/items/koruma/cicek_koparmak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçek koparmak

```
a cute small clay child pulling flowers in a nature park. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 92. `assets/images/items/koruma/ates_birakmak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ateşi söndürmeden bırakmak

```
a smoking campfire left alone in a forest. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 93. `assets/images/items/koruma/vazgecir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Arkadaşını vazgeçirmek

```
a cute small clay child kindly stopping a friend from carving a stone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 94. `assets/images/items/koruma/kazimak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taşa kazımak

```
a cute small clay child carving into an old stone with a key. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 95. `assets/images/items/koruma/tas_al.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taş parçası almak

```
a cute small clay child putting a piece of the old wall into a pocket. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 96. `assets/images/items/sahne/tarihi_kale.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Tarihî kale

```
a historic stone castle diorama with visitors and grassy hills, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 97. `assets/images/items/sahne/korunmus_tarih.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Korunan tarihî mekân

```
a well kept historic castle with flowers and happy visitors. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 98. `assets/images/items/sahne/yikik_kale.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yıkılmış tarihî mekân

```
a crumbling neglected castle with litter. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 99. `assets/images/items/sahne/kirli_dere.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kirlenmiş dere

```
a dirty stream with bottles and bags. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 100. `assets/images/items/sahne/korursak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Hepimiz korursak

```
a sunny diorama of a beautiful lake with a historic bridge and families looking, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 101. `assets/images/items/sahne/yonetim_arastirma.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yönetim şeklini araştırmak

```
a library diorama where a child sits at a table with books about Türkiye, a small Turkish flag on the table, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 102. `assets/images/items/kaynak/tbmm.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** TBMM binası

```
the Grand National Assembly of Türkiye building as a clay miniature with a Turkish flag. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 103. `assets/images/items/kaynak/lunapark.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Lunapark

```
a small amusement park carousel. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 104. `assets/images/items/sahne/meclis_merak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Meclisi merak etmek

```
a classroom diorama with a picture of a big parliament building on the wall, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 105. `assets/images/items/ataturk/kurtulus.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kurtuluş Savaşı

```
a hill at dawn with a Turkish flag and a small group of soldiers far away looking ahead, peaceful not violent, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 106. `assets/images/items/ataturk/harf.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Millet Mektepleri

```
a classroom diorama with adults and children learning together at desks, a teacher at the board with simple shapes, no letters, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 107. `assets/images/items/simge/guclendirir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Birliği güçlendirir

```
many small hands stacked together in a circle, symbol of unity. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 108. `assets/images/items/simge/guclendirmez.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Birliği güçlendirmez

```
a single lonely hand turned away from a small circle of hands, soft colors. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 109. `assets/images/items/birlik/bayram.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bayramı birlikte kutlamak

```
people celebrating a national holiday together with flags. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 110. `assets/images/items/birlik/mac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Millî takımı desteklemek

```
fans in red and white cheering the national team together. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 111. `assets/images/items/birlik/afet_yardim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afette dayanışmak

```
people passing boxes of supplies hand to hand after an earthquake. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 112. `assets/images/items/birlik/yalniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Etkinliğe katılmamak

```
a cute small clay child sitting alone, turning back to a group activity. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 113. `assets/images/items/birlik/alay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Farklılıklarla alay etmek

```
a child mocking another child's accent, others look sad. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 114. `assets/images/items/birlik/yardimdan_kac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yardımdan kaçmak

```
a cute small clay child walking away from people who need help. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 115. `assets/images/items/birlik/koli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yardım kolisine katkı

```
a cute small clay child putting a warm blanket into a donation box. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 116. `assets/images/items/birlik/ilgisiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İlgilenmemek

```
a cute small clay child playing a game ignoring the donation boxes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 117. `assets/images/items/sahne/yardim_kampanyasi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yardım kampanyası

```
a school hall diorama with boxes being filled with blankets and water for earthquake victims, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 118. `assets/images/items/sahne/yesil_bahce.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yemyeşil bahçe

```
a lush green school garden full of young trees. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 119. `assets/images/items/sahne/bos_bahce.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çorak bahçe

```
a bare empty dusty schoolyard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 120. `assets/images/items/sahne/fidan_dikim.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sınıfça fidan dikmek

```
a school garden diorama where a whole class is planting saplings together, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 121. `assets/images/items/yiyecek/bal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bal

```
a jar of honey with a honey dipper. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 122. `assets/images/items/yiyecek/peynir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Peynir

```
a slice of white cheese. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 123. `assets/images/items/doga/temiz_hava.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Temiz hava

```
fresh air swirls with green leaves around a tree. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 124. `assets/images/items/doga/orman_sahne.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Orman

```
a sunny forest diorama with tall trees, a stream and bees around flowers, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 125. `assets/images/items/yiyecek/yumurta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yumurta

```
a boiled egg in a small egg cup. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 126. `assets/images/items/doga/toprak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toprak

```
a vegetable garden bed with rich soil and sprouting plants. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 127. `assets/images/items/doga/ciftlik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Çiftlik

```
a farm diorama with a cow, a vegetable garden and the sun shining, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 128. `assets/images/items/hayvan/inek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İnek

```
a friendly cow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 129. `assets/images/items/yer/park.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Park

```
a small park with a tree, a bench and a slide. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 130. `assets/images/items/yer/okul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okul

```
a small school building with a flag. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 131. `assets/images/items/yer/firin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırın

```
a small bakery with bread in the window. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 132. `assets/images/items/kroki/park.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kroki: yıldız parkta

```
a simple hand drawn sketch map (kroki) on paper of a small neighborhood: a school, a park with trees, a bakery and roads; a big red star marker in the park; drawn with clean thick crayon lines, no text, no labels, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 133. `assets/images/items/kroki/okul.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kroki: yıldız okulda

```
the same simple hand drawn sketch map (kroki) of the small neighborhood with school, park, bakery and roads; the big red star marker is on the school; no text, no labels, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 134. `assets/images/items/kroki/firin_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırının yanı

```
the same simple sketch map of the small neighborhood with school, park, bakery and roads; the big red star marker is on the bakery; no text, no labels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 135. `assets/images/items/kroki/park_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Parkın içi

```
the same simple sketch map of the small neighborhood with school, park, bakery and roads; the big red star marker is in the park; no text, no labels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 136. `assets/images/items/kroki/okul_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okulun önü

```
the same simple sketch map of the small neighborhood with school, park, bakery and roads; the big red star marker is on the school; no text, no labels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 137. `assets/images/items/simge/afet_oncesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet öncesi

```
a packed orange emergency backpack with a flashlight and a water bottle clipped on. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 138. `assets/images/items/simge/afet_ani.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet anı

```
a small turtle tucked safely under a sturdy wooden table, symbol of drop-cover-hold on. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 139. `assets/images/items/afet/canta_hazirla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet çantası hazırlamak

```
a family packing an emergency backpack together. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 140. `assets/images/items/afet/dolap_sabitle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eşyaları sabitlemek

```
a grown-up fixing a bookshelf to the wall. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 141. `assets/images/items/afet/cok_kapan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çök, kapan, tutun

```
a cute small clay child doing drop, cover and hold on beside a sturdy table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 142. `assets/images/items/afet/masa_alti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıranın altına sığınmak

```
a cute small clay child sheltering under a school desk holding its leg. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 143. `assets/images/items/simge/afet_sonrasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet sonrası

```
a green open field with a small tree and a family-shaped group of round pins, symbol of an assembly area. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 144. `assets/images/items/afet/toplanma_ogren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toplanma alanını öğrenmek

```
a family looking at a map with a green assembly point symbol, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 145. `assets/images/items/afet/toplanma_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toplanma alanına gitmek

```
a family walking calmly to a green open assembly area. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 146. `assets/images/items/afet/binaya_girme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hasarlı binaya girmemek

```
a cute small clay child staying away from a cracked building with a grown-up. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 147. `assets/images/items/kaynak/cevre_uzmani.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çevre uzmanı

```
a friendly environmental expert in a green vest holding a water test tube by a river. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 148. `assets/images/items/sahne/su_koruma.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Suyu korumak

```
a riverside diorama with a clean river and a child holding a water bottle wondering, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 149. `assets/images/items/kaynak/ogretmen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Öğretmen

```
a friendly teacher explaining with a small poster of leaves and a recycle loop, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 150. `assets/images/items/kaynak/bebek_kardes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bebek kardeş

```
a baby sibling in a crib playing with a rattle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 151. `assets/images/items/sahne/sifir_atik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Okulda sıfır atık

```
a school corridor diorama with colorful recycling bins in a row, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 152. `assets/images/items/kaynak/karsilastir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvenilir kaynaklarla karşılaştırmak

```
a cute small clay child and a parent comparing a library book and an encyclopedia side by side. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 153. `assets/images/items/kaynak/hemen_inan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hemen inanmak

```
a cute small clay child nodding at a screen with a convinced face, without checking. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 154. `assets/images/items/kaynak/herkese_yay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Herkese yaymak

```
a cute small clay child shouting news to many friends. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 155. `assets/images/items/sahne/internet_bilgi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: İnternette bir bilgi

```
a child at a computer diorama looking at a screen with a picture of a plastic bottle in nature, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 156. `assets/images/items/tek/asi_sahne.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Aşı

```
a friendly clinic diorama with a nurse and a child getting a vaccine, not scary, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 157. `assets/images/items/sahne/aydinlik_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aydınlık ev

```
a cozy house with bright lit windows at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 158. `assets/images/items/tek/elektrik_sahne.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Elektrik

```
a warm evening house diorama with bright lit windows and a family reading together, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 159. `assets/images/items/tek/asi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aşı

```
a small vaccine bottle and a band-aid. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 160. `assets/images/items/sahne/saglikli_cocuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlıklı çocuk

```
a healthy smiling child playing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 161. `assets/images/items/tek/buzdolabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Buzdolabı

```
a refrigerator with fresh food inside. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 162. `assets/images/items/yiyecek/taze.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taze yiyecekler

```
fresh vegetables and milk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 163. `assets/images/items/simge/eski.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eski

```
an old brass hourglass with sand falling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 164. `assets/images/items/simge/yeni.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yeni

```
a shiny new gift-like sparkle star burst. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 165. `assets/images/items/tek/daktilo.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Daktilo

```
an old typewriter with blank keys. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 166. `assets/images/items/tek/mektup.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mektup

```
an envelope with a wax seal. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 167. `assets/images/items/tek/bilgisayar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bilgisayar

```
a modern laptop. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 168. `assets/images/items/tek/eposta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** E-posta

```
a tablet showing a blank envelope icon. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 169. `assets/images/items/tek/at_arabasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** At arabası

```
a wooden horse carriage. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 170. `assets/images/items/tek/otomobil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Otomobil

```
a modern family car. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 171. `assets/images/items/tek/camasir_legen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Leğende çamaşır yıkamak

```
a washboard in a tub of soapy water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 172. `assets/images/items/tek/camasir_makinesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çamaşır makinesi

```
a modern washing machine. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 173. `assets/images/items/sahne/ailece_vakit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ailece vakit geçirmek

```
a family playing a board game together while a washing machine runs in the background. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 174. `assets/images/items/sahne/yorgun_yikama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saatlerce elde yıkamak

```
a tired person scrubbing laundry by hand for hours. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 175. `assets/images/items/tek/camasir_sahne.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Çamaşır makinesi çalışıyor

```
a home laundry corner diorama with a washing machine running, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 176. `assets/images/items/kaynak/muze.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Müze

```
a small museum building with columns and paintings visible inside. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 177. `assets/images/items/kaynak/market.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Market

```
a small grocery market with fruit crates. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 178. `assets/images/items/sanat/osman_hamdi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Resim sergisi

```
an art gallery diorama with framed classic paintings on the walls, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 179. `assets/images/items/kaynak/sanat_kitabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sanat kitabı

```
a big art book with a bağlama (Turkish lute) picture on the cover, no letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 180. `assets/images/items/sanat/asik_veysel.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Türkü dinlemek

```
a cozy room diorama with a bağlama hanging on the wall and a radio, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 181. `assets/images/items/kaynak/eser_gezisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eseri yerinde görmek

```
a family visiting a historic Ottoman stone mosque with domes and slender minarets. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 182. `assets/images/items/sanat/mimar_sinan.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Mimar Sinan'ın eseri

```
a diorama of a historic Ottoman mosque with large domes and four slender minarets, Selimiye-like, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG; sahneler (16:9) arka planlı kalır
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 082 082 hb g3 gorseller`
