% DC(input('TRIGGER = '), input('EMGX = '));
% X = ans;

X = input('Trials = ');
Speed = input('Speed = ');
DataProcessed = [DataProcessed ; Speed,mean(X),std(X)]
