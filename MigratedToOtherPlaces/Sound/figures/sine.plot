# Clear any previous plots.
clear

# Reset all plotting variables to their default values.
reset

set terminal png size 400,300 enhanced font "Helvetica,10"

# We don't need a key (or legend) for this simple graph.
set key off

# Set the title for the graph.
set title "Sinusoïde"

# We want the graph to cover a full sine wave.
set xrange [0:6.28]

# Set the label for the X axis.
set xlabel "Période"

# Set the tick-marks for the X-axis. Use the Postscript
# symbol for Pi.
set xtics ("0" 0,"0.5{/Symbol p}" pi/2, "{/Symbol p}" pi, \
	"1.5{/Symbol p}" 1.5*pi, "2{/Symbol p}" 2*pi)

# Draw a horizontal centreline.
set xzeroaxis

# Pure sine wave amplitude ranges from +1 to -1.
set yrange [-1:1]

# No tick-marks are needed for the Y-axis .
unset ytics

# The wxt terminal is the default, but we need to turn on
# the enhanced feature in order to get the Greek symbols.
#set terminal wxt enhanced

# Plot the curve.
plot sin(5*x)
#set output "sine.png"
