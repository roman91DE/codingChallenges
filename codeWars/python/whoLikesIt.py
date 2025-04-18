def greetings(names: list[str]) -> str:

    s: str
    match names:
        case []:
            s = "no one likes this"
        case [a]:
            s = a + " likes this"
        case [a, b]:
            s = f"{a} and {b} like this"
        case [a, b, c]:
            s = f"{a}, {b} and {c} like this"
        case xs:
            rest = len(xs[2:])
            s = f"{xs[0]}, {xs[1]} and {rest} others like this"

    return s

