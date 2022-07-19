%% Setup diff mat dimensions
diff_mat = zeros(total_matches, total_matches);

%% Mentee and Mentor table indices
%{
4=school
5=interests
6=backgrounds
7=location
8=city
9=dream_colleges
10=length (application essay length)
if mentor: 11=multi_mentees
%}

%% Loop through mentee and mentor possible matches
tic
for i=1:1:total_matches
    for j = 1:1:total_matches
        %% Mentee data
        mentee_school = cell2mat(mentees{i, 4});
        mentee_interests = cell2mat(mentees{i, 5});
        mentee_backgrounds = cell2mat(mentees{i, 6});
        mentee_location = cell2mat(mentees{i, 7});
        mentee_city = cell2mat(mentees{i, 8});
        mentee_dream_colleges = cell2mat(mentees{i, 9});
        
        %% Mentor data
        mentor_college = cell2mat(mentors{j, 4});
        mentor_interests = cell2mat(mentors{j, 5});
        mentor_backgrounds = cell2mat(mentors{j, 6});
        mentor_location = cell2mat(mentors{j, 7});
        mentor_city = cell2mat(mentors{j, 8});
        
        %% Interests Difference
        interests_diff = 0;
        
        mentee_interests_split = strsplit(mentee_interests, ',');
        mentor_interests_split = strsplit(mentor_interests, ',');
        
        % if no interests were reported
        if any(strcmp(mentee_interests_split,'NULL'))
            mentee_interests_split = {};
        end
        if any(strcmp(mentor_interests_split,'NULL'))
            mentor_interests_split = {};
        end
        
        % find number of interests in common
        interests_diff = length(intersect(mentee_interests_split, mentor_interests_split));
                
        %% Backgrounds Difference
        backgrounds_diff = 0;
        
        mentee_backgrounds_split = strsplit(mentee_backgrounds, ',');
        mentor_backgrounds_split = strsplit(mentor_backgrounds, ',');
        
        % if no backgrounds were reported
        if any(strcmp(mentee_backgrounds_split,'NULL'))
            mentee_backgrounds_split = {};
        end
        if any(strcmp(mentor_backgrounds_split,'NULL'))
            mentor_backgrounds_split = {};
        end
        
        % find number of backgrounds in common
        backgrounds_diff = length(intersect(mentee_backgrounds_split, mentor_backgrounds_split));
        
        %% Location Difference
        location_diff = 0;
        
        if strcmp(mentee_location, mentor_location)
            location_diff = 1;
            if strcmp(mentee_city, mentor_city)
                location_diff = 2;
            end
        end
        
        %% Mentee dream colleges and Mentor school Difference
        college_school_diff = 0;
        
        mentee_drcol_split = strsplit(mentee_dream_colleges, ',');
        if ~any(strcmp(mentee_drcol_split,mentor_college))
            college_school_diff = 1;
        end

        %% Effort differences

        
        %% Accumulated differences value for this match
        diff_mat(i, j) = interests_diff + backgrounds_diff + location_diff + college_school_diff;
        
    end
end
toc
