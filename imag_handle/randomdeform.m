function [I,sx,sy] = randomdeform(I,maxdeform,sigma)

    if nargin<2; maxdeform = 3; end % max 3 pixels of deformation
    if nargin<3; sigma     = 3; end % max smooth on 3 pixels
    
    % Create random deformation
    s  = RandStream.create('mt19937ar','seed',1);   
    RandStream.setGlobalStream(s);
     % always same random numbers
    sx = maxdeform * 2*(rand(size(I))-0.5);
    sy = maxdeform * 2*(rand(size(I))-0.5);

    % Smooth deformation
    sx = imgaussian(sx,sigma);
    sy = imgaussian(sy,sigma);

    % Interpolate updated image
    I = iminterpolate(I,sx,sy);

end