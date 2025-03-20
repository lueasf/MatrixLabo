
% Function to update the Mandelbrot set
function updateMandelbrot(Xmin, Xmax, Ymin, Ymax, iterations, resolution)
    % Discretization of the complex plane
    RangeX = linspace(Xmin, Xmax, resolution); % real part
    RangeY = linspace(Ymin, Ymax, resolution); % imaginary part
    [CX, CY] = meshgrid(RangeX, RangeY); % generate 2D grid from 1D vectors
    C = CX + CY * 1i; % C is the complex plane

    % Initialization of matrices
    Z = zeros(size(C)); % term of the sequence
    V = ones(size(C)); % number of iterations before divergence

    % Mandelbrot iteration loop
    for n = 1:iterations
        B = abs(Z) <= 2; % points that have not diverged
        Z(B) = Z(B).^2 + C(B); % iterate the points that have not diverged
        V(B) = V(B) + 1; % increment the number of iterations
    end

    clf;
    
    % Display the Mandelbrot set
    image([Xmin, Xmax], [Ymin, Ymax], mod(V, 64) + 1);
    colormap copper; % on peut aussi me
    axis xy;
    axis equal;
    axis off;

    % Title with information
    title(['Mandelbrot Fractal - Iterations: ', num2str(iterations)]);
end
