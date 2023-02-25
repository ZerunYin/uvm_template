`ifndef {{name.upper()}}_SVH
`define {{name.upper()}}_SVH

class {{name}} extends {{base}};
    `uvm_component_utils({{name}})

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

function {{name}}::new(string name = "", uvm_component parent = null);
    super.new(name, parent);
endfunction : new

{%for key, value in cfg.phase_cfg.func_phases.items()%}
    {%if value[1]%}
function void {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endfunction : {{key}}_phase

    {%endif%}
{%endfor%}

{%for key, value in cfg.phase_cfg.task_phases.items()%}
    {%if value[1]%}
task {{name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endtask : {{key}}_phase

    {%endif%}
{%endfor%}

`endif // {{name.upper()}}_SVH