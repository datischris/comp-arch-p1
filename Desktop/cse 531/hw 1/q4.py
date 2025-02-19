def test_odd_cycle(s,adj_list,discovered,iter):
    queue = [0]*len(adj_list)
    color = {}

    head = tail = 0

    queue[0] = s
    discovered[s] = True
    color[s] = 0

    while head<=tail: 
        v = queue[head]
        head+=1
        for u in adj_list[v]:
            if u not in discovered:
                tail += 1
                queue[tail] = u

                discovered[u] = True
                color[u] = 1 - color[v]

            elif color[u] == color[v]:
                print("odd cycle found")
                return True
            
            iter += 1
    print(iter)


def does_my_g_have_odd_cycle(adj_list):
    discovered = {}
    iter=0

    for v in adj_list:
        if v not in discovered:
            if test_odd_cycle(v,adj_list,discovered,iter):
                return
        iter += 1
    print("no odd cycle found")
    return iter


if __name__ == "__main__":
    adj_list = {1:[2],2:[3],3:[4],4:[5],5:[6],6:[1]}
    print(does_my_g_have_odd_cycle(adj_list=adj_list))