out_ps=iceland.ps
input_list=123.list
cpt=04_report.cpt
 
gmt set PS_MEDIA A4

gmt makecpt -T0/315/15 -Crainbow -Z > $cpt
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
# Main map
gmt psbasemap -R-25/-12/62/67 -Jm1 -BwEsN -B1 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
awk -F'[,]' '{if ($4>=0 && $4<1) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=1 && $4<2) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=2 && $4<3) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=3 && $4<4) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

# Bottom map
gmt psbasemap -R-25/-12/62/67 -Jx1/-0.8 -Bxa1f1 -Bya100f20 -X0 -Y-5 -O -K >> $out_ps
awk -F'[,]' '{if ($4>=0 && $4<1) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=1 && $4<2) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=2 && $4<3) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk -F'[,]' '{if ($4>=3 && $4<4) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

# end gmt session 
gmt psxy -R -J -O -T >> $out_ps 
 
# convert to pdf 
gmt psconvert $out_ps -P -Tf 
# convert to png 
gmt psconvert $out_ps -P -Tg