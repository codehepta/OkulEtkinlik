extends GutTest
## "Günü sıfırla" saf mantığı (scripts/core/day_reset.gd).

const DayReset: GDScript = preload("res://scripts/core/day_reset.gd")

func _data() -> Dictionary:
	var d: Dictionary = SaveSchema.new_save()
	d["last_day_seen"] = 120
	d["usage"] = {"day": 120, "seconds": 900, "unlocked_day": 120}
	var p: Dictionary = SaveSchema.new_profile("p1", "a", "n", 1)
	p["outcomes"] = {
		"A": {"mastery": 0.5, "box": 2, "due": 121, "last_day": 120},
		"B": {"mastery": 0.5, "box": 3, "due": 102, "last_day": 99},
	}
	d["profiles"].append(p)
	return d

func test_future_days_pulled_back_to_today() -> void:
	var d: Dictionary = _data()
	DayReset.apply(d, 100)
	assert_eq(d["last_day_seen"], 100)
	assert_eq(d["usage"], {"day": 100, "seconds": 0, "unlocked_day": -1})
	var a: Dictionary = d["profiles"][0]["outcomes"]["A"]
	assert_eq(a["last_day"], 100)
	assert_eq(a["due"], 101, "kutu 2: vade en çok bugün + 1")

func test_past_values_untouched() -> void:
	var d: Dictionary = _data()
	DayReset.apply(d, 100)
	var b: Dictionary = d["profiles"][0]["outcomes"]["B"]
	assert_eq(b["last_day"], 99)
	assert_eq(b["due"], 102, "kutu 3 vadesi (bugün + 3) içinde kalan vade değişmez")

func test_today_usage_kept_when_not_in_future() -> void:
	var d: Dictionary = _data()
	d["usage"] = {"day": 100, "seconds": 300, "unlocked_day": 100}
	DayReset.apply(d, 100)
	assert_eq(d["usage"], {"day": 100, "seconds": 300, "unlocked_day": 100})

func test_tolerates_missing_fields() -> void:
	var d: Dictionary = {"profiles": [3, {"id": "x"}]}
	DayReset.apply(d, 5)
	assert_eq(d["last_day_seen"], 5)
