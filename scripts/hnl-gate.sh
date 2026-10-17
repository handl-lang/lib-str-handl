#!/usr/bin/env bash
# hnl gate — `typecheck` + `lint` + `test` over this package's `.hnl` sources.
#
# Sources live in `src/` (one package per repo, ADR-0128 split). Nothing else
# covers them — `cargo` never sees `.hnl`.
#
# Usage:  HNL=../cli/target/debug/hnl scripts/hnl-gate.sh
set -euo pipefail

SRC_DIR="${SRC_DIR:-src}"
HNL="${HNL:-../cli/target/debug/hnl}"
if [ ! -x "$HNL" ]; then
  echo "error: no hnl binary at '$HNL'" >&2
  echo "       build it:   (cd ../cli && cargo build --bin hnl)" >&2
  exit 1
fi

# Dependencies, when declared, are named in `pkg.hnl` by git ref
# (`{ deps: { math: "branch:main" } }`). The tools do not resolve them yet —
# this prints what the package expects so a missing wiring is visible.
if [ -f pkg.hnl ]; then
  echo "pkg.hnl: $(tr -d '\n' < pkg.hnl)"
fi

mapfile -t sources < <(find "$SRC_DIR" -name '*.hnl' ! -name '*.test.hnl' | sort)
mapfile -t tests < <(find "$SRC_DIR" -name '*.test.hnl' | sort)
if [ "${#sources[@]}" -eq 0 ]; then
  echo "error: no .hnl sources under $SRC_DIR/" >&2
  exit 1
fi

echo "== hnl typecheck (${#sources[@]} sources, ${#tests[@]} test files) =="
"$HNL" typecheck "${sources[@]}" ${tests[@]+"${tests[@]}"}

echo
echo "== hnl lint =="
"$HNL" lint "${sources[@]}" ${tests[@]+"${tests[@]}"}

if [ "${#tests[@]}" -gt 0 ]; then
  echo
  # `--jobs 1` inside each file: these suites can share one fixture process,
  # so running a file's cases concurrently makes them fight over it.
  echo "== hnl test (per file; in-file jobs: 1) =="
  for t in "${tests[@]}"; do
    echo "-- $t"
    "$HNL" test --jobs 1 "$t"
  done
fi

echo
echo "hnl gate passed."
