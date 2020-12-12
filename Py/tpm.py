#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Yingli Zhou
# version 0.1.0 2020/9/15

import sys

result=[]
def get_csv_dict(inputfile):
    result_dict={}
    with open(inputfile,'r') as f:
        for line in f.readlines()[1:]:
            linepart =line.strip().split('\t')
            lineid = linepart[0]
            len =int(linepart[1])
            result_dict[lineid] = len
    return (result_dict)

len_dict=get_csv_dict(genelenth)
count_dict=get_csv_dict(sys.argv[1])
sumrpk=0
rpkdict={}
genelist=[]
for gene in count_dict.keys():
    rpk = float(count_dict[gene])*1000/len_dict[gene]   ### reads per kbp
    sumrpk += rpk
    rpkdict[gene]=rpk

tpm_dict={}
for gene in genelist:
    TPM=rpkdict[gene]*1000000/sumrpk
    print('%s\t%.2f\t%d'%(gene,TPM,len_dict[gene]))
