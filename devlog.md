5/8/2026  11:32am 
Added the main prolog files and the other main files. Began by adding the plan/1 predicate. It will create a plan/3 structure that has the morning, evening and night schedules. It will also collect all employees and pass them through the shifts so that every employee can eventually be scheduled once. 

5/8/2026 1:52 pm
Added the make_shift/4 predicate. This part finds all the workstations that are active during a shift. I also implemented the assign_stations/5 which assigns employees to every active workstation. This took a lot longer than I had planned for and will likely continue working on this until I finish the project. 

5/8/2026 3:26 pm
Added valid workers so it selects employees from available employees. It will either assign an employee if they are valid for that shift and workstation or it will skip them and have them available later. I believe the project should be done now but I need to test it out and then do bug fixes. 

5/8/2026 4:27 pm
The code should work but doing the example outputs takes a long time for it to get an output. Sometimes the program will just crash. If I use simpler queries it works as intended. Bug fixes should be done and I believe this is good enough for submission. 