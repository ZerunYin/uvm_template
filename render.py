from os import mkdir, path
from collections import OrderedDict
from jinja2 import Environment, FileSystemLoader
from config import ComponentConfig
from config import AgentConfig

env = Environment(
    loader=FileSystemLoader(searchpath="templates"),
    trim_blocks=True,
    lstrip_blocks=True
)


def gen_files(name, tpls_cfg):
    if not path.isdir(name):
        mkdir(name)

    # generate file list
    with open("%s/%s.f" % (name, name), "w") as fh:
        for key, value in tpls_cfg.items():
            if value[0]:
                fh.writelines("%s_%s.svh\n" % (name, key))

    # generate package file
    with open("%s/%s_pkg.sv" % (name, name), "w") as fh:
        fh.write("package %s_pkg;\n" % name)
        fh.write("    import uvm_pkg::*;\n")
        fh.write("    `include \"uvm_macros.svh\"\n")
        fh.write("\n")
        for key, value in tpls_cfg.items():
            if value[0]:
                fh.writelines("    `include \"%s_%s.svh\"\n" % (name, key))
        fh.write("endpackage")

    for key, value in tpls_cfg.items():
        tpl = env.get_template("%s.sv" % key)
        cfg = value[1]
        with open("%s/%s_%s.svh" % (name, name, key), "w") as fh:
            fh.write(tpl.render(name=getattr(cfg, "%s_name" % key), base=getattr(cfg, "%s_base" % key), cfg=cfg))


name = "msg"

tpls_cfg = OrderedDict()
tpls_cfg["driver"] = (True, ComponentConfig(name))
tpls_cfg["monitor"] = (True, ComponentConfig(name))
tpls_cfg["sequencer"] = (True, ComponentConfig(name))
tpls_cfg["agent"] = (True, AgentConfig(name))
tpls_cfg["env"] = (True, ComponentConfig(name))

gen_files(name, tpls_cfg)
