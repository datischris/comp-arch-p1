def interval_scheduling_coving(n, intervals):
    merge_sort(intervals,n)
    return maximum, first_interval

def merge_sort(intervals,n):
    if n == 1:
        return intervals
    else:
        j = len(intervals) // 2
        
        split1, split2 = intervals[0:j], intervals[j:]

        arr1 = merge_sort(split1, len(split1))
        arr2 = merge_sort(split2, len(split2))
    return merge(arr1, arr2, len(arr1), len(arr2))

def merge(arr1,arr2,n1,n2):
    merged = []

    i = j = 0

    # print(n1, " vs ", len(arr1))
    # print(n2, " vs ", len(arr2))

    while i < n1 and j < n2:
        if arr1[i][1] < arr2[j][1]:
            merged.append(arr1[i])
            i += 1
        else:
            merged.append(arr1[j])
            j += 1

    print(merged)
    print()
    return merged


def read_input():
    n = int(input())
    intervals = []
    for _ in range(n):
        s, f = map(int, input().split())
        intervals.append((s, f))
    return n, intervals


if __name__ == "__main__":
    # n, intervals = read_input()

    n = 10
    intervals = [(1, 2), (5, 6), (1, 3), (3, 4), (4, 20), (5, 6), (4, 5), (7, 9), (5, 17), (2, 4)]

    maximum, first_interval = interval_scheduling_coving(n, intervals)
    print(maximum)
    print(first_interval)
