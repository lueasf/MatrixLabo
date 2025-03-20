close all;

% Define the centers, widths, and heights of the zoomed regions
centers = [-0.862, 0.435176852; 0.239, 0.341773243];
widths = [0.026, 2.5e-08];
heights = [0.022, 2.5e-08];

iterations = 1400;
resolution = 840;

% Loop through each zoomed region
for i = 1:2
    % Compute the boundaries of the region
    x_min = centers(1, i) - widths(i) / 2; 
    x_max = centers(1, i) + widths(i) / 2;
    y_min = centers(2, i) - heights(i) / 2;
    y_max = centers(2, i) + heights(i) / 2;

    % Print the region information 
    fprintf('Zoom %d: Center=(%.9f, %.9f), Width=%.9f, Height=%.9f\n', ...
    i, centers(1, i), centers(2, i), widths(i), heights(i));

    RangeX = linspace(x_min, x_max, resolution);
    RangeY = linspace(y_min, y_max, resolution);
    [CX, CY] = meshgrid(RangeX, RangeY);
    C = CX + CY * 1i; 

    % Initialize matrices for Mandelbrot computation
    Z = zeros(size(C)); 
    V = zeros(size(C)); 

    for n = 1:iterations
        B = abs(Z) <= 2; 
        Z(B) = Z(B).^2 + C(B); 
        V(B) = V(B) + 1;
    end
 
    figure;
        imagesc([x_min, x_max], [y_min, y_max], mod(V, 64) + 1);
        colormap copper; 
        axis xy;
        axis equal;
        axis off; 
end