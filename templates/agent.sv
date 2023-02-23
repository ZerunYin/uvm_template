`ifndef {{name.upper()}}_SV
`define {{name.upper()}}_SV

class {{name}} extends {{base}};
    `uvm_component_utils({{name}})

    {{cfg.driver_name}} m_drv;
    {{cfg.sequencer_name}} m_sqr;
    {{cfg.monitor_name}} m_mon;

    extern function new(string name = "", uvm_component parent = null);

    {%for key, value in cfg.phase_cfg.func_phases.items()%}
        {%if value[0]%}
    extern function void {{key}}_phase(uvm_phase phase);
        {%endif%}
    {%endfor%}

    {%for key, value in cfg.phase_cfg.task_phases.items()%}
        {%if value[0]%}
    extern task {{key}}_phase(uvm_phase phase);
        {%endif%}
    {%endfor%}

endclass : {{name}}

// ================================================================================================================== //

function {{name}}::new(string name = "", uvm_component parent = null);
    super.new(name, parent);
endfunction : new

// function phases
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(is_active == UVM_ACTIVE) begin
        m_drv = {{cfg.driver_name}}::type_id::create("m_drv", this);
        m_sqr = {{cfg.sequencer_name}}::type_id::create("m_sqr", this);
    end
    m_mon = {{cfg.monitor_name}}::type_id::create("m_mon", this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction : connect_phase

{%for key, value in cfg.phase_cfg.func_phases.items()%}
    {%if value[1]%}
function void {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endfunction : {{key}}_phase

    {%endif%}
{%endfor%}

// task phases
{%for key, value in cfg.phase_cfg.task_phases.items()%}
    {%if value[1]%}
task {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endtask : {{key}}_phase

    {%endif%}
{%endfor%}

`endif // {{name.upper()}}_SV