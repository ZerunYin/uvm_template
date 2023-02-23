`ifndef {{name.upper()}}_SV
`define {{name.upper()}}_SV

class {{name}} extends {{base}};
    `uvm_component_utils({{name}})

    {{cfg.driver_name}} m_drv;
    {{cfg.monitor_name}} m_mon;
    {{cfg.sequencer_name}} m_sqr;

    extern function new(string name = "", uvm_component parent = null);

    {%for item in cfg.func_phases%}
        {%if item[1]%}
    extern function void {{item[0]}}_phase(uvm_phase phase);
        {%endif%}
    {% endfor %}

    {%for item in cfg.task_phases%}
        {%if item[1]%}
    extern task {{item[0]}}_phase(uvm_phase phase);
        {%endif%}
    {%endfor%}

endclass : {{name}}

// ================================================================================================================== //

function {{name}}::new(string name = "", uvm_component parent = null);
    super.new(name, parent);
endfunction : new

// function phases
{%for item in cfg.func_phases%}
    {%if item[1]%}
function void {{name}}::{{item[0]}}_phase(uvm_phase phase);
    super.{{item[0]}}_phase(phase);
endfunction : {{item[0]}}_phase

    {%endif%}
{% endfor %}

// task phases
{%for item in cfg.task_phases%}
    {%if item[1]%}
task {{name}}::{{item[0]}}_phase(uvm_phase phase);
    super.{{item[0]}}_phase(phase);
endtask : {{item[0]}}_phase

    {%endif%}
{%endfor%}

`endif // {{name.upper()}}_SV