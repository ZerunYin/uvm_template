`ifndef {{name.upper()}}_SV
`define {{name.upper()}}_SV

class {{name}} extends {{base}};
    `uvm_component_utils({{name}})

    {{cfg.driver_name}} m_drv;
    {{cfg.monitor_name}} m_mon;
    {{cfg.sequencer_name}} m_sqr;

    extern function new(string name = "", uvm_component parent = null);

    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    {%for key, value in cfg.phase_cfg.func_phases.items()%}
        {%if value%}
    extern function void {{key}}_phase(uvm_phase phase);
        {%endif%}
    {%endfor%}

    {%for key, value in cfg.phase_cfg.task_phases.items()%}
        {%if value%}
    extern task {{key}}_phase(uvm_phase phase);
        {%endif%}
    {%endfor%}

endclass : {{name}}

// ================================================================================================================== //

function {{name}}::new(string name = "", uvm_component parent = null);
    super.new(name, parent);
endfunction : new

// function phases
{%for key, value in cfg.phase_cfg.func_phases.items()%}
    {%if value%}
function void {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endfunction : {{key}}_phase

    {%endif%}
{%endfor%}

// task phases
{%for key, value in cfg.phase_cfg.task_phases.items()%}
    {%if value%}
task {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endtask : {{key}}_phase

    {%endif%}
{%endfor%}

`endif // {{name.upper()}}_SV