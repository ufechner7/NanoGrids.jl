using DataFrames, PyPlot, Statistics, FeatherFiles

AREA = 16.0 # area of the solar panels

df = DataFrame(load("./data/solaryear.feather"))

plot(df.Power_Generation*AREA)
title("Solar power, 16 m², Gouda, NL")

mean(df.Power_Generation*AREA)
