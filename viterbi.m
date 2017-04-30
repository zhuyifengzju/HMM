%% Viterbi algorithm
A = [0.5, 0.2, 0.3;...
     0.3, 0.5, 0.2;...
     0.2, 0.3, 0.5]; % NxN

 B = [0.5, 0.5; 0.4, 0.6; 0.7, 0.3]; % NxM
 M = 2; %观测状态数
 p = [0.2,0.4,0.4]';
 N = 3;
 T = 3;
 O = [1,2,1];
 
 delta = p.*B(:,O(1))

 psi = zeros(N,T);
 for i = 1:T-1

    % delta = max((repmat(delta,1,N).*A),[],1)'.*B(:,O(i+1)) %注意这里的行、列问题，不要弄反了
      [delta psi(:,i+1)] = max((repmat(delta,1,N).*A),[],1);
      delta = delta'.*B(:,O(i+1))
 end;
 
 delta
 psi
 path = zeros(1,T);
 [~,path(N)] = max(delta);
 for i= T-1:-1:1
     path(i)=psi(path(i+1),i+1);
 end;
 path