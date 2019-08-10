# Functions to calculate the availabily of solar power over the year

using DataFrames, FeatherFiles, Statistics 

function calc_average_power(df)
end

function calc_rel_availability(df, min_power)
end

function calc_non_zero_percent(df)
    nonzeropower = df[df.Power_Generation .> 0, :Power_Generation]
    nonzerocount = size(nonzeropower)[1]
    return 100 * nonzerocount / size(df)[1]
end

if !isdefined(@__MODULE__, :df) df=DataFrame(load("data/solaryear.feather")) end

println("Percentage of solar power availability: ", round(calc_non_zero_percent(df), digits=2), "%")

