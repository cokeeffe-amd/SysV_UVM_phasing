`ifndef  SEQUENCER_SV
    `define SEQUENCER_SV

    `include "my_phase_base.sv"

    class Sequencer extends my_phase_base;
        function new(string name);
            super.new(name);  
            run_delay = 5;
            register_with_scheduler();
        endfunction: new

    endclass: Sequencer

`endif //  SEQUENCER_SV


