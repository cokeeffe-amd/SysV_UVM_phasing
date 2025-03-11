`include "my_phase_base.sv"

class Driver extends my_phase_base;
    function new(string name);
        this.name = name;  // Store the name in the base class property
    endfunction: new

endclass: Driver