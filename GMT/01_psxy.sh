echo 0 0 | gmt psxy -R-100/100/-80/120 -JX10 -Sc1 -Ba20g10/a20g10 -P -K > 01_psxy.ps
echo 20 20 | gmt psxy -R-100/100/-80/120 -JX10 -Sc1 -Ba20g10/a20g10 -P -O -K>> 01_psxy.ps
echo 40 40 | gmt psxy -R-100/100/-80/120 -JX10 -Sc1 -Ba20g10/a20g10 -P -O -K>> 01_psxy.ps
echo 60 60 | gmt psxy -R-100/100/-80/120 -JX10 -Sc1 -Ba20g10/a20g10 -P -O>> 01_psxy.ps
