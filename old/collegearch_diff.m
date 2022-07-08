
diff_mat = zeros(num, num);
for i=1:1:num
    for j = 1:1:num
        loc_d = 0;
        id_d = 0;
        inte_d = 0;
        
        if strcmp(cell2mat(mentees{i, 4}), cell2mat(mentors{j, 4}))
            loc_d = 1;
        end
        
        for id_col = 7:1:31
            if id_col == 29
            else
            
            if cell2mat(mentees{i, id_col}) == 't' && cell2mat(mentors{j, id_col}) == 't'
                id_d = id_d + 1;
            end
            end
        end
        
        mentee_interests = strsplit(cell2mat(mentees{i, 32}), ',');
        mentor_interests = strsplit(cell2mat(mentors{j, 32}), ',');
        if any(strcmp(mentee_interests,'NULL'))
            mentee_interests = {};
        end
        if any(strcmp(mentor_interests,'NULL'))
            mentor_interests = {};
        end
        
        inte_d = length(intersect(mentee_interests, mentor_interests));
        
        diff_mat(i, j) = loc_d + id_d + inte_d;
        
    end
end
