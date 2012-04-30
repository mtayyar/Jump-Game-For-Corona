--[[

Name : Mohammed K. Tayyar
Date: 24 - Apr - 2012
Subject: Jumping without physics engine

]]--

pushDown = 1;
isJumping = false;
-- adding game graphics -----------------------------------------
local bkg = display.newImage( "night_sky.png" )
bkg.x = 160; bkg.y = 240;

local ground = display.newImage("ground.png") -- physical ground object
ground.x = 160; ground.y = 420;
		--print("Ground: "..ground.contentBounds.yMin .. " -- " .. ground.contentBounds.yMax )

p1 = display.newImage("crate.png");
		p1.x = 100; p1.y = 100;
		--print("player: "..p1.contentBounds.yMin .. " -- " .. p1.contentBounds.yMax )
		
		
-- end of adding game graphics ----------------------------------

-- and the Game functions -----------------------------------------

--this function will puch the object down
function getDown(obj)
	pushDown = pushDown + 1;
	obj.y = obj.y + pushDown;  
end

-- this function will puch the object up
function goUp(obj)
	obj.y = obj.y - 1;
	pushDown = 0;
end

-- this function will keep the object on the stage
function keepOnStage(obj1,obj2)
	isJumping = false;
	obj1.y= 380;
	pushDown = 0; -- now this will stop pulling the object down
	
end

-- from Collision detection without physics. by Rob Miracle  site: http://omnigeek.robmiracle.com/2011/12/14/collision-detection-without-physics/ 
-- this function for detecting collession between two objects from all borders
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
 
 
 -- this is a function where we make the object jump
 function startJumping(obj1) 
		
			if (isJumping == false and pushDown == 0) then
				isJumping = true;
				pushDown = pushDown -15;
				
			end
			
end
 
 
 -- this is the main game loop where we put all the game logic in it
 function mainGameLoop()
	-- get the object down when it is in the air
	if (pushDown ~= 0) then
	--print(pushDown);
		getDown(p1);
	end
	-- keep the objec on the ground
	if (hasCollided(p1,ground)) then -- if the player hits the ground
		--print(pushDown .." ".. p1.y);
		keepOnStage(p1,ground);
		goUp(p1);
		
	end
	-- after the object reach the max in air bring it  down
	if(isJumping ) then
		if(pushDown == 0) then
			pushDown = 1;
		end
	end
	
	-- test animation and falling
	ground.x = ground.x -1
	
end 
 
 
Runtime:addEventListener("enterFrame", mainGameLoop)
Runtime:addEventListener("touch", startJumping) 
