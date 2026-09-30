function assert(expr,message)
  if not expr then error(message or "assert() failed") end
end
function draw_rect(monitor,x1,y1,x2,y2,background,foreground)
  assert(x2>x1)
  assert(y2>y1)
  if background then 
    monitor.setBackgroundColor(background)
  end
  if foreground then
    monitor.setBackgroundColor(foreground)
  end 
  for y=y1,y2 do 
    monitor.setCursorPos(x1,y)
    monitor.write((" "):rep(x2-x1))
  end
end

term.clear()
term.setCursorBlink(false)
print("keypad.lua ...")

local monitor = peripheral.find("monitor")
if not monitor then 
  error("error: monitor not attached")
end

monitor.setBackgroundColor(colors.blue)
monitor.clear()
local w,h = monitor.getSize()
draw_rect(monitor,1,1,w-1,h-1,colors.lightGray,colors.black)
local center = ceil(w/2)

terminal.setCursorPos(center-1,2)
terminal.blit("1",colors.gray,colors.white)
terminal.setCursorPos(center,2)
terminal.blit("2",colors.gray,colors.white)
terminal.setCursorPos(center+1,2)
terminal.blit("3",colors.gray,colors.white)

terminal.setCursorPos(center-1,3)
terminal.blit("4",colors.gray,colors.white)
terminal.setCursorPos(center,3)
terminal.blit("5",colors.gray,colors.white)
terminal.setCursorPos(center+1,3)
terminal.blit("6",colors.gray,colors.white)

terminal.setCursorPos(center-1,4)
terminal.blit("7",colors.gray,colors.white)
terminal.setCursorPos(center,4)
terminal.blit("8",colors.gray,colors.white)
terminal.setCursorPos(center+1,4)
terminal.blit("9",colors.gray,colors.white)

while true do 
  local event, side, x, y = os.pullEvent("monitor_touch")

  if x == center - 1 then
    if y == 2 then 
      print("1")
    end
  elseif x == center then
    print("a")
  elseif x == center+1 then
    print("b")
  end
end 
