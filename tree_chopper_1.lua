local NORTH = 1 
local SOUTH = 2 
local EAST = 3 
local WEST = 4 

local facing = 0

function locate() 
  local x,y,z = gps.locate()
  if x then 
    return [x,y,z]
  else
    error("no connection to gps network")
end

function navigate_to(target_pos,current_pos)
  if not current_pos then
    current_pos = locate()
  end
  --until at target position 
  --  if cant move towards target_pos
  --    go back in stack until non covered position available
  local giveup = false
  local stack = []
  local covered = []
  local cursor_x = 0
  local cursor_y = 0
  while current_pos ~= target_pos and not giveup do 
    if not covered[cursor_x] then covered[cursor_x] = [] end
    covered[cursor_x][cursor_y] = true
    if turtle.forward() then
      cursor_y += 1
    else
      turtle.turnRight()
      if turtle.forward() then
        cursor_x += 1
      elseif turtle.backward() then
        turtle.turnLeft()
        turtle.turnLeft()
        cursor_x -= 1
      else
        turtle.turnLeft()
        turtle.back()
        cursor_y -= 1
        local failed = false
        while not failed do 
          turtle.turnRight()
          if turtle.forward() then
            
            break
          elseif turtle.backward() then
            turtle.turnLeft()
            turtle.turnLeft()
            break
          else
            turtle.turnLeft()
            turtle.back()
          end
      end
  end 
end

function turn_until_block(block_string)
  for i in 0, 4 do 
    if turtle.inspect().name == block_string then
      return 
    end
    turtle.turnRight()
  end
end 

local state1_pos = [591,143,-71] -- position to open fuel chest_chest 
local state1_dir = SOUTH

--solve cardinal direction
assert(turtle.getFuelLevel()>=1, "not enough fuel")
local pos1 = locate()
if not turtle.forward() then
  if not turtle.backward() then
    turtle.turnRight()
    if not turtle.forward() then
      if not turtle.backward() then
        error("cant move")
      end 
    end
  end
end
local pos2 = locate()

local dx = pos2[1]-pos1[1]
local dz = pos2[3]-pos1[3]

if dz < 0 then
    facing = NORTH
elseif dz > 0 then
    facing = SOUTH -- Positive Z is South
elseif dx > 0 then
    facing = EAST  -- Positive X is East
elseif dx < 0 then
    facing = WEST -- Negative X is West
end


-- go to fuel chest to start work
navigate_to(state1_pos,pos2)
face(state1_dir)
