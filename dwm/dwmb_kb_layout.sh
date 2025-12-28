#!/bin/sh

# Thanks to nonpop.
# clone and compile and set in $PATH (watch for mode bits) the `xkblayout-state` from: https://github.com/nonpop/xkblayout-state.

# 󰗊 󰌌 󰊿 󰘳

printf '󰘳 ' ; xkblayout-state print %n | cut -b 1-3 -
