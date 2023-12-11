#!/usr/bin/env python
# coding: utf-8

# In[6]:


import folium
import pandas as pd
import json 


# In[7]:


wifi=pd.read_csv('C:/Users/USER/Desktop/data/wifi.csv',encoding='euc-kr')
wifi=wifi.drop(['통신사','서비스 분류','광역시도(국문)','시군구(국문)','지번주소(국문)','도로명주소(국문)'],axis=1)
eng_col=('Location','Lat','Lon')
wifi.columns=eng_col


# In[8]:


map_osm=folium.Map(location=[37.566345,126.977893])
rfile=open('C:/Users/USER/Desktop/data/skorea_municipalities_geo_simple.json','r',encoding='utf-8').read()
jsonData=json.loads(rfile)
folium.GeoJson(jsonData,name='json_data').add_to(map_osm)


# In[9]:


for Location,Lat,Lon in wifi.values:
    folium.Marker([Lat,Lon],popup=Location).add_to(map_osm)
map_osm.save('C:/Users/USER/Desktop/data/map_korea1.html')


# In[5]:


#for Location,Lat,Lon in wifi.values:
 #   folium.Marker([Lat,Lon]).add_to(map_osm)
#map_osm.save('C:/Users/USER/Desktop/data/map_korea1.html')


# In[ ]:




