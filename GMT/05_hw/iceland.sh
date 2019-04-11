out_ps=iceland.ps
input_list=123.list
cpt=04_report.cpt
 
gmt set PS_MEDIA A4

gmt makecpt -T0/30/15 -Crainbow -Z > $cpt
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
# Main map
gmt psbasemap -R-25/-12/62/67 -Jm1 -BwEsN -B1 -G0/250/250 -X-0.5 -Y10 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
awk -F'[,]' '{if ($4>=0 && $4<1) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=1 && $4<2) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=2 && $4<3) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=3 && $4<4) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
echo -16 68 22,1,black 0 CM Iceland Earthquakes of Past 48 Hours on 3/28 | gmt pstext -R -J -F+f+a+j -N -O -K >> $out_ps
# Bottom map
gmt psbasemap -R-25/-12/0/30 -Jx1/-0.08 -Bxa1f10 -Bya10f20 -X0 -Y-4 -O -K >> $out_ps
awk -F'[,]' '{if ($4>=0 && $4<1) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=1 && $4<2) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=2 && $4<3) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=3 && $4<4) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

# Right map
gmt psbasemap -R0/30/62/67 -Jx0.08/2.33 -Bxa10f20 -Bya1f1 -X14.8 -Y4 -O -K >> $out_ps
awk -F'[,]' '{if ($4>=0 && $4<1) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=1 && $4<2) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=2 && $4<3) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=3 && $4<4) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

gmt psscale -C$cpt -D-8/-6+w12/0.3+jTC+h -Bxaf+l"Depth" -By+lkm -O -K >> $out_ps
 

# end gmt session 
gmt psxy -R -J -O -T >> $out_ps 
 
# convert to pdf 
gmt psconvert $out_ps -P -Tf 
# convert to png 
gmt psconvert $out_ps -P -Tg