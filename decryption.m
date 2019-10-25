clear all
clc
load save
u0=primary_chaos2(key2);
[a,b]=size(cyphertext);
cyphpart=partition(cyphertext,a,b);
uu=zeros(1,128*128);
r=3.999;
for part=1:4
    %% inverse of confusion
    u=u0(part);
    for i=1:128
       for j=1:128
               u=r*u*(1-u);
               image(i,j,part)=notxor(u,cyphpart(i,j,part));
       end 
    end
%%inverse of permutation    
uu(1)=u0(part);
for n=1:128*128
    uu(n+1)=uu(n)*3.999*(1-uu(n));
    M(n)=floor(mod((uu(n+1)*10^4),16384));
end
a=(reshape(image(:,:,part),[],1))';
for i=numel(a):-1:1
% %j= floor(i*rand(1)+1);
 a([i,M(i)])=a([M(i),i]);
 end
 c(:,:,part)=reshape(a,[],128);
end

%%
cc(1:128,1:128)=c(:,:,1);
cc(1:128,129:256)=c(:,:,2);
cc(129:256,1:128)=c(:,:,3);
cc(129:256,129:256)=c(:,:,4);

imshow(uint8(cc))
