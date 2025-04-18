def groupCons(args: list[int], buf: list[int], acc: list[list[int]]) -> list[list[int]]:

    remainingArgs = len(args) - 1
    emptyBuffer = len(buf) == 0

    if remainingArgs < 0 and not emptyBuffer:
        acc.append(buf)
        return acc

    for i, cur in enumerate(args):

        if emptyBuffer:
            if remainingArgs > 0:
                buf = [cur]
                return groupCons(args[i + 1 :], buf, acc)
            else:
                acc.append([cur])
                return acc

        if remainingArgs > 1 and args[i + 1] == buf[-1] + 1:
            buf.append(args[i + 1])
            return groupCons(args[i + 2 :], buf, acc)

        else:
            if buf[-1] == cur - 1:
                buf.append(cur)
                return groupCons(args[i + 1 :], buf, acc)

            acc.append(buf)
            if len(args[i:]) < 1:
                return acc
            else:
                return groupCons(args[i + 1 :], [cur], acc)

    return acc


def summarizeGroup(groups: list[list[int]]) -> str:

    s: list[str] = []

    for group in groups:
        if len(group) < 3:
            for n in group:
                s.append(str(n))
        else:
            fst, last = group[0], group[-1]
            s.append(f"{fst}-{last}")

    return ",".join(s)


def solution(args: list[int]) -> str:

    groups = groupCons(args, [], [])

    s = summarizeGroup(groups)

    return s
