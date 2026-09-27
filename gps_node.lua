local args = { ... }

assert(#args==3,"usage: \"./gps_node.lua x y z\"")

os.run({},"rom/programs/gps.lua","host",args[0],args[1],args[2]);
