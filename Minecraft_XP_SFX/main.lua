-- v1.00

-- Event function level up
-- This function plays a custom sound effect when the player gains xp, the pitch will vary with the amount of xp gained.

local oldXP = UnitXP("player") -- init xp counter
local frame_a = CreateFrame("Frame")
frame_a:RegisterEvent("PLAYER_XP_UPDATE")
frame_a:SetScript("OnEvent", function(self, event, ...)
	-- local total = math.floor(0.5 + ((UnitXP("player") - oldXP) / 10)) -- testing with random value for xp threshold
	local total = math.floor(0.5 + ((UnitXP("player") - oldXP) / ((1.05) * (45 + (5 * UnitLevel("player")))))) -- xp threshold is equivalent to kiling mob 2 levels higher

	local function manyDings()
		if total > 0 then
			total = total - 1
			print("ding!")
			PlaySoundFile("Interface\\Addons\\Minecraft_XP_SFX\\sfx\\orb-" .. tostring(math.random(1, 40)) .. ".ogg")
			local timer = C_Timer.After(0.1, manyDings)
		end
	end

	if total > 0 do -- check for levelup (xp = 0)
		manyDings(total)
	end
	oldXP = UnitXP("player")
end)