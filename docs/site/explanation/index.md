# Explanation

## Why this crate exists

Implementing the library in handl is the point: it dogfoods the language on a
real workload, and because it targets the `char` contract rather than Rust, the
same source runs on every backend. Swapping `char-native` for an ASCII backend
changes `slugify`'s output without editing `slugify`.

## Where it sits

This crate belongs to the `engine-*` family. Plugins, kits and hosts reach it
through the kit's operation slot, so the engine can be swapped without touching a
language definition.

See the [reference](/lib-str-handl/reference/) for the API and the
[how-to guides](/lib-str-handl/how-to/) for tasks.
