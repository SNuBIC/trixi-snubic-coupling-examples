# Upstream PR mapping

This repository wraps and documents selected Trixi.jl pull requests by
Simon Candelaresi that are relevant to **p4est mesh-view coupling** in the
SNuBIC context. All PR branches live directly in the
[`trixi-framework/Trixi.jl`](https://github.com/trixi-framework/Trixi.jl)
repository (not in a personal fork), which is why the setup scripts can pin
both branch names and exact commit SHAs.

## Development line at a glance

```
#2110 (merged 2025-04-16)  Enhanced p4est mesh views (infrastructure)
      └─> #2366 (merged 2026-03-04)  p4est view coupled (single-variable coupling)
             └─> #2456 (open)  Enhanced p4est mesh view coupling (multi-variable)
                    └─> #2598 (open)  p4est view coupled hanging nodes (non-conforming)
```

PR #2598 is based on the branch of PR #2456, which in turn builds on the merged
work of #2366 and #2110.

## Primary PRs

### PR #2456 — Enhanced p4est mesh view coupling
- URL: https://github.com/trixi-framework/Trixi.jl/pull/2456
- State: open
- Upstream branch: `sc/p4est-view-coupled-enhanced`
- Pinned SHA: `c5969fad14d80d1a6c08e44c5d49cf94182ec8eb`
- Main theme: ability to couple systems that use **more than one variable**
  across p4est mesh views (e.g. Euler ↔ MHD).
- Upstream example introduced:
  `examples/p4est_2d_dgsem/elixir_euler_mhd_coupled.jl`
- Repository mapping:
  `scripts/setup_pr2456.jl`, `examples/run_mesh_view_multivar.jl`,
  `scripts/smoke_test_pr2456.jl`

### PR #2598 — WIP: Sc/p4est view coupled hanging nodes
- URL: https://github.com/trixi-framework/Trixi.jl/pull/2598
- State: open (WIP)
- Upstream branch: `sc/p4est-view-coupled-hanging-nodes`
  (based on `sc/p4est-view-coupled-enhanced`)
- Pinned SHA: `159d9c2c115a975d51bc4997e854014b40e37e7a`
- Main theme: coupling p4est mesh views with **hanging / non-conforming nodes**
  (AMR mortars).
- Upstream examples introduced:
  `examples/p4est_2d_dgsem/elixir_advection_coupled_with_amr_mortars.jl`,
  `examples/p4est_2d_dgsem/elixir_advection_coupled_checkerboard_views.jl`
- Repository mapping:
  `scripts/setup_pr2598.jl`, `examples/run_hanging_nodes_placeholder.jl`,
  `scripts/smoke_test_pr2598.jl`

## Merged precursor PRs

### PR #2366 — Sc/p4est view coupled
- URL: https://github.com/trixi-framework/Trixi.jl/pull/2366
- State: merged 2026-03-04
- Upstream branch: `sc/p4est-view-coupled`
- Merge SHA (head): `e8bba4ba77c31df428469b2a51f41009ca96b43c`
- Role: merged precursor and conceptual basis for minimal single-variable
  coupled p4est examples. Introduced `P4estMeshView`,
  `BoundaryConditionCoupledP4est`, `SemidiscretizationCoupledP4est`,
  `AnalysisCallbackCoupledP4est`, and
  `examples/p4est_2d_dgsem/elixir_advection_coupled.jl`.

### PR #2110 — WIP: Sc/Enhanced p4est mesh views
- URL: https://github.com/trixi-framework/Trixi.jl/pull/2110
- State: merged 2025-04-16
- Upstream branch: `sc/p4est-view-enhanced`
- Head SHA: `87ab0835112a272aaa27ab9d5c53b1283442d540`
- Role: earlier merged infrastructure for enhanced p4est mesh-view support,
  underpinning the later coupling work.

## Optional historical notes

These earlier explorations are part of the same development line and may be of
interest for archival completeness, but are not central to this repository:

- `#1761` — WIP: Sc/p4est view
- `#1595` — Sc/p4est coupling
- `#1881` — WIP: sc/p4est_coupled

## A note on `pull/<id>/head` vs. branch refs

Because these PR branches live in `trixi-framework/Trixi.jl` itself, the most
robust way to check them out with Julia's `Pkg` is by **branch name**
(`rev = "sc/..."`) or by the **exact commit SHA** (`rev = "<sha>"`). The
`rev = "pull/<id>/head"` form is a GitHub-specific ref that Julia's package
manager does not always resolve, so the setup scripts avoid it.
