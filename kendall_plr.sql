CREATE OR REPLACE FUNCTION plr_corr_kendall(
double precision[],
double precision[] )
RETURNS double precision AS
'
Kendall(arg1, arg2)
'
LANGUAGE 'plr' VOLATILE STRICT;
