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

--[[{
    name = "string",
    desc = "string",
    category = "string",
    items = { 12345, 12346 }
}]]


-- Database
-----------------------------------------------------------
addon.db = {
    alchemy = {
        name = "Move Alchemy",
        desc = "Move alchemical trade goods into their own category",
        category = "Alchemy",
        items = {
            191476, -- Draconic Vial
            191474, -- Draconic Vial
            191475, -- Draconic Vial
        },
    },

    cloth = {
        name = "Move Cloth",
        desc = "Move cloth and fabric trade goods into their own category",
        category = "Cloth",
        items = {
            193938, -- Azureweave Bolt
            193939, -- Azureweave Bolt
            193940, -- Azureweave Bolt
            193932, -- Bloody Wildercloth Bolt
            193934, -- Bloody Wildercloth Bolt
            193933, -- Bloody Wildercloth Bolt
            193936, -- Chronocloth Bolt
            193935, -- Chronocloth Bolt
            193937, -- Chronocloth Bolt
            193923, -- Decayed Wildercloth
            193053, -- Duck Feather
            193924, -- Frostbitten Wildercloth
            193925, -- Singed Wildercloth
            192096, -- Spool of Wilderthread
            192095, -- Spool of Wilderthread
            192097, -- Spool of Wilderthread
            193050, -- Tattered Wildercloth
            193929, -- Vibrant Wildercloth Bolt
            193930, -- Vibrant Wildercloth Bolt
            193931, -- Vibrant Wildercloth Bolt
            193922, -- Wildercloth
            193926, -- Wildercloth Bolt
            193928, -- Wildercloth Bolt
            193927, -- Wildercloth Bolt
        },
    },

    cooking = {
        name = "Move Cooking",
        desc = "Move cooking trade goods into their own category",
        category = "Cooking",

        tuskarr_feast = {
            name = "Move Tuskarr Feast",
            desc = "Move Tuskarr feast reagents into their own category",
            category = "Tuskarr Feast",
            items = {
                199105, -- Ancheevy
                199212, -- Clubfish
                199833, -- Dragonhead Eel
                199101, -- Dried Wyldermane Kelp
                199208, -- Grungle
                199102, -- Hunk o' Blubber
                199207, -- Iceback Sculpin
                199213, -- Lakkamuk Blenny
                199205, -- Manasucker
                199103, -- Nappa's Famous Tea
                199100, -- Peppersmelt
                199104, -- Piping-Hot Orca Milk
                199834, -- Pulpy Seagrass
                199063, -- Salted Fish Scraps
                199832, -- Smoked Seaviper
                199106, -- Tiny Leviathan Bone
                199835, -- Torga's Braid
            },
        },

        ingredients = {
            name = "Move Ingredients",
            desc = "Move cooking ingredients into their own category",
            category = "Ingredients",
            items = {
                197757, -- Assorted Exotic Spices
                197752, -- Conveniently Packaged Ingredients
                197749, -- Ohn'ahran Potato
                197751, -- Pastry Packets
                197756, -- Pebbled Rock Salts
                197753, -- Thaldraszian Cocoa Powder
                197750, -- Three-Cheese Blend
            },
        },

        meat = {
            name = "Move Meat",
            desc = "Move meat trade goods into their own category",
            category = "Meat",
            items = {
                197745, -- Basilisk Eggs
                197746, -- Bruffalon Flank
                197748, -- Burly Bear Meat
                197743, -- Duck Meat
                197744, -- Hornswog Hunk
                197741, -- Maybe Meat
                197747, -- Mighty Mammoth Ribs
                197742, -- Ribbed Mollusk Meat
                -- Technically meat?
                198395, -- Dull Spined Clam
            },
        },

        fish = {
            name = "Move Fish",
            desc = "Move fish trade goods into their own category",
            category = "Fish",
            items = {
                194967, -- Aileron Seamoth
                194968, -- Cerulean Spinefish
                194730, -- Scalebelly Mackerel
                194969, -- Temporal Dragonhead
                194966, -- Thousandbite Piranha
                194970, -- Islefin Dorado
                200074, -- Frosted Rimefin Tuna
                199344, -- Magma Thresher
                200061, -- Prismatic Leaper
                199345, -- Rimefin Tuna
                199346, -- Rotten Rimefin Tuna
            },
        },

        reagents = {
            name = "Move Reagents",
            desc = "Move cooking reagents into their own category",
            category = "Cooking Reagents",
            items = {
                -- Mining
                197754, -- Salt Deposit
                -- Herbalism
                197755, -- Lava Beetle
            },
        },
    },

    enchanting = {
        name = "Move Enchanting",
        desc = "Move enchanting trade goods into their own category",
        category = "Enchanting",
        items = {
            200113, -- Resonant Crystal
            194124, -- Vibrant Shard
            194123, -- Chromatic Dust
            201584, -- Tyrivite Rod
            -- 193057, -- 10.0 Placeholder Enchanting Crystal
        },
    },

    herbs = {
        name = "Move Herbs",
        desc = "Move herbs into their own category",
        category = "Herbs",
        items = {
            198419, -- Blazing Pigment
            198418, -- Blazing Pigment
            198420, -- Blazing Pigment
            191468, -- Bubble Poppy
            191469, -- Bubble Poppy
            191467, -- Bubble Poppy
            198415, -- Flourishing Pigment
            198417, -- Flourishing Pigment
            198416, -- Flourishing Pigment
            191462, -- Hochenblume
            191461, -- Hochenblume
            191460, -- Hochenblume
            191464, -- Saxifrage
            191465, -- Saxifrage
            191466, -- Saxifrage
            198412, -- Serene Pigment
            198414, -- Serene Pigment
            198413, -- Serene Pigment
            198421, -- Shimmering Pigment
            198422, -- Shimmering Pigment
            198423, -- Shimmering Pigment
            191470, -- Writhebark
            191471, -- Writhebark
            191472, -- Writhebark
        },
    },

    inscription = {
        name = "Move Inscription",
        desc = "Move inscription trade goods into their own category",
        category = "Inscription",
        items = {
            194784, -- Glittering Parchment
            194846, -- Blazing Ink
            194751, -- Blazing Ink
            194752, -- Blazing Ink
            194760, -- Burnished Ink
            194855, -- Burnished Ink
            194761, -- Burnished Ink
            194850, -- Flourishing Ink
            194758, -- Flourishing Ink
            194852, -- Flourishing Ink
            194856, -- Serene Ink
            194857, -- Serene Ink
            194858, -- Serene Ink
            194755, -- Cosmic Ink
            194754, -- Cosmic Ink
            194756, -- Cosmic Ink
            194825, -- Chirping Rune
            194824, -- Chirping Rune
            194826, -- Chirping Rune
            194859, -- Chilled Rune
            194767, -- Chilled Rune
            194768, -- Chilled Rune
            194864, -- Runed Writhebark
            194862, -- Runed Writhebark
            194863, -- Runed Writhebark
        },
    },

    jewelcrafting = {
        name = "Move Jewelcrafting",
        desc = "Move jewelcrafting trade goods into their own category",
        category = "Jewelcrafting",
        items = {
            200156, -- Amethyzarite Geode
            198397, -- Rainbow Pearl
            192880, -- Crumbled Stone
            192872, -- Fractured Glass
            192833, -- Misshapen Filigree
            192852, -- Alexstraszite
            192855, -- Alexstraszite
            192853, -- Alexstraszite
            192896, -- Blotting Sand
            192895, -- Blotting Sand
            192894, -- Blotting Sand
            192889, -- Dreamer's Vision
            202049, -- Dreamer's Vision
            202055, -- Dreamer's Vision
            192891, -- Earthwarden's Prize
            202051, -- Earthwarden's Prize
            202057, -- Earthwarden's Prize
            192851, -- Eternity Amber
            192849, -- Eternity Amber
            192850, -- Eternity Amber
            193368, -- Finely Ground Gemstones
            193369, -- Finely Ground Gemstones
            193370, -- Finely Ground Gemstones
            192877, -- Frameless Lens
            192878, -- Frameless Lens
            192876, -- Frameless Lens
            192869, -- Illimited Diamond
            192871, -- Illimited Diamond
            192870, -- Illimited Diamond
            192893, -- Jeweled Dragon's Heart
            202053, -- Jeweled Dragon's Heart
            202059, -- Jeweled Dragon's Heart
            192890, -- Keeper's Glory
            202056, -- Keeper's Glory
            202050, -- Keeper's Glory
            192856, -- Malygite
            192857, -- Malygite
            192858, -- Malygite
            192840, -- Mystic Sapphire
            192841, -- Mystic Sapphire
            192842, -- Mystic Sapphire
            192863, -- Neltharite
            192865, -- Neltharite
            192862, -- Neltharite
            192867, -- Nozdorite
            192866, -- Nozdorite
            192868, -- Nozdorite
            192885, -- Polished Stone
            192883, -- Polished Stone
            192884, -- Polished Stone
            192897, -- Pounce
            192899, -- Pounce
            192898, -- Pounce
            193030, -- Projection Prism
            193031, -- Projection Prism
            193029, -- Projection Prism
            202048, -- Queen's Gift
            192888, -- Queen's Gift
            202054, -- Queen's Gift
            192838, -- Queen's Ruby
            192839, -- Queen's Ruby
            192837, -- Queen's Ruby
            192835, -- Shimmering Clasp
            192834, -- Shimmering Clasp
            192836, -- Shimmering Clasp
            192847, -- Sundered Onyx
            192848, -- Sundered Onyx
            192846, -- Sundered Onyx
            192892, -- Timewatcher's Patience
            202052, -- Timewatcher's Patience
            202058, -- Timewatcher's Patience
            192845, -- Vibrant Emerald
            192843, -- Vibrant Emerald
            192844, -- Vibrant Emerald
            192860, -- Ysemerald
            192859, -- Ysemerald
            192861, -- Ysemerald
        },
    },

    leather = {
        name = "Move Leather",
        desc = "Move leather, bone, and scale trade goods into their own category",
        category = "Leather",
        items = {
            193261, -- Bite-Sized Morsel
            193262, -- Exceptional Morsel
            193253, -- Cacophonous Thunderscale
            193255, -- Pristine Vorquin Horn
            193252, -- Salamanther Scales
            193258, -- Fire-Infused Hide
            193256, -- Windsong Plumage
            193251, -- Crystalspine Fur
            193259, -- Flawless Proto Dragon Scale
            193213, -- Adamant Scales
            193214, -- Adamant Scales
            193215, -- Adamant Scales
            193237, -- Bloodsoaked Hide
            193236, -- Bloodsoaked Hide
            193238, -- Bloodsoaked Hide
            193249, -- Bloodwaxed Scales
            193248, -- Bloodwaxed Scales
            193250, -- Bloodwaxed Scales
            193232, -- Deathchill Hide
            193233, -- Deathchill Hide
            193234, -- Deathchill Hide
            193216, -- Dense Hide
            193217, -- Dense Hide
            193218, -- Dense Hide
            193239, -- Drygrate Scales
            193240, -- Drygrate Scales
            193241, -- Drygrate Scales
            193242, -- Earthshine Scales
            193243, -- Earthshine Scales
            193244, -- Earthshine Scales
            193245, -- Frostbite Scales
            193247, -- Frostbite Scales
            193246, -- Frostbite Scales
            193222, -- Lustrous Scales
            193224, -- Lustrous Scales
            193223, -- Lustrous Scales
            193229, -- Mireslush Hide
            193231, -- Mireslush Hide
            193230, -- Mireslush Hide
            193208, -- Resilient Leather
            193211, -- Resilient Leather
            193210, -- Resilient Leather
            193254, -- Rockfang Leather
            193228, -- Stonecrust Hide
            193226, -- Stonecrust Hide
            193227, -- Stonecrust Hide
            197735, -- Finished Prototype Explorer's Barding
            197736, -- Finished Prototype Regal Barding
        },
    },

    -- Mining
    ore_stone = {
        name = "Move Mining",
        desc = "Move mining, ore, and stone trade goods into their own category",
        category = "Mining",
        items = {
            190452, -- Primal Flux
            190535, -- Black Dragon Seared Alloy
            190533, -- Black Dragon Seared Alloy
            190534, -- Black Dragon Seared Alloy
            190537, -- Bloody Alloy
            190536, -- Bloody Alloy
            190538, -- Bloody Alloy
            188658, -- Draconium Ore
            190311, -- Draconium Ore
            189143, -- Draconium Ore
            190531, -- Frostfire Alloy
            190530, -- Frostfire Alloy
            190532, -- Frostfire Alloy
            190313, -- Khaz'gorite Ore
            190312, -- Khaz'gorite Ore
            190314, -- Khaz'gorite Ore
            189542, -- Primal Molten Alloy
            189541, -- Primal Molten Alloy
            189543, -- Primal Molten Alloy
            190395, -- Tyrivite Ore
            190394, -- Tyrivite Ore
            190396, -- Tyrivite Ore

            -- Jewelcrafting Prospect
            194545, -- Prismatic Ore
        },
    },

    -- Engineering
    parts = {
        name = "Move Engineering",
        desc = "Move engineering parts into their own category",
        category = "Engineering",
        items = {
            198195, -- Arclight Capacitor
            198197, -- Arclight Capacitor
            198196, -- Arclight Capacitor
            198201, -- Assorted Safety Fuses
            198202, -- Assorted Safety Fuses
            198203, -- Assorted Safety Fuses
            198190, -- Everburning Blasting Powder
            198189, -- Everburning Blasting Powder
            198191, -- Everburning Blasting Powder
            198194, -- Greased-Up Gears
            198192, -- Greased-Up Gears
            198193, -- Greased-Up Gears
            198184, -- Handful of Tyrivite Bolts
            198183, -- Handful of Tyrivite Bolts
            198185, -- Handful of Tyrivite Bolts
            198200, -- Reinforced Machine Chassis
            198198, -- Reinforced Machine Chassis
            198199, -- Reinforced Machine Chassis
            198188, -- Shock-Spring Coil
            198186, -- Shock-Spring Coil
            198187, -- Shock-Spring Coil
            -- Vendor reagent
            201832, -- Smudged Lens
        },
    },

    darkmoon_cards = {
        name = "Move Darkmoon Cards",
        desc = "Move Darkmoon Cards into their own category",
        category = "Darkmoon Cards",
        items = {
            198614, -- Soggy Clump of Darkmoon Cards
            194827, -- Bundle O' Cards: Dragon Isles
            194801, -- Ace of Air
            194809, -- Ace of Earth
            194785, -- Ace of Fire
            194793, -- Ace of Frost
            194808, -- Eight of Air
            194816, -- Eight of Earth
            194792, -- Eight of Fire
            194800, -- Eight of Frost
            194805, -- Five of Air
            194813, -- Five of Earth
            194789, -- Five of Fire
            194797, -- Five of Frost
            194804, -- Four of Air
            194812, -- Four of Earth
            194788, -- Four of Fire
            194796, -- Four of Frost
            194807, -- Seven of Air
            194815, -- Seven of Earth
            194799, -- Seven of Fire
            194791, -- Seven of Frost
            194806, -- Six of Air
            194814, -- Six of Earth
            194790, -- Six of Fire
            194798, -- Six of Frost
            194803, -- Three of Air
            194811, -- Three of Earth
            194787, -- Three of Fire
            194795, -- Three of Frost
            194802, -- Two of Air
            194810, -- Two of Earth
            194786, -- Two of Fire
            194794, -- Two of Frost
        },
    },

    -- Random shit I don't know where else to put
    reagents = {
        name = "Move Reagents",
        desc = "Move assorted reagents into their own category",
        category = "Reagents",
        items = {
            -- Common
            201400, -- Aquatic Maw
            200860, -- Draconic Stopper
            201406, -- Glowing Titan Orb
            201401, -- Large Plumed Feather
            201402, -- Large Sturdy Femur
            201403, -- Mastadon Tusk
            201399, -- Primal Bear Spine
            201404, -- Primal Tallstrider Sinew
            201405, -- Tuft of Primal Wool
            -- Uncommon
            191497, -- Omnium Draconis
            191498, -- Omnium Draconis
            191496, -- Omnium Draconis
            191495, -- Primal Convergent
            191494, -- Primal Convergent
            191493, -- Primal Convergent
        },
    },

    -- Fancy crafting crap
    crafting = {
        name = "Move Meta Crafting",
        desc = "Move crafting meta materials into their own category",
        category = "Meta Crafting",
        items = {
            190456, -- Artisan's Mettle
            190454, -- Primal Chaos
            200686, -- Primal Focus
            190455, -- Concentrated Primal Focus
            190453, -- Spark of Ingenuity
        },
    },

    treasure_sack = {
        name = "Move Treasure Sacks",
        desc = "Move Treasure Sacks into their own category",
        category = "Treasure Sacks",
        items = {
            199341, -- Regurgitated Sack of Swog Treasures
            202104, -- Weighted Sac of Swog Treasures
            199342, -- Weighted Sack of Swog Treasures
            202103, -- Immaculate Sac of Swog Treasures
            202102, -- Immaculate Sac of Swog Treasures
            199343, -- Immaculate Sack of Swog Treasures
        },
    },

    fortune_card = {
        name = "Move Fortune Cards",
        desc = "Move Fortune Cards into their own category",
        category = "Fortune Cards",
        items = {
            199137, -- Fated Fortune Card
            199156, -- Fated Fortune Card
            199166, -- Fated Fortune Card
            199116, -- Fated Fortune Card
            199124, -- Fated Fortune Card
            199127, -- Fated Fortune Card
            199129, -- Fated Fortune Card
            199141, -- Fated Fortune Card
            199155, -- Fated Fortune Card
            199158, -- Fated Fortune Card
            199165, -- Fated Fortune Card
            199121, -- Fated Fortune Card
            199135, -- Fated Fortune Card
            199146, -- Fated Fortune Card
            199151, -- Fated Fortune Card
            199167, -- Fated Fortune Card
            199114, -- Fated Fortune Card
            199117, -- Fated Fortune Card
            199118, -- Fated Fortune Card
            199119, -- Fated Fortune Card
            199120, -- Fated Fortune Card
            199123, -- Fated Fortune Card
            199125, -- Fated Fortune Card
            199126, -- Fated Fortune Card
            199133, -- Fated Fortune Card
            199134, -- Fated Fortune Card
            199136, -- Fated Fortune Card
            199138, -- Fated Fortune Card
            199139, -- Fated Fortune Card
            199140, -- Fated Fortune Card
            199142, -- Fated Fortune Card
            199143, -- Fated Fortune Card
            199144, -- Fated Fortune Card
            199145, -- Fated Fortune Card
            199147, -- Fated Fortune Card
            199148, -- Fated Fortune Card
            199149, -- Fated Fortune Card
            199150, -- Fated Fortune Card
            199152, -- Fated Fortune Card
            199153, -- Fated Fortune Card
            199154, -- Fated Fortune Card
            199157, -- Fated Fortune Card
            199161, -- Fated Fortune Card
            199162, -- Fated Fortune Card
            199163, -- Fated Fortune Card
            199164, -- Fated Fortune Card
            199168, -- Fated Fortune Card
            199169, -- Fated Fortune Card
            194829, -- Fated Fortune Card
            199160, -- Fated Fortune Card
            199131, -- Fated Fortune Card
            199130, -- Fated Fortune Card
            199159, -- Fated Fortune Card
            199132, -- Fated Fortune Card
            199170, -- Fated Fortune Card
        },
    },
}


--[[
haven't figures out where these belong to:

193360, -- Centaur's Trophy Necklace
191570, -- Dragon's Alchemical Solution

194843, -- Explorer's Barding Manuscript
194842, -- Regal Barding Manuscript
194838, -- Highland Drake Manuscript: Spined Crest
]]
