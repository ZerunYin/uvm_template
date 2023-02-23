from os import mkdir, path
from jinja2 import Environment, FileSystemLoader
from config import ComponentConfig

env = Environment(
    loader=FileSystemLoader(searchpath="templates"),
    trim_blocks=True,
    lstrip_blocks=True
)

tpls_cfg = {
    "env": True,
    "agent": True,
    "driver": True,
    "monitor": True,
    "sequencer": True
}

cfg = ComponentConfig("msg")

for key, value in tpls_cfg.items():
    if not path.isdir(cfg.name):
        mkdir(cfg.name)
    tpl = env.get_template("%s.sv" % key)
    with open("%s/%s_%s.sv" % (cfg.name, cfg.name, key), "w") as fh:
        fh.write(tpl.render(name=getattr(cfg, "%s_name" % key), base=getattr(cfg, "%s_base" % key), cfg=cfg))
