#!/bin/bash

dsids=(510889 510890 510891 510892 510893 510894 510895 510896 510897)
dsids_RH=(510898 510899 510900 510901 510902 510903 510904 510905 510906)
energies=(1TeV 1p2TeV 1p4TeV 1p6TeV 1p8TeV 2TeV 2p5TeV 3TeV 4TeV)

for i in "${!dsids[@]}"; do
    dsid=${dsids[$i]}
    dsid_RH=${dsids_RH[$i]}
    energy=${energies[$i]}
    echo "Predicting wprime1 for file ~/fast-frames-tb-x/to_spanet/wprime_combine_LH_${energy}_${dsid}.h5"
    python3 -m spanet.predict ./wprime1_wr_regress/version_0 \
                ./wprime_wr_regress_predictions/wprime1_LH_${energy}_${dsid}.h5 -tf \
                ~/fast-frames-tb-x/to_spanet/wprime_combine_LH_${energy}_${dsid}.h5 --gpu

    echo "Predicting wprime1 for file ~/fast-frames-tb-x/to_spanet/wprime_combine_RH_${energy}_${dsid_RH}.h5"
    python3 -m spanet.predict ./wprime1_wr_regress/version_0 \
                ./wprime_wr_regress_predictions/wprime1_RH_${energy}_${dsid_RH}.h5 -tf \
                ~/fast-frames-tb-x/to_spanet/wprime_combine_RH_${energy}_${dsid_RH}.h5 --gpu

    # echo "Predicting wprime2 for file ~/fast-frames-tb-x/to_spanet/wprime_combine_LH_${energy}_${dsid}.h5"
    # python3 -m spanet.predict ./wprime2_long_seed/version_0 \
    #             ./wprime_long_seed_predictions/wprime2_long_seed_LH_${dsid}_${energy}.h5 -tf \
    #             ~/fast-frames-tb-x/to_spanet/wprime_combine_LH_${energy}_${dsid}.h5 --gpu

    # echo "Predicting wprime 2 for file ~/fast-frames-tb-x/to_spanet/wprime_combine_RH_${energy}_${dsid_RH}.h5"
    # python3 -m spanet.predict ./wprime2_long_seed/version_0 \
    #             ./wprime_long_seed_predictions/wprime2_long_seed_RH_${dsid_RH}_${energy}.h5 -tf \
    #             ~/fast-frames-tb-x/to_spanet/wprime_combine_RH_${energy}_${dsid_RH}.h5 --gpu
done

# python3 -m spanet.predict ./wprime1_long/version_0 \
#                           ./wp_predictions/wprime1_long_test_output.h5 \
#                           -tf ~/fast-frames-tb-x/to_spanet/wprime_combine2.h5 \
#                           --gpu
            
# python3 -m spanet.predict ./wprime2_long/version_0 \
#                           ./wp_predictions/wprime2_long_test_output.h5 \
#                           -tf ~/fast-frames-tb-x/to_spanet/wprime_combine1.h5 \
#                           --gpu