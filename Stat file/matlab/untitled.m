T = readmatrix('return.csv');
T2=[]
T1=[]
INFO=[]
err90l=[]
err95l=[]
err99l=[]
name=['A','B,',"BTC" , "ETH" , "USDT", "BNB" , "XRP" , "ADA" , "LTC" ]
i=1
for n=3:9
    for m=3:9
        if m~=n           
            [T21, err90, err95, err99]=multi_causality_est(T(:,[m,n]),1)
            T2=[T2,name(n)]
            T1=[T1,name(m)]
            INFO=[INFO,T21]
            err90l=[err90l,err90]
            err95l=[err95l,err95]
            err99l=[err99l,err99]
         
        end
    end
end
T2=T2'
T1=T1'
INFO=INFO'
err90l=err90l'
err95l=err95l'
err99l=err99l'
res = table(T2,T1,INFO,err90l,err95l,err99l)
writetable(res,'res_info.csv')