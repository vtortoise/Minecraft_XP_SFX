-- v1.00

-- Event function level up
-- This function plays a custom sound effect when the player gains xp, the pitch will vary with the amount of xp gained.

local oldXP = UnitXP("player") -- init xp counter
local frame_a = CreateFrame("Frame")
frame_a:RegisterEvent("PLAYER_XP_UPDATE")
frame_a:SetScript("OnEvent", function(self, event, ...)
	local xpTable = {
		[1] = 60,     -- XP for killing a level 1 mob
		[2] = 63,     -- XP for killing a level 2 mob
		[3] = 66,     -- XP for killing a level 3 mob
		[4] = 69,     -- XP for killing a level 4 mob
		[5] = 72,     -- XP for killing a level 5 mob
		[6] = 75,     -- XP for killing a level 6 mob
		[7] = 78,     -- XP for killing a level 7 mob
		[8] = 81,     -- XP for killing a level 8 mob
		[9] = 84,     -- XP for killing a level 9 mob
		[10] = 87,    -- XP for killing a level 10 mob
		[11] = 90,    -- XP for killing a level 11 mob
		[12] = 93,    -- XP for killing a level 12 mob
		[13] = 96,    -- XP for killing a level 13 mob
		[14] = 99,    -- XP for killing a level 14 mob
		[15] = 102,   -- XP for killing a level 15 mob
		[16] = 105,   -- XP for killing a level 16 mob
		[17] = 108,   -- XP for killing a level 17 mob
		[18] = 111,   -- XP for killing a level 18 mob
		[19] = 114,   -- XP for killing a level 19 mob
		[20] = 117,   -- XP for killing a level 20 mob
		[21] = 120,   -- XP for killing a level 21 mob
		[22] = 123,   -- XP for killing a level 22 mob
		[23] = 126,   -- XP for killing a level 23 mob
		[24] = 129,   -- XP for killing a level 24 mob
		[25] = 132,   -- XP for killing a level 25 mob
		[26] = 135,   -- XP for killing a level 26 mob
		[27] = 138,   -- XP for killing a level 27 mob
		[28] = 141,   -- XP for killing a level 28 mob
		[29] = 144,   -- XP for killing a level 29 mob
		[30] = 147,   -- XP for killing a level 30 mob
		[31] = 150,   -- XP for killing a level 31 mob
		[32] = 153,   -- XP for killing a level 32 mob
		[33] = 156,   -- XP for killing a level 33 mob
		[34] = 159,   -- XP for killing a level 34 mob
		[35] = 162,   -- XP for killing a level 35 mob
		[36] = 165,   -- XP for killing a level 36 mob
		[37] = 168,   -- XP for killing a level 37 mob
		[38] = 171,   -- XP for killing a level 38 mob
		[39] = 174,   -- XP for killing a level 39 mob
		[40] = 177,   -- XP for killing a level 40 mob
		[41] = 180,   -- XP for killing a level 41 mob
		[42] = 183,   -- XP for killing a level 42 mob
		[43] = 186,   -- XP for killing a level 43 mob
		[44] = 189,   -- XP for killing a level 44 mob
		[45] = 192,   -- XP for killing a level 45 mob
		[46] = 195,   -- XP for killing a level 46 mob
		[47] = 198,   -- XP for killing a level 47 mob
		[48] = 201,   -- XP for killing a level 48 mob
		[49] = 204,   -- XP for killing a level 49 mob
		[50] = 207,   -- XP for killing a level 50 mob
		[51] = 210,   -- XP for killing a level 51 mob
		[52] = 213,   -- XP for killing a level 52 mob
		[53] = 216,   -- XP for killing a level 53 mob
		[54] = 219,   -- XP for killing a level 54 mob
		[55] = 222,   -- XP for killing a level 55 mob
		[56] = 225,   -- XP for killing a level 56 mob
		[57] = 228,   -- XP for killing a level 57 mob
		[58] = 231,   -- XP for killing a level 58 mob
		[59] = 234,   -- XP for killing a level 59 mob
		[60] = 237    -- XP for killing a level 60 mob
	}

	local function manyDings()
		if total > 0 then  -- check for levelup (xp is negative) and if finished all dings
			total = total - 1
			--print("ding!")
			PlaySoundFile("Interface\\Addons\\Minecraft_XP_SFX\\sfx\\orb-" .. tostring(math.random(1, 40)) .. ".ogg")
			local timer = C_Timer.After(0.1, manyDings)
		end
	end

	if (UnitXP("player") - oldXP > 0) then
		total = (UnitXP("player") - oldXP) / xpTable[UnitLevel("player")]
		manyDings(total)
	end

	oldXP = UnitXP("player")
end)
