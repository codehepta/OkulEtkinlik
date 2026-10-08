"""Sayı / saat / para / tek kelime: yalnızca düz biçimler ('X!' ve 'X.'). Sahip, giriş cümleli kesimler yerine
düz biçimin iyi tohumunu seçti (Cam şişe, Zübeyde Hanım, Kâğıt kutusu, Sepeti seç)."""
import rules
def variants(key, text):
    return [v for v in rules.variants(key, text) if not v["carrier"]][:2]
heard_ok = rules.heard_ok
