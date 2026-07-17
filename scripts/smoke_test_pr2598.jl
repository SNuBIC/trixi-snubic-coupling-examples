# PR #2598 smoke test: load the environment and reach the (exploratory)
# hanging-node coupled example loading stage. Because PR #2598 is WIP, the
# example itself treats runtime failure as a non-fatal expected outcome.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))
using Trixi
include(joinpath(@__DIR__, "..", "examples", "run_hanging_nodes_placeholder.jl"))
println("PR #2598 smoke test reached example loading stage.")
