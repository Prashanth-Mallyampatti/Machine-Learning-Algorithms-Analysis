

clc;
clear;
close all;

%% Load Data
load fisheriris;
data=load('fisher_dbscan');
X=data.X;


%% Run DBSCAN Clustering Algorithm

epsilon=.5;
MinPts=10;
IDX=DBSCAN(X,epsilon,MinPts);


%% Plot Results

PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
