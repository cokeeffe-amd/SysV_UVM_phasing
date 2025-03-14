`ifndef MY_PHASE_BASE_SV
`define MY_PHASE_BASE_SV

`include "phase_types.sv"

virtual class my_phase_base;
    string name;
    static bit is_scheduler_available = 0;
    int run_delay = 10; //default run delay is 10 time units, can be changed by child classes

    //Constructor that takes string argument for name: passed by child class
    function new(string name);
        this.name = name;
        register_with_scheduler();
    endfunction: new
    
    // Show scheduler has been instantiated - called by child class constructors, prevents running without scheduler
    static function void set_scheduler_available();
        is_scheduler_available = 1;
    endfunction
    
    // Function to register components with scheduler
    function void register_with_scheduler();
        if(is_scheduler_available)
            PhaseScheduler::register_component(this);
    endfunction
    
    // get_name function to retrieve the component name, used by phasescheduler to register components
    virtual function string get_name();
        return name;
    endfunction: get_name

    virtual function void my_build_phase(string name); //get object to pass "name" - this should be the name of the object calling function i.e driver_1
        $display("[%t] [%15s]: my_build_phase START", $time, name);
        $display("[%t] [%15s]: my_build_phase COMPLETE", $time, name);
    endfunction: my_build_phase

    virtual function void my_reset_phase(string name);
        $display("[%t] [%15s]: my_reset_phase START", $time, name);
        $display("[%t] [%15s]: my_reset_phase COMPLETE", $time, name);
    endfunction: my_reset_phase

    virtual task my_run_phase(string name);            //task since run phase consumes time
        $display("[%t] [%15s]: my_run_phase START", $time, name);
        #run_delay;                                    //To simulate run phase consuming time, delay can be overriden by child classes
        $display("[%t] [%15s]: my_run_phase COMPLETE after %-t", $time, name, $time);
    endtask: my_run_phase
  

    virtual function void my_final_phase(string name);
        $display("[%t] [%15s]: my_final_phase START", $time, name);
        $display("[%t] [%15s]: my_final_phase COMPLETE", $time, name);
    endfunction: my_final_phase




endclass

`endif // MY_PHASE_BASE_SV
