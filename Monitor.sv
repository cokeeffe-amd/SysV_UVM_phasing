`ifndef MONITOR_SV
    `define MONITOR_SV

    `include "my_phase_base.sv"

    class Monitor extends my_phase_base;
        function new(string name);
            super.new(name);  // Must call parent constructor first
            run_delay = 20; // Set run delay to 20 time units
     
        endfunction: new
        
    endclass: Monitor

`endif // MONITOR_SV
