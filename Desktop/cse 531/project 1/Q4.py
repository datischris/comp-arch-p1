def ascending_sort(cities):
    # Please write your algorithm here:

    # .................................
    return sorted_cities


def read_input():
    cities = []
    while True:
        city_input = input().strip()
        if not city_input:
            break
        city_info = city_input.split()
        city_index, population = int(city_info[0]), int(city_info[1])
        cities.append((city_index, population))

    return cities


if __name__ == "__main__":
    cities = read_input()
    sorted_cities = ascending_sort(cities)
    for city in sorted_cities:
        print(city[0], city[1])
