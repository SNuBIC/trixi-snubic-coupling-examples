# Multi-variable coupled p4est mesh-view example.
#
# Aimed at Trixi.jl PR #2456 ("Enhanced p4est mesh view coupling"), whose key
# feature is coupling systems that use MORE THAN ONE variable across p4est mesh
# views. The upstream branch introduces the elixir
#     examples/p4est_2d_dgsem/elixir_euler_mhd_coupled.jl
# in which a compressible Euler system (4 variables) is coupled to an ideal-GLM
# MHD system (9 variables) across coupled p4est mesh views.
#
# This wrapper prefers to locate and `include` the upstream elixir rather than
# re-implement the multi-variable coupling. Requires an environment set up via
# scripts/setup_pr2456.jl.
using Trixi

const UPSTREAM_ELIXIR =
    joinpath(examples_dir(), "p4est_2d_dgsem", "elixir_euler_mhd_coupled.jl")

if isfile(UPSTREAM_ELIXIR)
    @info "Running upstream Euler-MHD coupled mesh-view elixir" UPSTREAM_ELIXIR
    trixi_include(UPSTREAM_ELIXIR; maxiters = 3)  # a few timesteps: smoke-level
    println("Multi-variable coupled mesh-view example completed.")
else
    @warn """
    Upstream elixir not found at:
      $(UPSTREAM_ELIXIR)
    This Trixi.jl revision does not include the enhanced multi-variable coupling
    of PR #2456. Set up the PR #2456 environment with scripts/setup_pr2456.jl
    (branch sc/p4est-view-coupled-enhanced) and try again.
    """
end
