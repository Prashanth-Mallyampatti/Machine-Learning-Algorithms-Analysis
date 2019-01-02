clc;
clear all;
close all;

%load glass_DB
data=load('glass_DB');
X=data.X;
%X=X';

epsilon=.4;
MinPts=10;
IDX=DBSCAN(X,epsilon,MinPts);

PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
