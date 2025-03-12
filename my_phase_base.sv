`ifndef MY_PHASE_BASE_SV
`define MY_PHASE_BASE_SV

`include "phase_types.sv"

virtual class my_phase_base;
    string name;
    static bit is_scheduler_available = 0;
    
    // Constructor without auto-registration
    function new(string name);
        this.name = name;
        // Registration will be done by a separate function
    endfunction: new
    
    // Function to register with scheduler - called by child class constructors
    static function void set_scheduler_available();
        is_scheduler_available = 1;
    endfunction
    
    // Function to register with scheduler
    function void register_with_scheduler();
        if(is_scheduler_available)
            PhaseScheduler::register_component(this);
    endfunction
    
    // get_name function to retrieve the component name
    //used only to print the name of the component upon being registered
    virtual function string get_name();
        return name;
    endfunction: get_name

    virtual function void my_build_phase(string name); //get object to pass "name" - this should be the name of the object calling function i.e driver_1
        $display("component %s, phase: my_build_phase", name);
    endfunction: my_build_phase

    virtual function void my_reset_phase(string name);
        $display("component %s, phase: my_reset_phase", name);
    endfunction: my_reset_phase

    virtual function void my_run_phase(string name);
        $display("component %s, phase: my_run_phase", name);
    endfunction: my_run_phase

    virtual function void my_final_phase(string name);
        $display("component %s, phase: my_final_phase", name);
    endfunction: my_final_phase

endclass

`endif // MY_PHASE_BASE_SV
