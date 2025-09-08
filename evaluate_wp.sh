#!/bin/bash

files=(~/fast-frames-tb-x/to_spanet/*.h5)

for file in "${files[@]}"; do
    if [[ $file == *"wprime"* ]]; then
        filename=$(basename "$file")
        echo "Predicting wprime1 for file $file"
        python3 -m spanet.predict ./wprime1_Nov/version_0 \
                    ./predictions_Nov/${filename} -tf \
                    $file --gpu --batch_size 2056
        
    fi
done