# Constrained_PMF
The SGD for Constrained Probabilistic Matrix Factorization(CPMF) in Matlab 
%
% Created by Xiuze Zhou


% E-mail: zhouxiuze@foxmail.com

%
%
 Permission is granted for anyone to copy, use, modify, or distribute this 
% program and accompanying programs and documents  for any purpose, provided
% this copyright notice is retained and  prominently displayed, along with a 
% note saying that the original  programs are available from our web page.



%
%The programs and documents are distributed without any warranty,  express
% or implied. As the programs were written for research  purposes only, they 
% have not been tested to the degree that would  be advisable in any important
% application. All use of these programs is entirely at the user's own risk.



How to make it work:
    1. Create a separate directory and download all these files into the same directory

    2. Download the following 6 files:
        1) CPMF.m: Main file for training CPMF
	2) dg.m: The derivative of g(x)
        3) g.m: The log function g(x)
        4) LOSE.m: The loss function
	5) run.m: Load data and set parameters
        6) u.data: MovieLens 100k data set
    3. Run run.m



I did not try to optimize this code, but please e-mail me if you find bugs.


I am also very glad to communicate with you by e-mail about your problems.
