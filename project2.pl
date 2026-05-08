plan(plan(Morning, Evening, Night)) :-
    findall(Employee, employee(Employee), Employees),
    make_shift(morning, Employees, AfterMorning, Morning),
    make_shift(evening, AfterMorning, AfterEvening, Evening),
    make_shift(night, AfterEvening, [], Night).