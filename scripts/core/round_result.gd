class_name RoundResult
extends RefCounted
## Bir turun sonucu; LessonRunner bunu ustalık ve yıldız hesabına çevirir.

var attempts: int = 0
var wrong: int = 0
var helped: bool = false
var outcomes: PackedStringArray = PackedStringArray()
## Tur birden çok adımlı mı (her doğru adım answered(true) yayar)? Yıldız hesabında
## tur başına en çok 1 yanlış sayılır.
var multi_step: bool = false
