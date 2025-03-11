`ifndef MONITOR_SV
    `define MONITOR_SV

    `include "my_phase_base.sv"

    class Monitor extends my_phase_base;
        function new(string name);
            super.new(name);  // Must call parent constructor first
            register_with_scheduler(); // Then call the registration function from base class
        endfunction: new
        
    endclass: Monitor

`endif // MONITOR_SV
