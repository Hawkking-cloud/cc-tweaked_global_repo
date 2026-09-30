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

function write_color_at(monitor,text,background,foreground,x,y)
  monitor.setBackgroundColor(background)
  monitor.setForegroundColor(foreground)
  monitor.setCursor(x,y)
  monitor.write(text)
end 

term.clear()
term.setCursorBlink(false)
print("keypad.lua ...")
i
local monitor = peripheral.find("monitor")
if not monitor then 
  error("error: monitor not attached")
end

monitor.setTextScale(0.5)
monitor.setBackgroundColor(colors.blue)
monitor.clear()

local w,h = monitor.getSize()
draw_rect(monitor,1,1,w-1,h-1,colors.lightGray,colors.black)
local center = math.ceil(w/2)

write_color_at(
  monitor,
  "1",
  colors.gray,colors.white,
  center-1,2 
)
write_color_at(
  monitor,
  "2",
  colors.gray,colors.white,
  center-1,2 
)
write_color_at(
  monitor,
  "3",
  colors.gray,colors.white,
  center+1,2 
)


write_color_at(
  monitor,
  "4",
  colors.gray,colors.white,
  center-1,3 
)
write_color_at(
  monitor,
  "5",
  colors.gray,colors.white,
  center-1,3 
)
write_color_at(
  monitor,
  "6",
  colors.gray,colors.white,
  center+1,3 
)



write_color_at(
  monitor,
  "7",
  colors.gray,colors.white,
  center-1,2 
)
write_color_at(
  monitor,
  "8",
  colors.gray,colors.white,
  center-1,4 
)
write_color_at(
  monitor,
  "9",
  colors.gray,colors.white,
  center+1,4 
)


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
