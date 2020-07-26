#!/usr/bin/env bash

set -e

copy_files () {
    fileName=$1
    while IFS=\| read -ra line
    do
      x=$(basename "${line[0]}" '\')
      x="${x%.*}"
      cp -v "./drive/My Drive/dataset/$DATADIR/$x.wav" "$DATADIR/$x.wav" &
      # cp -v "./drive/My Drive/dataset/$DATADIR/$x.pt" "$DATADIR/$x.pt" &
    done < "$fileName"
}
DATADIR="ravdess"

mkdir -p "$DATADIR/"

cp -v "./drive/My Drive/dataset/$DATADIR/ravdess.csv" "$DATADIR/ravdess.csv" 

tmp="$DATADIR/ravdess.csv"

copy_files $tmp