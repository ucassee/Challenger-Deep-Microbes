#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Yingli Zhou
# Version:0.1

### https://www.kegg.jp/kegg-bin/show_brite?ko00001   (down json)
result_koClass=''
result_koAnnotation=''
koAnnotationDict={}
with open('E:\kegg\KO_20191008','r+') as inputFile:
    for line in inputFile.readlines():
        KOpart = line.split('\"')
        if line.startswith('\t\t\t\t\"name\":\"'):
            if line.find('\t\t\t\t\"name\":\"0')!=-1:
                result_koClass+='\n'+''.join(KOpart[3].split(':')[-1][:-1])+'\t'+' '.join(KOpart[3].split(' ')[1:-1])+'\t'
            else:
                result_koClass += '\n' + ''.join(KOpart[3].split(' ')[0]) + '\t' + ' '.join(KOpart[3].split(' ')[1:]) + '\t'
        elif line.find('\"name\":\"K')!=-1:
            result_koClass+=KOpart[3].split('  ')[0]+','
            koAnnotationDict[KOpart[3].split('  ')[0]]=KOpart[3].split('  ')[1]
            #result_koAnnotation+=KOpart[3].split('  ')[0]+'\t'+KOpart[3].split('  ')[1]+'\n'


for key in koAnnotationDict.keys():
    result_koAnnotation+=key + '\t' + koAnnotationDict[key] + '\n'

print(result_koClass)
with open('E:\kegg\kosum20191008.txt','w+') as outputFile:
    outputFile.writelines(result_koClass)

# with open('E:\kegg\koAnnotation20191008.txt','w+') as outputFile:
#     outputFile.writelines(result_koAnnotation)
