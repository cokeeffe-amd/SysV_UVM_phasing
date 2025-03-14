`ifndef  SCOREBOARD_SV
    `define SCOREBOARD_SV

    `include "my_phase_base.sv"

    class Scoreboard extends my_phase_base;
        function new(string name);
            super.new(name);  
            run_delay = 22;
           // register_with_scheduler();
        endfunction: new

    endclass: Scoreboard

`endif //  SCOREBOARD_SV


