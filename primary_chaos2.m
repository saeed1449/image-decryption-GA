function u0=primary_chaos2(key)
%u0=zeros(1,4);
for i=1:4
    key1=key(i,:);
    bin=dec2bin(key1,8);
    keybin=[bin(1,:) bin(2,:) bin(3,:) bin(4,:) bin(5,:)];
    sum=0;
    for k=1:40
            sum=sum + ((keybin(1,k)-48)*(2^(40-k)));
        end
       u0(i)=sum/(2^40);
end


