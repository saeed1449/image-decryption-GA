function outcome=notxor(u,cyphi)
ui=round(u*255);
bb=double(dec2bin(ui,8))-(48);
cc=double(dec2bin(cyphi,8))-(48);
for i=1:8
if cc(i)==0
       aa(i)= bb(i);
    else
       aa(i)= ~bb(i);
        
    end
end
zz=char((aa+48));
outcome=bin2dec(zz);
