import urllib.request
from parser import HTMLTableParser
import pandas as pd

total = 0
agg = pd.DataFrame()
complete_agg = pd.DataFrame()

targetBase = "http://usapl.liftingdatabase.com/competitions-view?id="

for i in range(460,2150):
    target = targetBase + str(i)
    req = urllib.request.Request(url=target)
    f = urllib.request.urlopen(req)
    xhtml = f.read().decode('utf-8')
    p = HTMLTableParser()
    p.feed(xhtml)
    LLL = p.tables
    
    if len(LLL) < 3:
        continue    
    if len(LLL[0]) < 2:
        continue 
    if len(LLL[0][1]) < 2:
        continue    
    sanction = LLL[0][1][1]
    if len(sanction) != 10:
        continue
    year = int(sanction[3:7])
    filename = sanction + '.csv'
    
    dirty = LLL[1]
    
    headers = dirty.pop(0)
    
    clean = []
    sex = ''
    raw = False
    
    while dirty:
        L = dirty.pop(0)
        if len(L) == 1:
            words = L[0].split(' ')
            if 'Male' in words:
                sex = 'Male'
            if 'Female' in words:
                sex = 'Female'
            if 'Raw' in words:
                raw = True
            elif 'R' in words:
                raw = True
            else:
                raw = False
        if len(L) == 19 and raw and sex:
            L = [sex]+L
            clean.append(L)
    
    headers = ['Sex','wclass','placing','name','YOB','team','state','Weight','SQ1','SQ2','SQ3','BP1','BP2','BP3','DL1','DL2','DL3','total','points','tested']
    try:
        df = pd.DataFrame(clean,columns=headers)
        df.YOB = pd.to_numeric(df.YOB)
        df.Weight = pd.to_numeric(df.Weight)
        df.SQ1 = pd.to_numeric(df.SQ1)
        df.SQ2 = pd.to_numeric(df.SQ2)
        df.SQ3 = pd.to_numeric(df.SQ3)
        df.BP1 = pd.to_numeric(df.BP1)
        df.BP2 = pd.to_numeric(df.BP2)
        df.BP3 = pd.to_numeric(df.BP3)
        df.DL1 = pd.to_numeric(df.DL1)
        df.DL2 = pd.to_numeric(df.DL2)
        df.DL3 = pd.to_numeric(df.DL3)
        df.total = pd.to_numeric(df.total)
        df.points = pd.to_numeric(df.points)
    except (ValueError,TypeError):
        continue
    ###############################################
    df = df.drop(columns=['placing','tested','wclass','team','state','total'])
    df = df.drop_duplicates()
    df["Sanction"] = sanction
    df["i_url"]= i
    df["Age"] = year - df["YOB"]
    df = df.drop( df[df.Age > 80].index )
    df = df.drop( df[df.Age < 18].index )
    df = df.drop( df[df.Weight > 200].index )
    df = df.drop( df[df.Weight < 20].index )
    complete_agg = pd.concat([complete_agg,df])
    #df.to_csv(filename,index=False)
    print(i,year,filename,df.shape[0])
    ###############################################
    # Now we get a version ready for Octave
    ###############################################
    df["zeros"] = 0
    #df = df.fillna(0)
    df.loc[:,"SQM"] = df.loc[:,["SQ1","SQ2","SQ3","zeros"]].max(axis=1)
    df.loc[:,"BPM"] = df.loc[:,["BP1","BP2","BP3","zeros"]].max(axis=1)
    df.loc[:,"DLM"] = df.loc[:,["DL1","DL2","DL3","zeros"]].max(axis=1)
    df.loc[:,"sex"] = 1*(df["Sex"] == "Male")
    forwrite = df.loc[:,["Sanction","name","sex","Age","Weight","SQM","BPM","DLM"]]
    forwrite = forwrite.drop_duplicates()
    forwrite = forwrite.drop( forwrite[forwrite.SQM == 0].index )
    forwrite = forwrite.drop( forwrite[forwrite.BPM == 0].index )
    forwrite = forwrite.drop( forwrite[forwrite.DLM == 0].index )
    #forwrite.to_csv("clean-"+filename,header=False,index=False)
    agg = pd.concat([agg,forwrite])
    #print(df)
    #print(agg)

agg.to_csv("data.csv",header=False,index=False)
complete_agg.to_csv("dataFancy.csv",index=False)
print(agg.shape)
print(complete_agg.shape)



