create or replace function plr_qqplot(y float[],x float[])
returns text as
'
pdf("D:/qqplot.pdf");
qqplot(x,y);
dev.off;
print("done");
'
language 'plr';