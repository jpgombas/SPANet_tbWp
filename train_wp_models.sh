#!/bin/bash

# cp options_files/tbX_template.json options_files/tbX.json
# sed -i "s/TTTT/wprime_combine_1_cut.h5/g" options_files/tbX.json
# sed -i "s/VVVV/wprime_combine_2_cut.h5/g" options_files/tbX.json
# python3 -m spanet.train -of options_files/tbX.json -n wprime1_May --gpus 1 --random_seed 1996

cp options_files/tbX_template.json options_files/tbX.json
sed -i "s/TTTT/wprime_combine_2_cut.h5/g" options_files/tbX.json
sed -i "s/VVVV/wprime_combine_1_cut.h5/g" options_files/tbX.json
python3 -m spanet.train -of options_files/tbX.json -n wprime2_May --gpus 1 --random_seed 1996 
