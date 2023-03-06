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
		if id_list.section then
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
	-- Fetch our category option names dynamically
	local profile = {}
	for key, value in pairs(DB) do
		profile[key] = true
		-- handle categories with sections
		if not value.items then
			for k, v in pairs(value) do
				-- skip the text only values
				if (type(v) == 'table') then profile[k] = false end
			end
		end
	end
	-- Register the settings namespace
	self.db = AdiBags.db:RegisterNamespace(self.filterName, { profile = profile })
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

	for key, value in pairs(DB) do
		if (self.db.profile[key] and value.items) then
			-- Register the regular depth-1 categories
			enableIds(ids, value)
		elseif (self.db.profile[key] and not value.tems) then
			-- Handle categories with sections instead of a single, top-level
			-- `items` table.
			for k, v in pairs(value) do
				-- Skip the text only values, we only want the child tables
				if (type(v) == 'table') then
					if (self.db.profile[k] == true) then
						enableIds(ids, v)
					else
						-- override the section, only pass the cooking category
						local section = v.section
						v.section = nil
						enableIds(ids, v)
						-- if we don't restore this value, subsequent activations will
						-- return the nil
						v.section = section
					end
				end
			end
		end
	end

	return ids
end

-- Filter Options Panel
-----------------------------------------------------------
function filter:GetOptions()
	local options = {
		-- Setup for the options panel headers
		craft = {
			name = L["Crafting"],
			type = "header",
			order = 5,
		},
		gather = {
			name = L["Gathering"],
			type = "header",
			order = 20,
		},
	}

	for key, value in pairs(DB) do
		options[key] = {
			name = L[value.name],
			desc = L[value.desc],
			type = "toggle",
			order = value.order,
		}
		-- Handle categories with sections
		if not value.items then
			local args = {}
			for k, v in pairs(value) do
				-- Skip the text only values, we only want the child tables
				if (type(v) == 'table') then
					args[k] = {
						name = L[v.name],
						desc = L[v.desc],
						type = "toggle",
						order = v.order,
					}
				end
			end
			options[key .. "_splits"] = {
				name = L["Split " .. value.category],
				desc = "", -- doesn't seem to get used anyway
				type = "group",
				inline = true,
				order = 18,
				disabled = function() return not self.db.profile[key] end,
				args = args
			}
		end
	end

	return options, AdiBags:GetOptionHandler(self, true, function() return self:Update() end)
end
