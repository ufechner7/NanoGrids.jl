# Script to calculate the availabily of wind power over the year
using DataFrames, FeatherFiles, Statistics 

AREA = 0.25445
V_MIN = 6.0    # minimal wind speed at average height [m/s]

function calc_average_power(df)
    minpower = df[df.Wind_Speed_at_Hub_Height .> V_MIN, :Power_Generation]
    return AREA * mean(minpower) * calc_rel_availability(df, 0.0) / 100.0
end

function calc_peak_power(df)
    return AREA * maximum(df.Power_Generation)
end

function calc_capacity_factor(df)
    return 100 * calc_average_power(df) / calc_peak_power(df)
end

function calc_rel_availability(df, min_power)
    minpower = df[(df.Power_Generation * AREA .> min_power) .& (df.Wind_Speed_at_Hub_Height .> V_MIN), :Power_Generation]
    return 100 * size(minpower, 1) / size(df, 1)
end

if !isdefined(@__MODULE__, :df) df=DataFrame(load("data/windyear.feather")) end

av = calc_average_power(df)
println("Average wind power [W]:                      ", round(av, digits=1))
println("Capacity factor [%]:                          ", round(calc_capacity_factor(df), digits=1))
println("Percentage of wind power availability    [%]: ", round(calc_rel_availability(df, 0.0), digits=1))
println("Percentage of time for more than 50% av. [%]: ", round(calc_rel_availability(df, av/2), digits=1))
println("Percentage of time for more than average [%]: ", round(calc_rel_availability(df, av), digits=1))
