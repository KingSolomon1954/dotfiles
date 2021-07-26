--[[
getting started:  http://www.hammerspoon.org/go/#ipcurl
api:              http://www.hammerspoon.org/docs/index.html
lua scripting:    https://learnxinyminutes.com/docs/lua/
samples:          https://github.com/Hammerspoon/hammerspoon/wiki/Sample-Configurations
--]]

-------------------------
-- Four Windows placement
-------------------------

function fourTerminalsHome(doSizing)
  if homeOrOffice == "home" then
      -- the right edge of the right most window here
      local rightEdge = 1680 + 1920 + 1920
  else
      local rightEdge = 1680 + 1920 + 1920
  end

  local upperLeft = hs.window.get("1 Upper Left")
  -- print(upperLeft.id)
  -- print(upperLeft:size())
  -- print(upperLeft:topLeft())
  -- size    hs.geometry.size(590.0,545.0)
  -- topLeft hs.geometry.point(4359.0,0.0)
  upperLeft:setTopLeft(4359.0,0.0)
  if doSizing then
      upperLeft:setSize(711.0,537.0)
  end

  local lowerLeft = hs.window.get("2 Lower Left")
  -- print(lowerLeft.id)
  -- print(lowerLeft:size())
  -- print(lowerLeft:topLeft())
  -- size    hs.geometry.size(590.0,534.0)
  -- topLeft hs.geometry.point(4359.0,546.0)
  lowerLeft:setTopLeft(4359.0,546.0)
  if doSizing then
      lowerLeft:setSize(711.0,537.0)
  end
  
  local upperRight = hs.window.get("3 Upper Right")
  -- print(upperRight.id)
  -- print(upperRight:size())
  -- print(upperRight:topLeft())
  -- size    hs.geometry.size(570.0,545.0)
  -- topLeft hs.geometry.point(4950.0,0.0)
  upperRight:setTopLeft(4950.0,0.0)
  if doSizing then
      upperRight:setSize(711.0,537.0)
  end

  local lowerRight = hs.window.get("4 Lower Right")
  -- print(lowerRight.id)
  -- print(lowerRight:size())
  -- print(lowerRight:topLeft())
   -- size    hs.geometry.size(570.0,534.0)
  -- topLeft hs.geometry.point(4950.0,546.0)
  lowerRight:setTopLeft(4950.0,546.0)
  if doSizing then
      lowerRight:setSize(711.0,537.0)
  end

end

------------------------

function fourTerminalsHandler(eventName, params)
    if params.doSizing == "true" then
        print("sizing is true")
        fourTerminalsHome(true)
    else
        fourTerminalsHome(false)
        print("sizing is false")
    end
end

------------------------

hs.urlevent.bind("fourTerminals", fourTerminalsHandler)

------------------------
-- Keep Awake
------------------------

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

--------------------------------
-- Jump to named terminal window
--------------------------------

function focusUpperLeftTerm()
    hs.window.get("1 Upper Left"):focus()
end

function focusLowerLeftTerm()
    hs.window.get("2 Lower Left"):focus()
end

function focusUpperRightTerm()
    hs.window.get("3 Upper Right"):focus()
end

function focusLowerRightTerm()
    hs.window.get("4 Lower Right"):focus()
end

hs.hotkey.bind({"ctrl","shift"}, "1", focusUpperLeftTerm)
hs.hotkey.bind({"ctrl","shift"}, "2", focusLowerLeftTerm)
hs.hotkey.bind({"ctrl","shift"}, "3", focusUpperRightTerm)
hs.hotkey.bind({"ctrl","shift"}, "4", focusLowerRightTerm)

------------------------
