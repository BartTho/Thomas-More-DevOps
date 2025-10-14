regels=5
for a in range(0,regels):
    print(((regels-(a+1))*' ')+(((2*a)+1)*'X'))
for a in range(1,regels):
    print(((a)*' ')+(((((regels-a)*2)-1)*'X')))
