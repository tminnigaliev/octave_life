function [new_state] = state_alive(neighbours)
    event = '';
    event = [event, event_die(neighbours)];
    event = [event, event_survive(neighbours)];

    switch event
    case 'die'
        new_state = @state_dead;
    case 'survive'
        new_state = @state_alive;
    otherwise
        msg = sprintf('Unknown event: %s\n', event);
        error(msg);
    end
end