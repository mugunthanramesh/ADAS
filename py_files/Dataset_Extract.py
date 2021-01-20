import urllib.request
'''url = 'https://storage.googleapis.com/openimages/web/visualizer/index.html?set=train&c=%2Fm%2F01bjv'
# Download the file from `url` and save it locally under `file_name`:
urllib.request.urlretrieve(url, 'my')
'''
import os
path = 'E:\\person'
os.chdir(path)
count = 0
for r,t,f in os.walk(path):
    for i in f:
        k = open(i,'r')
        for j in k:
            try:
                urllib.request.urlretrieve(j, 'C:\\Users\\R.Mugunthan\\Desktop\\'foldername'\\'+str(count)+'.jpg')
                print('done')
                count = count+1
            except Exception as e:
                print(e)
