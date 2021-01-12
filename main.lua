-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local tapCount = 0

local background = display.newImageRect("background.png",360,720)
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText(tapCount,display.contentCenterX,20,native.systemFont,40)
tapText:setFillColor(0,0,0)

local platform = display.newImageRect("platform.png",360,50)
platform.anchorX = 0
platform.anchorY = 1
platform.x, platform.y = display.screenOriginX, display.actualContentHeight + display.screenOriginY

local balloon = display.newImageRect("balloon.png",112,112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8 -- opacity

local physics = require("physics")
physics.start()
physics.addBody(platform,"static")
physics.addBody(balloon,"dynamic",{radius=50,bounce=0.3})

local function pushBalloon()
    balloon:applyLinearImpulse(0,-0.75,balloon.x,balloon.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
end

local function balloonLand()
    tapCount = 0
    tapText.text = tapCount
end

balloon:addEventListener("tap", pushBalloon)
platform:addEventListener("tap", balloonLand)