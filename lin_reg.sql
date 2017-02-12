create or replace function lin_reg()
returns setof lm_type as 
'
sql <- pg.spi.exec("select uw_gpa as y,first_term_gpa as x from all_grads");
result<-summary(lm(sql))$coefficient;
final<- data.frame(rownames(result),result);
return (final);
'
language 'plr' strict;

select lin_reg();