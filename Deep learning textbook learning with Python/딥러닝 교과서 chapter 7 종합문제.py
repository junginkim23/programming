#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np


# In[115]:


np.random.seed(0) #시드를 설정함으로써, 난수를 생성하면 매번 똑같은 난수가 생성된다. 
#a=np.random.randint(1,4,(3,4)) 이를 통해 코드가 실행될 때마다 코드가 똑같이 작동하도록 하는데 유용하다.


# In[141]:


a=np.random.randint(0,5)
print(type(a))
b=np.random.randint(0,5,3)
print(type(b))
b


# In[143]:


#난수로 지정한 크기의 이미지를 생성하는 함수 make_image()를 완성하세요.
def make_image(m,n):
    image=np.random.randint(0,6,(m,n))
    return image
def change_little(matrix):
    #행렬의 각 성분에 대해 변경 여부를 무작위로 결정한 다음 변경할 때는 0~5 사이의 정수로 임의 교체하세요. 
    for i in range(matrix.shape[0]):
        for j in range(matrix.shape[1]):
            if np.random.randint(0,2)==1:
                matrix[i,j]=np.random.randint(0,6,1)
    return matrix
image1=make_image(3,3)
print(image1)
print()
image2=change_little(np.copy(image1))
print(image2)
print()
image3=image1-image2
print(image3)
print()
image3=np.abs(image3)
print(image3)

