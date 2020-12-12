#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Yingli Zhou
# version 0.1.0 2020/4/14

from collections import defaultdict
import pprint
import sys

result = []

def extract_16s(filename):
    with open(filename, 'r+') as inputFile:
        sitename = filename.split('_1')[0]
        n = 0
        result = []
        seqdict = {};
        seq16sdict = {}
        for line in inputFile.readlines():
            if line.startswith('>'):
                id = line
                seqdict[id] = ''
            else:
                seqdict[id] += line.strip()

        for id in seqdict.keys():
            if id.find('16S_') != -1 and len(seqdict[id]) >= 100:
                n += 1
                seq16sdict['>' + sitename + '_' + str(n)] = seqdict[id]
                result.append('>' + sitename + '_' + str(n) + '\n' + seq16sdict['>' + sitename + '_' + str(n)] + '\n')

        with open(sitename + '.fa', 'w+') as outputFile:
            outputFile.writelines(result)


def get_novel_percentage(seqfile, blastfile, resultfile):
    sample_dict_raw = defaultdict(list)
    sample_dict = defaultdict(list)
    with open(seqfile, 'r') as f:
        for i in f.readlines():
            if i.startswith('>'):
                sample_name = ('_').join(i.strip('>').split('_')[:-1])
                sample_dict_raw[sample_name].append(i)

    with open(blastfile, 'r') as f:
        for i in f.readlines():
            ipart = i.split('\t')
            sample_name = ('_').join(ipart[0].split('_')[:-1])
            identify_rate = float(ipart[2])
            sample_dict[sample_name].append(identify_rate)

    total_new_genes = 0
    for sample_name in sample_dict.keys():
        n = 0
        print(sample_name)
        for i in sample_dict[sample_name]:
            if i < 97:
                total_new_genes += 1
                n += 1
            novel_rate = n / len(sample_dict_raw[sample_name])
        #       novel_rate =n/3000    ### for tara_ocean
        print(n)
        print(len(sample_dict_raw[sample_name]))
        print(len(sample_dict[sample_name]))
        print(novel_rate)
        print('\n')
        result.append(sample_name + '\t' + str(novel_rate) + '\n')

    pprint.pprint(result)
    print(total_new_genes)
    with open(resultfile, 'w') as f:
        f.writelines(result)


if __name__ == '__main__':
    inputfile = sys.argv[1]
    extract_16s(inputfile)
