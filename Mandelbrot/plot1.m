close all;

% Initial parameters
resolution = 840;
iterations = 100;

% Initial display region
Xmin = -2;
Xmax = 2;
Ymin = -2;
Ymax = 2;

% Display the Mandelbrot set
updateMandelbrot(Xmin, Xmax, Ymin, Ymax, iterations, resolution);

disp('+ = zoom in, - = zoom out.');

% Interactive loop
while true
    [a, b, button] = ginput(1); % Get a key press

    if button > 3
        switch char(button)

            case char(43)  % '+' Key for zoom in
                width = (Xmax - Xmin) / 2;
                height = (Ymax - Ymin) / 2;
                centre_x = (Xmin + Xmax) / 2;
                centre_y = (Ymin + Ymax) / 2;
                Xmin = centre_x - width / 2;
                Xmax = centre_x + width / 2;
                Ymin = centre_y - height / 2;
                Ymax = centre_y + height / 2;
                updateMandelbrot(Xmin, Xmax, Ymin, Ymax, iterations, resolution);

            case char(45)  % '-' Key for zoom out
                width = (Xmax - Xmin) * 2;
                height = (Ymax - Ymin) * 2;
                centre_x = (Xmin + Xmax) / 2;
                centre_y = (Ymin + Ymax) / 2;
                Xmin = max(-2, centre_x - width / 2);
                Xmax = min(2, centre_x + width / 2);
                Ymin = max(-2, centre_y - height / 2);
                Ymax = min(2, centre_y + height / 2);
                updateMandelbrot(Xmin, Xmax, Ymin, Ymax, iterations, resolution);
        end
    end
end