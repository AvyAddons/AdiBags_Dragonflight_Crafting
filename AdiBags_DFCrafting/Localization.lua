--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lucas Vienna (Avyiel) <dev@lucasvienna.dev>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

--]]
-- Retrive addon folder name, and our local, private namespace.
local _, addon = ...

-- Lua API
-----------------------------------------------------------
local _G = _G
local pairs = pairs

-- WoW API
-----------------------------------------------------------
local GetLocale = _G.GetLocale

-- Localization system.
-----------------------------------------------------------
-- Do not modify the function,
-- just the locales in the table below!
local L = (function(tbl, defaultLocale)
	local gameLocale = GetLocale()           -- The locale currently used by the game client.
	local L = tbl[gameLocale] or
	tbl[defaultLocale]                       -- Get the localization for the current locale, or use your default.
	-- Replace the boolean 'true' with the key,
	-- to simplify locale creation and reduce space needed.
	for i in pairs(L) do
		if (L[i] == true) then
			L[i] = i
		end
	end
	-- If the game client is in another locale than your default,
	-- fill in any missing localization in the client's locale
	-- with entries from your default locale.
	if (gameLocale ~= defaultLocale) then
		for i, msg in pairs(tbl[defaultLocale]) do
			if (not L[i]) then
				-- Replace the boolean 'true' with the key,
				-- to simplify locale creation and reduce space needed.
				L[i] = (msg == true) and i or msg
			end
		end
	end
	return L
end)({
	-- ENTER YOUR LOCALIZATION HERE!
	-----------------------------------------------------------
	-- * Note that you MUST include a full table for your primary/default locale!
	-- * Entries where the value (to the right) is the boolean 'true',
	--   will use the key (to the left) as the value instead!
	["enUS"] = {
		["Dragonflight Crafting"] = true, -- uiName
		["Put Dragonflight Crafting items and Reagents into their own categories."] = true, -- uiDesc

		-- Settings sections
		["Crafting"] = true,
		["Gathering"] = true,
		["Miscellaneous"] = true,

		-- Settings toggles
		["Move Alchemy"] = true,
		["Move alchemical trade goods into their own category"] = true,
		["Move Cloth"] = true,
		["Move cloth and fabric trade goods into their own category"] = true,
		["Move Cooking"] = true,
		["Move cooking trade goods into their own category"] = true,
		["Split Cooking"] = true,
		["Move Tuskarr Feast"] = true,
		["Move Tuskarr feast reagents into their own category"] = true,
		["Move Ingredients"] = true,
		["Move cooking ingredients into their own category"] = true,
		["Move Meat"] = true,
		["Move meat trade goods into their own category"] = true,
		["Move Fish"] = true,
		["Move fish trade goods into their own category"] = true,
		["Move Reagents"] = true,
		["Move cooking reagents into their own category"] = true,
		["Move Enchanting"] = true,
		["Move enchanting trade goods into their own category"] = true,
		["Move Herbs"] = true,
		["Move herbs into their own category"] = true,
		["Move Inscription"] = true,
		["Move inscription trade goods into their own category"] = true,
		["Move Jewelcrafting"] = true,
		["Move jewelcrafting trade goods into their own category"] = true,
		["Move Leather"] = true,
		["Move leather, bone, and scale trade goods into their own category"] = true,
		["Move Mining"] = true,
		["Move mining, ore, and stone trade goods into their own category"] = true,
		["Move Engineering"] = true,
		["Move engineering parts into their own category"] = true,
		["Move assorted reagents into their own category"] = true,
		["Move Meta Materials"] = true,
		["Move crafting meta materials into their own category"] = true,

		-- Categories
		["Alchemy"] = true,
		["Cloth"] = true,
		["Cooking"] = true,
		["Dragonflight Cooking"] = true,
		["Tuskarr Feast"] = true,
		["Ingredients"] = true,
		["Meat"] = true,
		["Fish"] = true,
		["Cooking Reagents"] = true,
		["Reagents"] = true,
		["Enchanting"] = true,
		["Herbs"] = true,
		["Inscription"] = true,
		["Jewelcrafting"] = true,
		["Leather"] = true,
		["Mining"] = true,
		["Engineering"] = true,
		["Meta Materials"] = true,
	},
	["deDE"] = {},
	["esES"] = {},
	["esMX"] = {},
	["frFR"] = {},
	["itIT"] = {},
	["koKR"] = {},
	["ptPT"] = {},
	["ruRU"] = {},
	["zhCN"] = {},
	["zhTW"] = {}

	-- The primary/default locale of your addon.
	-- * You should change this code to your default locale.
	-- * Note that you MUST include a full table for your primary/default locale!
}, "enUS")

addon.L = setmetatable(L, {
	__index = function(self, key)
		if key ~= nil then
			--@debug@
			print('Missing locale', tostring(key))
			--@end-debug@
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
