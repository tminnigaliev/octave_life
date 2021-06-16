function [new_state] = state_dead(neighbours)
    alive_count = sum(sum(cellfun(@(x)x == @state_alive, neighbours)));
    
    if (alive_count == 3)
        new_state = @state_alive;
    else
        new_state = @state_dead;
    end
end