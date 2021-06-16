function event = event_survive(neighbours)
    alive_count = sum(sum(cellfun(@(x)x == @state_alive, neighbours)));
    alive_count -= 1;
    if (alive_count == 2) || (alive_count == 3)
        event = 'survive';
    else
        event = '';
    end
end