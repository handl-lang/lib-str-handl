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
HNL=../host-cli/target/debug/hnl scripts/hnl-gate.sh
```

## Documentation

Published site (Diátaxis): <https://handl-lang.github.io/docs/lib-str-handl/>

- [Reference](https://handl-lang.github.io/docs/lib-str-handl/reference/) — public API surface
- [How-to](https://handl-lang.github.io/docs/lib-str-handl/how-to/) — task recipes
- [Explanation](https://handl-lang.github.io/docs/lib-str-handl/explanation/) — design and rationale

Decision records live on the `project` branch under `project/adrs/`.

## License

MIT.
