# PR #2456 smoke test: load the environment and run the multi-variable
# coupled mesh-view example for a very short time span.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
using Trixi
include(joinpath(@__DIR__, "..", "examples", "run_mesh_view_multivar.jl"))
println("PR #2456 smoke test reached example loading stage.")
