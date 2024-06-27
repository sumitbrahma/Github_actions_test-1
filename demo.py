l1 = [[2, 4, 5], [2, 4, 5], [1, 1, 1]]
l2 = [[3, 4, 5], [33, 4, 5], [1, 2, 1]]
counter = 0
for i in l1:
    for j in i:
        for j in l2:
            counter = counter + 1

print(counter)