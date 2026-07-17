# Setup for the PR #2598 path: "WIP: Sc/p4est view coupled hanging nodes"
# (coupling p4est mesh views with hanging / non-conforming nodes via AMR mortars).
#
# Upstream branch: sc/p4est-view-coupled-hanging-nodes
#                  (based on sc/p4est-view-coupled-enhanced from PR #2456)
# Pinned SHA:      159d9c2c115a975d51bc4997e854014b40e37e7a
#
# The branch lives in trixi-framework/Trixi.jl itself (not a fork), so we can
# check out the branch by name. To pin the exact revision instead, replace the
# `rev` below with the SHA. If the SHA becomes unavailable after an upstream
# force-push, fall back to the branch name.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))

const TRIXI_URL = "https://github.com/trixi-framework/Trixi.jl"
const PR2598_BRANCH = "sc/p4est-view-coupled-hanging-nodes"
const PR2598_SHA = "159d9c2c115a975d51bc4997e854014b40e37e7a"  # exact revision

# Use the branch name for robustness; switch to PR2598_SHA to pin exactly.
Pkg.add(Pkg.PackageSpec(url = TRIXI_URL, rev = PR2598_BRANCH))
Pkg.add(["OrdinaryDiffEqLowStorageRK", "OrdinaryDiffEqSSPRK"])
Pkg.instantiate()
println("PR #2598 environment set up (branch $(PR2598_BRANCH)).")
println("To pin exactly, set rev = \"$(PR2598_SHA)\".")
println("Note: PR #2598 is WIP; some features may be unstable.")
