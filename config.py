from collections import OrderedDict


class ComponentConfig(object):
    def __init__(self, name):
        self.name = name

        self.fields = {}
        self.rand_fields = {}

        self.phase_cfg = PhaseConfig()

        # derived names
        self.env_name = "%s_%s" % (self.name, "env")
        self.agent_name = "%s_%s" % (self.name, "agent")
        self.driver_name = "%s_%s" % (self.name, "driver")
        self.monitor_name = "%s_%s" % (self.name, "monitor")
        self.sequencer_name = "%s_%s" % (self.name, "sequencer")
        self.env_base = "uvm_env"
        self.agent_base = "uvm_agent"
        self.driver_base = "uvm_driver"
        self.monitor_base = "uvm_monitor"
        self.sequencer_base = "uvm_sequencer"


class AgentConfig(ComponentConfig):
    def __init__(self, name):
        super().__init__(name=name)
        self.phase_cfg.func_phases["build"] = False
        self.phase_cfg.func_phases["connect"] = False


class PhaseConfig(object):
    def __init__(self):
        """ default configurations """
        self.func_phases = OrderedDict()
        self.func_phases["build"] = True
        self.func_phases["connect"] = True
        self.func_phases["end_of_elaboration"] = False
        self.func_phases["start_of_simulation"] = False
        self.func_phases["extract"] = False
        self.func_phases["check"] = False
        self.func_phases["report"] = False
        self.func_phases["final"] = False

        self.task_phases = OrderedDict()
        self.task_phases["run"] = True
        self.task_phases["pre_reset"] = False
        self.task_phases["reset"] = False
        self.task_phases["post_reset"] = False
        self.task_phases["pre_configure"] = False
        self.task_phases["post_configure"] = False
        self.task_phases["pre_main"] = False
        self.task_phases["main"] = False
        self.task_phases["post_main"] = False
        self.task_phases["pre_shutdown"] = False
        self.task_phases["shutdown"] = False
        self.task_phases["post_shutdown"] = False
