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
sep_int="^i(" + data[7] + ")"
sep_left="^i("+data[8]+")"
sep_right="^i("+data[9]+")"
bg_cyan = "^bg(" + cyan + ")"
bg_green = "^bg(" + green + ")"
bg_def = "^bg(" + bg + ")"
fg_cyan = "^fg(" + cyan + ")"
fg_green = "^fg(" + green + ")"
fg_def = "^fg(" + bg + ")"
hasFocus = focus == index
hasClient = clients > 0
isLast = index == 8
isFirst = index == 0
def tags():
    if hasFocus and isFirst:
        return bg_def + fg_green + sep_left + bg_green + fg_def + name + fg_green + sep_int 
    if hasFocus and isLast:
        return bg_def + fg_green + sep_int + bg_green + fg_def + name + fg_green + sep_right 
    if hasFocus:
        return bg_def + fg_green + sep_int + bg_green + fg_def + name + fg_green + sep_int 
    if hasClient:
        return bg_def + fg_def + sep_int + bg_def + fg_cyan + name + fg_def + sep_int 
    return bg_def + fg_def + sep_int + bg_def + fg_green + name + fg_def + sep_int 
print(tags())
