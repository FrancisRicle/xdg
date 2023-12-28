#! /usr/bin/env python
inp=input()
data=inp.split(";")
index=int(data[0])
name=data[1]
clients=int(data[2])
focus=int(data[3])
cyan=data[4]
green=data[5]
bg=data[6]
sepr=data[7]
bg_cyan = "^bg(" + cyan + ")"
bg_green = "^bg(" + green + ")"
bg_def = "^bg(" + bg + ")"
fg_cyan = "^fg(" + cyan + ")"
fg_green = "^fg(" + green + ")"
fg_def = "^fg(" + bg + ")"
sep="^i("+sepr+")" 
res=""
hasFocus = focus == index
hasClient = clients > 0
if hasFocus and index > 0 and index < 8:
    res = bg_def + fg_green + sep + name  
elif hasFocus and index < 8:
    res = bg_def + fg_green + name
elif hasFocus and index > 0:
    res = bg_def + fg_green + sep + name + sep  
elif 

print(res)
