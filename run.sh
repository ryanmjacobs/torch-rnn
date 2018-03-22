#!/bin/bash

nogpu="-gpu -1"

source $HOME/torch/install/bin/torch-activate

virtualenv .virtualenv
source .virtualenv/bin/activate
pip install -r requirements.txt

python scripts/preprocess.py \
  --input_txt mollie-ryan.txt \
  --output_h5 my_data.h5 \
  --output_json my_data.json

th $nogpu train.lua -input_h5 my_data.h5 -input_json my_data.json
#th $nogpu train.lua -input_h5 my_data.h5 -input_json my_data.json -model_type rnn -num_layers 3 -rnn_size 256

#th $nogpu sample.lua -checkpoint cv/checkpoint_10000.t7 -length 2000
