   select * from (
   select width_bucket(uw_gpa,0,4.2,99)-1 as bucket,
   numrange(min(uw_gpa)::numeric,max(uw_gpa)::numeric,'[]') as range,
   count(*) as freq
   from all_grads
   group by bucket
   order by bucket
   ) as histogram;

   create or replace function hist_test1()
   returns text as
   '
   qr <- pg.spi.exec("select bucket, freq from histogram");
   pdf("D:/hist1.pdf");
   plot(qr,type="h");
   dev.off;
   print("done");
   '
   language 'plr' strict;
   select hist_test1();