# Trixi.jl Model Coupling Examples

SNuBIC-facing wrapper repository for selected Trixi.jl coupling and mesh-view
developments by Simon Candelaresi.

This repository collects minimal examples, setup helpers, and citation metadata
for developments related to **p4est mesh-view coupling** in
[Trixi.jl](https://github.com/trixi-framework/Trixi.jl).

## Scope

The repository covers the following upstream Trixi.jl pull requests by
Simon Candelaresi:

| PR | Title | State | Opened | Upstream branch |
|----|-------|-------|--------|-----------------|
| [#2456](https://github.com/trixi-framework/Trixi.jl/pull/2456) | Enhanced p4est mesh view coupling | open | 2025-06-26 | `sc/p4est-view-coupled-enhanced` |
| [#2598](https://github.com/trixi-framework/Trixi.jl/pull/2598) | WIP: Sc/p4est view coupled hanging nodes | open | 2025-10-09 | `sc/p4est-view-coupled-hanging-nodes` |

It also documents the **merged precursor** developments in the same line:

| PR | Title | State | Opened | Merged |
|----|-------|-------|--------|--------|
| [#2366](https://github.com/trixi-framework/Trixi.jl/pull/2366) | Sc/p4est view coupled | merged | 2025-04-17 | 2026-03-04 |
| [#2110](https://github.com/trixi-framework/Trixi.jl/pull/2110) | WIP: Sc/Enhanced p4est mesh views | merged | 2024-10-14 | 2025-04-16 |

A detailed component-to-PR mapping is in [`docs/upstream-prs.md`](docs/upstream-prs.md).

## Relation to SNuBIC

The developments covered here concern **bulk- and interface-coupling of
heterogeneous models** and **structure-preserving numerical methods**, the theme
of the DFG research unit [SNuBIC](https://www.snubic.io) (FOR 5409).

## Contents

- Setup helpers that add the appropriate Trixi.jl revision into a local Julia
  environment.
- Minimal example drivers exercising the coupling and mesh-view feature paths.
- Lightweight smoke tests.
- Citation metadata ([`CITATION.cff`](CITATION.cff), [`.zenodo.json`](.zenodo.json))
  and a Zenodo DOI placeholder.

Trixi.jl is not vendored; the setup scripts pin upstream revisions (exact SHAs,
with branch fallbacks) for reproducibility.

## Requirements

- Julia `1.10` or newer.
- A C toolchain is not required: `P4est_jll` is provided as a Julia artifact by
  Trixi.jl's dependencies.

## Quick start

All setup scripts activate this project (`--project=.`) and add the appropriate
Trixi.jl revision into the environment.

### Base setup (upstream `main` Trixi.jl)

```bash
julia --project=. scripts/setup_base.jl
```

### Setup for the PR #2456 path (enhanced multi-variable coupling)

```bash
julia --project=. scripts/setup_pr2456.jl
```

### Setup for the PR #2598 path (hanging / non-conforming nodes)

```bash
julia --project=. scripts/setup_pr2598.jl
```

Each PR setup script pins both a **branch name** and the **exact commit SHA**.
If a SHA becomes unavailable (e.g. after a force-push upstream), edit the script
to use the branch name only. The pinned revisions are:

| Path | Upstream ref | Pinned SHA |
|------|--------------|------------|
| base | `main` | (tracks upstream `main`) |
| #2456 | `sc/p4est-view-coupled-enhanced` | `c5969fad14d80d1a6c08e44c5d49cf94182ec8eb` |
| #2598 | `sc/p4est-view-coupled-hanging-nodes` | `159d9c2c115a975d51bc4997e854014b40e37e7a` |

## Examples

- [`examples/run_coupled_p4est_minimal.jl`](examples/run_coupled_p4est_minimal.jl)
  — minimal single-variable coupled p4est mesh-view advection setup, following
  the merged path around PR #2366.
- [`examples/run_mesh_view_multivar.jl`](examples/run_mesh_view_multivar.jl)
  — coupling of systems that use more than one variable across p4est mesh views
  (PR #2456).
- [`examples/run_hanging_nodes_placeholder.jl`](examples/run_hanging_nodes_placeholder.jl)
  — exploratory non-conforming / hanging-node coupling (PR #2598).

Where an upstream elixir exists for a given feature path, the example locates
and runs it (via `trixi_include`, with `maxiters` limiting the run to a few
timesteps) rather than re-implementing it.

## Smoke tests

The repository contains lightweight smoke tests:

```bash
julia --project=. scripts/smoke_test_base.jl     # instantiate + import Trixi
julia --project=. scripts/smoke_test_pr2456.jl   # load env + reach example stage
julia --project=. scripts/smoke_test_pr2598.jl   # load env + reach example stage
```

The base setup and import smoke test run on Julia 1.10 against upstream
Trixi.jl. The `run_coupled_p4est_minimal.jl` example steps the coupled
`SemidiscretizationCoupledP4est` solver (merged PR #2366 path) at `maxiters = 3`.
The PR #2456 and #2598 paths require their respective setup scripts (open
branches).

## Citation and DOI

Zenodo DOI:

[https://zenodo.org/records/21411125](https://zenodo.org/records/21411125)

Suggested citation text (see also [`CITATION.cff`](CITATION.cff)):

> Candelaresi, S., Torrilhon, M., Schlottke-Lakemper, M. (2026). *Trixi.jl Model Ccoupling Examples*
> (Version 0.1.0) [Software]. https://github.com/SNuBIC/trixi-model-coupling-examples

## Acknowledgement

The upstream coupling and mesh-view developments covered here are due primarily
to **Simon Candelaresi** within the Trixi.jl ecosystem. Trixi.jl is developed by
the [trixi-framework](https://github.com/trixi-framework) community and is
licensed under the MIT license; this repository is licensed under BSD-3-Clause
(see [`LICENSE`](LICENSE)).
