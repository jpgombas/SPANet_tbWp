import h5py

# Open the HDF5 file
filename = 'data/wprime_mass_reg.h5'
with h5py.File(filename, 'r') as file:
    # Get the dataset containing the rows
    dataset1 = file['/TARGETS/bR/b']
    dataset2 = file['/TARGETS/tR/b']


    # Loop over the rows
    for i in range(len(dataset1)):
        # Check if the condition is met
        if (dataset1[i] == dataset2[i]) and (dataset1[i] != -1):
            print("Same b-jet", dataset1[i], dataset2[i])
            break  # Exit the loop if the condition is met
    else:
        print("No row found where '/TARGETS/bR/b' is equal to '/TARGETS/tR/b'")