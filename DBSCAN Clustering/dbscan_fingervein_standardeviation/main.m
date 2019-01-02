
clc;
clear;
close all;



data=load('finger_dbscan');
X=data.X;



epsilon=10;
MinPts=10;
IDX=DBSCAN(X,epsilon,MinPts);



PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
