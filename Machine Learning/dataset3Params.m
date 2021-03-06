function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;



bestPrediction = 1000;
for C_i = [0.01]
  for sigma_i = [0.01]
    model= svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_i));
    predictions = svmPredict(model, Xval);
    prediction = mean(double(predictions ~= yval));
    if prediction < bestPrediction;
      bestPrediction = prediction;
      C = C_i;
      sigma = sigma_i;
    end
  end
end




% =========================================================================

end
