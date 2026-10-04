extends GutTest
## Analog saat hesapları.

const ClockTime: GDScript = preload("res://scripts/core/clock_time.gd")

func test_angles() -> void:
	assert_almost_eq(ClockTime.minute_angle(15), PI / 2.0, 0.0001)
	assert_almost_eq(ClockTime.hour_angle(3, 0), PI / 2.0, 0.0001)
	assert_almost_eq(ClockTime.hour_angle(12, 30), PI / 12.0, 0.0001, "yarımda akrep iki sayı arasında")

func test_step_minute_carries_hour() -> void:
	assert_eq(ClockTime.step_minute(3, 45, 15), Vector2i(4, 0))
	assert_eq(ClockTime.step_minute(12, 0, -5), Vector2i(11, 55))
	assert_eq(ClockTime.step_minute(12, 30, 30), Vector2i(1, 0))

func test_step_hour() -> void:
	assert_eq(ClockTime.step_hour(12, 15, 1), Vector2i(1, 15))
	assert_eq(ClockTime.step_hour(1, 15, -1), Vector2i(12, 15))

func test_minute_step_for_reaches_target() -> void:
	assert_eq(ClockTime.minute_step_for(1, 30), 30)
	assert_eq(ClockTime.minute_step_for(1, 15), 15, "çeyreğe yarım saat adımı uymaz")
	assert_eq(ClockTime.minute_step_for(1, 25), 5)
	assert_eq(ClockTime.minute_step_for(2, 45), 15)
	assert_eq(ClockTime.minute_step_for(3, 30), 5)
	for d: int in [1, 2, 3]:
		for m: int in range(0, 60, 5):
			assert_eq(m % ClockTime.minute_step_for(d, m), 0)

func test_start_time() -> void:
	assert_eq(ClockTime.start_time(Vector2i(3, 30)), Vector2i(12, 0))
	assert_eq(ClockTime.start_time(Vector2i(12, 0)), Vector2i(3, 0))
