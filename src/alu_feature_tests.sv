class alu_sum_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sum_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "Object created", UVM_NONE);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
    // setting initial values
    alu_pkt.a = 0;
    alu_pkt.b = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0000;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0,alu_pkt.a);
      finish_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d started and finished", i), UVM_NONE);
      alu_pkt.print();
    end
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask
endclass

class alu_sub_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sum_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "Object created", UVM_NONE);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
    // setting initial values
    alu_pkt.a = 0;
    alu_pkt.b = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0001;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0,alu_pkt.a);
      finish_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d started and finished", i), UVM_NONE);
      alu_pkt.print();
    end
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask
endclass

class alu_mult_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sum_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "Object created", UVM_NONE);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
    // setting initial values
    alu_pkt.a = 0;
    alu_pkt.b = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0010;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0,alu_pkt.a);
      finish_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d started and finished", i), UVM_NONE);
      alu_pkt.print();
    end
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask
endclass

class alu_div_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sum_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "Object created", UVM_NONE);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
    // setting initial values
    alu_pkt.a = 0;
    alu_pkt.b = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0011;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0,alu_pkt.a);
      finish_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d started and finished", i), UVM_NONE);
      alu_pkt.print();
    end
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "Task begin", UVM_NONE);
    `uvm_info(this.get_name(), "Task finished", UVM_NONE);
  endtask
endclass

