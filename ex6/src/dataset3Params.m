function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

num = 8;
seed = 0.01;
mult = 3;

cs = [seed];
for i=2:num
 cs(i) = cs(i - 1) * (mult);
end

errs = zeros(num);

for i=1:num
  for j=1:num
    model =  svmTrain(X, y, cs(i), @(x1, x2) gaussianKernel(x1, x2, cs(j))); 
    predictions = svmPredict(model, Xval);
    errs(i, j) = mean(double(predictions ~= yval));
  end
end

l = min(min(errs));

[is, js] = find(errs == l);



C = cs(is(1))
sigma = cs(js(1))








% =========================================================================

end
