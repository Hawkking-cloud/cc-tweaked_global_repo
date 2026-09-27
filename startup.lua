local api_files = {
  "startup.lua",
}

if fs.exists("requirements") then
  local requirements = fs.open("requirements","r").readAll()
  for chunk in requirements:gmatch("([^\n]+)") do 
    api_files[#api_files+1] = (chunk..".lua")
  end 
end 


for _,file in ipairs(api_files) do
  local url = ("https://raw.githubusercontent.com/Hawkking-cloud/cc-tweaked_global_repo/main/%s"):format(file)
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
