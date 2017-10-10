N = xlsread('F:\Dot\Downloads\Lung_carcinoma', 'A1:CR1052');
N=N';
m(1:96,1:4)=0;
D(1:96,1:1052)=0;
D(1:96,1:54)=N(1:96,1:54);
D(1:96,55:108)=N(1:96,527:580);
D(1:96,109:580)=N(1:96,55:526);
D(1:96,581:1052)=N(1:96,581:1052);
for i=1:96
    maximum=N(i,1);
    minimum=N(i,1);
    for j=1:580
        if(j>54 && j<527)
            continue;
        else
            if(maximum<N(i,j))
                maximum=N(i,j);
            end
            if(minimum>N(i,j))
                minimum=N(i,j);
            end
        end
    end
    m(i,1)=maximum;
    m(i,2)=minimum;
    maximum=N(i,55);
    minimum=N(i,55);
    for j=55:1052
        if(j>526 && j<581)
            continue;
        else
            if(maximum<N(i,j))
                maximum=N(i,j);
            end
            if(minimum>N(i,j))
                minimum=N(i,j);
            end
        end
    end
    m(i,3)=maximum;
    m(i,4)=minimum;
end
for i=1:96
    
    for j=1:580
        if(j>54 && j<527)
            continue;
        else
            if(N(i,j)==m(i,1))
                N(i,j)=1;
            elseif(N(i,j)==m(i,2))
                N(i,j)=0;
            else
                N(i,j)=(N(i,j)-m(i,2))/(m(i,1)-m(i,2));
            end
        end
    end
end
for i=1:96
   
    for j=55:1052
        if(j>526 && j<581)
            continue;
        else
            if(N(i,j)==m(i,3))
                N(i,j)=1;
            elseif(N(i,j)==m(i,4))
                N(i,j)=0;
            else
                N(i,j)=(N(i,j)-m(i,4))/(m(i,3)-m(i,4));
            end
        end
    end
end  

train(1:96,1:800)=0;
test(1:96,252)=0;

xlswrite('F:\Dot\Downloads\preprocessedData',D);
        
        
