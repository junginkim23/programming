#!/usr/bin/env python
# coding: utf-8

# In[17]:


def binary_search(numbers,target_number):
    min_value=0
    max_value=len(numbers)
    while True:
        try: 
            while min_value<=max_value:
                middle=(min_value+max_value)//2
                if numbers[middle]==target_number:
                    print("{1}은(는) {0}번째에 있다.".format(middle,target_number))
                    break
                elif numbers[middle]<target_number:
                    min_value=middle+1
                else:
                    max_value=middle-1
            break
        except:
            print("리스트에 해당 요소가 없다.")
            break
numbers=[1,2,3,4,5,6,7,8,9,10,11,12,13]
target_numbers=15
binary_search(numbers,target_numbers)

