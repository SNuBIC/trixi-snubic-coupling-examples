# Setup for the PR #2456 path: "Enhanced p4est mesh view coupling"
# (multi-variable coupling across p4est mesh views).
#
# Upstream branch: sc/p4est-view-coupled-enhanced
# Pinned SHA:      c5969fad14d80d1a6c08e44c5d49cf94182ec8eb
#
# The branch lives in trixi-framework/Trixi.jl itself (not a fork), so we can
# check out the branch by name. To pin the exact revision instead, replace the
# `rev` below with the SHA. If the SHA becomes unavailable after an upstream
# force-push, fall back to the branch name.
import Pkg
Pkg.activate(joinpath(@__DIR__, ".."))

const TRIXI_URL = "https://github.com/trixi-framework/Trixi.jl"
const PR2456_BRANCH = "sc/p4est-view-coupled-enhanced"
const PR2456_SHA = "c5969fad14d80d1a6c08e44c5d49cf94182ec8eb"  # exact revision

# Use the branch name for robustness; switch to PR2456_SHA to pin exactly.
Pkg.add(Pkg.PackageSpec(url = TRIXI_URL, rev = PR2456_BRANCH))
Pkg.add(["OrdinaryDiffEqLowStorageRK", "OrdinaryDiffEqSSPRK"])
Pkg.instantiate()
println("PR #2456 environment set up (branch $(PR2456_BRANCH)).")
println("To pin exactly, set rev = \"$(PR2456_SHA)\".")
