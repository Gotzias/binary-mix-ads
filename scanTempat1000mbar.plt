#!/usr/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 4.4 patchlevel 3
#    	last modified March 2011
#    	System: Linux 3.8.0-35-generic
#    
#    	Copyright (C) 1986-1993, 1998, 2004, 2007-2010
#    	Thomas Williams, Colin Kelley and many others
#    
#    	gnuplot home:     http://www.gnuplot.info
#    	faq, bugs, etc:   type "help seeking-assistance"
#    	immediate help:   type "help"
#    	plot window:      hit 'h'
#  set terminal postscript landscape enhanced defaultplex \
   leveldefault monochrome colortext \
   dashed dashlength 1.0 linewidth 1.0 butt noclip \
   palfuncparam 2000,0.003 \
   "Helvetica" 14 
#set terminal png size 800,600 enhanced font "Helvetica,15"
#unset output 
#unset term
#set term wxt
reset
unset multiplot


set terminal postscript eps enhanced color "Helvetica" 14
set output "Press1000mbar.eps"
set dummy x,y
set format x "% g"
set format y "% g"
set grid xtics nomxtics ytics nomytics
set grid layerdefault linetype 0 linewidth 0.0500 
set grid
set key default
set key font 'Times-Roman, 9
set key samplen 4 spacin 2 
#set key inside t c 
set key above vertical maxrows 5
set key width 1
unset logscale

set style data points
set style function lines
set xzeroaxis linetype -2 linewidth 1.000
set yzeroaxis linetype -2 linewidth 1.000

set xrange [ 0 : 1.0 ] noreverse nowriteback
set yrange [ 0: 5 ] noreverse nowriteback

set xtics 0.2
#set ytics 2
set style line 101 lc rgb '#808080' lt 1 lw 1
set border -1 front ls 101
set tics nomirror out scale 0.75
######################################################################################################################
set macros
# Placement of the a,b,c,d labels in the graphs

set macros
# Placement of the a,b,c,d labels in the graphs
POS= "at graph 0.4,.92 font 'Times-Roman,14' front rotate by 0 tc rgb '#606060' "
POSP= "at graph 0.05,.92 font 'Times-Roman,14' front rotate by 0 tc rgb '#606060'"
POST= "at graph 0.05,.05 font 'Times-Roman,12' front rotate by 0"
POStotal= "at graph 0.40,.49 font 'Times-Roman,12' front rotate by 0"
POSkno= "at graph 0.62,.21 font 'Times-Roman,12' front rotate by 0"
POSgme= "at graph 0.32,.82 font 'Times-Roman,12' front rotate by 0"
# x- and ytics for each row resp. column
POSC= "at graph 0.05,0.9 left font 'Times-Roman,10'"
# x- and ytics for each row resp. column


load 'moreland.pal'

NOXTICS = "set format x ''; unset xlabel"
XTICSL = "set format x '% g' ;set xtics scale 'minor' font ',8' offset 0. 0.2 ;set xlabel 'mole fraction x_{CO_2}' offset 0,0.5 font ',10' tc rgb '#606060'"

NOYTICS = "set format y '%g'; set ytics 10; unset ylabel"
YTICSL = "set format y '% g'; set yrange [0:3]; set ytics scale 'minor' font ',8' 0.5; set ylabel 'CO_2 uptake (mmol/g)'  offset 3.5,0. font ',10' tc rgb '#606060 "
YTICSL2 = "set format y '% g'; set yrange [0:1.5]; set ytics scale 'minor' font ',8' .2; set ylabel 'CH_4 uptake (mmol/g)'  offset 4,0. font ',10' tc rgb '#606060 "
YTICSL3 = "set format y '% g'; set yrange [2:8]; set ytics scale 'minor' font ',8' .5; set ylabel 'CO_2 / CH_4 selectivity '  offset 3.5,0. font ',10' tc rgb '#606060 "
YTICSNL = "set format y ''; unset ylabel "


#######################################################################################




# Margins for each row resp. column
TOPMARGIN         = "set tmargin at screen 0.8; set bmargin at screen 0.10"
LEFTMARGIN        = "set lmargin at screen 0.07; set rmargin at screen 0.33"
MID1MARGIN        = "set lmargin at screen 0.39; set rmargin at screen 0.65"
MID2MARGIN        = "set lmargin at screen 0.71; set rmargin at screen 0.97"
HEIGHINS1         = "set tmargin at screen 0.76; set bmargin at screen 0.56"
WIDTHINS1         = "set lmargin at screen 0.43; set rmargin at screen 0.60"
HEIGHINS2         = "set tmargin at screen 0.76; set bmargin at screen 0.56"
WIDTHINS2         = "set lmargin at screen 0.73; set rmargin at screen 0.90"
######################################################################################################################


#unset key
#set key off
unset multiplot

#set view map
#set size ratio .9

#set object 1 rect from graph 0, graph 0 to graph 1, graph 1 back
#set object 1 rect fc rgb "black" fillstyle solid 1.0

Tgive="274 276 278 280 282 284 286 288 290 292 294 296 298 300 302 304 306 308 310 312"
### Start multiplot (2x3 layout)
set multiplot layout 3,2 rowsfirst
# --- GRAPH a
@TOPMARGIN; @LEFTMARGIN
@XTICSL; @YTICSL
set label 1 'structure : acc' @POSP
plot for [i=1:20] 'competition_CO2_acc@1000.mbar.dat' u 2:i+2 with lines ls (i+2)*8/20 lw 2 notitle
unset label 1
#unset label 2
#unset label 3 
#unset label 4
#unset label 5 
#unset label 6 
### Start multiplot (2x3 layout)
#set multiplot layout 2,1 rowsfirst
# --- GRAPH b
@TOPMARGIN; @MID1MARGIN
@XTICSL; @YTICSL2 
set label 1 'P = 1000 mbar' @POS

plot for [i=1:20] 'competition_CH4_acc@1000.mbar.dat' u 2:i+2 with lines ls (i+2)*8/20 lw 2 ti 'T='.word(Tgive, i).' K'
unset label 1
# --- GRAPH c
@TOPMARGIN; @MID2MARGIN
@XTICSL; @YTICSL3
#set label 1 'selectivity' @POS
plot for [i=1:20] 'competition_selectivity_acc@1000.mbar.dat' u 2:i+2 with lines ls (i+2)*8/20 lw 2 notitle


unset multiplot
### End multiplot







