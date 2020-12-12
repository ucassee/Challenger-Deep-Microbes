#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Yingli Zhou
# Version:0.1

import time
from shutil import copyfile
import sys

class gtdbtk():
    def __init__(self,inputFilelist,outputFiledir,outputFilelist,number):
        self._inputFilelist = inputFilelist
        self._outputFiledir = outputFiledir
        self._outputFilelist = outputFilelist
        self._number = number
        print('start:'+time.strftime('%Y-%m-%d %H:%M:%S'))

### load listfile to count kegg annotation for each bins
    def pick(self):
        global gtdbdict,result,species,idpick,idpick_trans,icount,referencenumber
        referencenumber =self._number
        gtdbdict={}
        result=[]
        species=set()
        idpick=[]
        idpick_trans=[]
        with open(self._inputFilelist,'r+') as phylumFile:
            lines=phylumFile.readlines()
            for line in lines:
                if line.startswith('user_genome'): continue
                classify=line.split('\t')[1]
                classifyend=classify.find('__;')
                if classifyend!=-1:
                    species.add(classify[0:classifyend-2])
                else:
                    species.add(classify.split(';s__')[0])

        with open('/data2017/share/tools/miniconda3/share/gtdbtk-0.1.6/db/release86/taxonomy/gtdb_taxonomy.tsv','r+') as gtdb_taxonomyFlie:
            lines=gtdb_taxonomyFlie.readlines()
            for line in lines:
                binid=line.split('\t')[0].strip()
                bintax=line.split('\t')[1].strip()
                gtdbdict[binid]=bintax

        for i in species:
            icount = {}
            icount = 0
            for key,value in gtdbdict.items():
                if gtdbdict[key].find(i)!= -1:
                    icount += 1
                    if icount<= int(referencenumber):
                       idpick.append(key)
                    else:
                        break

        idpick=list(set(idpick))

        n=0
        for i in idpick:
            n+=1
            result.append('ref'+str(n)+'\t'+i+'\t'+gtdbdict[i]+'\n')
            if i.find('_')!=-1:
                idpick_trans.append(i[3:])
            else:
                idpick_trans.append(i)
        n=0
        for i in idpick_trans:
            n+=1
            copyfile('/data2017/share/tools/miniconda3/share/gtdbtk-0.1.6/db/release86/fastani/database/'+i+'_genomic.fna.gz', self._outputFiledir+'/ref'+str(n)+'.fasta.gz')

        with open(self._outputFilelist,'w+') as referencelist :
             referencelist.writelines(result)

a=gtdbtk(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4])
b=a.pick()
