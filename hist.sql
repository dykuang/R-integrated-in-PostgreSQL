 with uwgpa_stats as(
  select min(uw_gpa) as min,
         max(uw_gpa) as max
  from all_grads
  ),

   histogram as(
   select width_bucket(uw_gpa,min,max,99)-1 as bucket,
   numrange(min(uw_gpa)::numeric,max(uw_gpa)::numeric,'[]') as range,
   count(*) as freq
   from all_grads,uwgpa_stats
   group by bucket
   order by bucket
   )

select *, 
repeat('*',(freq::float/max(freq) over () * 30)::int) as bar
from histogram;
