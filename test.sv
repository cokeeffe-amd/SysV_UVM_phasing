`include "PhaseScheduler.sv"
`include "Driver.sv"
`include "Monitor.sv"

program automatic test1 ();  

    // Create component instances
//ToDo - use a for loop with i to simplify this
    Driver driver1, driver2, driver3, driver4;
    Monitor monitor1, monitor2;
    
    // Get the phase scheduler instance
    PhaseScheduler phase_scheduler;
    
    initial begin
        // Create the phase scheduler FIRST
        phase_scheduler = PhaseScheduler::get_instance();
        
        // Create multiple component instances - they will auto-register
//ToDo - use a for loop with i to simplify this
        driver1 = new("Driver_1");
        driver2 = new("Driver_2");
        driver3 = new("Driver_3");
        driver4 = new("Driver_4");
        
        monitor1 = new("Monitor_1");
        monitor2 = new("Monitor_2");
        
        // Execute all phases - this will wait for each phase to complete
        // before moving to the next one
        //ToDo - better approach?
        phase_scheduler.execute_phases();
    end

endprogram: test1