#!/bin/bash

dsids=(510889 510890 510891 510892 510893 510894 510895 510896 510897)
energies=(1TeV 1p2TeV 1p4TeV 1p6TeV 1p8TeV 2TeV 2p5TeV 3TeV 4TeV)

# for i in "${!dsids[@]}"; do
#     dsid=${dsids[$i]}
#     energy=${energies[$i]}
#     cp options_files/tbX_template.json options_files/tbX.json
#     sed -i "s/FFFF/wprime_combine_LH_${energy}_${dsid}.h5/g" options_files/tbX.json
#     python3 -m spanet.train -of options_files/tbX.json --time_limit 00:00:10:00 --gpus 1 -p 90
#     mv spanet_output/version_0 spanet_output/tbX_${dsid}_${energy}
#     python3 -m spanet.predict ./spanet_output/tbX_${dsid}_${energy} \
#                 ./wp_predictions/spanet_wprime_${dsid}_${energy}_output.h5 -tf \
#                 ~/fast-frames-tb-x/to_spanet/wprime_combine_LH_${energy}_${dsid}.h5 --gpu
# done
cp options_files/tbX_template.json options_files/tbX.json
sed -i "s/TTTT/wprime_combine1.h5/g" options_files/tbX.json
sed -i "s/VVVV/wprime_combine2.h5/g" options_files/tbX.json
python3 -m spanet.train -of options_files/tbX.json -n wprime1_long_seed --gpus 1 --random_seed 1996

cp options_files/tbX_template.json options_files/tbX.json
sed -i "s/TTTT/wprime_combine2.h5/g" options_files/tbX.json
sed -i "s/VVVV/wprime_combine1.h5/g" options_files/tbX.json
python3 -m spanet.train -of options_files/tbX.json -n wprime2_long_seed --gpus 1 --random_seed 1996 

# mv spanet_output/version_0 spanet_output/wprime_all_masses

# python3 -m spanet.predict ./spanet_output/wprime_all_masses \
#             ./wp_predictions/spanet_all_wprime1_output.h5 -tf \
#             ~/fast-frames-tb-x/to_spanet/wprime_combine1.h5 --gpu
