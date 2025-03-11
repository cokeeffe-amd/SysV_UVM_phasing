`include "my_phase_base.sv"

class Monitor extends my_phase_base;
    function new(string name);
        super.new(name);  // Call parent constructor which handles registration
    endfunction: new
    
endclass: Monitor
