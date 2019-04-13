format long
d_n10 = [
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001];

d_n100 = [
0.001031
0.001032
0.001032
0.001032
0.001032
0.001033
0.001045
0.001031
0.001031
0.001032];

d_n200 = [
0.010442
0.010545
0.010317
0.010290
0.010262
0.010501
0.010240
0.010272
0.010634
0.010384];

d_n500 = [
0.169832
0.169728
0.169968
0.169926
0.169863
0.169904
0.169819
0.169837
0.169862
0.169853];

d_n1000 = [
1.585496
1.585148
1.585222
1.585559
1.584837
1.587853
1.587643
1.587157
1.589625
1.587685];

d_o10 = [0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001
0.000001];

d_o100 = [0.000574
0.000574
0.000569
0.000570
0.000570
0.000582
0.000567
0.000568
0.000569
0.000570];

d_o200 = [0.004269
0.004381
0.004589
0.004424
0.004497
0.004591
0.004497
0.004620
0.004646
0.004590];

d_o500 = [0.067331
0.067340
0.067302
0.064147
0.067411
0.067327
0.067323
0.067324
0.067328
0.067281];

d_o1000 = [
0.539081
0.538295
0.539163
0.539143
0.539101
0.539204
0.539090
0.539096
0.539118
0.539115];

data_opt = [d_o10 d_o100 d_o200 d_o500 d_o1000];
data_naive = [d_n10 d_n100 d_n200 d_n500 d_n1000];
X = [10,100,200,500,1000];
boxplot(data_opt,  'Color', 'b','positions',X,'labels',X)
hold on
boxplot(data_naive, 'Color', 'r','positions',X,'labels',X)
title('Matrix multiplication')
xlabel('Square matrix dimension') 
ylabel('Execution time (s)') 
hLegend = legend(findall(gca,'Tag','Box'), {'Omptimized', 'Color', 'b','Naive','Color','r'});