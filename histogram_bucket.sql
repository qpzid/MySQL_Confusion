select 
    case 
        when payment_total between 0 and 100 then '0-100' 
        when payment_total between 100 and 200 then '100-200'
        else '100+'
    end as payment_buck, 
    count(*) 
from invoices
group by 1;

select floor(payment_total/100)*100 as bucket_fl, floor((payment_total/100))*100+100 as bucket_cl, count(*) as count
from invoices
group by 1,2
order by 1,2;
