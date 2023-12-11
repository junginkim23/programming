# -*- coding: utf-8 -*-
"""crawling_python

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1sfF6HH67vTVRRf1lFoSHDQ1p3yhPlqen
"""

!mkdir data

!cp chromedriver inscrawler/bin/chromedriver

# 필요 패키지 임포트
import os
import json
import urllib.request

import selenium
from inscrawler import InsCrawler

## 필요 함수 
# 해시태그 기반 인스타그램 크롤러 객체 생성 
def get_posts_by_hashtag(tag, number, debug):
    ins_crawler = InsCrawler(has_screen=debug)
    return ins_crawler.get_latest_posts_by_tag(tag, number)

# 크롤링 결과 txt파일 저장 
def output(data, filepath):
    out = json.dumps(data, ensure_ascii=False)
    if filepath:
        with open(filepath, "w", encoding="utf8") as f:
            f.write(out)
    else:
        print(out)

# 이미지 다운로드 함수 
def imagedownload(file_path, hashtag):
    f = open(file_path, "r", encoding="utf-8")
    line = f.readline()
    posts = json.loads(line)
    for i, post in enumerate(posts):
        # print(post["img_url"])
        urllib.request.urlretrieve(post["img_url"], f'./data/{hashtag}/{str(i)}.jpg')

hashtags = ['iggy', 'Shiba']
num_crawling = 15
show = True

for hashtag in hashtags:
    if not os.path.exists(f'./data/{hashtag}'):
        os.makedirs(f'./data/{hashtag}')
    output(get_posts_by_hashtag(hashtag, num_crawling, show), f'./data/{hashtag}/output.txt')
    imagedownload(f'./data/{hashtag}/output.txt', hashtag)