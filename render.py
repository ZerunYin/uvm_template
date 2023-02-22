from jinja2 import Environment, FileSystemLoader
from config import AgentConfig

env = Environment(
    loader=FileSystemLoader(searchpath="templates"),
    trim_blocks=True,
    lstrip_blocks=True
)
tpl = env.get_template("agent.sv")

agent_config = AgentConfig("msg")
args = {
    "agent_config": agent_config
}

print(tpl.render(**args))