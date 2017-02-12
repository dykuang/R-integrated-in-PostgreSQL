create or replace function hist_1(data float[])
   returns float[] as '
pdf("D:/hist1.pdf");
output<-(hist(data,breaks=30,plot=FALSE));
dev.off;

return(output$counts);'
language 'plr' strict;

select hist_1(array_agg(uw_gpa))
from all_grads
where levl='UG';