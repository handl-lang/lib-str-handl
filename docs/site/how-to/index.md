# How-to guides

Task recipes. Each assumes sibling checkouts of this repo and of the platform
repos it patches.

## Add a string function

Add `src/<name>.hnl` plus `src/<name>.test.hnl`; depend only on `char` operations so every backend keeps working.

## Use it in a project

Declare the dependency (`str-handl = { … }`) and import the function's module; each function is its own module, so imports stay narrow.
