"""Metni olduğu gibi okut (sık çalınan geri bildirim satırları için)."""
import rules
def variants(key, text):
    return [{"say": text.strip(), "carrier": False}]
heard_ok = rules.heard_ok
