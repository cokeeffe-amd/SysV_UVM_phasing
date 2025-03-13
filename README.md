# SysV UVM Phasing Project

## Overview
This is a simplified SystemVerilog phasing aimed to mimic the UVM phasing mechanism. The approach uses a custom scheduler and base class for all components.
Executes the phases build, connect, run, and final on each component in the appropriate order. 
Designed to be easily extendable and customisable for verification environments.

## Key Files
- **test.sv**: Instantiates components, retrieves the scheduler, and runs phases.
- **my_phase_base.sv**: virtual base class providing common phase logic. All components are derived from this base class.
- **PhaseScheduler.sv**: Holds registered components and executes phases in order.
- **Driver.sv**, **Monitor.sv**, **Sequencer.sv**, **Env.sv**, **Scoreboard.sv**: Components extending `my_phase_base`. All registered to phase scheduler upon construction.


## Usage (with VCS)
1. Compile all `.sv` files.
   - vcs -sverilog ./test.sv
     
2. Run the `test.sv` program block and observe log files.
    - simv -l simv.log
    - **Optional set number of components:** eg:   simv -l simv.log +NUMSEQUENCERS=3 +NUMSCOREBOARDS=2
  

## Notes
- Default is one of each component. Can change in command line.
- Each component registers itself with the scheduler.
- Change number of comonents using +NUMCOMPONENTNAME = <numtosetto>
- Modify the `run_delay` or the number of instances as needed for testing.
