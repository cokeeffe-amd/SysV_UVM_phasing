`include "PhaseScheduler.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Sequencer.sv"

program automatic test1 ();  

    // Create component instances
    //Driver driver1, driver2, driver3, driver4;
    Driver driver_array[];
   // Monitor monitor1, monitor2, monitor3;
    Monitor monitor_array[];
    //Sequencer sequencer1, sequencer2;
    Sequencer sequencer_array[];

    // Get the phase scheduler instance
    PhaseScheduler phase_scheduler;
    
    initial begin
        // Create the phase scheduler FIRST
        phase_scheduler = PhaseScheduler::get_instance();
        
        // Create multiple component instances - they will auto-register when created due to my_phase_base constructor functionality
        for(int i=0; i<4; i++) begin
            driver_array[(i+1)] = new($sformatf("Driver_%0d", (i+1)));
        end

        for(int i=0; i<3; i++) begin
            monitor_array[(i+1)] = new($sformatf("Monitor_%0d", (i+1)));
        end
        

        for(int i=0; i<2; i++) begin
            sequencer_array[(i+1)] = new($sformatf("Sequencer_%0d", (i+1)));
        end
        
        // Execute all phases - this will wait for each phase to complete before moving to the next one
        phase_scheduler.execute_phases();
    end

    

endprogram: test1