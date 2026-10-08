"""Tek aday kipi: her satır için yalnızca ilk okunuş biçimi (kısa satırda 'X!', cümlede metnin kendisi).
Whisper'ın doğru duymadığı satırlar sonra rules.py'nin bütün biçimleriyle yeniden denenir."""
import rules
def variants(key, text):
    return rules.variants(key, text)[:1]
heard_ok = rules.heard_ok
