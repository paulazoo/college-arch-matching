tic
X = optimvar('X',total_matches,total_matches,'Type','integer','LowerBound',0,'UpperBound',1);
prob = optimproblem('ObjectiveSense','maximize');
prob.Constraints.oneworker=sum(X,2)<=1;
prob.Constraints.maxTasks=sum(X,1)<=1;
prob.Objective=sum(diff_mat(:).*X(:));
Xsolution = solve(prob);

pairs = Xsolution.X;
toc

