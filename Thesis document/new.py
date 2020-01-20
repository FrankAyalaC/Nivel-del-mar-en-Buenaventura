import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

horas=["Hora_"+str(i) for i in range(1,25)]
cols=["Agente","Planta"]+horas
main_dict={}
for col in cols:
    main_dict[col]=[]
    
data=open('OFEI1204.txt','r')

for line in data:
    value=line.strip().split(",")
    if line.strip()[:6]=="AGENTE":
        agente=line.strip()[8:]
    elif len(value)>1 and value[1]==' D':
        for i in range (len(cols)):
            if i==0:
                main_dict[cols[i]].append(agente)
            elif i==1:
                main_dict[cols[i]].append(value[i-1])
            else:
                main_dict[cols[i]].append(value[i])

df=pd.DataFrame(main_dict)        