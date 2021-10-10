## Zombie attack example

# Take an array of population of cities and return updated populations each day 
x = c(3, 6, 0, 4, 3, 2,7,1)
max = x[1]

for (i in 1:length(x)) {
    if (x[i] > max) {
        max = x[i]
    }}

day=-1
while (max>0){
    day = day + 1
    print(paste("Day", day, "x =[", toString(x),"]", collapse = " "))
    max = floor(max/2)
    for (j in 1:8) {
        x[j] = floor(x[j]/2)
    }
}

print(paste("Day", day+1, "x =[", toString(x),"]", collapse = " "))
print("----extinct----")
5
