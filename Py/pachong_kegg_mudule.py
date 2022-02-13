#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Yingli Zhou
# version 0.1.0 2022/1/1


from collections import defaultdict
import requests
import re
# 下载一个网页
url = 'http://rest.kegg.jp/link/ko/M00001'
# 模拟浏览器发送http请求
response = requests.get(url)
# 编码方式
response.encoding='utf-8'
# 目标主页的网页源码
html = response.text

with open(r'F:\kegg\module.txt','w+') as f:
    f.writelines(html)

module_dict = defaultdict(list)
module_description = {}
with open(r'','r') as f:
    for i in f.readlines():
        ipart = i.strip().split('\t')
        module = ipart[0].split(':')[1]
        ko_id = ipart[1].split(':')[1]
        module_dict[module].append(ko_id)

with open(r'','r') as f:
    for i in f.readlines():
        ipart = i.strip().split('\t')
        module = ipart[0].split(':')[1]
        description = ipart[1]
        module_description[module] =description

for module in module_dict.keys():
    ko_list ='\t'.join(module_dict[module])
    print('%s\t%s\t%s' % (module,ko_list,module_description[module]))