pushDown = 0;
-- adding game graphics -----------------------------------------
local bkg = display.newImage( "night_sky.png" )
bkg.x = 160; bkg.y = 240

local ground = display.newImage("ground.png") -- physical ground object
ground.x = 160; ground.y = 420

j1 = display.newImage("crate.png");
		j1.x = 100 
		j1.y = 100
-- end of adding game graphics ----------------------------------
--this function will puch the object down
function getDown(obj)
	pushDown = pushDown + 1;
	obj.y = obj.y + pushDown;  
end

-- this function will puch the object up
function goUp(obj)
	obj.y = obj.y - 0.1;
end

-- this function will keep the object on the stage
function keepOnStage(obj)
	pushDown = 0; -- now this will stop pulling the object down
	
end

-- this function for detecting collession between two objects
local function hasCollided(obj1, obj2) 
     if obj1 == nil then 
         return false 
     end 
     if obj2 == nil then 
         return false 
     end 
     local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin 
     local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax 
     local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin 
     local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax 
     return (left or right) and (up or down) 
 end 
 
 -- this is the main game loop where we put all the game logic in it
 function mainGameLoop()
	
end 
 
 
 Runtime:addEventListener("enterFrame", mainGameLoop)

