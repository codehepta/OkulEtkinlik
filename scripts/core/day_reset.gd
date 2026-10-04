extends RefCounted
## "Günü sıfırla" (veli paneli): cihaz saati ileri alınıp geri getirildiğinde kayıtta
## gelecekte kalan günleri bugüne çeker. Saf mantık, sahnesiz.

## Kayıt verisini yerinde düzeltir: etkin gün bugün olur; gelecekteki günün kullanımı
## sıfırlanır, gelecekteki veli açması iptal olur; çıktıların son oynanma günü bugüne,
## tekrar vadesi en çok kutusunun bugünden hesaplanan vadesine çekilir.
static func apply(data: Dictionary, today: int) -> void:
	data["last_day_seen"] = today
	var usage: Variant = data.get("usage")
	if usage is Dictionary:
		var u: Dictionary = usage
		if int(u.get("day", 0)) > today:
			u["day"] = today
			u["seconds"] = 0
		if int(u.get("unlocked_day", -1)) > today:
			u["unlocked_day"] = -1
	var profiles: Variant = data.get("profiles")
	if not (profiles is Array):
		return
	for p: Variant in profiles:
		if not (p is Dictionary) or not ((p as Dictionary).get("outcomes") is Dictionary):
			continue
		for o: Variant in ((p as Dictionary)["outcomes"] as Dictionary).values():
			if not (o is Dictionary):
				continue
			var od: Dictionary = o
			if int(od.get("last_day", 0)) > today:
				od["last_day"] = today
			var latest: int = Leitner.due_day(int(od.get("box", 1)), today)
			if int(od.get("due", 0)) > latest:
				od["due"] = latest
