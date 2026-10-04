class_name DayClock
extends RefCounted
## Yerel güne göre epoch'tan bu yana gün sayısı. Testte fixed_day ile sabitlenir.

## 0 ve üstü ise gerçek saat yerine bu gün kullanılır.
var fixed_day: int = -1

func today() -> int:
	if fixed_day >= 0:
		return fixed_day
	var bias_minutes: int = int(Time.get_time_zone_from_system().get("bias", 0))
	var secs: float = Time.get_unix_time_from_system() + float(bias_minutes) * 60.0
	return floori(secs / 86400.0)
