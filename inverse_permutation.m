function Plain_Image=inverse_permutation(I,key)
M=zeros(1,16384);
II=zeros(128,128,4);
u0=initial-value(key);% generate initial value using the key
for part=1:4 %image partition
    a=(reshape (I(:,:,part),[],1))';%reshape each part of cypher-image 
    u=u0(part);
    for n=1:128*128
        u(n+1)=u(n)*3.999*(1-u(n));%chaos function logistic map
        M(n)=floor(mod((u(n+1)*10^4),16384));% psudo-random vector
    end
    for i=1:numel(a)
        a([i,M(i)])=a([M(i),i]);%inverse of permutation
    end
    II(:,:,part)=reshape(a,[],128);%reshape vector to matrix
end
 Plain_Image=inverse-partition(II);% attach parts of image together