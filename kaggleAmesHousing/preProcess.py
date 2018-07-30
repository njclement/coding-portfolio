import pandas as pd

def clean(foo,clean):
    numerics = [ 'int16', 'int32', 'int64', 'float16', 'float32', 'float64' ]
    data = pd.read_csv(foo)
    cleaned = (data.select_dtypes(include=numerics)).dropna(how='any')
    cleaned.to_csv(clean)
    

