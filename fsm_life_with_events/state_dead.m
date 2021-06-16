function [new_state] = state_dead(neighbours)
    
    event = event_spawn(neighbours);
    
    switch event
    case 'spawn'
        new_state = @state_alive;
    case ''
        new_state = @state_dead;
    otherwise
        msg = sprintf('Unknown event: %s\n', event);
        error(msg);
    end
end