#!/bin/bash
echo "alpha"

read alpha

echo "saturation (0.0 - 1.0)"

read saturation

wal -a "$alpha" --saturate $saturation -i $1 -n
