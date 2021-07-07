% accept mentors last to override any intersections
% take out ' in excel, strip spaces in excel
mentee_mentor = cell(num, 2);
for i = 1:1:num
   mentee_res = pairs(i, :);
   mentor_ind = find(mentee_res==1);
   mentor_email = mentors(mentor_ind, 5);
   
   mentee_email = mentees(i, 5);
   
   mentee_mentor(i, :) = [table2array(mentee_email), table2array(mentor_email)];
end

