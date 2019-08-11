using DataFrames, PyPlot, Statistics, FeatherFiles

AREA = 16.0 # area of the solar panels

df = DataFrame(load("./data/solaryear.feather"))

plot(df.Power_Generation*AREA)
mean(df.Power_Generation*AREA)
