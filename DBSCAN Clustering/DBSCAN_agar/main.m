clc;
clear;
close all;

load oil_composition;
z=z';
data=load('oil_composition');
X=data.X;

epsilon=0.2;
MinPts=10;
IDX=DBSCAN(X,epsilon,MinPts);

PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
