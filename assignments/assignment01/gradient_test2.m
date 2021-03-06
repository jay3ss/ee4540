function  [a_opt] = gradient_test2(X,C,eps,M)
% 
% This subroutine performs the minimization of the function 
% norm(Xa-c).^2 using the gradient algorithm and estimates the 
% coordinates of the minimum 
% gamma: algorithm step
% eps: stopping parameter
% M: maximum number of search steps
%
NN=size(C);
Nw=NN(1);
a=zeros(Nw,M);
steps=1;

for index=1:M
    grad=2*((X')*X)*a(:,index)-2*X'*C;  % gradient at previous coordinate
    gammai=norm(grad).^2/(2*grad'*(X'*X)*grad);
    a(:,index+1)=a(:,index)-gammai*grad; % new coordinate
    steps=index+1;
    if norm(a(:,index+1)-a(:,index))<eps % stopping criterion
        break
    end
end
a_opt=a(:,index)   % optimal (final) coordinate
steps
end




