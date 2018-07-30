
# coding: utf-8

# In[30]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import tkinter as tk

df = pd.read_csv("trainDirty.csv")


# In[31]:


print(df.shape)


# In[32]:


headers = list(df)
plt.figure(figsize=(12,8))
sns.heatmap(df.loc[:,headers[0:15]].isnull(),cbar=False,yticklabels=False,cmap='viridis')
plt.show()


# In[37]:


plt.figure(figsize=(12,8))
sns.heatmap(df.loc[:,headers[15:30]].isnull(),cbar=False,yticklabels=False,cmap='viridis')
plt.show()


# In[38]:


print(df.Alley.unique())
print(len(df.Alley.unique()))
print(df.Alley.unique().dtype)


# In[100]:


actions=[
    "Run away from your problems",
    "Delete column",
    "Remove samples",
    "Fill with 0",
    "Fill with mean",
    "Fill with median",
    "Fill with mode",
]

def populateEVs():
    evalues = list(ser.unique())
    evalues = evalues[0:1000] # more than 1000 items in a drop down menu is insanity
    select = tk.OptionMenu(ask,existing_value,*evalues)
    select.grid(row=i,column=1)
    
def CheckAct():
    s = act_choice.get()
    if not(s):
        pass
    else:
        if s == "Fill with an existing value":
            e = existing_value.get()
            if not(e):
                pass
            else:
                whatToDo[header] = ("custom",e)
                ask.destroy()
        else:
            whatToDo[header] = ("stock",s)
            ask.destroy()
            


# In[107]:


whatToDo = {}
for header in headers:
    ser = df.loc[:,header]
    if ser.isnull().sum():
        integrity = ser.count() / ser.shape[0]
        ask = tk.Tk()
        act_choice = tk.StringVar(ask)
        qst=tk.Label(ask,text="The column "+header+" has missing data.\n What should we do?")
        qst.grid(row=0,column=1)
        #evalues = set(["NA"])
        i=1
        for act in actions:
            tk.Radiobutton(ask,
                           text=act,
                           padx=20,
                           indicatoron=0,
                           width=20,
                           variable=act_choice,
                           value=act).grid(row=i,column=0)
            i += 1
        tk.Radiobutton(ask,
                       text="Fill with an existing value:",
                       padx=20,
                       indicatoron=0,
                       width=20,
                       command=populateEVs,
                       variable=act_choice,
                       value="Fill with an existing value").grid(row=i,column=0)
        existing_value = tk.StringVar(ask)
        commit = tk.Button(ask,
                           text="OK, NEXT!",
                           fg="blue",
                           command=CheckAct,
                           bg="magenta")
        commit.grid(row=i,column=2)
        ask.mainloop()
         
print(whatToDo)


# In[110]:


print(actions)


# In[112]:


df2 = pd.DataFrame()
naughtyList = [] # Where we keep all those headers whose NaN rows we will delete later
for header in headers:
    if header in whatToDo:
        (SoC, order) = whatToDo[header]
        if SoC == "custom":
            df2[header] = df[header].copy().fillna(order)
        elif order == "Run away from your problems":
            df2[header] = df[header].copy()
        elif order == "Delete column":
            pass
        elif order == "Remove samples":
            naughtyList.append(header)
        elif order == "Fill with 0":
            df2[header] = df[header].copy().fillna(0)
        elif order == "Fill with mean":
            df2[header] = df[header].copy().fillna(df[header].mean())
        elif order == "Fill with median":
            df2[header] = df[header].copy().fillna(df[header].median())
        elif order == "Fill with mode":
            df2[header] = df[header].copy().fillna(df[header].mode()[0])
        else:
            print("Warning! Column header "+header+" was not handled! The order was: "+str((SoC,order)))
    else:
        df2[header] = df[header].copy()


# In[113]:


type(df2)
df2.shape


# In[114]:


df2.to_csv("yolo.csv",index=False)

