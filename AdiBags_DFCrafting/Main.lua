--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lucas Vienna (Avyiel) <dev@lucasvienna.dev>
	Copyright (c) 2021 Lars Norberg

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
local addonName, addon = ...
local L = addon.L
local DB = addon.db

-- Lua API
-----------------------------------------------------------
local pairs = pairs
local ipairs = ipairs

-- Callbacks
-----------------------------------------------------------
local function enableIds(dict, id_list)
	--@debug@
	assert(id_list["items"], "Items list not found ")
	assert(id_list["category"], "Category name not found")
	--@end-debug@
	for _, v in ipairs(id_list.items) do
		dict[v] = {}
		dict[v]["category"] = L[id_list.category]
		if L[id_list.section] then
			dict[v]["section"] = L[id_list.section]
		end
	end
end

-- Private Addon APIs and Tables
-----------------------------------------------------------
local Cache

-- AdiBags namespace
-----------------------------------------------------------
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

-- Filter Registration
-----------------------------------------------------------
local filter = AdiBags:RegisterFilter("Dragonflight Crafting", 91, "ABEvent-1.0")
filter.uiName = L["Dragonflight Crafting"]
filter.uiDesc = L["Put Dragonflight Crafting items and Reagents into their own categories."]

function filter:OnInitialize()
	-- Register the settings namespace
	self.db = AdiBags.db:RegisterNamespace(self.filterName, {
		profile = {
			-- Add your settings here
			move_alchemy = true,
			move_cloth = true,
			move_cooking = true,
			split_tuskarr_feast = false,
			split_ingredients = false,
			split_meat = false,
			split_fish = false,
			split_reagents = false,
			move_enchanting = true,
			move_herbs = true,
			move_inscription = true,
			move_jewelcrafting = true,
			move_leather = true,
			move_ore_stone = true,
			move_parts = true,
			move_reagents = true,
			move_crafting = true,
		},
	})
	-- Pre-populate our cache now that we have the settings loaded
	Cache = self:BuildCache()
end

function filter:Update()
	-- Rebuild the cache with updated settings
	Cache = self:BuildCache()
	-- Notify myself that the filtering options have changed
	self:SendMessage("AdiBags_FiltersChanged")
end

function filter:OnEnable()
	AdiBags:UpdateFilters()
end

function filter:OnDisable()
	AdiBags:UpdateFilters()
end

-- Main Filter
-----------------------------------------------------------
function filter:Filter(slotData)
	local itemId = slotData.itemId

	if (itemId and Cache[itemId]) then
		if (Cache[itemId]["section"]) then
			return Cache[itemId]["section"], Cache[itemId]["category"]
		end
		return Cache[itemId]["category"], L["Dragonflight Crafting"]
	end
end

function filter:BuildCache()
	local ids = {}

	if self.db.profile.move_alchemy then
		enableIds(ids, DB.alchemy)
	end
	if self.db.profile.move_cloth then
		enableIds(ids, DB.cloth)
	end
	if self.db.profile.move_cooking then
		-- iterate all cooking splits
		for key, value in pairs(DB.cooking) do
			-- skip the text only values
			if (type(value) == 'table') then
				if (self.db.profile["split_" .. key] == true) then
					enableIds(ids, value)
				else
					-- override the section, only pass the cooking category
					local section = value.section
					value.section = nil
					enableIds(ids, value)
					-- if we don't restore this value, subsequent activations will
					-- return the nil
					value.section = section
				end
			end
		end
	end
	if self.db.profile.move_enchanting then
		enableIds(ids, DB.enchanting)
	end
	if self.db.profile.move_herbs then
		enableIds(ids, DB.herbs)
	end
	if self.db.profile.move_inscription then
		enableIds(ids, DB.inscription)
	end
	if self.db.profile.move_jewelcrafting then
		enableIds(ids, DB.jewelcrafting)
	end
	if self.db.profile.move_leather then
		enableIds(ids, DB.leather)
	end
	if self.db.profile.move_ore_stone then
		enableIds(ids, DB.ore_stone)
	end
	if self.db.profile.move_parts then
		enableIds(ids, DB.parts)
	end
	if self.db.profile.move_reagents then
		enableIds(ids, DB.reagents)
	end
	if self.db.profile.move_crafting then
		enableIds(ids, DB.crafting)
	end

	addon.CacheIds = ids
	return ids
end

-- Filter Options Panel
-----------------------------------------------------------
function filter:GetOptions()
	return {
		-- Setup for the options panel
		craft = {
			name = L["Crafting"],
			type = "header",
			order = 5,
		},
		move_alchemy = {
			name = L[DB.alchemy.name],
			desc = L[DB.alchemy.desc],
			type = "toggle",
			order = 10,
		},
		move_enchanting = {
			name = L[DB.enchanting.name],
			desc = L[DB.enchanting.desc],
			type = "toggle",
			order = 11,
		},
		move_inscription = {
			name = L[DB.inscription.name],
			desc = L[DB.inscription.desc],
			type = "toggle",
			order = 12,
		},
		move_jewelcrafting = {
			name = L[DB.jewelcrafting.name],
			desc = L[DB.jewelcrafting.desc],
			type = "toggle",
			order = 13,
		},
		move_parts = {
			name = L[DB.parts.name],
			desc = L[DB.parts.desc],
			type = "toggle",
			order = 14,
		},
		move_crafting = {
			name = L[DB.crafting.name],
			desc = L[DB.crafting.desc],
			type = "toggle",
			order = 15,
		},
		move_reagents = {
			name = L[DB.reagents.name],
			desc = L[DB.reagents.desc],
			type = "toggle",
			order = 16,
		},
		move_cooking = {
			name = L[DB.cooking.name],
			desc = L[DB.cooking.desc],
			type = "toggle",
			width = "double",
			order = 17,
		},
		cooking_splits = {
			name = L["Split Cooking"],
			desc = "", -- doesn't seem to get used anyway
			type = "group",
			inline = true,
			order = 18,
			disabled = function() return not self.db.profile.move_cooking end,
			args = {
				split_tuskarr_feast = {
					name = L[DB.cooking.tuskarr_feast.name],
					desc = L[DB.cooking.tuskarr_feast.desc],
					type = "toggle",
					order = 10,
				},
				split_ingredients = {
					name = L[DB.cooking.ingredients.name],
					desc = L[DB.cooking.ingredients.desc],
					type = "toggle",
					order = 20,
				},
				split_meat = {
					name = L[DB.cooking.meat.name],
					desc = L[DB.cooking.meat.desc],
					type = "toggle",
					order = 30,
				},
				split_fish = {
					name = L[DB.cooking.fish.name],
					desc = L[DB.cooking.fish.desc],
					type = "toggle",
					order = 40,
				},
				split_reagents = {
					name = L[DB.cooking.reagents.name],
					desc = L[DB.cooking.reagents.desc],
					type = "toggle",
					order = 50,
				},
			}
		},

		gather = {
			name = L["Gathering"],
			type = "header",
			order = 20,
		},
		move_herbs = {
			name = L[DB.herbs.name],
			desc = L[DB.herbs.desc],
			type = "toggle",
			order = 21,
		},
		move_leather = {
			name = L[DB.leather.name],
			desc = L[DB.leather.desc],
			type = "toggle",
			order = 22,
		},
		move_ore_stone = {
			name = L[DB.ore_stone.name],
			desc = L[DB.ore_stone.desc],
			type = "toggle",
			order = 23,
		},
		move_cloth = {
			name = L[DB.cloth.name],
			desc = L[DB.cloth.desc],
			type = "toggle",
			order = 24,
		},
	}, AdiBags:GetOptionHandler(self, true, function() return self:Update() end)
end
