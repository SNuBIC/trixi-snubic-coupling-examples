# Base smoke test: activate the project and verify that Trixi.jl imports.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
using Trixi
println("Base environment loaded. Trixi.jl version: ",
        pkgversion(Trixi))
println("Base smoke test passed.")
