# Base setup: add the current upstream Trixi.jl (main) into this project.
#
# Trixi.jl is intentionally NOT vendored in this repository. This script pulls
# it in on demand so the wrapper stays lean.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
Pkg.add(Pkg.PackageSpec(url = "https://github.com/trixi-framework/Trixi.jl"))
# Trixi.jl uses ordinary-diff-eq subpackages in its elixirs; add the ones the
# coupled p4est examples need so the smoke tests can run.
Pkg.add(["OrdinaryDiffEqLowStorageRK", "OrdinaryDiffEqSSPRK"])
Pkg.instantiate()
println("Base environment set up (upstream Trixi.jl main).")
