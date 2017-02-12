CREATE OR REPLACE FUNCTION glm_plr(y float8[], x float8[]) 
RETURNS SETOF lm_type AS 
' 
    m1<- glm(y~x)
    m1_s<- summary(m1)$coef
    temp_m1<- data.frame(rownames(m1_s), m1_s)
    return(temp_m1)
' 
LANGUAGE 'plr';