# Create output using: gnuplot -c elliptic-curves.gnuplot > elliptic-curves.pdf
set terminal pdf solid font "Arial,12"

if (!exists("MP_LEFT"))   MP_LEFT = .05
if (!exists("MP_RIGHT"))  MP_RIGHT = .90
if (!exists("MP_BOTTOM")) MP_BOTTOM = .1
if (!exists("MP_TOP"))    MP_TOP = .9
if (!exists("MP_GAP"))    MP_GAP = 0.05

set multiplot layout 4, 4 rowsfirst margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_GAP

set xzeroaxis
#set xtics axis
unset xtics
set xrange [-3:3]

set yzeroaxis
#set ytics axis
unset ytics
set yrange [-3:3]

unset zzeroaxis
unset ztics

set border -1
set key noautotitle
unset colorbox
set nokey

set view 0,0
set isosample 500,500
set contour base
set cntrparam levels discrete 0
unset surface

f(x,y,a,b) = x**3 + a*x + b - y**2

set title "b = -1"
splot [-3:3][-3:3] f(x,y, -2, -1) lt -1
set title "b = 0"
splot [-3:3][-3:3] f(x,y, -2, 0) lt -1
set title "b = 1"
set ylabel "a = -2" offset 11,0
splot [-3:3][-3:3] f(x,y, -2, 1) lt -1
unset ylabel
set title "b = 2"
splot [-3:3][-3:3] f(x,y, -2, 2) lt -1
unset title

splot [-3:3][-3:3] f(x,y, -1, -1) lt -1
splot [-3:3][-3:3] f(x,y, -1, 0) lt -1
set ylabel "a = -1" offset 11,0
splot [-3:3][-3:3] f(x,y, -1, 1) lt -1
unset ylabel
splot [-3:3][-3:3] f(x,y, -1, 2) lt -1

splot [-3:3][-3:3] f(x,y, -0, -1) lt -1
splot [-3:3][-3:3] f(x,y, -0, 0) lt -1
set ylabel "a = 0" offset 11,0
splot [-3:3][-3:3] f(x,y, -0, 1) lt -1
unset ylabel
splot [-3:3][-3:3] f(x,y, -0, 2) lt -1

splot [-3:3][-3:3] f(x,y, 1, -1) lt -1
splot [-3:3][-3:3] f(x,y, 1, 0) lt -1
set ylabel "a = 1" offset 11,0
splot [-3:3][-3:3] f(x,y, 1, 1) lt -1
unset ylabel
splot [-3:3][-3:3] f(x,y, 1, 2) lt -1

unset multiplot