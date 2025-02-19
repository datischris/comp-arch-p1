import math

def algo_1(A):
    it = 0

    for i in range(0,len(A)):
        for j in range(0,len(A)):
            it+=1
            print("i says:", A[i],"j says: ",A[j]**2)
            print("iteration:", it)
            if A[j] == (A[i])**2:
                return "yes"
        print("iteration:", it)
    return "no"

def algo_2(A):
    j = 0
    n = len(A)-1
    iter = 0
    for i in range(0,len(A)):
        print("i: ", i)
        iter += 1
        while j <= n and A[j] < (A[i])**2:
            j += 1
            iter += 1
            print(A[j])
            print(" j is now: ",j)
        if j <= n and A[j] == (A[i])**2:
            return ("yes",i,j,iter)
    return ("no",i,j,iter)

def algo_3(A):
    iter = 0
    for i in range(0,len(A)):
        iter += 1
        print("i: ", i)
        l = i
        r = len(A) - 1
        
        while l <= r:
            j = math.ceil((l + r) / 2)
            print(" j: ",j)
            if A[j] == (A[i])**2:
                return ("yes",i,j,iter)
            elif (A[i])**2 < A[j]:
                r = j - 1  # Move left if A[j] is larger
            else:
                l = j + 1  # Move right if A[j] is smaller
            iter+=1
    print()
    return ("no",i,j,iter)

if __name__ == "__main__":
    A = [4,2]
    A_sorted = sorted([3,50,40,1200,2500])

    A_paper = [500,5000,7000,8000,9000,9000,250000]
    output = algo_2(A_sorted)
    print()
    print("result: ",output[0])
    print("iterations: ",output[3])
    print("i = ",output[1])
    print("j = ",output[2])
    