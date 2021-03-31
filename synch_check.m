%function iterator_jump = synch_check(y, start)
%a(1) = get_delta(y, start);
%for i = 1:30
%    a(i + 1) = get_delta(y, start + i);
%end
%[m, iterator_jump] = min(a);
%iterator_jump = iterator_jump - 1;
%end

function iterator_jump = synch_check(y, start)
ratio = 10; %0-100 for comparing
a(1) = (100 - ratio) * synch_difference(y, start, 40) - ratio * get_delta(y, start);
for i = 1:5
    a(i + 1) = (100 - ratio) * synch_difference(y, start + i, 40) - ratio * get_delta(y, start + i);
end
[m, iterator_jump] = max(a);
iterator_jump = iterator_jump - 1;
end

