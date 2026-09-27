local files = {
  "startup.lua",
}

for _,file in ipairs(files) do
  local url = ("https://raw.githubusercontent.com/Hawkking-cloud/cc-tweaked_global_repo/main/%s"):format(file)
  local response = http.gstartup.lua
  if response then 
    local content = response.readAll()
    response.close()

    local dir = fs.getDir(path)
    if dir ~= "" and not fs.exists(dir) then
      fs.makeDir(dir)
    end 

    local f = fs.open(path,"w")
    f.write(content)
    fs.close()
    print((": %s"):format(file))
  else
    print(("failed to fetch: %s"):format(file))
  end 
end
