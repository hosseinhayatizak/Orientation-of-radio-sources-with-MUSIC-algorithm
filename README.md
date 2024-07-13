# Orientation-of-radio-sources-with-MUSIC-algorithm
Orientation of radio sources with `MUSIC` algorithm
# Developer
* **Hossein Hayati**
# Introduction
One of the applications of statistical processing of signals is to estimate the angle of arrival of signals received by the receiver. On the other hand, to estimate the entry angle Signal (Ⅾirection Of Arrival (`DOA`) estimation) Actually, the receiving antenna must have more than one element.
In the methods based on the noise and signal subspaces, the covariance matrix of the received vector is first
estimated and by `EVⅮ` decomposition of this matrix, noise and signal subspaces are separated. `ⅯUSIⅭ` method is also one of the methods based on subspace.
In general, in subspace-based methods, after finding the noise and signal subspaces, the orthogonality between these two subspaces is used, and parameters such as the number of sources and the angle of entry are estimated.
# Description
It is assumed that the receiving antenna elements are in the form of a uniform linear array
(`UⅬA`) On the other hand, the signals whose direction or number is to be estimated are `RF` signals. The dataset we have in this project is a `N × T` matrix, where N is the number of receiver antenna elements and T is the number of time samples (snapshot).
is that we have from the received signal.
On the other hand, suppose that the data that is provided to you is a signal that has been transferred to the baseband after receiving.
I have considered the distance between the elements of the receiving antenna to be equal to $d=λ/2$ , where $λ$ is the wavelength of the carrier signal. I have also considered the frequency of the carrier signal to be equal to $Fc=20MHz$.
## Output
<img src="">
