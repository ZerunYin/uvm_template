class ComponentConfig(object):
    def __init__(self, name):
        self.name = name
        self.func_phases = {
            "build": True,
            "connect": True,
            "end_of_elaboration": False,
            "start_of_simulation": False,

            "extract": False,
            "check": False,
            "report": False,
            "final": False
        }
        self.task_phases = {
            "run": True,

            "pre_reset": False,
            "reset": False,
            "post_reset": False,
            "pre_configure": False,
            "configure": False,
            "post_configure": False,
            "pre_main": False,
            "main": False,
            "post_main": False,
            "pre_shutdown": False,
            "shutdown": False,
            "post_shutdown": False,
        }
        self.fields = {}
        self.rand_fields = {}

    def __str__(self):
        return self.name


class AgentConfig(ComponentConfig):
    def __init__(self, name):
        super().__init__(name)
        self.name += "_agent"


if __name__ == '__main__':
    agent_config = AgentConfig("msg")
    print(agent_config.name)
