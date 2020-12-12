#!/bin/bash
gmt set MAP_FRAME_TYPE plain
gmt set MAP_ANNOT_OFFSET_PRIMARY 8p
gmt set MAP_TICK_LENGTH -0.2c
gmt set FORMAT_GEO_MAP ddd.x
gmt set FONT_ANNOT_PRIMARY 8p
gmt set FONT_TITLE 12p
gmt set FONT_LABEL 12p

out_ps=Mariana.ps
grd2=/root/.gmt/server/earth_relief_15m.grd
#grd=./grid/MarianaTrench_South_ASCII_bathy.grd
grd=./basin.grd
int=./basin_shadow.grd
cpt=./mariana.cpt
site=./sites.txt

gmt psbasemap -R141/143.5/10.7/12 -JM10c -Bx0.5f0.1+l"Longitude" -By0.5f0.1+l"Latitude"  -BWSne+t"test" -K   > $out_ps
gmt grdimage $grd -R -J -B -C$cpt -E500 -V -K -O >> $out_ps
gmt grdcontour $grd -R -J  -B -C500 -A1500 -Wa0.5p,black -Wc0.3p,white  -Gd8c -K -O >> $out_ps 


cat $site |awk '{print $1,$2}'| gmt psxy -R -J -Sc0.2c -W0.5p,black -Gred -K -O >> $out_ps
cat $site |awk '{print $1,$2,"7,black=~2p,white","CB",$3}'| gmt pstext -R -J -F+f+j -D0c/-0.4c -K -O >> $out_ps


gmt psscale -R -J -C$cpt -DjBR+w7c/0.5c+o-2c/0c -Bxa1500f500 -By+l"Depth"  -K -O >> $out_ps


gmt psbasemap -Rg -JA142/12/3c -Bg -K -O -X13c -Y7c >> $out_ps
gmt grdimage $grd2 -Rg -JA142/12/3c -Bg -Cglobe -E1000 -V -K -O >> $out_ps
#gmt pscoast -Rg -JA142/12/3c -Bg -Dc -A1000 -Gwhite -S100/200/255 -K -O >> $out_ps
#gmt pscoast -Rg -JA142/12/3c -Bg -Dc -A1000   -K -O >> $out_ps


echo "142 11.15" |gmt psxy -R -J -Sa0.2c -Gred -K -O >> $out_ps


rm gmt.conf gmt.history
ps2pdf $out_ps

