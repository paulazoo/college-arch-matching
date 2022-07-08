% accept mentors last to override any intersections
% take out ' in excel, strip spaces in excel
mentee_mentor = cell(total_matches, 2);
tic
for i = 1:1:total_matches
   mentee_res = pairs(i, :);
   mentor_ind = find(mentee_res==1);
   mentor_email = mentors(mentor_ind, 3);
   
   mentee_email = mentees(i, 3);
   
   mentee_mentor(i, :) = [table2array(mentee_email), table2array(mentor_email)];
end
toc

