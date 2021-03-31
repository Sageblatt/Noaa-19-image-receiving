function [bool_found, iterator_jump] = synch_check_first(y, start)
delta = get_delta(y, start);
diff = synch_difference(y, start, 40);
a(1) = diff - delta;
if(delta < 1500 && diff > 1300)
    for i = 1:10
        a(i + 1) = synch_difference(y, start, 40) - get_delta(y, start + i);
    end
    [m, iterator_jump] = max(a);
    iterator_jump = iterator_jump - 1;
    bool_found = true;
else
    bool_found = false;
    iterator_jump = 0;
end

