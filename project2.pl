plan(plan(Morning, Evening, Night)) :-
    findall(Employee, employee(Employee), Employees),
    make_shift(morning, Employees, AfterMorning, Morning),
    make_shift(evening, AfterMorning, AfterEvening, Evening),
    make_shift(night, AfterEvening, [], Night).

make_shift(Shift, Available, Remaining, Schedule) :-
    findall(ws(Station, Min, Max),
            (workstation(Station, Min, Max), \+ workstation_idle(Station, Shift)),
            Stations),
    assign_stations(Stations, Shift, Available, Remaining, Schedule).

assign_stations([], _, Available, Available, []).

assign_stations([ws(Station, Min, Max)|RestStations], Shift, Available, Remaining,
                [workstation(Station, Workers)|RestSchedule]) :-
    Min =< Max,
    between(Min, Max, Count),
    choose_valid_workers(Count, Available, Shift, Station, Workers, AfterStation),
    assign_stations(RestStations, Shift, AfterStation, Remaining, RestSchedule).
    choose_valid_workers(0, Available, _, _, [], Available).

choose_valid_workers(Count, [Employee|Rest], Shift, Station,
                     [Employee|Workers], Remaining) :-
    Count > 0,
    can_work(Employee, Shift, Station),
    Count1 is Count - 1,
    choose_valid_workers(Count1, Rest, Shift, Station, Workers, Remaining).

choose_valid_workers(Count, [Employee|Rest], Shift, Station,
                     Workers, [Employee|Remaining]) :-
    Count > 0,
    choose_valid_workers(Count, Rest, Shift, Station, Workers, Remaining).
can_work(Employee, Shift, Station) :-
    \+ avoid_shift(Employee, Shift),
    \+ avoid_workstation(Employee, Station).