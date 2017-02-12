#change the column type before you use the functions
#example

alter table all_grads
alter column uw_gpa type float using (uw_gpa::float);


#for some the the function taking float[] as input, you should
execute it like:(using array_agg)

select plr_glm(array_agg(uw_gpa),array_agg(first_term_gpa)) from all_grads
where levl = 'UG';