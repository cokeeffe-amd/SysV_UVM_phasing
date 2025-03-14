`ifndef DRIVER_SV
    `define DRIVER_SV

    `include "my_phase_base.sv"

    class Driver extends my_phase_base;
        function new(string name);
            super.new(name);  // Must call parent constructor first
      
        endfunction: new

    endclass: Driver

`endif // DRIVER_SV