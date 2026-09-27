local api_files = {
  "startup.lua",
}

for _,file in ipairs(files) do
  local url = ("https://cdn.jsdeliver.net/gh/Hawkking-cloud/cc-tweaked_global_repo@main/%s"):format(file)
  local response = http.get(url)
  if response then 
    local content = response.readAll()
    response.close()

    local dir = fs.getDir(file)
    if dir ~= "" and not fs.exists(dir) then
      fs.makeDir(dir)
    end 

    local f = fs.open(file,"w")
    f.write(content)
    f.close()
    print((": %s"):format(file))
  else
    print(("failed to fetch: %s"):format(file))
  end 
end

if fs.exists("h_startup.lua") then 
  os.run({},"h_startup.lua")
end 
