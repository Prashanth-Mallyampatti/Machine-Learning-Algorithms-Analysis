clear all;clc;close all;
meas_1 = [10          9           10.5        8.7         7.1         9           8.5         9.3         12           3          2.1       3.4        4.5        5          1.7      2.2        4           ]';
meas_2 = [log10(0.03) log10(0.05) log10(0.09) log10(0.07) log10(0.15) log10(0.04) log10(0.07) log10(0.12) log10(0.06)  log10(3)   log10(2)  log10(2.2) log10(1.9) log10(1.9) log10(2) log10(2.9) log10(3.2)  ]';
label = [ 'P '; 'P '; 'P '; 'P '; 'P '; 'P '; 'P '; 'P '; 'P ';    'NP'; 'NP'; 'NP'; 'NP'; 'NP'; 'NP'; 'NP'; 'NP';]
one_label = 'NP'

kernel_function = 'linear';
svm_classifier(meas_1,meas_2,label,one_label,kernel_function);

% figure;
 kernel_function = 'rbf';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'quadratic';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'polynomial';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'mlp';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);