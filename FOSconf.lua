local event = require("event")
local component = require("component")
local term = require("term")
local gpu = component.gpu local text = "This is a dll document" local resolution = {} resolution["x"] = 160 resolution["y"] = 50 
function clearScreen() gpu.setBackground(0x000000) term.clear() end
function checkForClick() while true do local _,_,x,y = event.pull("touch") if((x >= resolution["x"] - 3 and x < resolution["x"])) then clearScreen() break end
if((x >= 10 and x < 20) and y == resolution["y"] - 1) then for x = resolution["x"]/3, resolution["x"]/3 * 2 do for y = resolution["y"]/3, resolution["y"]/3 * 2 do
colorTo(0x696969, x, y, " ") end end term.setCursor(resolution["x"]/2 - string.len(text)/2, resolution["y"]/2) print(text) term.setCursor(resolution["x"]/2 - string.len(text2)/2, resolution["y"]/2 + 1) print(text2) end end end
function colorToRed(x, y) gpu.setBackground(0xFF0000) gpu.set(x,y, " ") gpu.setBackground(0x000000) end
function colorTo(color, x, y, text) gpu.setBackground(color) gpu.set(x,y, text) gpu.setBackground(0x000000) end
function startupHeart() local startResolution = resolution["x"]/4 local endResolution = startResolution + resolution["x"]/2 for x = startResolution, endResolution do
if ((x > (startResolution + resolution["x"]/16 * 2.5) - 1 and x <= (startResolution + resolution["x"]/4 - resolution["x"]/16 * 0.5)) or (x > (resolution["x"]/2 + resolution["x"]/16 * 0.5) and x <= (endResolution - resolution["x"]/16 * 2.5))) then colorToRed(x, math.floor(resolution["y"]/3)) end
if ((x > (startResolution + resolution["x"]/16 * 2.25) and x <= (startResolution + resolution["x"]/4 - resolution["x"]/16 * 0.25)) or (x > (resolution["x"]/2 + resolution["x"]/16 * 0.25) and x <= (endResolution - resolution["x"]/16 * 2.25))) then colorToRed(x, math.floor(resolution["y"]/3) + 1) end
if ((x > (startResolution + resolution["x"]/16 * 2) and x <= (startResolution + resolution["x"]/4)) or (x > (resolution["x"]/2) and x <= (endResolution - resolution["x"]/16 * 2) - 1)) then colorToRed(x, math.floor(resolution["y"]/3) + 2) end
if (x > (startResolution + resolution["x"]/16 * 1.75) + 1 and x <= (endResolution - resolution["x"]/16 * 1.75) - 1) then colorToRed(x, math.floor(resolution["y"]/3) + 3) colorToRed(x, math.floor(resolution["y"]/3) + 4) colorToRed(x, math.floor(resolution["y"]/3) + 5) end
if (x > (startResolution + resolution["x"]/16 * 2) and x <= (endResolution - resolution["x"]/16 * 2) - 1) then colorToRed(x, math.floor(resolution["y"]/3) + 6) colorToRed(x, math.floor(resolution["y"]/3) + 7) end
if (x > (startResolution + resolution["x"]/16 * 2.25) and x <= (endResolution - resolution["x"]/16 * 2.25)) then colorToRed(x, math.floor(resolution["y"]/3) + 8) end
if (x > (startResolution + resolution["x"]/16 * 2.5) - 1 and x <= (endResolution - resolution["x"]/16 * 2.5)) then colorToRed(x, math.floor(resolution["y"]/3) + 9) colorToRed(x, math.floor(resolution["y"]/3) + 10) end
if (x > (startResolution + resolution["x"]/16 * 2.75) - 1 and x <= (endResolution - resolution["x"]/16 * 2.75) + 1) then colorToRed(x, math.floor(resolution["y"]/3) + 11) end
if (x > (startResolution + resolution["x"]/16 * 3) - 2 and x <= (endResolution - resolution["x"]/16 * 3) + 1) then colorToRed(x, math.floor(resolution["y"]/3) + 12) colorToRed(x, math.floor(resolution["y"]/3) + 13) end
if (x > (startResolution + resolution["x"]/16 * 3.25) - 2 and x <= (endResolution - resolution["x"]/16 * 3.25) + 2) then colorToRed(x, math.floor(resolution["y"]/3) + 14) end
if (x > (startResolution + resolution["x"]/16 * 3.5) - 3 and x <= (endResolution - resolution["x"]/16 * 3.5) + 2) then colorToRed(x, math.floor(resolution["y"]/3) + 15) colorToRed(x, math.floor(resolution["y"]/3) + 16) end
if (x > (startResolution + resolution["x"]/16 * 3.75) - 2 and x <= (endResolution - resolution["x"]/16 * 3.75) + 2) then colorToRed(x, math.floor(resolution["y"]/3) + 17) colorToRed(x, math.floor(resolution["y"]/3) + 18) end
os.sleep(0.1) end end
function closeButton() for x = resolution["x"] - 3, resolution["x"] do for y = 1, 3 do colorTo(0x696969, x, y, " ") if(x == resolution["x"] - 2 and y == 2) then colorTo(0x696969, x, y, "♥") gpu.setBackground(0x000000) end end end end 
function taskBar() for x = 0, resolution["x"] do colorTo(0x696969, x, resolution["y"], " ") end end
function startup() clearScreen() startupHeart() clearScreen() closeButton() taskBar() term.setCursor(11, resolution["y"]) print("A File.dll") term.setCursor(1, 1) end
function desktop() clearScreen() closeButton() taskBar() term.setCursor(11, resolution["y"]) print("document.dll") term.setCursor(1, 1) end
startup()
checkForClick()
