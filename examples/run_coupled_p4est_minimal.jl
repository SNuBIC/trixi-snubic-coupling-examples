# Minimal coupled p4est mesh-view example (single variable).
#
# Follows the merged path around Trixi.jl PR #2366 ("Sc/p4est view coupled"),
# which introduced `P4estMeshView`, `BoundaryConditionCoupledP4est` and
# `SemidiscretizationCoupledP4est`, together with the upstream elixir
#     examples/p4est_2d_dgsem/elixir_advection_coupled.jl
#
# To stay faithful to upstream, this wrapper prefers to locate and `include`
# that upstream elixir from the installed Trixi.jl package rather than
# re-implementing it. If the elixir is not found (e.g. running against a
# Trixi.jl revision that predates it), it prints an informative message.
using Trixi

const UPSTREAM_ELIXIR =
    joinpath(examples_dir(), "p4est_2d_dgsem", "elixir_advection_coupled.jl")

if isfile(UPSTREAM_ELIXIR)
    @info "Running upstream coupled p4est advection elixir" UPSTREAM_ELIXIR
    # `maxiters` limits the run to a few solver timesteps, keeping this at
    # smoke-test level regardless of the elixir's internal time span. This is
    # the robust override for elixirs that hard-code their tspan inline.
    trixi_include(UPSTREAM_ELIXIR; maxiters = 3)
    println("Minimal coupled p4est mesh-view example completed.")
else
    @warn """
    Upstream elixir not found at:
      $(UPSTREAM_ELIXIR)
    This Trixi.jl revision may predate PR #2366. Install a compatible revision
    with scripts/setup_pr2456.jl (or a newer main) and try again.
    """
end
