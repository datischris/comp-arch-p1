def create_adj_list(edges):
    adj_dict = {}
    for e in edges:
        if e[0] not in adj_dict:
            adj_dict[e[0]] = set()
        if e[1] not in adj_dict:
            adj_dict[e[1]] = set()
        adj_dict[e[0]].add(e[1])
    return adj_dict

def actual_BFS(s,edges,discovered,level):
    queue = [0]*len(edges)
    head = tail = 0

    queue[head] = s
    discovered[s] = set()
    level[s] = 0
    
    
    while head<=tail: 
        v = queue[head]
        head += 1
        for u in edges[v]:
            if u not in discovered:
                tail += 1
                queue[tail] = u

                discovered[v].add(u)
                discovered[u] = set()

                level[u] = level[v] + 1
    

def BFS(n, m, s, t, edges):
    adj_list = create_adj_list(edges=edges)
    discovered = {}
    level = {}

    result = "no"
    layer = "inf"

    for v in range(1,n+1):
        if v not in discovered:
            actual_BFS(v,adj_list,discovered,level)

    if s in discovered:
        if t in discovered[s]:
            result = "yes"
            layer = level[t]
    
    return result, layer


def read_input():
    n, m = map(int, input().split())
    s, t = map(int, input().split())
    edges = []
    for _ in range(m):
        u, v = map(int, input().split())
        edges.append((u, v))
    return n, m, s, t, edges


if __name__ == "__main__":
    n, m, s, t, edges = read_input()
    # n = 6
    # m = 7
    # s = 1
    # t = 5
    # edges = [(1, 2), (5, 6), (2, 3), (4, 5), (4, 6), (1, 5), (3, 5)]

    # n = 5
    # m = 6
    # s = 5
    # t = 6
    # edges = [(1, 2), (2, 3), (3, 4), (1, 4), (2, 4), (5, 6)]

    result, layer = BFS(n, m, s, t, edges)
    print(result)
    print(layer)