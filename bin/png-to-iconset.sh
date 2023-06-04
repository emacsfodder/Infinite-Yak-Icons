#!/bin/bash

if [[ $# != 2 ]];then
   echo "Usage: $0 <input png> <iconset>"
else
   png="$1"
   iconset="$2"

   echo "${png} ⇒ ${iconset}"
   [[ -d "${iconset}" ]] || mkdir "${iconset}"
   for n in 16 32 128 256 512; do
       for retina in "" "@2x"; do
           if [[ $retina == "" ]]; then
               width=$n
           else
               width=$(($n * 2))
           fi
           out="${iconset}/icon_${n}x${n}${retina}.png"
           echo "     ${out} (${width}px)"
           convert "$png" -resize ${width}x${width} $out
       done
   done
fi
