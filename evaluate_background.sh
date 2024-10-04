#!/bin/bash

python3 -m spanet.predict ./wprime1_wr_regress/version_0 \
                -tf ~/fast-frames-tb-x/to_spanet/ttbar_jets_all.h5 --gpu \
                ./background_predictions/spanet_ttbar_all_output.h5
python3 -m spanet.predict ./wprime1_wr_regress/version_0 \
                -tf ~/fast-frames-tb-x/to_spanet/single_top_all.h5 --gpu \
                ./background_predictions/spanet_single_top_all_output.h5

