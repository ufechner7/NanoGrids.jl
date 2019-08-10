using CSV, DataFrames, PyPlot, Statistics, FeatherFiles

AREA = 16.0 # area of the solar panels

FILE_NAME = "./data/1_2008_Solar_Final_52.0 4.7.csv"
df1 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/2_2008_Solar_Final_52.0 4.7.csv"
df2 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/3_2008_Solar_Final_52.0 4.7.csv"
df3 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/4_2008_Solar_Final_52.0 4.7.csv"
df4 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/5_2008_Solar_Final_52.0 4.7.csv"
df5 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/6_2008_Solar_Final_52.0 4.7.csv"
df6 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/7_2008_Solar_Final_52.0 4.7.csv"
df7 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/8_2008_Solar_Final_52.0 4.7.csv"
df8 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/9_2008_Solar_Final_52.0 4.7.csv"
df9 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/10_2008_Solar_Final_52.0 4.7.csv"
df10 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/11_2008_Solar_Final_52.0 4.7.csv"
df11 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

FILE_NAME = "./data/12_2008_Solar_Final_52.0 4.7.csv"
df12 = CSV.File(FILE_NAME, normalizenames=true) |> DataFrame!

df = [df1;df2;df3;df4;df5;df6;df7;df8;df9;df10;df11;df12]
plot(df.Power_Generation*AREA)
mean(df.Power_Generation*AREA)
save("./data/solaryear.feather", df)
