#!/usr/bin/env bash

gpu=$(nvidia-smi| grep -Eo "[0-9]+%" | head -1)

echo "$gpu"
