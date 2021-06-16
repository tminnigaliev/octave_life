function event = event_spawn(neighbours)
    alive_count = sum(sum(cellfun(@(x)x == @state_alive, neighbours)));
    if (alive_count == 3)
        event = 'spawn';
    else
        event = '';
    end
end