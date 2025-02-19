def LIFO_FF(k, n, m, requests):
    # Please write your algorithm here:

    # .................................
    return fifo, lifo, ff

#You are allowed to use some built-in functions, such as the Python heap library, including heapq.heapify(). 

def read_input():
    k, n, m = map(int, input().split())
    requests = []
    for _ in range(m):
        request = int(input())
        requests.append(request)
    return k, n, m, requests


if __name__ == "__main__":
    k, n, m, requests = read_input()
    fifo, lifo, ff = LIFO_FF(k, n, m, requests)
    print(sum, fifo)
    print(sum, lifo)
    print(sum, ff)
