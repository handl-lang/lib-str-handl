# lib-str-handl

The `str` library implemented in pure handl over the char floor —
the reference backend of the `str` contract (`lib-str`).

## Layout

| path | role |
| --- | --- |
| `src/*.hnl` + `*.test.hnl` | one file per arrow + its test |
| `src/internal/` | shared internals |
| `pkg.hnl` | manifest — `modules: ["str-handl"]`, dep `str` |
| `docs/` | site docs (`site.yaml` + `site/`) |
| `scripts/hnl-gate.sh`, `workflows/gate.yaml` | the gate / bupha entry |

## Contract

- Pure `.hnl` package surface: consumers copy `pkg.hnl` +
  `src/**/*.hnl` via `handl-pkg-vendor` into `OUT_DIR` and embed them
  with `include_str!` (`plugin-lib-handl` does this; the
  `handl-lib-str-handl` crate's `STR_HANDL_*` consts are no longer
  consumed).
- Implements all 45 `str/<arrow>` contract signatures; `str-c`
  delegates its sequential algorithms here and `str-js` ports from
  it — keep behavior aligned with the contract laws.
- See README "Documentation" / `docs/` for the surface docs.

## Verification

```bash
HNL=../host-cli/target/debug/hnl scripts/hnl-gate.sh
```

## License

MIT.

<!-- myco:agent-awareness -->

## Agent awareness

- Session start / any work discussion: run `myco status --prompt`
  before proposing next steps — know the board first.
- User describes new work → offer to capture it (`myco todo add`,
  `issue new`, `proposal new`). Don't wait to be asked.
- Picking up a task: `myco resume <ID>` is the briefing.
- Wrapping up: `myco handoff <ID>` anything resumable; keep statuses
  honest (claimed → in-progress → blocked/done).

<!-- /myco:agent-awareness -->
