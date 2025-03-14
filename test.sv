`include "PhaseScheduler.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Sequencer.sv"
`include "Env.sv"	
`include "Scoreboard.sv"

`timescale 1ns/1ns
program automatic test1 ();  

    // Create component arrays
    Driver driver_array[];
    Monitor monitor_array[];
    Sequencer sequencer_array[];
    Scoreboard scoreboard_array[];
    Env env_array[];

    //Set number of each component
    int num_drivers = 1;
    int num_monitors = 3;
    int num_sequencers = 2;
    int num_scoreboards =1;
    int num_envs = 1;

    // Get the phase scheduler instance
    PhaseScheduler phase_scheduler;
    
    initial begin
        $timeformat(-9, 1, "ns", 8);
        //Allow command line to set number of components
        setfromcommandline();

        // Create the phase scheduler 
        phase_scheduler = PhaseScheduler::get_instance();

        // Create and initialise components
        initialise_components();

        // Execute all phases - this will wait for each phase to complete before moving to the next one
        phase_scheduler.execute_phases();
    end



    // Function to create and initialise components
    function void initialise_components();
        // Create multiple component instances - will auto-register 
        for(int i=0; i<num_drivers; i++) begin
            driver_array[i] = new($sformatf("Driver_%0d", i+1));
        end

        for(int i=0; i<num_monitors; i++) begin
            monitor_array[i] = new($sformatf("Monitor_%0d", i+1));
        end

        for(int i=0; i<num_sequencers; i++) begin
            sequencer_array[i] = new($sformatf("Sequencer_%0d", i+1));
        end

        for(int i=0; i<num_scoreboards; i++) begin
            scoreboard_array[i] = new($sformatf("Scoreboard_%0d", i+1));
        end

        for(int i=0; i<num_envs; i++) begin
            env_array[i] = new($sformatf("Env_%0d", i+1));
        end


    endfunction

    // Set the number of components from the command line
    //For example: simv -l simv.log +NUMSEQUENCERS=3 +NUMSCOREBOARDS=2
    function void setfromcommandline();
    $display("\n\n");    

    if($value$plusargs("NUMDRIVERS=%0d",num_drivers))begin
        $display("Number of drivers set to %d", num_drivers);
    end
    
    if($value$plusargs("NUMMONITORS=%0d",num_monitors))begin
        $display("Number of monitors set to %d", num_monitors);
    end

    if($value$plusargs("NUMSEQUENCERS=%0d",num_sequencers)) begin
        $display("Number of sequencers set to %d", num_sequencers);
    end

    if($value$plusargs("NUMSCOREBOARDS=%0d",num_scoreboards)) begin
        $display("Number of scoreboards set to %d", num_scoreboards);
    end

    if($value$plusargs("NUMENVS=%0d",num_envs)) begin
        $display("Number of envs set to %d", num_envs);
    end


    endfunction



endprogram: test1