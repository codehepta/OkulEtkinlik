class_name RoundContext
extends RefCounted
## Bir tura LessonRunner'ın verdiği bağlam.

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var voice_id: String = ""
var outcomes: PackedStringArray = PackedStringArray()
## İçeriğin sınıfı (1–3); düğüm kimliğinden (g<N>.) gelir. Şablonlar sunumu buna göre
## seçer (ör. 1. sınıfta sembol yerine sözcük kartı, dijital saat yok).
var grade: int = 1
