# Hanging-node / non-conforming coupled p4est mesh-view example (EXPLORATORY).
#
# Tied to Trixi.jl PR #2598 ("WIP: Sc/p4est view coupled hanging nodes"), which
# couples p4est mesh views across interfaces with hanging (non-conforming)
# nodes via AMR mortars. The upstream branch introduces the elixirs
#     examples/p4est_2d_dgsem/elixir_advection_coupled_with_amr_mortars.jl
#     examples/p4est_2d_dgsem/elixir_advection_coupled_checkerboard_views.jl
#
# PR #2598 is WORK IN PROGRESS upstream. This driver is therefore labeled
# exploratory: it attempts to run the AMR-mortar elixir for a very short time
# span, but treats runtime failure as a non-fatal, expected outcome for a
# low-credit smoke setup and reports it clearly instead of erroring out.
#
# Requires an environment set up via scripts/setup_pr2598.jl.
using Trixi

const CANDIDATES = [
    joinpath(examples_dir(), "p4est_2d_dgsem",
             "elixir_advection_coupled_with_amr_mortars.jl"),
    joinpath(examples_dir(), "p4est_2d_dgsem",
             "elixir_advection_coupled_checkerboard_views.jl"),
]

elixir = findfirst(isfile, CANDIDATES)

if elixir === nothing
    @warn """
    No hanging-node coupled elixir found under:
      $(joinpath(examples_dir(), "p4est_2d_dgsem"))
    This Trixi.jl revision does not include the PR #2598 hanging-node work. Set
    up the PR #2598 environment with scripts/setup_pr2598.jl (branch
    sc/p4est-view-coupled-hanging-nodes) and try again.
    """
else
    path = CANDIDATES[elixir]
    @info "Attempting exploratory hanging-node coupled elixir (WIP)" path
    try
        trixi_include(path; maxiters = 2)  # a couple of timesteps, exploratory
        println("Hanging-node coupled example completed (exploratory).")
    catch err
        @warn """
        Exploratory hanging-node run did not complete. This is acceptable for
        a WIP feature (PR #2598) in a low-credit smoke setup. The environment
        and elixir were located successfully; only execution was incomplete.
        """ exception = (err, catch_backtrace())
    end
end
