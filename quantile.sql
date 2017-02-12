DROP AGGREGATE IF EXISTS quantile(float8, float8);
CREATE OR REPLACE FUNCTION r_quantile(float8[])
   returns float8 as 
   '
   binsz <- arg1[1]
   thedata <- arg1[2:length(arg1)]
   quantile(thedata, binsz, na.rm=TRUE)
   ' language 'plr' strict ;
CREATE OR REPLACE FUNCTION q_array_accum(float8[], float8, float8)
   returns float8[] as '
   select case when $1 is NULL then array[$3] else $1 || $2 end
   ' language sql;
CREATE AGGREGATE quantile (float8, float8) (
       sfunc = q_array_accum,
       stype = float8[],
       finalfunc = r_quantile);