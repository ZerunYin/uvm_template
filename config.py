class ComponentConfig(object):
    def __init__(self, name):
        self.name = name
        self.func_phases = [
            ("build", True),
            ("connect", True),
            ("end_of_elaboration", False),
            ("start_of_simulation", False),

            ("extract", False),
            ("check", False),
            ("report", False),
            ("final", False)
        ]

        self.task_phases = [
            ("run", True),

            ("pre_reset", False),
            ("reset", False),
            ("post_reset", False),
            ("pre_configure", False),
            ("configure", False),
            ("post_configure", False),
            ("pre_main", False),
            ("main", False),
            ("post_main", False),
            ("pre_shutdown", False),
            ("shutdown", False),
            ("post_shutdown", False)
        ]
        self.fields = {}
        self.rand_fields = {}

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

    def __str__(self):
        return self.name


if __name__ == '__main__':
    pass
