`include "alu_seq_packet.sv"

class driver extends uvm_driver #(alu_seq_packet);
  `uvm_component_utils(driver);

    alu_seq_packet alu_driver_pkt;
    virtual alu_interface.mp_if ALU_vif;

    // Class constructor:
    function new(string name = "driver", uvm_component parent = null);
        super.new(name, parent);
      `uvm_info(this.get_name(),"driver Instance created", UVM_NONE);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(this.get_name(),"build_phase begin", UVM_NONE);
        // Checking for virtual interface in the uvm hierarchy:
        if(! uvm_config_db # (virtual alu_interface.mp_if)::get(this, "", "ALU_vif", ALU_vif) ) begin
                `uvm_fatal(get_name(), " can't get desired virtual interface");
            end
        `uvm_info(this.get_name(),"build_phase finished", UVM_NONE);
    
     	// Initializing  
     	ALU_vif.cb.a <= 0;    // initialicing variables
        ALU_vif.cb.b <= 0;    // initialicing variables
      	ALU_vif.cb.ALU_sel <= 4'b0000;
      	ALU_vif.cb.reset <= 1;
    endfunction


    // run phase:
    task run_phase(uvm_phase phase);
        `uvm_info(this.get_name(),"run_phase begin", UVM_NONE);  
      forever begin
            seq_item_port.get_next_item(alu_driver_pkt);    // gets sequence from sequener and saves it to alu_driver_pkt
            sequence_hadler(alu_driver_pkt);
            seq_item_port.item_done();
        end
        `uvm_info(this.get_name(),"run_phase finished", UVM_NONE);
    endtask

    // handles operands a and b to be sent via interface to the DUT (ALU)
  virtual task sequence_hadler(alu_seq_packet pkt);
    `uvm_info(this.get_name(),"sequence_hadler Task begin", UVM_NONE);
    	@(ALU_vif.cb);
        pkt.print();
    	ALU_vif.cb.reset <= pkt.rst;
    	ALU_vif.cb.a <= pkt.a;
        ALU_vif.cb.b <= pkt.b;
    `uvm_info(this.get_name(),"sequence_hadler Task finished", UVM_NONE);
    endtask
endclass