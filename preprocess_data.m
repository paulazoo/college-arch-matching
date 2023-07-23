%% Import data from csv files
mentee_applicants = readtable('mentees.csv');
mentor_applicants = readtable('mentors.csv');

%% Save original mentor applicants
original_mentor_applicants = mentor_applicants;

%% Multi mentees
% Duplicate mentor rows for mentors willing to accept multiple mentees
consider_multi_mentees = 1;
multi_mentees_col = 11;

% ONLY WORKS UP TO 2 MULTIMENTEES (trying to avoid triple mentees)
if consider_multi_mentees == 1
    [total_mentors, ~] = size(mentor_applicants);
    for i = 1:1:total_mentors
        multi_mentees = table2array(mentor_applicants(i, multi_mentees_col));
        if multi_mentees > 1
            mentor_row = mentor_applicants(i, :);
            mentor_applicants = [mentor_applicants; mentor_row]; % Add these rows to the bottom
        end
    end
end

%% Make sure size of both final matrices is the same
% NOTE: manually check to make sure no mentees have no mentor
mentees = mentee_applicants;
[total_matches, ~] = size(mentees);
mentors = mentor_applicants(1:total_matches, :);
