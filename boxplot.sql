create or replace function boxplot(data float[])
returns text as
'
pdf("D:/boxplot.pdf");
boxplot(data);
dev.off;
print("done");
'
language 'plr' strict;

select boxplot(array_agg(uw_gpa)) from all_grads;