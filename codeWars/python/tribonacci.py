from typing import Generator


def tribonacci_generator(seed: list[int]) -> Generator[int]:
    """Create a Lazy Generator for the Tribonacci Sequence build from the three initial Seed Elements"""
    assert len(seed) == 3

    buffer = list(seed)
    for elem in buffer:
        yield elem

    while True:
        new = sum(buffer[-3:])
        buffer.append(new)
        yield new


def tribonacci(seed: list[int], n: int) -> list[int]:
    """Take the first n Elements using the seeded Generator"""
    res = []
    g = tribonacci_generator(seed)
    for _ in range(n):
        res.append(next(g))
    return res
