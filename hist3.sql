create or replace function hist_test()
   returns text as '
sql <- pg.spi.exec("select uw_gpa from all_grads");
pdf("D:/hist.pdf");
hist(sql[,1]);
dev.off;
print("done");
'
language 'plr' strict;

select hist_test();