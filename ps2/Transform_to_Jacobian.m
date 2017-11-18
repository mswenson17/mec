function J=Transform_to_Jacobian(H, RP)
% for SE(3)

assert(numel(H)==numel(RP))

z=[0;0;1];
for i=1:numel(H)
    if i==1
    H0_i{i}=H{i};
    else
    H0_i{i}= H{i}*H{i-1};  
    end
    Hminus_n{i}=eye(4);
    for j=i:numel(H)
            Hminus_n{i} = Hminus_n{i}*H{j};
    end
R0_minus{i}=H0_i{i}(1:3,1:3);
Ominus_n{i}=Hminus_n{i}(1:3,3);

if RP(i) %Revolute
J(:,i) = R0_minus{i}*cross(z,Ominus_n{i});
else % prismatic
J(:,i) = R0_minus{i}*z;
end
    

end

celldisp(H0_i)
celldisp(Hminus_n)
%celldisp(R0_minus)
%celldisp(Ominus_n)




