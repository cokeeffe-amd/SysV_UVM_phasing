`ifndef DRIVER_SV
    `define DRIVER_SV

    `include "my_phase_base.sv"

    class Driver extends my_phase_base;
        function new(string name);
            super.new(name);  // Must call parent constructor first
            register_with_scheduler(); // Then call the registration function from the base class
        endfunction: new

    endclass: Driver

`endif // DRIVER_SV