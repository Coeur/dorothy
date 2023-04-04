#!/usr/bin/env bash
# do whatever you want in this file:
# shellcheck disable=SC2034

# Used by `interactive.sh`

# Source the bash/zsh completions if you care for them
source "$DOROTHY/sources/completions.sh"

# Enable fancier bash options, sorted by rarest last
shopt -s nullglob extglob globstar &>/dev/null || true
