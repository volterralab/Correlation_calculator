# ImageJ Plugin: Cross-Correlation Calculator

This tool was created by **Iaroslav Savtchouk** from [Andrea volterra Laboratory](https://wwwfbm.unil.ch/dnf/group/glia-an-active-synaptic-partner/member/volterra-andrea-volterra) and published in [Studying Axon-Astrocyte Functional Interactions by 3D Two-Photon Ca2+ Imaging: A Practical Guide to Experiments and “Big Data” Analysis](https://www.frontiersin.org/articles/10.3389/fncel.2018.00098/full)

A cross-correlation plugin that performs a comprehensive list of voxel-by-voxel calculations through time in search of temporal correlation versus either an externally loaded trace, a binarized stimulus waveform, or an individual ROI extract. This allows for the easy identification of putatively time-locked regions within a 3D imaging volume. To improve the performance under the jittering response conditions, cumulative cross-correlation (area under the curve) is available in addition to the normal peak calculation. In our studies, we have applied this plugin to axonal stimulation paradigms (minimal stimulations) in the dentate gyrus and have thereby identified several regions within an astrocyte that reliably responded to the stimuli. Such regions corresponded to a fraction of <1% of the total analyzed astrocytic volume (Bindocci et al., 2017).


[](/img/fncel-12-00098-g007.jpg)

Correlation-based analysis approaches provide a useful means of detecting broadly co-incident patterns in the data. The correlation method has been successfully used in automatically building unitary ROIs (e.g., corresponding to neuronal somas) based on the expectation that neighboring pixels belonging to the same underlying structure exhibit Ca2+ transients with fundamentally similar kinetics. Detecting and grouping closely correlated pixels allows for the build-up of a larger ROI with vastly improved SNR. The correlation-based techniques can also be used to rapidly screen for time-locked responses in the data. This is the approach that we recently used to identify the regions of an astrocyte that respond to minimal axonal stimulations: the task was severely complicated by the fact that astrocytes also display endogenous Ca2+ activity, that the reliably responding regions are small, that the response properties are variable, with a large jitter in response delay, on-kinetics and magnitude. The work-around for these difficulties was to perform correlation analysis on the Ca2+ signal from each individual voxel using repeated trials of stimulation, looking for signals that occurred consistently in each trial within a given time window after each stimulation. With this approach, the endogenous or low-probability responses that occurred by chance within the imposed time window in some of the trials were canceled out, while the repeated Ca2+ increases (even with variable delay/waveform) were kept. We called this approach “normalized cumulative cross-correlation” because, mathematically, the computation was performed by calculating a cross-correlation of the normalized fluorescence Ca2+ trace with an externally loaded (optionally binarized) stimulus file (Bindocci et al., 2017). The resulting correlation coefficients were added up for all values of time lag between 0 and a pre-defined time window (corresponding to 2.5 or 5 s in our case). In practice, this allowed for a direct, user-independent quantification of the estimated active volumes or responding regions. During the analysis using the plugin, the user can specify the time size of the correlation window used to detect the response (in t frames) and the size of an X-Y filter (averaging neighboring pixels) that can be applied to the data. The time size of the correlation window will vary depending on the sampling rate, the expected time delay between the stimulation and the response, and, to some extent, on the indicator used. This window size also acts as a normalization window for the fluorescence trace.
