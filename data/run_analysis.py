from Analysis import Analysis
import json
import numpy as np
import matplotlib.pyplot as plt
import sys

reload = False
if "-r" in sys.argv:
    reload = True

settings = json.load(open('wp_settings.json'))

a = Analysis(settings=settings)
a.load_data(reload=reload)

a.make_plot_variables()
a.make_plot_arrays("wp")

for name, dataloader in a.dataloaders.items():
    print("Dataloader: ", name)
    dataloader.print_details()
    print()

truth_masses = a.dataloaders["wp"].truth_wp_masses
rui_masses = a.rui_analysis("wp")
matched_masses_trueW = a.matchjet_analysis_with_true_W("wp")
matched_masses = a.matchjet_analysis("wp")
spanet_masses = a.spanet_analysis("wp")
ttbar_spanet_masses = a.spanet_analysis("ttbar")
rui_masses =  rui_masses / 1000
matched_masses_trueW = matched_masses_trueW / 1000
matched_masses = matched_masses / 1000
fig, axs = plt.subplots(1, 1, figsize=(8, 6))
a.plot_with_atlasStyle(axs, [truth_masses, rui_masses, matched_masses_trueW, matched_masses, spanet_masses, ttbar_spanet_masses], 
                       ["W' Truth", "W' to tb", "W' Matched w/ true W", "W' Matched", "W' Spanet", "ttbar Spanet"], 
                       bins=np.arange(0, 1500, 10), xlabel="Mass [GeV]", 
                       ylabel=r"Unweighted Events [$\text{GeV}^{-1}$]", logy=True)
plt.savefig("plots/baseline_mass.pdf")