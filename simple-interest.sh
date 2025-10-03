#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate> <time>
# Example: ./simple-interest.sh 1000 5 2

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <principal> <rate> <time>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numeric inputs (simple check)
re='^[0-9]+([.][0-9]+)?$'
for val in "$P" "$R" "$T"; do
  if ! [[ $val =~ $re ]]; then
    echo "All inputs must be numeric: principal rate time"
    exit 1
  fi
done

SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
echo "Simple interest = $SI"
