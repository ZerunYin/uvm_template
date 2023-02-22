`ifndef {{agent_config.name.upper()}}_SV
`define {{agent_config.name.upper()}}_SV

class {{agent_config.name}} extends uvm_agent;
    `uvm_component_utils({{agent_config.name}})

    extern function new(string name = "", uvm_component parent);

    {% for key, value in agent_config.func_phases.items() %}
        {% if value %}
    extern function void {{key}}_phase(uvm_phase phase);
        {% endif %}
    {% endfor %}

    {% for key, value in agent_config.task_phases.items() %}
        {% if value %}
    extern task {{key}}_phase(uvm_phase phase);
        {% endif %}
    {% endfor %}

endclass : {{agent_config.name}}

// ================================================================================================================== //

function {{agent_config.name}}::new(string name = "", uvm_component parent);
    super.new(name, parent);
endfunction : new

// function phases
{% for key, value in agent_config.func_phases.items() %}
    {% if value %}
function void {{agent_config.name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endfunction : {{key}}_phase
    {% endif %}
{% endfor %}

// task phases
{% for key, value in agent_config.task_phases.items() %}
    {% if value %}
task {{agent_config.name}}::{{key}}_phase(uvm_phase phase);
    super.{{key}}_phase(phase);
endtask : {{key}}_phase
    {% endif %}
{% endfor %}

`endif // {{agent_config.name.upper()}}_SV