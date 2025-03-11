`include "phase_types.sv"

virtual class my_phase_base;
    string name;
    
    // Constructor that auto-registers with scheduler
    function new(string name);
        this.name = name; //passed from the object that calls the class
        // Auto-register with scheduler
        PhaseScheduler::register_component(this);
    endfunction: new
    
    // get_name function to retrieve the component name
    //ToDo - see if still needed
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
