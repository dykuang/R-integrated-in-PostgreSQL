CREATE or TYPE lm_type AS (
Variable text, Coef_Est float, Std_Error float, T_Stat float, P_Value float);

CREATE OR REPLACE FUNCTION lm_plr(y float8[], x float8[]) 
RETURNS SETOF lm_type AS 
' 
    m1<- lm(y~x)
    m1_s<- summary(m1)$coef
    temp_m1<- data.frame(rownames(m1_s), m1_s)
    return(temp_m1)
' 
LANGUAGE 'plr';

