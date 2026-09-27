local args = { ... }

assert(#args==3,"usage: \"./gps_node.lua x y z\"")

print(("starting gps node at %s, %s, %s"):format(args[1],args[2],args[3]))

os.run({},"rom/programs/gps.lua","host",args[1],args[2],args[3]);
