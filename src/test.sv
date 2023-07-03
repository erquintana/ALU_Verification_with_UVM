`include "driver.sv"
`include "sequencer.sv"
`include "alu_feature_tests.sv"
 
class test extends uvm_test;
  `uvm_component_utils(test);

    driver drv;
    sequencer seqr;
    alu_sum_seq sum_test_seq;

    // class constructor:
  function new(string name = "test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        drv = driver::type_id::create("drv", this);
        seqr = sequencer::type_id::create("seqr", this);
        sum_test_seq = alu_sum_seq::type_id::create("sum_test_seq", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
      if(! uvm_config_db #(virtual alu_interface.mp_if)::get(this, "", "ALU_vif",drv.ALU_vif)) begin
            `uvm_error("connect", "ALU_vif not found")
        end
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "starting sum_test_seq");
        sum_test_seq.start(seqr);
        phase.drop_objection(this, "finished sum_test_seq");
    endtask
endclass