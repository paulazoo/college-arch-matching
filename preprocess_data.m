%% Import data from csv files
mentee_applicants = readtable('mentees.csv');
mentor_applicants = readtable('mentors.csv');

%% Save original mentor applicants
original_mentor_applicants = mentor_applicants;

%% Multi mentees
% Duplicate mentor rows for mentors willing to accept multiple mentees
consider_multi_mentees = 1;

if consider_multi_mentees == 1
    [total_mentors, ~] = size(mentor_applicants);
    for i = 1:1:total_mentors
        multi_mentees = table2array(mentor_applicants(i, 11));
        if multi_mentees > 1

            for j = 1:1:(multi_mentees - 1) % For every other mentee they can take
                mentor_row = mentor_applicants(i, :);
                mentor_applicants = [mentor_applicants; mentor_row]; % Add these rows to the bottom
            end
        end
    end
end

%% Make sure size of both final matrices is the same
% NOTE: manually check to make sure no mentees have no mentor
mentees = mentee_applicants;
[total_matches, ~] = size(mentees);
mentors = mentor_applicants(1:total_matches, :);
