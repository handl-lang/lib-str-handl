# lib-str-handl

The `str` library, written in pure handl over the `char` floor.

## What it is

`str-handl` implements the string library **in handl itself**, one module per
function, over the `char` contract. Because the `char` floor decides what counts
as whitespace, alphabetic or uppercase, this library inherits Unicode-vs-ASCII
semantics from the composed backend rather than hard-coding one.

## Modules
- one module per function — `capitalize`, `trim`, `split`, `replace`, `slugify`, …
- `*.test.hnl` — each module ships its own tests


## Start here

- **Reference** — [public API](/lib-str-handl/reference/)
- **How-to** — [task recipes](/lib-str-handl/how-to/)
- **Explanation** — [design and rationale](/lib-str-handl/explanation/)

No tutorials: this repo is a building block used from Rust. End-to-end
walkthroughs live with the product that composes it — see the
[Handl platform](/handl/).
