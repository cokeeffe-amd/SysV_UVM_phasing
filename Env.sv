`ifndef  ENV_SV
    `define ENV_SV

    `include "my_phase_base.sv"

    class Env extends my_phase_base;
        function new(string name);
            super.new(name);  
            run_delay = 25; //overrides default of 10
          
        endfunction: new

    endclass: Env

`endif //  ENV_SV


