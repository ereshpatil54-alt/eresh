import numpy as np
X=np.array([
['Sunny','Warm','Normal','Strong','Warm','Same'],
['Sunny','Warm','High','Strong','Warm','Same'],
['Rainy','Cold','High','Strong','Warm','Change'],
['Sunny','Warm','High','Strong','Cool','Change']
])
y=np.array(['Yes','Yes','No','Yes'])
def find_s(X,y):
    h=['Ø']*len(X[0])
    for x,t in zip(X,y):
        if t=='Yes':
            h=[x[i] if h[i]=='Ø' else ('?' if h[i]!=x[i] else h[i])
               for i in range(len(h))]
    return h
def candidate_elimination(X,y):
    n=len(X[0]); S=[['Ø']*n]; G=[['?']*n]
    d=[set(X[:,i]) for i in range(n)]
    for x,t in zip(X,y):
        if t=='Yes':
            G=[g for g in G if all(g[i]=='?' or g[i]==x[i] for i in range(n))]
            for s in S:
                for i in range(n):
                    s[i]=x[i] if s[i]=='Ø' else ('?' if s[i]!=x[i] else s[i])
        else:
            NG=[]
            for g in G:
                if all(g[i]=='?' or g[i]==x[i] for i in range(n)):
                    for i in range(n):
                        if g[i]=='?':
                            NG += [g[:i]+[v]+g[i+1:] for v in d[i] if v!=x[i]]
                else: NG.append(g)
            G=NG
    return S,G
print("Find-S:", find_s(X,y))
S,G = candidate_elimination(X,y)
print("S:", S)
print("G:", G)
