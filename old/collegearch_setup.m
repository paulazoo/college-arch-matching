% 8 min run time for 300 mentees and mentors each
% remember keep headers on import google sheets
% you need the client secret json accessible by production

mentee_applicants = readtable('mentees_test.csv');
mentor_applicants = readtable('mentors_test.csv');

%%
mentee_emails = mentee_applicants(:, 5);
mentor_emails = mentor_applicants(:, 5);

%%
intersect(mentee_emails, mentor_emails)

%%
[v, w] = unique( mentee_emails, 'stable' );
duplicate_indices = setdiff( 1:numel(mentee_emails), w );
for dup =1:1:length(duplicate_indices)
    mentee_applicants(duplicate_indices(dup), :) = [];
end
%%
mentees = mentee_applicants;
[num, ~] = size(mentees);
mentors = mentor_applicants(1:num, :);
