#!/bin/bash
# dsid_list_ttbar=("410470" "410471" "411073" "411074" "411075" "411076" "411077" "411078")
dsid_list_ttbar=("410470")


for j in "${!dsid_list_ttbar[@]}"; do
    ttbar_dsid=${dsid_list_ttbar[$j]}

    python3 -m spanet.predict ./wprime1_long_seed/version_0 \
``                    -tf ~/fast-frames-tb-x/to_spanet/ttbar_jets_combine_${ttbar_dsid}.h5 --gpu \
                    ./ttbar_predictions/spanet_ttbar_${ttbar_dsid}_output.h5
done
