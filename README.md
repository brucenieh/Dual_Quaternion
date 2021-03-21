# Dual_Quaternion

This project is an attempt to explore the dual quaternion method to translate and rotate a point cloud to avoid [candy-wrapper effect][1] in skinning when calculated
with homogeneous matrix representations.


![Alt text](./candy_wrapper_demo.png?raw=true "Title")


The matrix operations, mathmatical calculations, and point representations are produced by following Ben Kenwright's paper ["A Beginners Guide to Dual-Quaternions"][2].


[1]: https://www.researchgate.net/figure/The-well-known-candy-wrapper-artefact-of-linear-blend-skinning-Left-The-character_fig2_318590047
[2]: https://cs.gmu.edu/~jmlien/teaching/cs451/uploads/Main/dual-quaternion.pdf
