addpath('fsm_life_no_events')
debug_on_error(1)

size_x = 30;
size_y = 30;
init_alive_percentage = 30;

% initialization selection:
%init = 'random';
%init = 'cycle';
init = 'glider';

field = cell(size_y, size_x);
[field{:}] = deal(@state_dead);

switch (init)
case 'random'
    init_alive_count = round((size_x * size_y) * init_alive_percentage / 100);

    for n=(1:init_alive_count)
        x = floor((size_x-0.0000001)*rand())+1;
        y = floor((size_y-0.0000001)*rand())+1;
        field{y,x} = @state_alive;
    end
case 'cycle'
    field{2,1} = @state_alive;
    field{2,2} = @state_alive;
    field{2,3} = @state_alive;
case 'glider'
    field{1,3} = @state_alive;
    field{2,3} = @state_alive;
    field{3,3} = @state_alive;
    field{3,2} = @state_alive;
    field{2,1} = @state_alive;
end

printf("Initial distribution:\n");
cellfun(@(x)x == @state_alive, field)

% simulation
for step = (1:100)

    field_new = cell(size(field));
    for x=(1:size_x)
        for y=(1:size_y)
            x_min = max(x-1, 1);
            x_max = min(x+1, size_x);
            y_min = max(y-1, 1);
            y_max = min(y+1, size_y);

            neighbours = field(y_min:y_max, x_min:x_max);
            field_new{y,x} = field{y,x}(neighbours);
        end
    end
    field = field_new;

    printf('Distribution after step %d\n', step );
    cellfun(@(x)x == @state_alive, field)
    figure(1); imagesc(cellfun(@(x)x == @state_alive, field));
    pause(0.05);
    % keyboard(':')
end