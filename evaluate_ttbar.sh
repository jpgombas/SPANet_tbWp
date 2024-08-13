#!/bin/bash
# dsids=(510889 510890 510891 510892 510893 510894 510895 510896 510897)
# energies=(1TeV 1p2TeV 1p4TeV 1p6TeV 1p8TeV 2TeV 2p5TeV 3TeV 4TeV)
# dsid_list_ttbar=("410470" "410471" "411073" "411074" "411075" "411076" "411077" "411078")
dsids=(510889)
energies=(1TeV)
dsid_list_ttbar=("410470")

for i in "${!dsids[@]}"; do
    dsid=${dsids[$i]}
    energy=${energies[$i]}
    for j in "${!dsid_list_ttbar[@]}"; do
        ttbar_dsid=${dsid_list_ttbar[$j]}

        python3 -m spanet.predict ./spanet_output/tbX_${dsid}_${energy} \
                     -tf ~/fast-frames-tb-x/to_spanet/ttbar_jets_combine_${ttbar_dsid}.h5 --gpu \
                     ./ttbar_predictions/spanet_ttbar_${ttbar_dsid}_${energy}_output.h5
    done
done