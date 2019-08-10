# Script to calculate the availabily of solar power over the year
using DataFrames, FeatherFiles, Statistics 

const AREA = 16.0 # area of the solar panels

function calc_average_power(df)
    return AREA * mean(df.Power_Generation)
end

function calc_rel_availability(df, min_power)
    minpower = df[df.Power_Generation * AREA .> min_power, :Power_Generation]
    minpowercount = size(minpower)[1]
    return 100 * minpowercount / size(df)[1]
end

function calc_non_zero_percent(df)
    return calc_rel_availability(df, 0.0)
end

if !isdefined(@__MODULE__, :df) df=DataFrame(load("data/solaryear.feather")) end

av = calc_average_power(df)
println("Average solar power [W]:                     ", round(av, digits=1))
println("Percentage of solar power availability   [%]: ", round(calc_non_zero_percent(df), digits=1))
println("Percentage of time for more than average [%]: ", round(calc_rel_availability(df, av), digits=1))
println("Percentage of time for more than 50% av. [%]: ", round(calc_rel_availability(df, av/2), digits=1))

