def first_non_repeating_letter(s: str) -> str:

    cache = set()
    uppercased = s.upper()

    for i, c in enumerate(uppercased):
        if c in uppercased[i+1:] or c in cache:
            cache.add(c)
        else:
            return s[i]

    return ""

