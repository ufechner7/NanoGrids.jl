using DataFrames, PyPlot, Statistics, FeatherFiles

AREA = 0.25445

dfw = DataFrame(load("./data/windyear.feather"))

plot(dfw.Power_Generation*AREA)
title("Wind power, 0.75 m² Wind Drone, Gouda, NL")
