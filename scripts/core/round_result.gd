class_name RoundResult
extends RefCounted
## Bir turun sonucu; LessonRunner bunu ustalık ve yıldız hesabına çevirir.

var attempts: int = 0
var wrong: int = 0
var helped: bool = false
var outcomes: PackedStringArray = PackedStringArray()
