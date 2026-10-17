# lib-str-handl

The str library implemented in pure handl over the char floor.

Part of the `handl-lang` org split (ADR-0128). History is a `git subtree
split` of `platform/handl-packages/str-handl/`.

## Layout

```text
src/        the .hnl sources
pkg.hnl     dependencies, when the package has any:
            `{ deps: { <name>: "branch:<ref>" } }`
```

Dependencies: none

## Gate

The `.hnl` sources are not covered by `cargo`; `hnl typecheck` / `lint` /
`test` is their gate, run in CI and available locally:

```bash
HNL=../cli/target/debug/hnl scripts/hnl-gate.sh
```
