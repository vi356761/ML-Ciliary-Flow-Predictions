%% Normalize any 2D matrix with no NaNs
function normalized_data = norm2dmatrix(input,rng)
sz = size(input);
data = input(:);
norm_data = normalize(data,'range',rng);
normalized_data = reshape(norm_data,sz);
end