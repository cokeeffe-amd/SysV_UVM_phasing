`include "my_phase_base.sv"

class PhaseScheduler;
    //one instance of PhaseScheduler, make static
    static PhaseScheduler instance;
    
    // Queue to hold all registered components
    static my_phase_base component_queue[$];
    
    // Static method to register components
    static function void register_component(my_phase_base comp);
        if (instance == null)
            instance = new();
        component_queue.push_back(comp);
        $display("Auto-registered component: %s", comp.get_name());
    endfunction: register_component
    
    // Get singleton instance
    static function PhaseScheduler get_instance();
        if (instance == null)
            instance = new();
        return instance;
    endfunction: get_instance
    
    // Execute all phases in order
    task execute_phases();
        // Build phase for all components
        $display("\n--- Starting BUILD PHASE ---");
        foreach (component_queue[i]) 
            component_queue[i].my_build_phase(component_queue[i].name);
        $display("--- BUILD PHASE COMPLETED ---");
        
        // Reset phase for all components
        $display("\n--- Starting RESET PHASE ---");
        foreach (component_queue[i]) 
            component_queue[i].my_reset_phase(component_queue[i].name);
        $display("--- RESET PHASE COMPLETED ---");
        
        // Run phase for all components
        $display("\n--- Starting RUN PHASE ---");
        foreach (component_queue[i]) 
            component_queue[i].my_run_phase(component_queue[i].name);
        $display("--- RUN PHASE COMPLETED ---");
        
        // Final phase for all components
        $display("\n--- Starting FINAL PHASE ---");
        foreach (component_queue[i]) 
            component_queue[i].my_final_phase(component_queue[i].name);
        $display("--- FINAL PHASE COMPLETED ---");
            
        $display("\n--- ALL PHASES COMPLETED ---");
    endtask: execute_phases
endclass: PhaseScheduler
