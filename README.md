# Symmetry Preserving Attention Networks

A library for training and evaluation SPANets on jet reconstruction tasks. 
Originally developed for `ttbar` analysis,
this library now supports arbitrary event topologies and symmetry groups.

## Dependencies

A list of the libraries necessary to fully train and evaluate SPANets. These are only the minimum versions that we
tested, other versions might work.

| Library                                                 | Minimum Version |
| ------------------------------------------------------- | --------------- |
| python                                                  | 3.7             |
| [numpy](https://pypi.org/project/numpy/)                | 1.19            |
| [sympy](https://www.sympy.org/en/index.html)            | 1.17            |
| [scikit_learn](https://scikit-learn.org/stable/)        | 1.20            |
| [pytorch](https://pytorch.org/)                         | 1.7             |
| [pytorch-lightning](https://www.pytorchlightning.ai/)   | 1.3             |
| [opt_einsum](https://github.com/dgasmith/opt_einsum)    | 3.3.0           |
| [h5py](https://pypi.org/project/h5py/)                  | 3.0             |

A docker container with python and all of these libraries already installed
is available here: https://hub.docker.com/r/ashmakovuci/igb-python

## Usage
Using this library requires setting up several componentts.

1. Defining the event topology.
2. Creating a training dataset.
3. Configuring training options.


### Training

Once those steps are complete, you can begin training by 
calling `train.py` with your chosen parameters. For more information
simply run `python train.py --help`

You can experiment with the provided example configuration and dataset
for some `ttbar` events by calling 
`python train.py -of options_files/ttbar_example.json --gpus NUM_GPUS` 
where `NUM_GPUS` is the number of gpus available on your machine.

### Evaluation

Once training is complete, you may evalute a network on
a testing dataset by running `test.py` with a path to your previously
trained network and a file on which to evalute on.

For example, after running the previous training run on `ttbar_example`, 
you can evaluate the network again on the example dataset by running.
`python test.py ./lightning_logs/version_0 -tf ./data/ttbar/ttbar_example.h5`

Note that the included example file is very small and you will likely not
see very good performance on it.