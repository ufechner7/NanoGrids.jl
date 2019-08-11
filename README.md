# NanoGrids.jl
Tools to calculate wind and solar powered nano grids

## Requirements
- Julia 1.0 or higher;
- should work on Linux, Windows and Mac

You can download and install Julia from https://julialang.org/downloads/

The following packages must be installed:
- CSV.jl
- DataFrames.jl
- Statistics.jl
- PyPlot.jl
- FeatherFiles.jl

You can install them by first lauchning Julia and then entering the following commands:
```
using Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("Statistics")
Pkg.add("PyPlot")
Pkg.add("FeatherFiles")
using PyPlot
```
This might take 20 minutes, in particular the last command installs a lot of dependencies automatically.

## Usage
First the wind and solar data .csv files need to be imported and converted into .feather files:
```
include("src/import_solar.jl)
include("src/import_wind.jl)
```
Before you run these commands make sure that your current directory is the Nanogrids.jl directory. Example:
```
ufechner@tuxedo:~/NanoGrids.jl$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.1.0 (2019-01-21)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> pwd()
"/home/ufechner/NanoGrids.jl"

julia> 
```
### Plotting the data
```
include("src/plot_solar.jl)
```
Restart Julia, then:
```
include("src/plot_wind.jl)
```
You can zoom into the plot window.

### Calculating statistical data
```
include("calc_solarpower.jl")
include("calc_windpower.jl")
```

The data, that is currently in the data directory is for the location Gauda, the Netherlands.

**Authors:** 
- Dr Uwe Fechner, fechner@aenarete.eu
- Sachin Chitnis