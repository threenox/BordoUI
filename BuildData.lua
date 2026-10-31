-- BordoUI: Meta Build Database & Advisor Data
-- Azeroth Survivors meta builds for all 9 classes with authentic WoW 1.12 spell/item assets.
BordoUI = BordoUI or {};
BordoUI_BuildData = {};

local CLASSES = {
    HUNTER  = { name = "Hunter",  color = { 0.67, 0.83, 0.45 }, hex = "aad372" },
    PALADIN = { name = "Paladin", color = { 0.96, 0.55, 0.73 }, hex = "f58cba" },
    WARRIOR = { name = "Warrior", color = { 0.78, 0.61, 0.43 }, hex = "c79c6e" },
    MAGE    = { name = "Mage",    color = { 0.41, 0.80, 0.94 }, hex = "69ccf0" },
    WARLOCK = { name = "Warlock", color = { 0.58, 0.51, 0.79 }, hex = "9482c9" },
    ROGUE   = { name = "Rogue",   color = { 1.00, 0.96, 0.41 }, hex = "fff569" },
    SHAMAN  = { name = "Shaman",  color = { 0.00, 0.44, 0.87 }, hex = "0070de" },
    PRIEST  = { name = "Priest",  color = { 1.00, 1.00, 1.00 }, hex = "ffffff" },
    DRUID   = { name = "Druid",   color = { 1.00, 0.49, 0.04 }, hex = "ff7d0a" },
};

BordoUI_BuildData.Classes = CLASSES;
BordoUI_BuildData.ClassOrder = {
    "HUNTER", "PALADIN", "WARRIOR", "MAGE", "WARLOCK", "ROGUE", "SHAMAN", "PRIEST", "DRUID"
};

-- Base Class Starting Spells (Each class starts with 1 universal core ability on Action Bar Slot 1)
-- Secondary starting abilities (Action Bar Slot 2) are granted dynamically by talents and automatically detected live!
BordoUI_BuildData.StarterSpells = {
    WARRIOR = {
        name = "Cleave", key = "cleave", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_Cleave", desc = "Class starter ability. Sweeping strike that cuts through multiple foes.",
        [1] = { name = "Cleave", key = "cleave", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_Cleave", desc = "Class starter ability. Sweeping strike that cuts through multiple foes.", slot = 1 },
    },
    PRIEST = {
        name = "Smite", key = "smite", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_HolySmite", desc = "Class starter ability. Direct holy beam dealing focused damage.",
        [1] = { name = "Smite", key = "smite", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_HolySmite", desc = "Class starter ability. Direct holy beam dealing focused damage.", slot = 1 },
    },
    PALADIN = {
        name = "Judgement", key = "judgement", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_RighteousFury", desc = "Class starter ability. Frequent targeted holy burst.",
        [1] = { name = "Judgement", key = "judgement", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_RighteousFury", desc = "Class starter ability. Frequent targeted holy burst.", slot = 1 },
    },
    MAGE = {
        name = "Fireball", key = "fireball", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_FlameBolt", desc = "Class starter ability. Incendiary projectile dealing direct and fire damage.",
        [1] = { name = "Fireball", key = "fireball", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_FlameBolt", desc = "Class starter ability. Incendiary projectile dealing direct and fire damage.", slot = 1 },
    },
    HUNTER = {
        name = "Auto Shot", key = "auto_shot", school = "Physical", icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Class starter ability. Automatic ranged attack firing arrows.",
        [1] = { name = "Auto Shot", key = "auto_shot", school = "Physical", icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Class starter ability. Automatic ranged attack firing arrows.", slot = 1 },
    },
    ROGUE = {
        name = "Sinister Strike", key = "sinister_strike", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice", desc = "Class starter ability. Primary combo generator.",
        [1] = { name = "Sinister Strike", key = "sinister_strike", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice", desc = "Class starter ability. Primary combo generator.", slot = 1 },
    },
    WARLOCK = {
        name = "Shadow Bolt", key = "shadow_bolt", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt", desc = "Class starter ability. Premier shadow projectile.",
        [1] = { name = "Shadow Bolt", key = "shadow_bolt", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt", desc = "Class starter ability. Premier shadow projectile.", slot = 1 },
    },
    SHAMAN = {
        name = "Lightning Bolt", key = "lightning_bolt", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Lightning", desc = "Class starter ability. Electrical nature projectile.",
        [1] = { name = "Lightning Bolt", key = "lightning_bolt", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Lightning", desc = "Class starter ability. Electrical nature projectile.", slot = 1 },
    },
    DRUID = {
        name = "Wrath", key = "wrath", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_AbolishPoison", desc = "Class starter ability. Quick nature bolt.",
        [1] = { name = "Wrath", key = "wrath", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_AbolishPoison", desc = "Class starter ability. Quick nature bolt.", slot = 1 },
    },
};

-- 18 Comprehensive Builds (2 per class)
BordoUI_BuildData.Builds = {
    -- ------------------------------------------------------------------------

    HUNTER = {
        {
            id = "hunter_aimed_shot",
            title = "Aimed Shot",
            spec = "Marksmanship",
            role = "Aimed Shot Single-Target Boss Melter Meta",
            summary = "Marksmanship Aimed Shot specialist. Delivers devastating long-range critical strikes to obliterate bosses and elites.",
            focus = "Invest all card upgrades into Aimed Shot (#1 Priority). Keep Auto Shot & Frost Trap for supporting DPS and slow.",
            banish = { "Concussive Shot", "Hunter's Mark", "Multi-Shot" },
            guideInfo = "|cffffd200Focus:|r Max out Aimed Shot (#1 Priority). Invest all card upgrades into Aimed Shot. Keep Auto Shot and Frost Trap for supporting DPS and slows.\n|cffff6666Banish:|r Concussive Shot, Hunter's Mark, Multi-Shot.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky. Equip Mark of the Chosen in the 2nd trinket slot.",
            statPriority = "Critical Strike Chance > Critical Strike Damage > Cooldown Reduction > Luck",
            stats = {
                { name = "Critical Strike Chance", note = "Multiplies critical hit frequency on Aimed Shot (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Massively inflates critical strike multiplier (Blackhand's Breadth)" },
                { name = "Cooldown Reduction", note = "Accelerates Aimed Shot firing rate (Quick Strike Ring)" },
                { name = "Luck", note = "Boosts card upgrade rarity and gear drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "aimed_shot",
                    name = "Aimed Shot",
                    icon = "Interface\\Icons\\INV_Spear_07",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately. Invest all upgrades into Aimed Shot.",
                },
                {
                    key = "auto_shot",
                    name = "Auto Shot",
                    icon = "Interface\\Icons\\Ability_Whirlwind",
                    school = "Physical",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - Automatic continuous ranged arrow fire.",
                },
                {
                    key = "frost_trap",
                    name = "Frost Trap",
                    icon = "Interface\\Icons\\Spell_Frost_FreezingBreath",
                    school = "Frost",
                    prio = 3,
                    rankMax = 8,
                    reason = "Priority (#3) - Ground ice slick to slow approaching enemies.",
                },
                {
                    key = "concussive_shot",
                    name = "Concussive Shot",
                    icon = "Interface\\Icons\\Spell_Frost_Stun",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Aimed Shot.",
                },
                {
                    key = "hunters_mark",
                    name = "Hunter's Mark",
                    icon = "Interface\\Icons\\Ability_Hunter_SniperShot",
                    school = "Physical",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Aimed Shot.",
                },
                {
                    key = "multi_shot",
                    name = "Multi-Shot",
                    icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Aimed Shot.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Aimed Shot",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_16",
                    quality = 5,
                    benefit = "Remakes Aimed Shot",
                    desc = "Legendary amulet - remakes Aimed Shot\nEmpowers Aimed Shot with devastating piercing power.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                },
            },
            tactics = {
                "Invest all card upgrades into Aimed Shot (Priority #1) to melt targets instantly.",
                "Keep Auto Shot and Frost Trap for steady baseline damage and kiting control.",
                "Banish Concussive Shot, Hunter's Mark, and Multi-Shot.",
                "Wear a +30% Luck / +25% Gold neck early to accelerate gear progression before switching to Eye of the Splitting Sky.",
            },
        },
        {
            id = "hunter_multi_shot",
            title = "Multi-Shot",
            spec = "Beast Mastery / Marksmanship",
            role = "Multi-Shot Heavy AoE & Rapid Fire Meta",
            summary = "Multi-Shot projectile powerhouse. Maximizes Multi-Shot damage, crits, and double-cast procs to shred massive mob clusters.",
            focus = "Max out Multi-Shot first (#1 Priority - invest all upgrades into Multi-Shot). Aimed Shot & Serpent Sting provide secondary boss burst.",
            banish = { "Hunter's Mark", "Frost Trap", "Auto Shot" },
            guideInfo = "|cffffd200Focus:|r Max out Multi-Shot (#1 Priority). Invest all card upgrades into Multi-Shot. Aimed Shot & Serpent Sting provide secondary damage.\n|cffff6666Banish:|r Hunter's Mark, Frost Trap, Auto Shot.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky (Multi-Shot).",
            statPriority = "Critical Strike Chance > Damage > Critical Strike Damage > Echo / Haste",
            stats = {
                { name = "Critical Strike Chance", note = "Ensures frequent crits across all multi-shot arrows (Master Dragonslayer's Ring)" },
                { name = "Damage", note = "Multiplicative damage boost scaling all projectile hits (Band of Accuria)" },
                { name = "Critical Strike Damage", note = "Amplifies critical strike output (Blackhand's Breadth)" },
                { name = "Echo / Double Cast", note = "Chance for Multi-Shot to instantly fire a second time (Hand of Justice)" },
            },
            spells = {
                {
                    key = "multi_shot",
                    name = "Multi-Shot",
                    icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately. Invest all card upgrades into Multi-Shot.",
                },
                {
                    key = "aimed_shot",
                    name = "Aimed Shot",
                    icon = "Interface\\Icons\\INV_Spear_07",
                    school = "Physical",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - High damage single-target burst for elites and bosses.",
                },
                {
                    key = "serpent_sting",
                    name = "Serpent Sting",
                    icon = "Interface\\Icons\\Ability_Hunter_Quickshot",
                    school = "Nature",
                    prio = 3,
                    rankMax = 8,
                    reason = "Priority (#3) - Continuous ticking nature poison damage.",
                },
                {
                    key = "hunters_mark",
                    name = "Hunter's Mark",
                    icon = "Interface\\Icons\\Ability_Hunter_SniperShot",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Multi-Shot.",
                },
                {
                    key = "frost_trap",
                    name = "Frost Trap",
                    icon = "Interface\\Icons\\Spell_Frost_FreezingBreath",
                    school = "Frost",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Multi-Shot.",
                },
                {
                    key = "auto_shot",
                    name = "Auto Shot",
                    icon = "Interface\\Icons\\Ability_Whirlwind",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card offerings on Multi-Shot.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Multi-Shot",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_16",
                    quality = 5,
                    benefit = "Remakes Multi-Shot",
                    desc = "Legendary amulet - remakes Multi-Shot\nMulti-Shot splits into additional arrows with devastating piercing force.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Hand of Justice",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_01",
                    quality = 4,
                    benefit = "9% Chance to Cast Twice",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                },
            },
            tactics = {
                "Invest all card upgrades into Multi-Shot (Priority #1) to annihilate entire waves in a single volley.",
                "Pick Aimed Shot and Serpent Sting for secondary single-target pressure.",
                "Banish Hunter's Mark, Frost Trap, and Auto Shot.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- PALADIN
    -- ------------------------------------------------------------------------
    PALADIN = {
        {
            id = "paladin_retribution",
            title = "Exorcism",
            spec = "Retribution",
            role = "Exorcism Nuke Meta",
            summary = "Exorcism nuke carry. Funnels all upgrades into Exorcism while banishing diluting holy abilities.",
            focus = "Max out Exorcism (#1 Priority - invest almost every option into Exorcism)",
            banish = { "Consecration", "Judgement", "Divine Shield" },
            guideInfo = "|cffffd200Focus:|r Max Exorcism first (Prio #1 - invest almost every upgrade into Exorcism).\n|cffff6666Banish:|r Consecration, Judgement, Divine Shield.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky.",
            statPriority = "Damage > Critical Strike Chance > Critical Strike Damage > Luck",
            stats = {
                { name = "Damage", note = "+26% flat damage scaling for all holy nukes (Band of Accuria)" },
                { name = "Critical Strike Chance", note = "Increases critical hit frequency (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Amplifies critical strike output (Blackhand's Breadth)" },
                { name = "Luck", note = "Increases rare card offerings and chest drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "exorcism",
                    name = "Exorcism",
                    icon = "Interface\\Icons\\Spell_Holy_Excorcism_02",
                    school = "Holy",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately, invest almost every upgrade into Exorcism.",
                },
                {
                    key = "hammer_of_wrath",
                    name = "Hammer of Wrath",
                    icon = "Interface\\Icons\\Ability_ThunderBolt",
                    school = "Holy",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - Take Legendary options early for high execute damage.",
                },
                {
                    key = "holy_light",
                    name = "Holy Light",
                    icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                    school = "Holy",
                    prio = 3,
                    rankMax = 8,
                    reason = "Priority (#3) - Legendary options for comfort (only need up to rank 4).",
                },
                {
                    key = "consecration",
                    name = "Consecration",
                    icon = "Interface\\Icons\\Spell_Holy_InnerFire",
                    school = "Holy",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish immediately to focus card choices on Exorcism.",
                },
                {
                    key = "judgement",
                    name = "Judgement",
                    icon = "Interface\\Icons\\Spell_Holy_RighteousFury",
                    school = "Holy",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish immediately to focus card choices on Exorcism.",
                },
                {
                    key = "divine_shield",
                    name = "Divine Shield",
                    icon = "Interface\\Icons\\Spell_Holy_DivineIntervention",
                    school = "Holy",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish / Flex]|r - Banish to focus card choices (keep only if you want emergency save).",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Exorcism",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04",
                    quality = 5,
                    benefit = "Remakes Exorcism",
                    desc = "Legendary amulet - remakes Exorcism\nExorcism strikes 1 more target and deals heavy bonus damage.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                },
            },
            tactics = {
                "Invest almost every card upgrade into Exorcism (Priority #1) to achieve massive nuke damage.",
                "Banish Consecration, Judgement, and Divine Shield to ensure high-priority cards appear.",
                "Equip Eye of the Splitting Sky necklace to unlock the Remakes Exorcism legendary power.",
            },
        },
        {
            id = "paladin_consecration",
            title = "Consecration",
            spec = "Protection",
            role = "Consecration AoE Meta",
            summary = "Consecration AoE carry. Pours all upgrades into Consecration to burn waves in holy fire.",
            focus = "Max out Consecration (#1 Priority - invest almost all upgrades into Consecration). Hammer of Wrath & Exorcism can be taken occasionally for extra damage.",
            banish = { "Judgement", "Hammer of Justice", "Holy Shock" },
            guideInfo = "|cffffd200Focus:|r Max Consecration first (Prio #1 - invest almost all upgrades into Consecration). Hammer of Wrath & Exorcism can be taken occasionally for extra damage.\n|cffff6666Banish:|r Judgement, Hammer of Justice, Holy Shock.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Amulet of the Inferno.",
            statPriority = "Critical Strike Chance > Damage Reduction > Max Health > Cooldown Reduction > Critical Strike Damage",
            stats = {
                { name = "Critical Strike Chance", note = "Increases critical tick rate of Consecration (Master Dragonslayer's Ring)" },
                { name = "Damage Reduction", note = "Reduces incoming damage from all sources (Archimtiros' Ring of Reckoning)" },
                { name = "Max Health", note = "Expands survivability against swarm damage (Archimtiros' Ring of Reckoning)" },
                { name = "Critical Strike Damage", note = "Amplifies critical strike damage (Blackhand's Breadth)" },
                { name = "Cooldown Reduction", note = "Enables faster repositioning and uptime (Talisman of Ephemeral Power)" },
            },
            spells = {
                {
                    key = "consecration",
                    name = "Consecration",
                    icon = "Interface\\Icons\\Spell_Holy_InnerFire",
                    school = "Holy",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately, invest almost every upgrade into Consecration.",
                },
                {
                    key = "hammer_of_wrath",
                    name = "Hammer of Wrath",
                    icon = "Interface\\Icons\\Ability_ThunderBolt",
                    school = "Holy",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - Take occasionally when offered for extra burst / execute damage.",
                },
                {
                    key = "exorcism",
                    name = "Exorcism",
                    icon = "Interface\\Icons\\Spell_Holy_Excorcism_02",
                    school = "Holy",
                    prio = 3,
                    rankMax = 8,
                    reason = "Priority (#3) - Take occasionally when offered for extra single-target damage.",
                },
                {
                    key = "judgement",
                    name = "Judgement",
                    icon = "Interface\\Icons\\Spell_Holy_RighteousFury",
                    school = "Holy",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Consecration.",
                },
                {
                    key = "hammer_of_justice",
                    name = "Hammer of Justice",
                    icon = "Interface\\Icons\\Spell_Holy_SealOfMight",
                    school = "Holy",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Consecration.",
                },
                {
                    key = "holy_shock",
                    name = "Holy Shock",
                    icon = "Interface\\Icons\\Spell_Holy_SearingLight",
                    school = "Holy",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Consecration.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Consecration",
                    name = "Amulet of the Inferno",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_19",
                    quality = 5,
                    benefit = "Remakes Consecration",
                    desc = "Legendary amulet - remakes Consecration\nConsecration turns into blazing holy fire, dealing immense periodic damage.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Archimtiros' Ring of Reckoning",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_35",
                    quality = 4,
                    benefit = "+4.4% Dmg Red, +18% Max HP",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Talisman of Ephemeral Power",
                    icon = "Interface\\Icons\\INV_Misc_StoneTablet_11",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                },
            },
            tactics = {
                "Invest almost every card upgrade into Consecration (Priority #1) to fill the ground with holy fire.",
                "Banish Judgement, Hammer of Justice, and Holy Shock so high-priority Consecration upgrades appear.",
                "Pick Hammer of Wrath and Exorcism occasionally when offered to add extra burst damage.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- WARRIOR
    -- ------------------------------------------------------------------------
    WARRIOR = {
        {
            id = "warrior_whirlwind",
            title = "Whirlwind",
            spec = "Fury",
            role = "Whirlwind Blender Meta",
            summary = "Whirlwind spin carry. Maximizes Whirlwind damage while saving banishes by letting Battle Shout naturally fade.",
            focus = "Max out Whirlwind first (#1 Priority - invest all upgrades into Whirlwind). Pick Execute for secondary burst.",
            banish = { "Bloodthirst", "Demoralizing Shout", "Cleave" },
            guideInfo = "|cffffd200Focus:|r Max out Whirlwind first (Prio #1 - invest all upgrades into Whirlwind). Pick Execute for secondary burst.\n|cffff6666Banish:|r Bloodthirst, Demoralizing Shout, Cleave.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Heart of the Earthshaker. Let Battle Shout fade naturally to save 1 banish.",
            statPriority = "Cooldown Reduction > Critical Strike Chance > Critical Strike Damage > Luck",
            stats = {
                { name = "Cooldown Reduction", note = "Enables non-stop 360-degree Whirlwind spinning (Quick Strike Ring)" },
                { name = "Critical Strike Chance", note = "Multiplies critical strike frequency across all targets (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Increases damage multiplier on crits (Blackhand's Breadth)" },
                { name = "Luck", note = "Boosts card upgrade rarity and gear drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "whirlwind",
                    name = "Whirlwind",
                    icon = "Interface\\Icons\\Ability_Whirlwind",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately, invest all upgrades into Whirlwind.",
                },
                {
                    key = "execute",
                    name = "Execute",
                    icon = "Interface\\Icons\\INV_Sword_48",
                    school = "Physical",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - Secondary burst against bosses and low-health targets.",
                },
                {
                    key = "battle_shout",
                    name = "Battle Shout",
                    icon = "Interface\\Icons\\Ability_Warrior_BattleShout",
                    school = "Physical",
                    prio = 3,
                    rankMax = 1,
                    reason = "|cff00ff00[Keep Rank 1]|r - Do not banish; naturally leaves the offering pool later, saving a banish for gear.",
                },
                {
                    key = "bloodthirst",
                    name = "Bloodthirst",
                    icon = "Interface\\Icons\\Spell_Nature_BloodLust",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Whirlwind.",
                },
                {
                    key = "demoralizing_shout",
                    name = "Demoralizing Shout",
                    icon = "Interface\\Icons\\Ability_Warrior_WarCry",
                    school = "Physical",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Whirlwind.",
                },
                {
                    key = "cleave",
                    name = "Cleave",
                    icon = "Interface\\Icons\\Ability_Warrior_Cleave",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to focus card choices on Whirlwind (or keep Rank 1 early).",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Whirlwind",
                    name = "Heart of the Earthshaker",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_18",
                    quality = 5,
                    benefit = "Remakes Whirlwind",
                    desc = "Legendary amulet - remakes Whirlwind\nWhirlwind hits all surrounding targets with massive earthshaking force.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                },
            },
            tactics = {
                "Invest all upgrades into Whirlwind (Priority #1) to continuously decimate surrounding waves.",
                "Banish Bloodthirst, Demoralizing Shout, and Cleave. Let Battle Shout fade naturally to save a banish.",
                "If Heart of the Earthshaker is not found, equip a Luck amulet until it appears.",
            },
        },
        {
            id = "warrior_shield_slam",
            title = "Shield Slam",
            spec = "Protection",
            role = "Shield Slam Heavy Armor Meta",
            summary = "Protection Shield Slam powerhouse. Crushes foes with high damage reduction and massive shield blocks.",
            focus = "Max out Shield Slam first (Prio #1). Choice prio: +Targets > Cooldown Reduction > Damage. Demoralizing Shout & Thunder Clap at Rank 3.",
            banish = { "Battle Shout", "Bloodthirst", "Cleave" },
            guideInfo = "|cffffd200Focus:|r Max out Shield Slam (#1 Priority). Upgrade prio: +Targets > Cooldown Reduction > Damage. Demoralizing Shout & Thunder Clap at Rank 3.\n|cffff6666Banish:|r Battle Shout, Bloodthirst, Cleave.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Choker of the Fire Lord (higher DPS) or Medallion of the Bladestorm. Equip Mark of the Chosen in the 2nd trinket slot.",
            statPriority = "Damage Reduction > Max Health > Damage > Luck",
            stats = {
                { name = "Damage Reduction", note = "Increases damage mitigation from heavy armor (Archimtiros' Ring of Reckoning, Star of Mystaria)" },
                { name = "Max Health", note = "Expands total health pool for high survivability (Star of Mystaria, Archimtiros' Ring of Reckoning)" },
                { name = "Damage", note = "Boosts physical damage scaling of Shield Slam (Band of Accuria)" },
                { name = "Luck", note = "Increases rare offering rates and equipment upgrades (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "shield_slam",
                    name = "Shield Slam",
                    icon = "Interface\\Icons\\INV_Shield_05",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Max rank immediately. Upgrade prio: +Targets > Cooldown Reduction > Damage.",
                },
                {
                    key = "demoralizing_shout",
                    name = "Demoralizing Shout",
                    icon = "Interface\\Icons\\Ability_Warrior_WarCry",
                    school = "Physical",
                    prio = 2,
                    rankMax = 3,
                    reason = "Priority (#2) - Keep at Rank 3 to weaken enemy damage.",
                },
                {
                    key = "thunder_clap",
                    name = "Thunder Clap",
                    icon = "Interface\\Icons\\Spell_Nature_ThunderClap",
                    school = "Physical",
                    prio = 3,
                    rankMax = 3,
                    reason = "Priority (#3) - Keep at Rank 3 for area slowing and lightning disruption.",
                },
                {
                    key = "battle_shout",
                    name = "Battle Shout",
                    icon = "Interface\\Icons\\Ability_Warrior_BattleShout",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to keep offerings focused on Shield Slam.",
                },
                {
                    key = "bloodthirst",
                    name = "Bloodthirst",
                    icon = "Interface\\Icons\\Spell_Nature_BloodLust",
                    school = "Physical",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to prevent unwanted offering rolls.",
                },
                {
                    key = "cleave",
                    name = "Cleave",
                    icon = "Interface\\Icons\\Ability_Warrior_Cleave",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to prevent unwanted offering rolls.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Shield Slam",
                    name = "Medallion of the Bladestorm",
                    icon = "Interface\\Icons\\INV_Misc_Cape_18",
                    quality = 5,
                    benefit = "Remakes Shield Slam",
                    desc = "Legendary amulet - remakes Shield Slam\nSlams through multiple targets with devastating force.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Archimtiros' Ring of Reckoning",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_35",
                    quality = 4,
                    benefit = "+4.4% Dmg Red, +18% Max HP",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Star of Mystaria",
                    icon = "Interface\\Icons\\INV_Enchant_EssenceMagicLarge",
                    quality = 4,
                    benefit = "+25% Max HP, +4% Dmg Red",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                },
            },
            tactics = {
                "Invest all card upgrades into Shield Slam (Priority: +Targets > Cooldown Reduction > Damage).",
                "Demoralizing Shout and Thunder Clap only need Rank 3.",
                "Banish Battle Shout, Bloodthirst, and Cleave.",
                "Use a +30% Luck / +25% Gold neck early to accelerate gear progression before equipping Medallion of the Bladestorm or Choker of the Fire Lord.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- MAGE
    -- ------------------------------------------------------------------------
    MAGE = {
        {
            id = "mage_pyroblast",
            title = "Pyroblast",
            spec = "Fire / Arcane / Frost",
            role = "Pyroblast Splash & Rolling Ignite Meta",
            summary = "Colossal fire nuker. Remakes Pyroblast into a devastating multi-target splash bomb backed by Flamestrike and Blast Wave.",
            focus = "Pyroblast is #1 Priority. Card prio: Pyroblast (+Target > +Damage, target cap 13/14) > Flamestrike (Duration/Area > Cooldown) > Blast Wave (Area > Cooldown). Get Ice Barrier absorb to 125-150% then banish.",
            banish = { "Fireball", "Frost Nova", "Ice Barrier" },
            guideInfo = "|cffffd200Focus:|r Max Pyroblast (#1 Prio). Upgrade prio: +Target > +Damage (Cap: 13, 14 with Amulet).\n|cffffff00Supporting Spells:|r Flamestrike (Duration/Area > CD) & Blast Wave (Area > CD). Stop CDR once CD < 4s.\n|cffff6666Banish:|r Fireball, Frost Nova. (Upgrade Ice Barrier to 125-150% absorb first, then banish!).\n|cff00ffffStats:|r Max Crit first! Take white crit if needed until ~50% crit, then take highest rarity. Target 500% Crit Dmg & 75% Luck.\n|cff00ff00Tip:|r Recommend Gnome (or Undead for endless). Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky (Pyroblast).",
            statPriority = "Critical Strike Chance > Critical Strike Damage > Luck > Cooldown Reduction",
            stats = {
                { name = "Critical Strike Chance", note = "Absolute first stat to max! Feeds Ignite and massive Pyroblast crits (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Target 500% critical damage multiplier (Blackhand's Breadth)" },
                { name = "Luck", note = "Target 75% luck for maximum rare card offerings and item drops (Mark of the Chosen)" },
                { name = "Cooldown Reduction", note = "Reduces Flamestrike and Blast Wave CD down to < 4 sec (Quick Strike Ring)" },
            },
            spells = {
                {
                    key = "pyroblast",
                    name = "Pyroblast",
                    icon = "Interface\\Icons\\Spell_Fire_Fireball02",
                    school = "Fire",
                    prio = 1,
                    rankMax = 20,
                    reason = "Top Priority (#1) - Remade by Eye of the Splitting Sky. Upgrade prio: +Target > +Damage (cap 13, 14 with Amulet).",
                },
                {
                    key = "flamestrike",
                    name = "Flamestrike",
                    icon = "Interface\\Icons\\Spell_Fire_SelfDestruct",
                    school = "Fire",
                    prio = 2,
                    rankMax = 18,
                    reason = "Secondary AoE burn. Upgrade prio: Duration/Area > Cooldown (stop CDR once CD < 4s).",
                },
                {
                    key = "blast_wave",
                    name = "Blast Wave",
                    icon = "Interface\\Icons\\Spell_Holy_Excorcism_02",
                    school = "Fire",
                    prio = 3,
                    rankMax = 8,
                    reason = "Emergency radial knockback and burn. Upgrade prio: Area > Cooldown.",
                },
                {
                    key = "ice_barrier",
                    name = "Ice Barrier",
                    icon = "Interface\\Icons\\Spell_Ice_Lament",
                    school = "Frost",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish after absorb]|r - Upgrade Absorb Amount to 125-150% first, then banish!",
                },
                {
                    key = "fireball",
                    name = "Fireball",
                    icon = "Interface\\Icons\\Spell_Fire_FlameBolt",
                    school = "Fire",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to keep card pool focused on Pyroblast and Flamestrike.",
                },
                {
                    key = "frost_nova",
                    name = "Frost Nova",
                    icon = "Interface\\Icons\\Spell_Frost_FrostNova",
                    school = "Frost",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "|cffff4444[Banish]|r - Banish to keep card pool focused on Pyroblast and Flamestrike.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Pyroblast",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_30",
                    quality = 5,
                    benefit = "Remakes Pyroblast",
                    desc = "Legendary amulet - remakes Pyroblast\nPyroblast explosion splashes for 40% within 8 yd.",
                    equip = "Legendary amulet - remakes Pyroblast. Pyroblast explosion splashes for 40% within 8 yd.",
                    why = "Core legendary amulet powering Pyroblast with multi-target splash.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Enables rapid Flamestrike and Blast Wave cooldowns (aim for < 4s CD).",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Crit is the #1 stat to max first to trigger rolling Ignite debuffs.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage (Target: 500%)" },
                    equip = "Increases critical strike damage.",
                    why = "Massively amplifies critical strike hits (aim for 500% target).",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck (Target: 75%)" },
                    equip = "Increases luck.",
                    why = "Increases rare card offerings and item drops (aim for 75% target).",
                },
            },
            tactics = {
                "Priority Order: Pyroblast (+Target > +Damage) > Flamestrike (Duration/Area > Cooldown) > Blast Wave (Area > Cooldown).",
                "Absorb Amount on Ice Barrier to 125-150% then banish.",
                "Crit is the absolute first thing you should max. Take white crit if needed until ~50% crit, then take highest rarity.",
                "Once Blast Wave and Flamestrike CD < 4sec, stop going for CDR.",
                "Pyro Target cap is 13 (14 with Eye of the Splitting Sky Amulet).",
                "Recommend Gnome (or Undead for endless).",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky.",
            },
        },
        {
            id = "mage_arcane_missiles",
            title = "Arcane Missiles",
            spec = "Arcane / Frost",
            role = "Rapid Machine-Gun Arcane Missiles & Echo Meta",
            summary = "Rapid-fire Arcane Missiles specialist. Powered by Stormcaller's Amulet and Hand of Justice, unleashes endless streaming volleys of homing missiles with high critical chance and double-cast procs.",
            focus = "Invest all upgrades into Arcane Missiles (#1 Priority). Keep Arcane Explosion for radial waveclear and Ice Barrier for defense. Banish Frostbolt, Blizzard, and Cone of Cold.",
            banish = { "Frostbolt", "Blizzard", "Cone of Cold" },
            guideInfo = "|cffffd200Focus:|r Put all upgrades into Arcane Missiles (#1 Priority). Arcane Explosion provides radial close-range waveclear and Ice Barrier gives survivability.\n|cffff6666Banish:|r Frostbolt, Blizzard, Cone of Cold.\n|cffffff00Gear:|r Stormcaller's Amulet remakes Arcane Missiles into rapid streams; Hand of Justice provides double-cast echo procs; Band of Accuria & Dragonslayer's Ring maximize damage and crits.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Stormcaller's Amulet (Arcane Missiles).",
            statPriority = "Damage > Critical Strike Chance > Double Cast / Echo > Luck",
            stats = {
                { name = "Damage", note = "Directly amplifies all missile hit impacts (Band of Accuria)" },
                { name = "Critical Strike Chance", note = "Guarantees frequent high-damage arcane crits (Master Dragonslayer's Ring)" },
                { name = "Double Cast / Echo", note = "Chance for spells to immediately fire twice (Hand of Justice)" },
                { name = "Luck", note = "Increases rare card offerings and item drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "arcane_missiles",
                    name = "Arcane Missiles",
                    icon = "Interface\\Icons\\Spell_Nature_StarFall",
                    school = "Arcane",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Remade by Stormcaller's Amulet into relentless streaming barrages.",
                },
                {
                    key = "arcane_explosion",
                    name = "Arcane Explosion",
                    icon = "Interface\\Icons\\Spell_Nature_WispSplode",
                    school = "Arcane",
                    prio = 2,
                    rankMax = 8,
                    reason = "Priority (#2) - Radial arcane burst for wiping close swarms.",
                },
                {
                    key = "ice_barrier",
                    name = "Ice Barrier",
                    icon = "Interface\\Icons\\Spell_Ice_Lament",
                    school = "Frost",
                    prio = 3,
                    rankMax = 8,
                    reason = "Priority (#3) - Essential defensive barrier absorbing damage.",
                },
                {
                    key = "frostbolt",
                    name = "Frostbolt",
                    icon = "Interface\\Icons\\Spell_Frost_FrostBolt02",
                    school = "Frost",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to focus card choices on Arcane Missiles.",
                },
                {
                    key = "blizzard",
                    name = "Blizzard",
                    icon = "Interface\\Icons\\Spell_Frost_IceStorm",
                    school = "Frost",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to focus card choices on Arcane Missiles.",
                },
                {
                    key = "cone_of_cold",
                    name = "Cone of Cold",
                    icon = "Interface\\Icons\\Spell_Frost_Glacier",
                    school = "Frost",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to focus card choices on Arcane Missiles.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Arcane Missiles",
                    name = "Stormcaller's Amulet",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_26",
                    quality = 5,
                    benefit = "Remakes Arcane Missiles",
                    desc = "Legendary amulet - remakes Arcane Missiles\nFires rapid barrages of Arcane Missiles with increased missile count and damage.",
                    equip = "Legendary amulet - remakes Arcane Missiles. Fires rapid barrages of Arcane Missiles with increased missile count and damage.",
                    why = "Core legendary amulet that transforms Arcane Missiles into a continuous stream.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases all damage dealt.",
                    why = "Flat multiplicative damage boost scaling every single missile impact.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Guarantees frequent critical hits across high missile counts.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card upgrade rarity and gear drops.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Hand of Justice",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_01",
                    quality = 3,
                    benefit = "9% Chance to Cast Twice",
                    stats = { "9% Chance to Cast Twice" },
                    equip = "Grants a chance for any spell to immediately cast a second time.",
                    why = "Insane synergy with Arcane Missiles, repeatedly doubling volleys.",
                },
            },
            tactics = {
                "Invest all upgrades into Arcane Missiles (#1 Priority).",
                "Use Arcane Explosion when dense packs swarm your perimeter.",
                "Maintain Ice Barrier for constant damage absorption.",
                "Banish Frostbolt, Blizzard, and Cone of Cold.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Stormcaller's Amulet.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- WARLOCK
    -- ------------------------------------------------------------------------
    WARLOCK = {
        {
            id = "warlock_searing_pain",
            title = "Searing Pain",
            spec = "Demonology / Destruction / Affliction",
            role = "Searing Pain Area Burst & Rapid Shadowbolt Meta",
            summary = "Searing Pain fire devastation specialist. Remakes Searing Pain into a devastating rapid-fire area blast backed by high-rank Shadow Bolt and Demonic Empowerment.",
            focus = "Pump all upgrades into Searing Pain (#1 Priority). Once you hit that 1% area, feel free to upgrade Shadow Bolt. Upgrade Demonic Empowerment 2 times, it will auto banish itself.",
            banish = { "Drain Life", "Corruption", "Soulfire" },
            guideInfo = "|cffffd200Focus:|r Pump all upgrades into Searing Pain (#1 Priority). Once you hit that 1% area, feel free to upgrade Shadow Bolt.\n|cffffff00Demonic Empowerment:|r Upgrade Demonic Empowerment 2 times (Rank 3), it will auto banish itself.\n|cffff6666Banish:|r Drain Life, Corruption, Soulfire.\n|cffffff00Gear:|r Stormcaller's Amulet remakes Searing Pain; Band of Accuria & Earthstrike provide massive flat damage; Quick Strike Ring reduces cooldowns.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Stormcaller's Amulet (Searing Pain).",
            statPriority = "Damage > Cooldown Reduction > Luck > Area",
            stats = {
                { name = "Damage", note = "Directly scales Searing Pain and Shadow Bolt output (Band of Accuria, Earthstrike)" },
                { name = "Cooldown Reduction", note = "Enables faster spell cast cycles (Quick Strike Ring)" },
                { name = "Luck", note = "Increases rare card offerings and item drops (Mark of the Chosen)" },
                { name = "Area", note = "Target that 1% area milestone on Searing Pain" },
            },
            spells = {
                {
                    key = "searing_pain",
                    name = "Searing Pain",
                    icon = "Interface\\Icons\\Spell_Fire_SoulBurn",
                    school = "Fire",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Remade by Stormcaller's Amulet. Pump all upgrades here until 1% area!",
                },
                {
                    key = "shadow_bolt",
                    name = "Shadow Bolt",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt",
                    school = "Shadow",
                    prio = 2,
                    rankMax = 98,
                    reason = "Priority (#2) - High-rank single-target shadow nuke. Upgrade after hitting 1% area on Searing Pain.",
                },
                {
                    key = "demonic_empowerment",
                    name = "Demonic Empowerment",
                    icon = "Interface\\Icons\\Ability_Warlock_DemonicEmpowerment",
                    school = "Shadow",
                    prio = 3,
                    rankMax = 3,
                    reason = "Priority (#3) - Upgrade 2 times (to Rank 3); it will auto banish itself.",
                },
                {
                    key = "drain_life",
                    name = "Drain Life",
                    icon = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
                    school = "Shadow",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Searing Pain and Shadow Bolt.",
                },
                {
                    key = "corruption",
                    name = "Corruption",
                    icon = "Interface\\Icons\\Spell_Shadow_AbominationExplosion",
                    school = "Shadow",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Searing Pain and Shadow Bolt.",
                },
                {
                    key = "soulfire",
                    name = "Soulfire",
                    icon = "Interface\\Icons\\Spell_Fire_Fireball02",
                    school = "Fire",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Searing Pain and Shadow Bolt.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Searing Pain",
                    name = "Stormcaller's Amulet",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_26",
                    quality = 5,
                    benefit = "Remakes Searing Pain",
                    desc = "Legendary amulet - remakes Searing Pain\nSearing Pain deals devastating fire bursts and hits in a wider area.",
                    equip = "Legendary amulet - remakes Searing Pain. Searing Pain deals devastating fire bursts and hits in a wider area.",
                    why = "Core legendary amulet that powers up Searing Pain.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases all damage dealt.",
                    why = "Massive overall damage amplifier for all spell hits.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Reduces cooldowns across your entire ability rotation.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Earthstrike",
                    icon = "Interface\\Icons\\Spell_Nature_AbolishMagic",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases physical and spell damage dealt.",
                    why = "Flat high spell damage bonus boosting Searing Pain and Shadow Bolt.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card upgrade rarity and gear drops.",
                },
            },
            tactics = {
                "Pump all upgrades into Searing Pain (#1 Priority).",
                "Once you hit that 1% area on Searing Pain, feel free to upgrade Shadow Bolt.",
                "Upgrade Demonic Empowerment 2 times (to Rank 3); it will auto banish itself.",
                "Banish Drain Life, Corruption, and Soulfire.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Stormcaller's Amulet.",
            },
        },
        {
            id = "warlock_corruption",
            title = "Corruption",
            spec = "Affliction / Demonology",
            role = "Corruption Rapid Ticks & DoT Spread Meta",
            summary = "Affliction Corruption damage-over-time specialist. Remakes Corruption via Pendant of the Plague into relentless high-speed rotting ticks, supported by Immolate and Curse of Agony.",
            focus = "Prio Corruption (#1 Priority, Rank 99). Immolate only when you see +target. Agony if everything else is bad.",
            banish = { "Shadow Bolt", "Drain Life", "Death Coil" },
            guideInfo = "|cffffd200Focus:|r Prio Corruption (#1 Priority, Rank 99). Immolate only when you see +target. Agony if everything else is bad.\n|cffff6666Banish:|r Shadow Bolt, Drain Life, Death Coil.\n|cffffff00Gear:|r Pendant of the Plague remakes Corruption; Seal of the Damned makes DoTs tick faster; Band of Accuria boosts damage; Talisman of Ephemeral Power cuts cooldowns.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Pendant of the Plague (Corruption).",
            statPriority = "DoT Tick Speed > Damage > Cooldown Reduction > Luck",
            stats = {
                { name = "DoT Tick Speed", note = "Accelerates damage-over-time ticks to shred packs rapidly (Seal of the Damned)" },
                { name = "Damage", note = "Directly amplifies Corruption, Immolate, and Agony ticks (Band of Accuria)" },
                { name = "Cooldown Reduction", note = "Reduces recast times and enhances rotation fluidity (Talisman of Ephemeral Power)" },
                { name = "Luck", note = "Improves rare card offering rates and gear drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "corruption",
                    name = "Corruption",
                    icon = "Interface\\Icons\\Spell_Shadow_AbominationExplosion",
                    school = "Shadow",
                    prio = 1,
                    rankMax = 99,
                    reason = "Top Priority (#1) - Remade by Pendant of the Plague. Pump all upgrades into Corruption (Rank 99)!",
                },
                {
                    key = "immolate",
                    name = "Immolate",
                    icon = "Interface\\Icons\\Spell_Fire_Immolation",
                    school = "Fire",
                    prio = 2,
                    rankMax = 90,
                    reason = "Priority (#2) - Upgrade only when you see +target offerings.",
                },
                {
                    key = "curse_of_agony",
                    name = "Curse of Agony",
                    icon = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras",
                    school = "Shadow",
                    prio = 3,
                    rankMax = 90,
                    reason = "Priority (#3) - Upgrade only if everything else offered is bad.",
                },
                {
                    key = "shadow_bolt",
                    name = "Shadow Bolt",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt",
                    school = "Shadow",
                    prio = 4,
                    rankMax = 8,
                    reason = "Banished - Banish early to keep card offerings focused on DoTs.",
                },
                {
                    key = "drain_life",
                    name = "Drain Life",
                    icon = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
                    school = "Shadow",
                    prio = 5,
                    rankMax = 8,
                    reason = "Banished - Banish early.",
                },
                {
                    key = "death_coil",
                    name = "Death Coil",
                    icon = "Interface\\Icons\\Spell_Shadow_DeathCoil",
                    school = "Shadow",
                    prio = 6,
                    rankMax = 8,
                    reason = "Banished - Banish early.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Corruption",
                    name = "Pendant of the Plague",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_11",
                    quality = 5,
                    benefit = "Remakes Corruption",
                    stats = { "Remakes Corruption" },
                    equip = "Legendary amulet - remakes Corruption into rapid lethal plague ticks.",
                    why = "Core amulet remaking Corruption into an overwhelming screen-clearing DoT.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases physical and spell damage dealt.",
                    why = "Flat spell damage scaling all active DoT ticks.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Seal of the Damned",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_51Naxxramas",
                    quality = 4,
                    benefit = "Faster DoT ticks",
                    stats = { "Faster DoT ticks" },
                    equip = "Significantly increases tick frequency of damage-over-time spells.",
                    why = "Essential ring multiplying tick rate of Corruption, Immolate, and Curse of Agony.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card offering rarity and gear upgrade drops.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Talisman of Ephemeral Power",
                    icon = "Interface\\Icons\\INV_Misc_StoneTablet_11",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces ability cooldowns.",
                    why = "Reduces cooldowns for smoother rotations and reapplications.",
                },
            },
            tactics = {
                "Invest every upgrade into Corruption (Top Priority, Rank 99).",
                "Only pick Immolate upgrades when offered +target.",
                "Pick Curse of Agony only if all other card offerings are bad.",
                "Banish Shadow Bolt, Drain Life, and Death Coil.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Pendant of the Plague.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- ROGUE
    -- ------------------------------------------------------------------------
    ROGUE = {
        {
            id = "rogue_crit",
            title = "Crit Strike",
            spec = "Assassination / Combat",
            role = "100% Critical Strike Burst Meta",
            summary = "Lethal critical strike specialist. Reaches 100% crit chance and giant crit multipliers to melt guardians and swarms with splashing critical hits.",
            focus = "Aim for 100% Crit Chance & min 200% Crit Dmg on trinkets. Upgrade Eviscerate early to kill mini-bosses/guardians until your legendary amulet drops, then upgrade from there. Eviscerate upgrade prio: +Target > Cooldown.",
            guideInfo = "|cffffd200Focus:|r Aim for 100% Crit Chance & min 200% Crit Dmg on trinkets. Upgrade Eviscerate early to kill mini-bosses/guardians until your legendary amulet drops, then upgrade from there. Eviscerate upgrade prio: +Target > Cooldown.\n|cffff6666Banish:|r Ghostly Strike, Adrenaline Rush, Slice and Dice.\n|cffffff00Rerolls:|r Only use rerolls on amulet/trinket/ring choices (Prio: Crit% > Crit Dmg% > HP for Heroic / Cooldown for Normal).\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Onyxia Tooth Pendant.",
            statPriority = "Critical Strike Chance > Critical Strike Damage > Damage > Cooldown Reduction",
            stats = {
                { name = "Critical Strike Chance", note = "Multiplies critical hit frequency to guarantee 100% crit cap (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Inflates critical multiplier to reach 200%+ target (Blackhand's Breadth)" },
                { name = "Damage", note = "Amplifies base weapon and all splashing damage (Earthstrike)" },
                { name = "Cooldown Reduction", note = "Accelerates Sinister Strike and Eviscerate cycle (Quick Strike Ring)" },
            },
            spells = {
                {
                    key = "sinister_strike",
                    name = "Sinister Strike",
                    icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Spam combo builder delivering heavy physical hits. Scales with your high critical rate.",
                },
                {
                    key = "eviscerate",
                    name = "Eviscerate",
                    icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                    school = "Physical",
                    prio = 2,
                    rankMax = 8,
                    reason = "Massive finishing burst to kill mini-bosses & guardians. Priority on upgrades: +Target > Cooldown.",
                },
                {
                    key = "backstab",
                    name = "Backstab",
                    icon = "Interface\\Icons\\Ability_BackStab",
                    school = "Physical",
                    prio = 3,
                    rankMax = 8,
                    reason = "Lethal physical strike dealing high critical multiplier damage.",
                },
                {
                    key = "ghostly_strike",
                    name = "Ghostly Strike",
                    icon = "Interface\\Icons\\Spell_Shadow_Curse",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep the upgrade pool focused on Sinister Strike and Eviscerate.",
                },
                {
                    key = "adrenaline_rush",
                    name = "Adrenaline Rush",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowWordDominate",
                    school = "Physical",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep the upgrade pool focused on Sinister Strike and Eviscerate.",
                },
                {
                    key = "slice_and_dice",
                    name = "Slice and Dice",
                    icon = "Interface\\Icons\\Ability_Rogue_SliceDice",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep the upgrade pool focused on Sinister Strike and Eviscerate.",
                },
            },
            jewelry = {
                neck = {
                    name = "Onyxia Tooth Pendant",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_09",
                    quality = 4,
                    slot = "Necklace",
                    benefit = "+4% Crit, +20% Crit Dmg, 30% Splash",
                    stats = { "+4% Crit", "+20% Crit Dmg", "30% Splash" },
                    equip = "+4% critical strike, +20% critical strike damage, Your critical hits splash 30% on enemies within 5 yd.",
                    why = "Essential capstone neck. Crits splash for 30% on nearby enemies, destroying swarms.",
                },
                ring1 = {
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    slot = "Finger",
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Pushes critical strike chance towards the 100% goal.",
                },
                ring2 = {
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    slot = "Finger",
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Decreases ability cooldowns for faster finishing moves.",
                },
                trinket1 = {
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    slot = "Trinket",
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage.",
                    why = "Crucial to achieve minimum 200% critical strike damage multiplier.",
                },
                trinket2 = {
                    name = "Earthstrike",
                    icon = "Interface\\Icons\\Spell_Nature_AbolishMagic",
                    quality = 4,
                    slot = "Trinket",
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases all physical and spell damage dealt.",
                    why = "Massive overall damage boost multiplying all splashing critical strikes.",
                },
            },
            tactics = {
                "Aim for 100% crit chance and minimum 200% crit damage on trinkets.",
                "Upgrade Eviscerate early to melt mini-bosses and guardians until your legendary amulet drops.",
                "Priority on Eviscerate upgrades: +Target > Cooldown reduction.",
                "Only use rerolls on amulet, trinket, and ring choices.",
                "Banish Ghostly Strike, Adrenaline Rush, and Slice and Dice.",
            },
        },
        {
            id = "rogue_backstab",
            title = "Backstab",
            spec = "Subtlety / Combat",
            role = "Backstab Single-Target Assassin Meta",
            summary = "Deadly single-target burst assassin. Remakes Backstab into a devastating piercing burst with massive critical multipliers and defensive sustain.",
            focus = "Max out Backstab (#1 Priority). Keep Eviscerate for finishing moves and Adrenaline Rush at Rank 1. Get 5 targets on Ghostly Strike and Kidney Shot before banishing.",
            guideInfo = "|cffffd200Focus:|r Max out Backstab (#1 Priority). Keep Eviscerate for finishing moves and Adrenaline Rush at Rank 1.\n|cffff6666Targets & Banish:|r Upgrade Ghostly Strike and Kidney Shot to 5 targets first, then banish both! Banish Slice and Dice.\n|cffffff00Options:|r Rings - Use Archimtiros' (DR) or Quick Strike (CDR) depending on difficulty. Amulets - Luck neck early or DR neck depending on difficulty before The Reaper's Amulet.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to The Reaper's Amulet.",
            statPriority = "Critical Strike Chance > Critical Strike Damage > Damage Reduction / Cooldowns > Luck",
            stats = {
                { name = "Critical Strike Chance", note = "Increases critical strike frequency for devastating Backstabs (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Massively inflates Backstab critical strike multiplier (Blackhand's Breadth)" },
                { name = "Damage Reduction / Max Health", note = "Protects against lethal melee hits during high difficulties (Archimtiros' Ring of Reckoning)" },
                { name = "Luck", note = "Increases rare card offerings and equipment upgrades (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "backstab",
                    name = "Backstab",
                    icon = "Interface\\Icons\\Ability_BackStab",
                    school = "Physical",
                    prio = 1,
                    rankMax = 90,
                    reason = "Core damage ability remade by The Reaper's Amulet. All card upgrades go here.",
                },
                {
                    key = "eviscerate",
                    name = "Eviscerate",
                    icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                    school = "Physical",
                    prio = 2,
                    rankMax = 8,
                    reason = "Secondary finishing burst to spend combo points and finish off tough enemies.",
                },
                {
                    key = "adrenaline_rush",
                    name = "Adrenaline Rush",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowWordDominate",
                    school = "Physical",
                    prio = 3,
                    rankMax = 1,
                    reason = "Kept at Rank 1 for increased energy regeneration and attack tempo.",
                },
                {
                    key = "slice_and_dice",
                    name = "Slice and Dice",
                    icon = "Interface\\Icons\\Ability_Rogue_SliceDice",
                    school = "Physical",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep the upgrade pool focused on Backstab.",
                },
                {
                    key = "ghostly_strike",
                    name = "Ghostly Strike",
                    icon = "Interface\\Icons\\Spell_Shadow_Curse",
                    school = "Physical",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Get 5 targets on Ghostly Strike first, then banish!",
                },
                {
                    key = "kidney_shot",
                    name = "Kidney Shot",
                    icon = "Interface\\Icons\\Ability_Rogue_KidneyShot",
                    school = "Physical",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Get 5 targets on Kidney Shot first, then banish!",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Backstab",
                    name = "The Reaper's Amulet",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_19",
                    quality = 5,
                    benefit = "Remakes Backstab",
                    desc = "Legendary amulet - remakes Backstab\nBackstab deals devastating damage and pierces through enemies.",
                    equip = "Legendary amulet - remakes Backstab. Backstab deals devastating damage and pierces through enemies.",
                    why = "Core legendary amulet required for the Backstab build.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Ensures frequent Backstab critical strikes.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Archimtiros' Ring of Reckoning",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15",
                    quality = 4,
                    benefit = "+4.4% Dmg Red, +18% Max HP",
                    stats = { "+4.4% Damage Reduction", "+18% Max Health" },
                    equip = "Reduces damage taken and increases maximum health.",
                    why = "Crucial defensive sustain for higher difficulty runs. Can swap to Quick Strike Ring for normal runs.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage.",
                    why = "Multiplies Backstab critical damage for huge single-target burst.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck, boosting rare card offerings and equipment drops.",
                    why = "Provides high luck to quickly find The Reaper's Amulet and high-tier upgrades.",
                },
            },
            tactics = {
                "Max out Backstab (#1 Priority) - invest all available card upgrades into Backstab.",
                "Upgrade Ghostly Strike and Kidney Shot to 5 targets first, then banish them.",
                "Keep Adrenaline Rush at Rank 1 for the energy regeneration buff.",
                "Use Archimtiros' Ring for Damage Reduction on hard difficulties or Quick Strike Ring for Cooldowns on normal.",
                "Banish Slice and Dice immediately.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- SHAMAN
    -- ------------------------------------------------------------------------
    SHAMAN = {
        {
            id = "shaman_magma_totem",
            title = "Magma Totem",
            spec = "Elemental / Restoration",
            role = "Pulsing Volcanic Totem Swarm Burner Meta",
            summary = "Volcanic fire totem master. Powered by Amulet of the Ancients, Magma Totem radiates destructive pulses of fire that incinerate hordes of advancing enemies.",
            focus = "Invest all upgrades into Magma Totem (#1 Priority). Keep Healing Wave for sustain and Lightning Bolt for ranged support. Banish Lightning Shield, Searing Totem, and Fire Nova.",
            guideInfo = "|cffffd200Focus:|r Put all upgrades into Magma Totem (#1 Priority). Keep Healing Wave for survival and Lightning Bolt for ranged support.\n|cffff6666Banish:|r Lightning Shield, Searing Totem, Fire Nova.\n|cffffff00Gear:|r Master Dragonslayer's Ring + Quick Strike Ring for high crit & CDR. Blackhand's Breadth + Earthstrike for massive damage multiplier.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Amulet of the Ancients (Magma Totem).",
            statPriority = "Fire Spell Damage > Critical Strike Chance > Critical Strike Damage > Cooldown Reduction",
            stats = {
                { name = "Fire Spell Damage", note = "Directly increases pulse damage of Magma Totem" },
                { name = "Critical Strike Chance", note = "Guarantees frequent fiery critical pulses (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Massively inflates Magma Totem critical damage (Blackhand's Breadth)" },
                { name = "Damage", note = "Amplifies overall fire and spell damage output (Earthstrike)" },
                { name = "Cooldown Reduction", note = "Accelerates totem cooldown and shock recovery (Quick Strike Ring)" },
            },
            spells = {
                {
                    key = "magma_totem",
                    name = "Magma Totem",
                    icon = "Interface\\Icons\\Spell_Fire_SelfDestruct",
                    school = "Fire",
                    prio = 1,
                    rankMax = 90,
                    reason = "Core volcanic ability remade by Amulet of the Ancients. Invest all card upgrades here!",
                },
                {
                    key = "healing_wave",
                    name = "Healing Wave",
                    icon = "Interface\\Icons\\Spell_Nature_MagicImmunity",
                    school = "Nature",
                    prio = 2,
                    rankMax = 8,
                    reason = "Primary survival heal to keep your health topped off in swarms.",
                },
                {
                    key = "lightning_bolt",
                    name = "Lightning Bolt",
                    icon = "Interface\\Icons\\Spell_Nature_Lightning",
                    school = "Nature",
                    prio = 3,
                    rankMax = 8,
                    reason = "Single-target nature projectile for elite and boss damage.",
                },
                {
                    key = "lightning_shield",
                    name = "Lightning Shield",
                    icon = "Interface\\Icons\\Spell_Nature_LightningShield",
                    school = "Nature",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Magma Totem.",
                },
                {
                    key = "searing_totem",
                    name = "Searing Totem",
                    icon = "Interface\\Icons\\Spell_Fire_SearingTotem",
                    school = "Fire",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Magma Totem.",
                },
                {
                    key = "fire_nova",
                    name = "Fire Nova",
                    icon = "Interface\\Icons\\Spell_Fire_SealOfFire",
                    school = "Fire",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Magma Totem.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Magma Totem",
                    name = "Amulet of the Ancients",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_07",
                    quality = 5,
                    benefit = "Remakes Magma Totem",
                    desc = "Legendary amulet - remakes Magma Totem\nMagma Totem pulses with immense fiery volcanic force across the battlefield.",
                    equip = "Legendary amulet - remakes Magma Totem. Magma Totem pulses with immense fiery volcanic force across the battlefield.",
                    why = "Core legendary amulet that powers up Magma Totem into a devastating pulse.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Multiplies critical strike frequency across all Magma Totem pulses.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Accelerates totem replacement and spell cooldown recovery.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage.",
                    why = "Massively inflates fiery critical strike damage multiplier.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Earthstrike",
                    icon = "Interface\\Icons\\Spell_Nature_AbolishMagic",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases physical and spell damage dealt.",
                    why = "Flat damage boost multiplying all Magma Totem fiery waves.",
                },
            },
            tactics = {
                "Put all card upgrades into Magma Totem (#1 Priority).",
                "Keep Healing Wave and Lightning Bolt for survival and single-target support.",
                "Banish Lightning Shield, Searing Totem, and Fire Nova immediately.",
            },
        },
        {
            id = "shaman_earth_shock",
            title = "Earth Shock",
            spec = "Elemental / Enhancement",
            role = "Earth Shock Rapid Burst & Stun Meta",
            summary = "Earth Shock burst specialist. Remakes Earth Shock into a devastating low-cooldown nuke backed by Frost Shock and Chain Lightning.",
            focus = "Prio: Earth Shock > Frost Shock > Chain Lightning. Take +Targets for Frost Shock. Once Eye of the Splitting Sky drops, full pivot into Earth Shock.",
            banish = { "Lightning Bolt", "Flame Shock", "Healing Wave" },
            guideInfo = "|cffffd200Focus:|r Prio: Earth Shock > Frost Shock > Chain Lightning. Take +Targets for Frost Shock.\n|cffffff00Pivot:|r Once you get Eye of the Splitting Sky (Earth Shock), full pivot and put all upgrades into Earth Shock.\n|cffff6666Banish:|r Lightning Bolt, Flame Shock, Healing Wave.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky (Earth Shock).",
            statPriority = "Nature / Frost Spell Damage > Cooldown Reduction > Critical Strike Chance > Critical Strike Damage",
            stats = {
                { name = "Nature / Frost Spell Damage", note = "Directly scales Earth Shock and Frost Shock" },
                { name = "Cooldown Reduction", note = "Accelerates Earth Shock firing rate (Quick Strike Ring)" },
                { name = "Critical Strike Chance", note = "Guarantees frequent elemental crits (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Amplifies Earth Shock critical hits (Blackhand's Breadth)" },
                { name = "Luck", note = "Increases rare card offerings and equipment drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "earth_shock",
                    name = "Earth Shock",
                    icon = "Interface\\Icons\\Spell_Nature_EarthShock",
                    school = "Nature",
                    prio = 1,
                    rankMax = 90,
                    reason = "Core damage nuke remade by Eye of the Splitting Sky. Priority #1!",
                },
                {
                    key = "frost_shock",
                    name = "Frost Shock",
                    icon = "Interface\\Icons\\Spell_Frost_FrostShock",
                    school = "Frost",
                    prio = 2,
                    rankMax = 8,
                    reason = "Secondary shock with slow. Take +Targets upgrades if offered.",
                },
                {
                    key = "chain_lightning",
                    name = "Chain Lightning",
                    icon = "Interface\\Icons\\Spell_Nature_ChainLightning",
                    school = "Nature",
                    prio = 3,
                    rankMax = 8,
                    reason = "Tertiary multi-target damage.",
                },
                {
                    key = "lightning_bolt",
                    name = "Lightning Bolt",
                    icon = "Interface\\Icons\\Spell_Nature_Lightning",
                    school = "Nature",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep upgrades focused on Earth Shock.",
                },
                {
                    key = "flame_shock",
                    name = "Flame Shock",
                    icon = "Interface\\Icons\\Spell_Fire_FlameShock",
                    school = "Fire",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep upgrades focused on Earth Shock.",
                },
                {
                    key = "healing_wave",
                    name = "Healing Wave",
                    icon = "Interface\\Icons\\Spell_Nature_MagicImmunity",
                    school = "Nature",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep upgrades focused on Earth Shock.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Earth Shock",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02",
                    quality = 5,
                    benefit = "Remakes Earth Shock",
                    desc = "Legendary amulet - remakes Earth Shock\nReduces Earth Shock cooldown by 20% and increases damage by 25%.",
                    equip = "Legendary amulet - remakes Earth Shock. Reduces Earth Shock cooldown by 20% and increases damage by 25%.",
                    why = "Core legendary amulet that powers up Earth Shock.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Enables rapid Earth Shock cycles.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Guarantees frequent Earth Shock crits.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card upgrade rarity and gear drops.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage.",
                    why = "Multiplies Earth Shock critical hits.",
                },
            },
            tactics = {
                "Priority: Earth Shock > Frost Shock > Chain Lightning.",
                "If Frost Shock +Target card appears, take it.",
                "Once you get Eye of the Splitting Sky (Earth Shock), full pivot and put all upgrades into Earth Shock.",
                "Banish Lightning Bolt, Flame Shock, and Healing Wave.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- PRIEST
    -- ------------------------------------------------------------------------
    PRIEST = {
        {
            id = "priest_mind_blast",
            title = "Mind Blast",
            spec = "Shadow / Discipline",
            role = "Mind Blast Shadow Burst Meta",
            summary = "Devastating single-target shadow nuker. Powered by Eye of the Splitting Sky and Shadowform, Mind Blast obliterates bosses and swarms backed by strong Power Word: Shield absorption.",
            focus = "Put all upgrades into Mind Blast. Keep PW:Shield at Rank 5 for defense and SW:Pain at Rank 1 for Shadow Weaving. Banish Mind Flay, Devouring Plague, and Psychic Scream.",
            guideInfo = "|cffffd200Focus:|r Put all upgrades into Mind Blast. Keep PW:Shield at Rank 5 for defense and SW:Pain at Rank 1 for Shadow Weaving.\n|cffff6666Card Prio:|r Leg. Mind Blast > Target Mind Blast > Target SW:Pain > other Mind Blast cards. (Take Leg. PW:Shield if survivability is needed).\n|cffff3333Banish:|r Mind Flay, Devouring Plague, Psychic Scream.\n|cff00ff00Tip:|r Wear a Luck neck early before switching to Eye of the Splitting Sky (Mind Blast). Aim for >50% Crit Chance before stacking Crit Dmg.",
            statPriority = "Shadow Spell Damage > Cooldown Reduction > Critical Strike Chance > Critical Strike Damage",
            stats = {
                { name = "Shadow Spell Damage", note = "Increases Mind Blast base damage and scaling formulas" },
                { name = "Cooldown Reduction", note = "Accelerates Mind Blast and Power Word: Shield recovery (Quick Strike Ring)" },
                { name = "Critical Strike Chance", note = "Guarantees frequent Shadow crits (>50% soft cap) (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Amplifies Mind Blast critical hits (Blackhand's Breadth)" },
            },
            spells = {
                {
                    key = "sw_pain",
                    name = "Shadow Word: Pain",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
                    school = "Shadow",
                    prio = 1,
                    rankMax = 1,
                    reason = "Kept at Rank 1 to continuously apply Shadow Weaving debuff across enemies.",
                },
                {
                    key = "pw_shield",
                    name = "Power Word: Shield",
                    icon = "Interface\\Icons\\Spell_Holy_PowerWordShield",
                    school = "Holy",
                    prio = 2,
                    rankMax = 5,
                    reason = "Essential defensive shield kept at Rank 5 for survivability.",
                },
                {
                    key = "mind_blast",
                    name = "Mind Blast",
                    icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
                    school = "Shadow",
                    prio = 3,
                    rankMax = 90,
                    reason = "Core damage nuke remade by Eye of the Splitting Sky. Invest all card upgrades here!",
                },
                {
                    key = "mind_flay",
                    name = "Mind Flay",
                    icon = "Interface\\Icons\\Spell_Shadow_SiphonMana",
                    school = "Shadow",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish immediately to keep upgrade pool focused on Mind Blast.",
                },
                {
                    key = "devouring_plague",
                    name = "Devouring Plague",
                    icon = "Interface\\Icons\\Spell_Shadow_BlackPlague",
                    school = "Shadow",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish immediately to keep upgrade pool focused on Mind Blast.",
                },
                {
                    key = "psychic_scream",
                    name = "Psychic Scream",
                    icon = "Interface\\Icons\\Spell_Shadow_PsychicScream",
                    school = "Shadow",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish immediately to keep upgrade pool focused on Mind Blast.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Mind Blast",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_21",
                    quality = 5,
                    benefit = "Remakes Mind Blast",
                    desc = "Legendary amulet - remakes Mind Blast\nMind Blast deals devastating burst damage with reduced cooldown.",
                    equip = "Legendary amulet - remakes Mind Blast. Mind Blast deals devastating burst damage with reduced cooldown.",
                    why = "Essential legendary amulet powering the entire Mind Blast build.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities and spells.",
                    why = "Enables rapid Mind Blast casts and frequent Shield refreshes.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Pushes spell crit above 50% for consistent Mind Blast crits.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage.",
                    why = "Multiplies Mind Blast critical hits into devastating blows.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck, boosting rare card offerings and equipment drops.",
                    why = "Provides high luck to quickly find Eye of the Splitting Sky and high-tier upgrades.",
                },
            },
            tactics = {
                "Put all card upgrades into Mind Blast (#1 Priority).",
                "Keep Power Word: Shield at Rank 5 for survivability and Shadow Word: Pain at Rank 1.",
                "Card upgrade priority: Legendary Mind Blast > Target Mind Blast > Target SW:Pain > other Mind Blast cards.",
                "Take Legendary Power Word: Shield if extra survivability is needed.",
                "Banish Mind Flay, Devouring Plague, and Psychic Scream.",
            },
        },
        {
            id = "priest_mind_flay",
            title = "Mind Flay",
            spec = "Shadow / Discipline",
            role = "Channeled Shadow Waveclear & Slow Meta",
            summary = "Channeled shadow beam master. Powered by Breath of the Black Dragon and Seal of the Damned, Mind Flay melts and slows screens of enemies with accelerated tick rates.",
            focus = "Invest all upgrades into Mind Flay (#1 Priority). Keep SW:Pain and Mind Blast for secondary DPS. Banish Devouring Plague, Psychic Scream, and Holy Fire.",
            guideInfo = "|cffffd200Focus:|r Put all upgrades into Mind Flay (#1 Priority). Shadow Word: Pain & Mind Blast provide secondary DPS.\n|cffff6666Banish:|r Devouring Plague, Psychic Scream, Holy Fire. (Optionally get Psychic Scream CDR to 2.5s for constant fear before banishing).\n|cffffff00Gear:|r Seal of the Damned accelerates DoT ticks; Band of Accuria boosts raw damage; Talisman lowers cooldowns.\n|cff00ff00Tip:|r Wear a Luck neck early before switching to Breath of the Black Dragon (Mind Flay).",
            statPriority = "Shadow Spell Damage > DoT Tick Rate > Damage > Cooldown Reduction > Luck",
            stats = {
                { name = "Shadow Spell Damage", note = "Directly increases Mind Flay beam damage and SW:Pain ticks" },
                { name = "DoT Tick Speed", note = "Accelerates channel ticks and damage frequency (Seal of the Damned)" },
                { name = "Damage", note = "Amplifies overall spell damage multiplier (Band of Accuria)" },
                { name = "Cooldown Reduction", note = "Reduces spell cooldowns and cast cycling (Talisman of Ephemeral Power)" },
                { name = "Luck", note = "Boosts rare offering rates and equipment upgrades (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "mind_flay",
                    name = "Mind Flay",
                    icon = "Interface\\Icons\\Spell_Shadow_SiphonMana",
                    school = "Shadow",
                    prio = 1,
                    rankMax = 90,
                    reason = "Core channeled ability remade by Breath of the Black Dragon. Invest all card upgrades here!",
                },
                {
                    key = "sw_pain",
                    name = "Shadow Word: Pain",
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
                    school = "Shadow",
                    prio = 2,
                    rankMax = 8,
                    reason = "Spreads continuous shadow periodic damage across advancing mobs.",
                },
                {
                    key = "mind_blast",
                    name = "Mind Blast",
                    icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy",
                    school = "Shadow",
                    prio = 3,
                    rankMax = 8,
                    reason = "High-impact single-target shadow burst against elites and bosses.",
                },
                {
                    key = "devouring_plague",
                    name = "Devouring Plague",
                    icon = "Interface\\Icons\\Spell_Shadow_BlackPlague",
                    school = "Shadow",
                    prio = 4,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Mind Flay.",
                },
                {
                    key = "psychic_scream",
                    name = "Psychic Scream",
                    icon = "Interface\\Icons\\Spell_Shadow_PsychicScream",
                    school = "Shadow",
                    prio = 5,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish (or optionally get 2.5s CDR for perm-fear before banishing).",
                },
                {
                    key = "holy_fire",
                    name = "Holy Fire",
                    icon = "Interface\\Icons\\Spell_Holy_SearingLight",
                    school = "Holy",
                    prio = 6,
                    banished = true,
                    rankMax = 1,
                    reason = "Banish to keep card pool focused on Mind Flay.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Mind Flay",
                    name = "Breath of the Black Dragon",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_17",
                    quality = 5,
                    benefit = "Remakes Mind Flay",
                    desc = "Legendary amulet - remakes Mind Flay\nMind Flay channels rapid multi-target shadow beams slowing and destroying enemies.",
                    equip = "Legendary amulet - remakes Mind Flay. Mind Flay channels rapid multi-target shadow beams slowing and destroying enemies.",
                    why = "Core legendary amulet that remakes Mind Flay into an AoE shredder.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_03",
                    quality = 4,
                    benefit = "+26% Damage",
                    stats = { "+26% Damage" },
                    equip = "Increases all damage dealt.",
                    why = "Massive overall damage amplifier.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Seal of the Damned",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_51Naxxramas",
                    quality = 4,
                    benefit = "Faster DoT ticks",
                    stats = { "Faster DoT ticks" },
                    equip = "Your damage over time spells tick faster.",
                    why = "Significantly accelerates Mind Flay ticks and DoT tick rate.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck, boosting rare card offerings and equipment drops.",
                    why = "Provides high luck to quickly find Breath of the Black Dragon and high-tier upgrades.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Talisman of Ephemeral Power",
                    icon = "Interface\\Icons\\INV_Misc_StoneTablet_11",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces the cooldown of all abilities.",
                    why = "Allows constant Mind Blast and utility spell cycling.",
                },
            },
            tactics = {
                "Put all card upgrades into Mind Flay (#1 Priority).",
                "Shadow Word: Pain and Mind Blast provide supplementary single-target and multi-target DPS.",
                "Optionally get Psychic Scream cooldown down to 2.5-3s before banishing to keep mobs constantly feared.",
                "Banish Devouring Plague, Psychic Scream, and Holy Fire.",
            },
        },
    },

    -- ------------------------------------------------------------------------
    -- DRUID
    -- ------------------------------------------------------------------------
    DRUID = {
        {
            id = "druid_starfire_moonkin",
            title = "Starfire Moonkin",
            spec = "Balance / Restoration",
            role = "Starfire Massive Astral Splash & Lunar Burst Meta",
            summary = "Balance Starfire astral devastation specialist. Remakes Starfire via Eye of the Splitting Sky into colossal splashing astral blasts backed by rapid-fire Wrath and Moonfire.",
            focus = "Everything into Starfire (#1 Priority, Max Rank). Keep Wrath & Moonfire for supporting DPS. Banish Regrowth, Faerie Fire, and Insect Swarm.",
            banish = { "Regrowth", "Faerie Fire", "Insect Swarm" },
            guideInfo = "|cffffd200Focus:|r Everything into Starfire (#1 Priority). Put all card upgrades into Starfire. Keep Wrath & Moonfire for supporting DPS.\n|cffff6666Banish:|r Regrowth, Faerie Fire, Insect Swarm.\n|cffffff00Gear:|r Eye of the Splitting Sky remakes Starfire into massive splashing astral blasts; Dragonslayer's Ring & Blackhand's Breadth give 100% crit and huge crit damage; Quick Strike Ring reduces cooldowns.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky (Starfire).",
            statPriority = "Critical Strike Chance > Critical Strike Damage > Cooldown Reduction > Luck",
            stats = {
                { name = "Critical Strike Chance", note = "Drives Starfire and Wrath critical hit frequency (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Multiplies astral crits with Vengeance talent for colossal damage (Blackhand's Breadth)" },
                { name = "Cooldown Reduction", note = "Accelerates cast cycle and reduces interval between Starfire strikes (Quick Strike Ring)" },
                { name = "Luck", note = "Increases card offering rarity and gear upgrade drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "starfire",
                    name = "Starfire",
                    icon = "Interface\\Icons\\Spell_Arcane_StarFire",
                    school = "Arcane",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Remade by Eye of the Splitting Sky. Everything into Starfire!",
                },
                {
                    key = "wrath",
                    name = "Wrath",
                    icon = "Interface\\Icons\\Spell_Nature_AbolishPoison",
                    school = "Nature",
                    prio = 2,
                    rankMax = 90,
                    reason = "Priority (#2) - Secondary DPS projectile chipping away at advancing waves.",
                },
                {
                    key = "moonfire",
                    name = "Moonfire",
                    icon = "Interface\\Icons\\Spell_Nature_StarFall",
                    school = "Arcane",
                    prio = 3,
                    rankMax = 90,
                    reason = "Priority (#3) - Instant lunar strike providing continuous burn damage.",
                },
                {
                    key = "regrowth",
                    name = "Regrowth",
                    icon = "Interface\\Icons\\Spell_Nature_ResistNature",
                    school = "Nature",
                    prio = 4,
                    rankMax = 8,
                    reason = "Banished - Banish early to maximize offensive card offerings.",
                },
                {
                    key = "faerie_fire",
                    name = "Faerie Fire",
                    icon = "Interface\\Icons\\Spell_Nature_FaerieFire",
                    school = "Nature",
                    prio = 5,
                    rankMax = 8,
                    reason = "Banished - Banish early.",
                },
                {
                    key = "insect_swarm",
                    name = "Insect Swarm",
                    icon = "Interface\\Icons\\Spell_Nature_InsectSwarm",
                    school = "Nature",
                    prio = 6,
                    rankMax = 8,
                    reason = "Banished - Banish early.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Starfire",
                    name = "Eye of the Splitting Sky",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03",
                    quality = 5,
                    benefit = "Remakes Starfire",
                    stats = { "Remakes Starfire" },
                    equip = "Legendary amulet - remakes Starfire so it splashes massive damage to nearby enemies.",
                    why = "Core amulet turning Starfire into a gigantic screen-splashing nuke.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07",
                    quality = 4,
                    benefit = "-14% Cooldowns",
                    stats = { "-14% Cooldowns" },
                    equip = "Reduces ability cooldowns.",
                    why = "Enables rapid recast and bombardment cycles.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Ensures nearly every Starfire and Wrath hits for critical astral damage.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage bonus.",
                    why = "Pairs with Vengeance talent to maximize catastrophic Starfire crits.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card offering rarity and gear upgrade drops.",
                },
            },
            tactics = {
                "Pump everything into Starfire (Top Priority #1).",
                "Keep Wrath and Moonfire as secondary DPS spells.",
                "Banish Regrowth, Faerie Fire, and Insect Swarm immediately.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Eye of the Splitting Sky (Starfire).",
            },
        },
        {
            id = "druid_hurricane_cat",
            title = "Hurricane Cat",
            spec = "Balance / Feral Combat",
            role = "AFK Screen-Wide Hurricane Tempest & Feral Opener Meta",
            summary = "Balance & Feral hybrid powerhouse. Starts with Shred & Swipe in Cat form for early kills, transitions into a screen-covering 70+ yd Hurricane with Amulet of the Inferno for an AFK playstyle.",
            focus = "Take Hurricane ASAP and go all-in on it (#1 Priority, Max Rank). Use Cat form (Shred/Swipe) early. Banish Swipe ASAP, then Shred once Hurricane carries you. Banish Moonfire last.",
            banish = { "Swipe", "Shred", "Moonfire" },
            guideInfo = "|cffffd200Focus:|r Start with Shred and Swipe in Cat form for early kills. Take Hurricane ASAP and go all-in on it (#1 Priority). Fill slots with Entangling Roots, Insect Swarm, and Moonfire.\n|cffff6666Banish:|r Ban Swipe ASAP, followed by Shred once Hurricane carries you. Ban Moonfire last.\n|cffffff00Gear:|r Amulet of the Inferno remakes Hurricane to cover the entire map (70+ yds); Seal of the Damned accelerates DoTs until ~40% cap; Master Dragonslayer's Ring & Blackhand's Breadth max out crit and crit damage.\n|cff00ff00Tip:|r Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Amulet of the Inferno (Hurricane).",
            statPriority = "Area Radius > Critical Strike Chance > Critical Strike Damage > DoT Tick Speed > Luck",
            stats = {
                { name = "Area Radius", note = "Enlarges Hurricane until it blankets the whole map at 70+ yards (Amulet of the Inferno)" },
                { name = "Critical Strike Chance", note = "Multiplies Hurricane and bleed damage crits (Master Dragonslayer's Ring)" },
                { name = "Critical Strike Damage", note = "Increases critical strike damage bonus (Blackhand's Breadth)" },
                { name = "DoT Tick Speed", note = "Speeds up Hurricane and Swarm damage ticks (Seal of the Damned until ~40% cap)" },
                { name = "Luck", note = "Boosts rare card offerings and item drops (Mark of the Chosen)" },
            },
            spells = {
                {
                    key = "hurricane",
                    name = "Hurricane",
                    icon = "Interface\\Icons\\Spell_Nature_Cyclone",
                    school = "Nature",
                    prio = 1,
                    rankMax = 90,
                    reason = "Top Priority (#1) - Remade by Amulet of the Inferno. Go all-in on Hurricane ASAP until it covers the map (70+ yds)!",
                },
                {
                    key = "insect_swarm",
                    name = "Insect Swarm",
                    icon = "Interface\\Icons\\Spell_Nature_InsectSwarm",
                    school = "Nature",
                    prio = 2,
                    rankMax = 90,
                    reason = "Priority (#2) - Fill slot, accelerates ticks with Seal of the Damned.",
                },
                {
                    key = "entangling_roots",
                    name = "Entangling Roots",
                    icon = "Interface\\Icons\\Spell_Nature_StrangleVines",
                    school = "Nature",
                    prio = 3,
                    rankMax = 90,
                    reason = "Priority (#3) - Traps enemies inside your massive Hurricane storm.",
                },
                {
                    key = "swipe",
                    name = "Swipe",
                    icon = "Interface\\Icons\\INV_Misc_MonsterClaw_03",
                    school = "Physical",
                    prio = 4,
                    rankMax = 8,
                    reason = "Banished - Lean on early in Cat form for kills, then banish ASAP.",
                },
                {
                    key = "shred",
                    name = "Shred",
                    icon = "Interface\\Icons\\Spell_Shadow_VampiricAura",
                    school = "Physical",
                    prio = 5,
                    rankMax = 8,
                    reason = "Banished - Lean on early in Cat form, banish once Hurricane carries you.",
                },
                {
                    key = "moonfire",
                    name = "Moonfire",
                    icon = "Interface\\Icons\\Spell_Nature_StarFall",
                    school = "Arcane",
                    prio = 6,
                    rankMax = 8,
                    reason = "Banished - Used as early filler, banish last.",
                },
            },
            jewelry = {
                neck = {
                    slotType = "NECK",
                    spell = "Hurricane",
                    name = "Amulet of the Inferno",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_19",
                    quality = 5,
                    benefit = "Remakes Hurricane",
                    stats = { "Remakes Hurricane" },
                    equip = "Legendary amulet - remakes Hurricane to expand across the entire map.",
                    why = "Core amulet transforming Hurricane into an AFK screen-clearing vortex.",
                },
                ring1 = {
                    slotType = "RING",
                    name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41",
                    quality = 4,
                    benefit = "+6% Critical Strike",
                    stats = { "+6% Critical Strike" },
                    equip = "Increases critical strike chance.",
                    why = "Maximizes critical strike rate across all Hurricane damage ticks.",
                },
                ring2 = {
                    slotType = "RING",
                    name = "Seal of the Damned",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_51Naxxramas",
                    quality = 4,
                    benefit = "Faster DoT ticks",
                    stats = { "Faster DoT ticks" },
                    equip = "Accelerates DoT and channel ticks (caps out around ~40%).",
                    why = "Dramatically accelerates Hurricane damage frequency.",
                },
                trinket1 = {
                    slotType = "TRINKET",
                    name = "Mark of the Chosen",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",
                    quality = 2,
                    benefit = "+22% Luck",
                    stats = { "+22% Luck" },
                    equip = "Increases luck.",
                    why = "Boosts card offering rarity and gear upgrade drops.",
                },
                trinket2 = {
                    slotType = "TRINKET",
                    name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09",
                    quality = 4,
                    benefit = "+29% Critical Strike Damage",
                    stats = { "+29% Critical Strike Damage" },
                    equip = "Increases critical strike damage bonus.",
                    why = "Massively amplifies critical strike damage in combination with Vengeance talent.",
                },
            },
            tactics = {
                "Start with Shred and Swipe in Cat form to get kills early on.",
                "Pick Hurricane ASAP and invest all upgrades into it (Priority #1).",
                "Banish Swipe ASAP, then banish Shred once Hurricane carries you.",
                "Banish Moonfire last; keep Insect Swarm and Entangling Roots to fill slots.",
                "Upgrade Seal of the Damned to ~40% tick rate, then focus on Crit, Crit Damage, and Luck.",
                "Early on, wear a +30% Luck / +25% Gold neck to level gear fast before switching to Amulet of the Inferno.",
            },
        },
    },
};

-- ----------------------------------------------------------------------------
-- Helper Functions & Lookups
-- ----------------------------------------------------------------------------

local function NormalizeText(str)
    if not str then return ""; end
    local s = string.lower(str);
    s = string.gsub(s, "[%s%p_]", "");
    return s;
end

-- Fast spell lookup across all builds: normalized name/key -> table of matching build spells
local spellLookup = {};
for classKey, buildList in pairs(BordoUI_BuildData.Builds) do
    for bIdx = 1, table.getn(buildList) do
        local build = buildList[bIdx];
        for sIdx = 1, table.getn(build.spells) do
            local sp = build.spells[sIdx];
            local normKey = NormalizeText(sp.key);
            local normName = NormalizeText(sp.name);
            spellLookup[normKey] = spellLookup[normKey] or {};
            table.insert(spellLookup[normKey], { classKey = classKey, buildIdx = bIdx, spell = sp });
            if normName ~= normKey then
                spellLookup[normName] = spellLookup[normName] or {};
                table.insert(spellLookup[normName], { classKey = classKey, buildIdx = bIdx, spell = sp });
            end
        end
    end
end
BordoUI_BuildData.SpellLookup = spellLookup;

-- Universal Racial Abilities Blacklist (WoW 1.12.1 / Turtle WoW - English & German)
-- Racials MUST NEVER be detected or slotted as class starter abilities or build priorities!
-- Canonical Spell Keys & Helpers (WoW 1.12.1 / Turtle WoW)
local SPELL_CANONICAL_KEYS = {
    ["powerwordshield"]     = "pw_shield",
    ["power_word_shield"]   = "pw_shield",
    ["pwshield"]            = "pw_shield",
    ["pw_shield"]           = "pw_shield",

    ["shadowwordpain"]      = "sw_pain",
    ["shadow_word_pain"]    = "sw_pain",
    ["swpain"]              = "sw_pain",
    ["sw_pain"]             = "sw_pain",

    ["demoralizingshout"]   = "demo_shout",
    ["demoralizing_shout"]  = "demo_shout",
    ["demoshout"]           = "demo_shout",
    ["demo_shout"]          = "demo_shout",

    ["huntersmark"]         = "hunters_mark",
    ["hunter_mark"]         = "hunters_mark",
    ["hunters_mark"]        = "hunters_mark",
    ["huntermark"]          = "hunters_mark",

    ["soulfire"]            = "soul_fire",
    ["soul_fire"]           = "soul_fire",

    ["judgment"]            = "judgement",
    ["judgement"]           = "judgement",
};

local function CanonicalSpellKey(str)
    if not str then return ""; end
    local clean = string.lower(string.gsub(tostring(str), "[^%a]", ""));
    return SPELL_CANONICAL_KEYS[clean] or clean;
end
BordoUI_CanonicalSpellKey = CanonicalSpellKey;

local function NormalizeIconPath(p)
    if not p then return ""; end
    return string.gsub(tostring(p), "/", "\\");
end

local function IconsMatch(iconA, iconB)
    if not (iconA and iconB) then return false; end
    local sA = string.lower(NormalizeIconPath(iconA));
    local sB = string.lower(NormalizeIconPath(iconB));
    if sA == sB then return true; end
    local _, _, fileA = string.find(sA, "([^\\\\]+)$");
    fileA = fileA or sA;
    local _, _, fileB = string.find(sB, "([^\\\\]+)$");
    fileB = fileB or sB;
    if fileA ~= "" and fileA ~= "inv_misc_questionmark" and fileA == fileB then
        return true;
    end
    return false;
end

local RACIAL_SPELLS = {
    ["BLOOD FURY"] = true,
    ["BERSERKING"] = true,
    ["WILL OF THE FORSAKEN"] = true,
    ["CANNIBALIZE"] = true,
    ["WAR STOMP"] = true,
    ["PERCEPTION"] = true,
    ["THE HUMAN SPIRIT"] = true,
    ["DIPLOMACY"] = true,
    ["STONEFORM"] = true,
    ["FIND TREASURE"] = true,
    ["GUN SPECIALIZATION"] = true,
    ["ESCAPE ARTIST"] = true,
    ["EXPANSIVE MIND"] = true,
    ["ENGINEERING SPECIALIZATION"] = true,
    ["SHADOWMELD"] = true,
    ["QUICKNESS"] = true,
    ["WISP SPIRIT"] = true,
    ["MEDITATION"] = true,
    ["ARCANE RESISTANCE"] = true,
    ["BEST BARGAIN"] = true,
    ["BETTER LIVING THROUGH CHEMISTRY"] = true,
    -- German localization
    ["BLUTRAUSCH"] = true,
    ["KRIEGSSTAMPFEN"] = true,
    ["SCHATTENMIME"] = true,
    ["ENTFESSELUNGSKÃœNSTLER"] = true,
    ["ENTFESSELUNGSKUNSTLER"] = true,
    ["WACHSAMKEIT"] = true,
    ["STEINGESTALT"] = true,
    ["KANNIBALISMUS"] = true,
    ["WILLE DER VERLASSENEN"] = true,
    ["MENSCHLICHER GEIST"] = true,
    ["DIPLOMATIE"] = true,
    ["SCHATZSUCHE"] = true,
    ["WACHER GEIST"] = true,
    ["SCHNELLIGKEIT"] = true,
    ["IRRWISCH-GEIST"] = true,
    ["IRRWISCHGEIST"] = true,
    ["ARKANWIDERSTAND"] = true,
};

function BordoUI_IsRacialSpell(name, key)
    if not name and not key then return false; end
    if name and RACIAL_SPELLS[string.upper(name)] then return true; end
    if key and RACIAL_SPELLS[string.upper(key)] then return true; end
    local cName = name and CanonicalSpellKey(name) or "";
    local cKey = key and CanonicalSpellKey(key) or "";
    if cName == "bloodfury" or cName == "escapeartist" or cName == "berserking"
       or cName == "willoftheforsaken" or cName == "warstomp" or cName == "stoneform"
       or cName == "shadowmeld" or cName == "cannibalize" or cName == "perception"
       or cName == "thehumanspirit" or cName == "diplomacy" or cName == "findtreasure"
       or cName == "gunspecialization" or cName == "expansivemind" or cName == "engineeringspecialization"
       or cName == "quickness" or cName == "wispspirit" or cName == "meditation"
       or cName == "arcaneresistance" or cName == "bestbargain" or cName == "betterlivingthroughchemistry"
       or cName == "blutrausch" or cName == "kriegsstampfen" or cName == "schattenmime"
       or cName == "entfesselungskunstler" or cName == "wachsamkeit" or cName == "steingestalt"
       or cName == "kannibalismus" or cName == "willederverlassenen" or cName == "menschlichergeist"
       or cName == "diplomatie" or cName == "schatzsuche" or cName == "wachergeist"
       or cName == "schnelligkeit" or cName == "irrwischgeist" or cName == "arkanwiderstand" then
        return true;
    end
    if cKey ~= "" then
        if cKey == "bloodfury" or cKey == "escapeartist" or cKey == "berserking"
           or cKey == "willoftheforsaken" or cKey == "warstomp" or cKey == "stoneform"
           or cKey == "shadowmeld" or cKey == "cannibalize" or cKey == "perception"
           or cKey == "thehumanspirit" or cKey == "diplomacy" or cKey == "findtreasure"
           or cKey == "gunspecialization" or cKey == "expansivemind" or cKey == "engineeringspecialization"
           or cKey == "quickness" or cKey == "wispspirit" or cKey == "meditation"
           or cKey == "arcaneresistance" or cKey == "bestbargain" or cKey == "betterlivingthroughchemistry" then
            return true;
        end
    end
    return false;
end

-- Check whether a spell strictly belongs to the specified class (prevents cross-class leakage)
function BordoUI_IsClassSpell(classKey, name, key, icon)
    if not classKey then return false; end
    local upper = string.upper(classKey);
    if BordoUI_IsRacialSpell(name, key) then return false; end
    if not name or name == "" or name == "Ability" then return false; end

    local cName = CanonicalSpellKey(name);
    local cKey = key and CanonicalSpellKey(key) or "";

    -- 1. Check StarterSpells
    local st = BordoUI_BuildData and BordoUI_BuildData.StarterSpells and BordoUI_BuildData.StarterSpells[upper];
    if st then
        local st1 = st[1] or st;
        if (st1.name and st1.name == name) or (cName ~= "" and CanonicalSpellKey(st1.name) == cName) or (cKey ~= "" and CanonicalSpellKey(st1.key) == cKey) or (icon and st1.icon and IconsMatch(st1.icon, icon)) then
            return true;
        end
    end

    -- 2. Check Catalog Spells (master list)
    local catList = BordoUI_Catalog and BordoUI_Catalog.Spells and (BordoUI_Catalog.Spells[upper] or BordoUI_Catalog.Spells[classKey]);
    if catList then
        for _, sp in ipairs(catList) do
            if (sp.name and sp.name == name) or (cName ~= "" and CanonicalSpellKey(sp.name) == cName) or (cKey ~= "" and CanonicalSpellKey(sp.key) == cKey) or (icon and sp.icon and IconsMatch(sp.icon, icon)) then
                return true;
            end
        end
    end

    -- 3. Check BordoUI_BuildData.Spells alias
    local bSpells = BordoUI_BuildData and BordoUI_BuildData.Spells and (BordoUI_BuildData.Spells[upper] or BordoUI_BuildData.Spells[classKey]);
    if bSpells and bSpells ~= catList then
        for _, sp in ipairs(bSpells) do
            if (sp.name and sp.name == name) or (cName ~= "" and CanonicalSpellKey(sp.name) == cName) or (cKey ~= "" and CanonicalSpellKey(sp.key) == cKey) or (icon and sp.icon and IconsMatch(sp.icon, icon)) then
                return true;
            end
        end
    end

    -- 4. Check class default build spells
    local defBuilds = BordoUI_BuildData and BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[upper];
    if defBuilds then
        for bI = 1, table.getn(defBuilds) do
            local bDef = defBuilds[bI];
            if bDef and bDef.spells then
                for sI = 1, table.getn(bDef.spells) do
                    local sp = bDef.spells[sI];
                    if sp and ((sp.name and sp.name == name) or (cName ~= "" and CanonicalSpellKey(sp.name) == cName) or (cKey ~= "" and CanonicalSpellKey(sp.key) == cKey) or (icon and sp.icon and IconsMatch(sp.icon, icon))) then
                        return true;
                    end
                end
            end
        end
    end

    return false;
end

-- Multi-Starter Live Helper: Retrieve current live detected starters for a class (strictly sanitized)
function BordoUI_GetLiveStartersList(classKey)
    local cUpper = string.upper(classKey or "WARRIOR");
    local curLive = BordoUIDB and BordoUIDB.liveStarters and BordoUIDB.liveStarters[cUpper];
    local cleanList = {};

    if curLive and curLive.starters and table.getn(curLive.starters) > 0 then
        for _, st in ipairs(curLive.starters) do
            if st and st.name and BordoUI_IsClassSpell(cUpper, st.name, st.key, st.icon) then
                table.insert(cleanList, st);
            end
        end
        if table.getn(cleanList) > 0 then
            return cleanList;
        end
    end

    if curLive and (curLive.starter1 or curLive.starter2) then
        for s = 1, 6 do
            local st = curLive["starter" .. s];
            if st and st.name and BordoUI_IsClassSpell(cUpper, st.name, st.key, st.icon) then
                table.insert(cleanList, st);
            end
        end
        if table.getn(cleanList) > 0 then
            return cleanList;
        end
    end

    local baseStarter = BordoUI_BuildData and BordoUI_BuildData.StarterSpells and BordoUI_BuildData.StarterSpells[cUpper];
    if baseStarter then
        local st1 = baseStarter[1] or baseStarter;
        return {
            {
                name = st1.name,
                key = st1.key or string.lower(string.gsub(st1.name, "[%s%p_]", "")),
                icon = st1.icon,
                school = st1.school or "Physical",
                isStarter = true,
                slot = 1,
            }
        };
    end
    return {};
end

-- Multi-Starter Dynamic Synchronizer: Places K starters into open slots and protects customized user builds
function BordoUI_SyncBuildStarters(cb, startersList, classKey)
    if not (cb and cb.spells and startersList) then return; end
    if not cb.isCustom then return; end -- Preset builds (Tab 1 & 2) must remain 100% immutable
    local cUpper = classKey and string.upper(classKey);
    if not cUpper and cb.id then
        local _, _, parsedCls = string.find(cb.id, "^custom_([^_]+)_");
        if parsedCls then cUpper = string.upper(parsedCls); end
    end
    if not cUpper then return; end

    local numStarters = table.getn(startersList);
    if numStarters <= 0 then return; end
    if numStarters > 6 then numStarters = 6; end

    -- Sanitize cb.spells: Purge any spells that do not belong to this class, are racials, or are generic "Ability"
    for s = 1, 6 do
        local sp = cb.spells[s];
        if sp then
            if BordoUI_IsRacialSpell(sp.name, sp.key) or not BordoUI_IsClassSpell(cUpper, sp.name, sp.key, sp.icon) or sp.name == "Ability" or sp.name == "" then
                cb.spells[s] = nil;
            end
        end
    end

    -- Process each starter spell:
    for i = 1, numStarters do
        local st = startersList[i];
        if st and st.name and BordoUI_IsClassSpell(cUpper, st.name, st.key, st.icon) then
            local existingSlot = nil;
            for sIdx = 1, 6 do
                local sp = cb.spells[sIdx];
                if sp and (sp.name == st.name or (sp.key and sp.key == st.key)) then
                    existingSlot = sIdx;
                    sp.isStarter = true;
                    sp.icon = st.icon or sp.icon;
                    sp.school = st.school or sp.school;
                    break;
                end
            end

            -- If starter is not anywhere in the build yet:
            -- If user has NOT manually customized/locked this build, place into open slot:
            if not existingSlot and not cb.userModified then
                local targetSlot = nil;
                if not cb.spells[i] and not (cb.clearedSlots and cb.clearedSlots[i]) then
                    targetSlot = i;
                else
                    for s = 1, 6 do
                        if not cb.spells[s] and not (cb.clearedSlots and cb.clearedSlots[s]) then
                            targetSlot = s;
                            break;
                        end
                    end
                end

                if targetSlot then
                    cb.spells[targetSlot] = {
                        key = st.key or string.lower(string.gsub(st.name, "[%s%p_]", "")),
                        name = st.name,
                        icon = st.icon,
                        school = st.school or "Physical",
                        prio = targetSlot,
                        rankMax = 8,
                        reason = "Class starter ability #" .. i .. " (Action Bar Slot " .. (st.slot or i) .. ")",
                        isStarter = true,
                    };
                end
            end
        end
    end
end

function BordoUI_GetClassBuilds(classKey)
    if not classKey then return nil; end
    local upper = string.upper(classKey);
    BordoUIDB = BordoUIDB or {};
    BordoUIDB.customBuilds = BordoUIDB.customBuilds or {};
    if not BordoUIDB.customBuilds[upper] then
        BordoUIDB.customBuilds[upper] = {};
    end

    local cInfo = BordoUI_BuildData and BordoUI_BuildData.Classes and BordoUI_BuildData.Classes[upper];
    local cName = (cInfo and cInfo.name) or upper;
    local defTalents = (BordoUI_BuildData and BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[upper] and BordoUI_BuildData.Builds[upper][1] and BordoUI_BuildData.Builds[upper][1].talents);

    -- 1 & 2: The Two Fixed Preset Meta Builds for this class
    local pBuild1 = BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[upper] and BordoUI_BuildData.Builds[upper][1];
    local pBuild2 = BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[upper] and BordoUI_BuildData.Builds[upper][2];
    if pBuild1 then pBuild1.isCustom = false; end
    if pBuild2 then pBuild2.isCustom = false; end

    if not pBuild1 then
        pBuild1 = {
            id = "preset_" .. string.lower(upper) .. "_1",
            title = cName .. " Meta 1",
            role = "Preset Meta 1",
            spells = {},
            jewelry = {},
            talents = defTalents,
            isCustom = false,
        };
    end
    if not pBuild2 then
        pBuild2 = {
            id = "preset_" .. string.lower(upper) .. "_2",
            title = cName .. " Meta 2",
            role = "Preset Meta 2",
            spells = {},
            jewelry = {},
            talents = defTalents,
            isCustom = false,
        };
    end

    -- 3: The Custom Build for this class (saved in BordoUIDB.customBuilds)
    local customObj = nil;
    if BordoUIDB.customBuilds[upper][3] and type(BordoUIDB.customBuilds[upper][3]) == "table" then
        customObj = BordoUIDB.customBuilds[upper][3];
    elseif BordoUIDB.customBuilds[upper][1] and type(BordoUIDB.customBuilds[upper][1]) == "table" and BordoUIDB.customBuilds[upper][1].isCustom then
        customObj = BordoUIDB.customBuilds[upper][1];
        BordoUIDB.customBuilds[upper][3] = customObj;
    elseif BordoUIDB.customBuilds[upper].spells or BordoUIDB.customBuilds[upper].title then
        customObj = BordoUIDB.customBuilds[upper];
        BordoUIDB.customBuilds[upper] = { [3] = customObj };
    end

    if not customObj then
        customObj = {
            id = "custom_" .. string.lower(upper),
            name = cName .. " Custom Build",
            title = "Custom Build",
            role = "Custom Build",
            tag = "[Custom Build]",
            desc = "Your custom crafted " .. cName .. " build. Click spells or jewelry slots to configure pick priorities.",
            statPriority = "Custom Stat Priority",
            isCustom = true,
            spells = {},
            jewelry = {},
            talents = defTalents,
        };
        BordoUIDB.customBuilds[upper][3] = customObj;
    end
    customObj.isCustom = true;
    if not customObj.title or customObj.title == "Build 1" or customObj.title == "Build 3" then
        customObj.title = "Custom Build";
    end

    local startersList = BordoUI_GetLiveStartersList and BordoUI_GetLiveStartersList(upper);
    if customObj and customObj.spells and startersList and BordoUI_SyncBuildStarters then
        for sIdx = 1, 6 do
            local sp = customObj.spells[sIdx];
            if sp then
                if BordoUI_IsRacialSpell(sp.name, sp.key) or not BordoUI_IsClassSpell(upper, sp.name, sp.key, sp.icon) or sp.name == "Ability" or sp.name == "" then
                    customObj.spells[sIdx] = nil;
                elseif not sp.rankMax or sp.rankMax <= 5 then
                    sp.rankMax = 8;
                end
            end
        end
        BordoUI_SyncBuildStarters(customObj, startersList, upper);
    end

    local list = {
        [1] = pBuild1,
        [2] = pBuild2,
        [3] = customObj,
    };
    return list;
end

function BordoUI_GetActiveBuild()
    BordoUIDB = BordoUIDB or {};
    if not BordoUIDB.activeBuild or not BordoUIDB.activeBuild.classKey then
        return nil, nil, nil;
    end

    local actClass = BordoUIDB.activeBuild.classKey;
    local actIdx = tonumber(BordoUIDB.activeBuild.buildIdx) or 1;
    if actIdx < 1 or actIdx > 5 then actIdx = 1; end

    if actIdx <= 3 then
        local builds = BordoUI_GetClassBuilds(actClass);
        if builds and builds[actIdx] then
            return builds[actIdx], actClass, actIdx;
        end
    else
        local pIdx = actIdx - 3;
        local pBuild = BordoUI_BuildData and BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[actClass] and BordoUI_BuildData.Builds[actClass][pIdx];
        if pBuild then
            return pBuild, actClass, actIdx;
        end
    end
    return nil, nil, nil;
end

function BordoUI_ClearActiveBuild()
    BordoUIDB = BordoUIDB or {};
    BordoUIDB.activeBuild = nil;
end

function BordoUI_IsBuildActiveInRun()
    local b = BordoUI_GetActiveBuild();
    return (b ~= nil);
end

function BordoUI_SetActiveBuild(classKey, buildIdx)
    BordoUIDB = BordoUIDB or {};
    local cUpper = string.upper(classKey);
    local idx = tonumber(buildIdx) or 1;
    if idx < 1 or idx > 5 then idx = 1; end

    if idx <= 3 then
        local builds = BordoUI_GetClassBuilds(cUpper);
        local b = builds and builds[idx];
        if b then
            BordoUIDB.activeBuild = {
                classKey = cUpper,
                buildIdx = idx,
                id = b.id,
                title = b.title or ("Build " .. idx),
                isCustom = true,
            };
            return b;
        end
    else
        local pIdx = idx - 3;
        local b = BordoUI_BuildData and BordoUI_BuildData.Builds and BordoUI_BuildData.Builds[cUpper] and BordoUI_BuildData.Builds[cUpper][pIdx];
        if b then
            BordoUIDB.activeBuild = {
                classKey = cUpper,
                buildIdx = idx,
                id = b.id or ("preset_" .. string.lower(cUpper) .. "_" .. pIdx),
                title = b.title or ("Meta " .. pIdx),
                isCustom = false,
            };
            return b;
        end
    end
    return nil;
end

-- [moved to top] local SPELL_CANONICAL_KEYS = {
-- [moved to top]     ["powerwordshield"]     = "pw_shield",
-- [moved to top]     ["power_word_shield"]   = "pw_shield",
-- [moved to top]     ["pwshield"]            = "pw_shield",
-- [moved to top]     ["pw_shield"]           = "pw_shield",
-- [moved to top] 
-- [moved to top]     ["shadowwordpain"]      = "sw_pain",
-- [moved to top]     ["shadow_word_pain"]    = "sw_pain",
-- [moved to top]     ["swpain"]              = "sw_pain",
-- [moved to top]     ["sw_pain"]             = "sw_pain",
-- [moved to top] 
-- [moved to top]     ["demoralizingshout"]   = "demo_shout",
-- [moved to top]     ["demoralizing_shout"]  = "demo_shout",
-- [moved to top]     ["demoshout"]           = "demo_shout",
-- [moved to top]     ["demo_shout"]          = "demo_shout",
-- [moved to top] 
-- [moved to top]     ["huntersmark"]         = "hunters_mark",
-- [moved to top]     ["hunter_mark"]         = "hunters_mark",
-- [moved to top]     ["hunters_mark"]        = "hunters_mark",
-- [moved to top]     ["huntermark"]          = "hunters_mark",
-- [moved to top] 
-- [moved to top]     ["soulfire"]            = "soul_fire",
-- [moved to top]     ["soul_fire"]           = "soul_fire",
-- [moved to top] 
-- [moved to top]     ["judgment"]            = "judgement",
-- [moved to top]     ["judgement"]           = "judgement",
-- [moved to top] };
-- [moved to top] 
-- [moved to top] local function CanonicalSpellKey(str)
-- [moved to top]     if not str then return ""; end
-- [moved to top]     local clean = string.lower(string.gsub(tostring(str), "[^%a]", ""));
-- [moved to top]     return SPELL_CANONICAL_KEYS[clean] or clean;
-- [moved to top] end

-- Checks if a spell (by key or name) belongs to the currently active build
-- Returns: isMatch (bool), priority (number 1-6), spellData (table)
function BordoUI_IsActiveBuildSpell(spellNameOrKey)
    if not spellNameOrKey then return false, nil, nil; end
    local activeBuild = BordoUI_GetActiveBuild();
    if not (activeBuild and activeBuild.spells) then return false, nil, nil; end
    local targetCanon = CanonicalSpellKey(spellNameOrKey);
    for i = 1, 6 do
        local sp = activeBuild.spells[i];
        if sp and sp.name then
            local spCanonKey = CanonicalSpellKey(sp.key);
            local spCanonName = CanonicalSpellKey(sp.name);
            if targetCanon ~= "" and (targetCanon == spCanonKey or targetCanon == spCanonName) then
                return true, sp.prio or i, sp;
            end
        end
    end
    return false, nil, nil;
end


-- ============================================================================
-- 51-Point Talent Builds & Milestones for All 19 Meta Builds
-- Structured matching Azeroth Survivors Armory Talents UI (3 trees + milestones)
-- ============================================================================
local TALENT_DB = {
    hunter_multi_shot = {
        summary = "32 / 18 / 0",
        trees = {
            {
                name = "Beast Mastery", points = 32, icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                milestones = {
                    { pts = 10, name = "Unleashed Fury", active = true, icon = "Interface\\Icons\\Ability_BullRush", desc = "Milestone. Greatly empowers beastial attacks and hunter haste." },
                    { pts = 20, name = "Intimidation", active = true, icon = "Interface\\Icons\\Ability_Devour", desc = "Milestone. Stuns enemy and increases damage dealt." },
                    { pts = 30, name = "Bestial Wrath", active = true, icon = "Interface\\Icons\\Ability_Druid_FerociousBite", desc = "Capstone. Sends you into a berserk rage dealing 50% more damage." },
                },
                talents = {
                    { name = "Improved Aspect of the Hawk", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_RavenForm", desc = "While Aspect of the Hawk is active, all normal ranged attacks have a 5% chance of increasing ranged attack speed by 30% for 12 sec." },
                    { name = "Endurance Training", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Reincarnation", desc = "Increases the Health of your pets by 15% and your total health by 5%." },
                    { name = "Thick Hide", row = 2, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\INV_Misc_Pelt_Bear_03", desc = "Increases the Armor rating of your pets by 30% and your total armor value by 10%." },
                    { name = "Improved Revive Pet", row = 2, col = 3, points = 2, max = 2, icon = "Interface\\Icons\\Ability_Hunter_BeastSoothe", desc = "Revive Pet costs less mana and recovers faster." },
                    { name = "Ferocity", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\INV_Misc_MonsterClaw_04", desc = "Increases the critical strike chance of your pets and physical abilities by 15%." },
                    { name = "Bestial Discipline", row = 4, col = 3, points = 1, max = 2, icon = "Interface\\Icons\\Spell_Nature_AbolishMagic", desc = "Increases Focus regeneration." },
                    { name = "Frenzy", row = 5, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\INV_Misc_MonsterClaw_03", desc = "Gives your attacks a 100% chance to gain a 30% attack speed bonus after dealing a critical strike." },
                    { name = "Animal Handler", row = 5, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Hunter_AnimalHandler", desc = "Increases your speed and reduces chance of being hit." },
                },
            },
            {
                name = "Marksmanship", points = 18, icon = "Interface\\Icons\\Ability_Marksmanship",
                milestones = {
                    { pts = 10, name = "Aimed Shot", active = false, icon = "Interface\\Icons\\INV_Spear_07", desc = "Milestone. Grants Aimed Shot." },
                    { pts = 20, name = "Trueshot Aura", active = false, icon = "Interface\\Icons\\Ability_TrueShot", desc = "Milestone. Increases attack power." },
                    { pts = 30, name = "Master Marksman", active = false, icon = "Interface\\Icons\\Ability_Hunter_MasterMarksman", desc = "Capstone. Maximizes ranged burst." },
                },
                talents = {
                    { name = "Efficiency", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_WizardMark", desc = "Reduces the Mana cost of your Shots and Stings by 10%." },
                    { name = "Lethal Shots", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Gouge", desc = "Increases your critical strike chance with ranged weapons by 5%." },
                    { name = "Mortal Shots", row = 3, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Pierce", desc = "Increases your ranged weapon critical strike damage bonus by 30%." },
                    { name = "Barrage", row = 4, col = 1, points = 1, max = 5, icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive", desc = "Increases the damage done by your Multi-Shot and Volley spells by 5%." },
                    { name = "Improved Stings", row = 4, col = 3, points = 2, max = 2, icon = "Interface\\Icons\\Ability_Hunter_Quickshot", desc = "Increases the damage done by your Serpent Sting and Wyvern Sting by 30%." },
                },
            },
            {
                name = "Survival", points = 0, icon = "Interface\\Icons\\Ability_Hunter_SwiftStrike",
                milestones = {
                    { pts = 10, name = "Survivalist", active = false, desc = "Increases health and critical strike." },
                    { pts = 20, name = "Counterattack", active = false, desc = "Counterattack strike." },
                    { pts = 30, name = "Wyvern Sting", active = false, desc = "Sleep sting." },
                },
                talents = {},
            },
        },
    },

    hunter_aimed_shot = {
        summary = "1 / 32 / 18",
        trees = {
            {
                name = "Beast Mastery", points = 1, icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                milestones = {
                    { pts = 10, name = "Endurance Training", active = false, desc = "Increases health and movement speed." },
                    { pts = 20, name = "Frenzy", active = false, desc = "Increases attack speed after critical strikes." },
                    { pts = 30, name = "Bestial Wrath", active = false, desc = "Enrages you and companions, granting 50% more damage." },
                },
                talents = {
                    { name = "Improved Aspect of the Hawk", row = 1, col = 1, points = 1, max = 5, icon = "Interface\\Icons\\Spell_Nature_RavenForm", desc = "While Aspect of the Hawk is active, normal ranged attacks have a 1% chance to increase attack speed by 30%." },
                },
            },
            {
                name = "Marksmanship", points = 32, icon = "Interface\\Icons\\Ability_Marksmanship",
                milestones = {
                    { pts = 10, name = "Aimed Shot", active = true, icon = "Interface\\Icons\\INV_Spear_07", desc = "Milestone. Grants Aimed Shot and empowers ranged critical strikes." },
                    { pts = 20, name = "Trueshot Aura", active = true, icon = "Interface\\Icons\\Ability_TrueShot", desc = "Milestone. Increases ranged and melee attack power." },
                    { pts = 30, name = "Master Marksman", active = true, icon = "Interface\\Icons\\Ability_Hunter_MasterMarksman", desc = "Capstone. Maximizes Aimed Shot burst damage." },
                },
                talents = {
                    { name = "Efficiency", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_WizardMark", desc = "Reduces the Mana cost of your Shots and Stings by 10%." },
                    { name = "Lethal Shots", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Gouge", desc = "Increases your critical strike chance with ranged weapons by 5%." },
                    { name = "Mortal Shots", row = 3, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Pierce", desc = "Increases your ranged weapon critical strike damage bonus by 30%." },
                    { name = "Barrage", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive", desc = "Increases the damage done by your Multi-Shot and Volley spells by 15%." },
                    { name = "Improved Stings", row = 4, col = 3, points = 2, max = 2, icon = "Interface\\Icons\\Ability_Hunter_Quickshot", desc = "Increases the damage done by your Serpent Sting and Wyvern Sting by 30%." },
                    { name = "Ranged Weapon Spec", row = 5, col = 3, points = 1, max = 3, icon = "Interface\\Icons\\INV_Weapon_Rifle_01", desc = "Increases the damage you deal with ranged weapons by 1%." },
                    { name = "Careful Aim", row = 6, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Hunter_ZenArchery", desc = "Increases your ranged attack power by an amount equal to 100% of your total Intellect." },
                    { name = "Piercing Shots", row = 6, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Hunter_SniperShot", desc = "Your critical strikes cause the target to bleed for 30% of the damage dealt." },
                },
            },
            {
                name = "Survival", points = 18, icon = "Interface\\Icons\\Ability_Hunter_SwiftStrike",
                milestones = {
                    { pts = 10, name = "Survivalist", active = true, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Milestone. Increases maximum health and critical strike chance." },
                    { pts = 20, name = "Counterattack", active = false, icon = "Interface\\Icons\\Ability_Warrior_Challange", desc = "A strike that becomes active after parrying an opponent's attack." },
                    { pts = 30, name = "Wyvern Sting", active = false, icon = "Interface\\Icons\\INV_Spear_02", desc = "A stinging shot that puts the target to sleep." },
                },
                talents = {
                    { name = "Monster Slaying", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\INV_Misc_MonsterHead_01", desc = "Increases all damage taken by Beast, Giant and Dragonkin targets by 5% and critical strike damage by 5%." },
                    { name = "Deflection", row = 2, col = 1, points = 2, max = 3, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases your Parry chance by 2%." },
                    { name = "Savage Strikes", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases the critical strike chance of Raptor Strike and Mongoose Bite by 20%." },
                    { name = "Clever Traps", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_SelfDestruct", desc = "Increases the duration of Freezing and Frost Trap effects by 30%." },
                    { name = "Surefooted", row = 4, col = 3, points = 2, max = 3, icon = "Interface\\Icons\\Ability_Kick", desc = "Increases hit chance by 2% and increases the chance to resist movement impairing effects by 10%." },
                },
            },
        },
    },
    hunter_aimed_sniper = {
        summary = "1 / 32 / 18",
        trees = {
            {
                name = "Beast Mastery", points = 1, icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                milestones = {
                    { pts = 10, name = "Endurance Training", active = false, desc = "Increases health and movement speed." },
                    { pts = 20, name = "Frenzy", active = false, desc = "Increases attack speed after critical strikes." },
                    { pts = 30, name = "Bestial Wrath", active = false, desc = "Enrages you and companions, granting 50% more damage." },
                },
                talents = {
                    { name = "Improved Aspect of the Hawk", row = 1, col = 1, points = 1, max = 5, icon = "Interface\\Icons\\Spell_Nature_RavenForm", desc = "While Aspect of the Hawk is active, normal ranged attacks have a 1% chance to increase attack speed by 30%." },
                },
            },
            {
                name = "Marksmanship", points = 32, icon = "Interface\\Icons\\Ability_Marksmanship",
                milestones = {
                    { pts = 10, name = "Aimed Shot", active = true, icon = "Interface\\Icons\\INV_Spear_07", desc = "Milestone. Grants Aimed Shot and empowers ranged critical strikes." },
                    { pts = 20, name = "Trueshot Aura", active = true, icon = "Interface\\Icons\\Ability_TrueShot", desc = "Milestone. Increases ranged and melee attack power." },
                    { pts = 30, name = "Master Marksman", active = true, icon = "Interface\\Icons\\Ability_Hunter_MasterMarksman", desc = "Capstone. Maximizes Aimed Shot burst damage." },
                },
                talents = {
                    { name = "Efficiency", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_WizardMark", desc = "Reduces the Mana cost of your Shots and Stings by 10%." },
                    { name = "Lethal Shots", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Gouge", desc = "Increases your critical strike chance with ranged weapons by 5%." },
                    { name = "Mortal Shots", row = 3, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Pierce", desc = "Increases your ranged weapon critical strike damage bonus by 30%." },
                    { name = "Barrage", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive", desc = "Increases the damage done by your Multi-Shot and Volley spells by 15%." },
                    { name = "Improved Stings", row = 4, col = 3, points = 2, max = 2, icon = "Interface\\Icons\\Ability_Hunter_Quickshot", desc = "Increases the damage done by your Serpent Sting and Wyvern Sting by 30%." },
                    { name = "Ranged Weapon Spec", row = 5, col = 3, points = 1, max = 3, icon = "Interface\\Icons\\INV_Weapon_Rifle_01", desc = "Increases the damage you deal with ranged weapons by 1%." },
                    { name = "Careful Aim", row = 6, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Hunter_ZenArchery", desc = "Increases your ranged attack power by an amount equal to 100% of your total Intellect." },
                    { name = "Piercing Shots", row = 6, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Hunter_SniperShot", desc = "Your critical strikes cause the target to bleed for 30% of the damage dealt." },
                },
            },
            {
                name = "Survival", points = 18, icon = "Interface\\Icons\\Ability_Hunter_SwiftStrike",
                milestones = {
                    { pts = 10, name = "Survivalist", active = true, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Milestone. Increases maximum health and critical strike chance." },
                    { pts = 20, name = "Counterattack", active = false, icon = "Interface\\Icons\\Ability_Warrior_Challange", desc = "A strike that becomes active after parrying an opponent's attack." },
                    { pts = 30, name = "Wyvern Sting", active = false, icon = "Interface\\Icons\\INV_Spear_02", desc = "A stinging shot that puts the target to sleep." },
                },
                talents = {
                    { name = "Monster Slaying", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\INV_Misc_MonsterHead_01", desc = "Increases all damage taken by Beast, Giant and Dragonkin targets by 5% and critical strike damage by 5%." },
                    { name = "Deflection", row = 2, col = 1, points = 2, max = 3, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases your Parry chance by 2%." },
                    { name = "Savage Strikes", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases the critical strike chance of Raptor Strike and Mongoose Bite by 20%." },
                    { name = "Clever Traps", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_SelfDestruct", desc = "Increases the duration of Freezing and Frost Trap effects by 30%." },
                    { name = "Surefooted", row = 4, col = 3, points = 2, max = 3, icon = "Interface\\Icons\\Ability_Kick", desc = "Increases hit chance by 2% and increases the chance to resist movement impairing effects by 10%." },
                },
            },
        },
    },
    paladin_retribution = {
        summary = "20 / 0 / 31",
        trees = {
            {
                name = "Holy", points = 20, icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                milestones = {
                    { pts = 10, name = "Divine Favor", active = true, icon = "Interface\\Icons\\Spell_Holy_Heal", desc = "Milestone. You start every run with Holy Shock, and each of its bolts leaps to 2 more enemies for 50% of it." },
                    { pts = 20, name = "Daybreak", active = true, icon = "Interface\\Icons\\Spell_Holy_Excorcism", desc = "Milestone. Holy Shock's critical strikes call down a free Holy Wrath around you, at most once every 3 sec." },
                    { pts = 30, name = "Light's Grace", active = false, icon = "Interface\\Icons\\Spell_Holy_SearingLight", desc = "Capstone. A Holy Wrath bursts from you on its own every 14 sec." },
                },
                talents = {
                    { name = "Divine Strength", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_GolemThunderClap", desc = "Increases your Strength by 10%." },
                    { name = "Unyielding Faith", row = 1, col = 3, points = 0, max = 5, icon = "Interface\\Icons\\Spell_Holy_UnyieldingFaith", desc = "Increases resistance to Fear." },
                    { name = "Healing Light", row = 2, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_HolyBolt", desc = "Increases the amount healed by your Holy Light and Flash of Light by 12%." },
                    { name = "Divine Intellect", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Sleep", desc = "Increases your total Intellect by 10%." },
                    { name = "Illumination", row = 3, col = 3, points = 2, max = 3, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal", desc = "Gives your healing spell critical strikes a 70% chance to refund mana." },
                    { name = "Divine Favor", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_Heal", desc = "Increases healing and holy damage by 15%." },
                },
            },
            {
                name = "Protection", points = 0, icon = "Interface\\Icons\\Spell_Holy_DevotionAura",
                milestones = {
                    { pts = 10, name = "Hallowed Ground", active = false, icon = "Interface\\Icons\\Spell_Holy_SealOfProtection", desc = "Milestone. Every Hammer of Justice that lands hallows the ground beneath you." },
                    { pts = 20, name = "Ardent Defender", active = false, icon = "Interface\\Icons\\Spell_Holy_HolyProtection", desc = "Milestone. You start every run with Hammer of Justice." },
                    { pts = 30, name = "Hammer of the Righteous", active = false, icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Capstone. Max health is 15% higher." },
                },
                talents = {
                    { name = "Redoubt", row = 1, col = 1, points = 0, max = 5, icon = "Interface\\Icons\\Ability_Defend", desc = "Increases block chance by 30% after taking a hit." },
                    { name = "Improved Devotion Aura", row = 1, col = 3, points = 0, max = 5, icon = "Interface\\Icons\\Spell_Holy_DevotionAura", desc = "Increases armor bonus of Devotion Aura by 25%." },
                },
            },
            {
                name = "Retribution", points = 31, icon = "Interface\\Icons\\Spell_Holy_AuraOfLight",
                milestones = {
                    { pts = 10, name = "Seal of Command", active = true, icon = "Interface\\Icons\\Ability_Warrior_InnerRage", desc = "Milestone. You start every run with Judgement, and every Judgement also strikes 2 more enemies near its target for 50% of it." },
                    { pts = 20, name = "Sanctity Aura", active = true, icon = "Interface\\Icons\\Spell_Holy_MindVision", desc = "Milestone. Increases Holy damage dealt by 10%." },
                    { pts = 30, name = "Repentance", active = true, icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing", desc = "Capstone. Puts enemy to sleep and makes them vulnerable to attacks." },
                },
                talents = {
                    { name = "Improved Blessing of Might", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_FistOfJustice", desc = "Increases attack power bonus of Blessing of Might by 20%." },
                    { name = "Benediction", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_WindWalkOn", desc = "Reduces the mana cost of your Judgement and Seal spells by 15%." },
                    { name = "Improved Retribution Aura", row = 2, col = 1, points = 0, max = 3, icon = "Interface\\Icons\\Spell_Holy_AuraOfLight", desc = "Increases damage of Retribution Aura." },
                    { name = "Deflection", row = 2, col = 3, points = 4, max = 5, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases your Parry chance by 4%." },
                    { name = "Conviction", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_RetributionAura", desc = "Increases your chance to get a critical strike by 5%." },
                    { name = "Eye for an Eye", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_EyeforanEye", desc = "All critical strikes deal bonus damage and reflect damage." },
                    { name = "Two-Handed Weapon Spec", row = 5, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\INV_Hammer_04", desc = "Increases the damage you deal with two-handed melee weapons by 6%." },
                    { name = "Vengeance", row = 6, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Racial_Avatar", desc = "Gives you a 15% bonus to Physical and Holy damage after landing a critical strike." },
                },
            },
        },
    },
    paladin_consecration = {
        summary = "11 / 35 / 5",
        trees = {
            {
                name = "Holy", points = 11, icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                milestones = {
                    { pts = 10, name = "Consecration", active = true, icon = "Interface\\Icons\\Spell_Holy_InnerFire", desc = "Milestone. Consecrates the ground beneath you, dealing Holy damage." },
                    { pts = 20, name = "Illumination", active = false, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal", desc = "Milestone. Spell criticals refund mana." },
                    { pts = 30, name = "Divine Favor", active = false, icon = "Interface\\Icons\\Spell_Holy_Heal", desc = "Capstone. Next spell cast is guaranteed critical strike." },
                },
                talents = {
                    { name = "Divine Strength", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_GolemThunderClap", desc = "Increases Strength by 10%." },
                    { name = "Divine Intellect", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Sleep", desc = "Increases total Intellect by 10%." },
                },
            },
            {
                name = "Protection", points = 35, icon = "Interface\\Icons\\Spell_Holy_DevotionAura",
                milestones = {
                    { pts = 10, name = "Hallowed Ground", active = true, icon = "Interface\\Icons\\Spell_Holy_SealOfProtection", desc = "Milestone. Every Hammer of Justice that lands hallows the ground beneath you." },
                    { pts = 20, name = "Ardent Defender", active = true, icon = "Interface\\Icons\\Spell_Holy_HolyProtection", desc = "Milestone. You start every run with Hammer of Justice." },
                    { pts = 30, name = "Hammer of the Righteous", active = true, icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Capstone. Max health is 15% higher." },
                },
                talents = {
                    { name = "Redoubt", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Defend", desc = "Increases block chance by 30% after taking a hit." },
                    { name = "Improved Devotion Aura", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_DevotionAura", desc = "Increases armor bonus of Devotion Aura by 25%." },
                    { name = "Improved Consecration", row = 2, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_InnerFire", desc = "Every tick of Consecration deals an extra 1% of your maximum health." },
                    { name = "Precision", row = 2, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Marksmanship", desc = "Increases chance to hit with melee attacks and spells by 3%." },
                    { name = "Weighted Hammer", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfMight", desc = "Hammer of Justice deals an extra 2% of your maximum health." },
                    { name = "Shield Specialization", row = 4, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases damage absorbed by shield by 30%." },
                    { name = "Righteous Fury", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfFury", desc = "Every spell you cast deals an extra 1% of your maximum health." },
                    { name = "Improved Hammer of Justice", row = 5, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfWrath", desc = "Hammer of Justice deals 20% more damage and recovers faster." },
                    { name = "Holy Shield", row = 6, col = 1, points = 1, max = 1, icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Increases block chance by 30% and reflects holy damage." },
                    { name = "Sacred Duty", row = 6, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_DivineIntervention", desc = "While a shield holds, you deal 20% more damage." },
                },
            },
            {
                name = "Retribution", points = 5, icon = "Interface\\Icons\\Spell_Holy_AuraOfLight",
                milestones = {
                    { pts = 10, name = "Seal of Command", active = false, icon = "Interface\\Icons\\Ability_Warrior_InnerRage", desc = "Milestone. You start every run with Judgement." },
                    { pts = 20, name = "Sanctity Aura", active = false, icon = "Interface\\Icons\\Spell_Holy_MindVision", desc = "Milestone. Increases Holy damage dealt by 10%." },
                    { pts = 30, name = "Repentance", active = false, icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing", desc = "Capstone. Puts enemy to sleep." },
                },
                talents = {
                    { name = "Improved Blessing of Might", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_FistOfJustice", desc = "Increases attack power bonus of Blessing of Might by 20%." },
                },
            },
        },
    },
    paladin_holy_bulwark = {
        summary = "11 / 35 / 5",
        trees = {
            {
                name = "Holy", points = 11, icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                milestones = {
                    { pts = 10, name = "Consecration", active = true, icon = "Interface\\Icons\\Spell_Holy_InnerFire", desc = "Milestone. Consecrates the ground beneath you, dealing Holy damage." },
                    { pts = 20, name = "Illumination", active = false, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal", desc = "Milestone. Spell criticals refund mana." },
                    { pts = 30, name = "Divine Favor", active = false, icon = "Interface\\Icons\\Spell_Holy_Heal", desc = "Capstone. Next spell cast is guaranteed critical strike." },
                },
                talents = {
                    { name = "Divine Strength", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_GolemThunderClap", desc = "Increases Strength by 10%." },
                    { name = "Divine Intellect", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Sleep", desc = "Increases total Intellect by 10%." },
                },
            },
            {
                name = "Protection", points = 35, icon = "Interface\\Icons\\Spell_Holy_DevotionAura",
                milestones = {
                    { pts = 10, name = "Hallowed Ground", active = true, icon = "Interface\\Icons\\Spell_Holy_SealOfProtection", desc = "Milestone. Every Hammer of Justice that lands hallows the ground beneath you." },
                    { pts = 20, name = "Ardent Defender", active = true, icon = "Interface\\Icons\\Spell_Holy_HolyProtection", desc = "Milestone. You start every run with Hammer of Justice." },
                    { pts = 30, name = "Hammer of the Righteous", active = true, icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Capstone. Max health is 15% higher." },
                },
                talents = {
                    { name = "Redoubt", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Defend", desc = "Increases block chance by 30% after taking a hit." },
                    { name = "Improved Devotion Aura", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_DevotionAura", desc = "Increases armor bonus of Devotion Aura by 25%." },
                    { name = "Improved Consecration", row = 2, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_InnerFire", desc = "Every tick of Consecration deals an extra 1% of your maximum health." },
                    { name = "Precision", row = 2, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Marksmanship", desc = "Increases chance to hit with melee attacks and spells by 3%." },
                    { name = "Weighted Hammer", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfMight", desc = "Hammer of Justice deals an extra 2% of your maximum health." },
                    { name = "Shield Specialization", row = 4, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases damage absorbed by shield by 30%." },
                    { name = "Righteous Fury", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfFury", desc = "Every spell you cast deals an extra 1% of your maximum health." },
                    { name = "Improved Hammer of Justice", row = 5, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_SealOfWrath", desc = "Hammer of Justice deals 20% more damage and recovers faster." },
                    { name = "Holy Shield", row = 6, col = 1, points = 1, max = 1, icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Increases block chance by 30% and reflects holy damage." },
                    { name = "Sacred Duty", row = 6, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_DivineIntervention", desc = "While a shield holds, you deal 20% more damage." },
                },
            },
            {
                name = "Retribution", points = 5, icon = "Interface\\Icons\\Spell_Holy_AuraOfLight",
                milestones = {
                    { pts = 10, name = "Seal of Command", active = false, icon = "Interface\\Icons\\Ability_Warrior_InnerRage", desc = "Milestone. You start every run with Judgement." },
                    { pts = 20, name = "Sanctity Aura", active = false, icon = "Interface\\Icons\\Spell_Holy_MindVision", desc = "Milestone. Increases Holy damage dealt by 10%." },
                    { pts = 30, name = "Repentance", active = false, icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing", desc = "Capstone. Puts enemy to sleep." },
                },
                talents = {
                    { name = "Improved Blessing of Might", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_FistOfJustice", desc = "Increases attack power bonus of Blessing of Might by 20%." },
                },
            },
        },
    },

    warrior_whirlwind = {
        summary = "11 / 36 / 4",
        trees = {
            {
                name = "Arms", points = 11, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Deep Wounds", active = true, icon = "Interface\\Icons\\Ability_BackStab", desc = "Milestone. Critical strikes cause bleed for 60% of weapon damage." },
                    { pts = 20, name = "Sweeping Strikes", active = false, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Next 5 melee strikes hit an additional nearby enemy." },
                    { pts = 30, name = "Mortal Strike", active = false, icon = "Interface\\Icons\\Ability_Warrior_SavageBlow", desc = "A vicious strike dealing heavy damage." },
                },
                talents = {
                    { name = "Deflection", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases parry chance by 5%." },
                    { name = "Iron Will", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\INV_Helmet_08", desc = "Increases resistance to stun and charm effects by 15%." },
                },
            },
            {
                name = "Fury", points = 36, icon = "Interface\\Icons\\Ability_Warrior_InnerRage",
                milestones = {
                    { pts = 10, name = "Sweeping Strikes", active = true, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Milestone. Your next 5 attacks strike an extra nearby target." },
                    { pts = 20, name = "Bloodthirst", active = true, icon = "Interface\\Icons\\Spell_Nature_BloodLust", desc = "Milestone. Instantly attacks target and heals for a percentage of health." },
                    { pts = 30, name = "Bladestorm", active = true, icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Capstone. Whirlwind continuously shreds surrounding enemies." },
                },
                talents = {
                    { name = "Booming Voice", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases the area of effect and duration of Battle Shout and Demoralizing Shout." },
                    { name = "Cruelty", row = 1, col = 3, points = 2, max = 5, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate", desc = "Increases critical strike chance with melee weapons by 2%." },
                    { name = "Unbridled Wrath", row = 2, col = 1, points = 1, max = 5, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Gives a chance to generate an additional Rage point on hits." },
                    { name = "Improved Battle Shout", row = 2, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_BattleShout", desc = "Increases the melee attack power bonus of Battle Shout by 25%." },
                    { name = "Dual Wield Spec", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_DualWield", desc = "Increases damage dealt by off-hand weapons by 15%." },
                    { name = "Flurry", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Increases attack speed by 30% for your next 3 swings after a critical hit." },
                    { name = "Death Wish", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_AbolishMagic", desc = "Increases physical damage dealt by 20%." },
                    { name = "Berserker Stance Spec", row = 5, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Racial_Avatar", desc = "Increases critical strike chance while in Berserker Stance." },
                    { name = "Blood Craze", row = 6, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_SummonImp", desc = "Regenerates 3% of total health after being critically struck." },
                    { name = "Improved Whirlwind", row = 6, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Reduces the cooldown of Whirlwind by 2 sec." },
                },
            },
            {
                name = "Protection", points = 4, icon = "Interface\\Icons\\INV_Shield_06",
                milestones = {
                    { pts = 10, name = "Last Stand", active = false, icon = "Interface\\Icons\\Spell_Holy_AshesToAshes", desc = "Grants 30% of maximum health for 20 sec." },
                    { pts = 20, name = "Concussion Blow", active = false, icon = "Interface\\Icons\\Ability_ThunderBolt", desc = "Stuns target for 5 sec." },
                    { pts = 30, name = "Shield Slam", active = false, icon = "Interface\\Icons\\INV_Shield_05", desc = "Slams target with shield, dealing heavy damage." },
                },
                talents = {
                    { name = "Anticipation", row = 1, col = 3, points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_MirrorImage", desc = "Increases Defense skill by 8." },
                },
            },
        },
    },
    warrior_whirlwind_cleaver = {
        summary = "11 / 36 / 4",
        trees = {
            {
                name = "Arms", points = 11, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Deep Wounds", active = true, icon = "Interface\\Icons\\Ability_BackStab", desc = "Milestone. Critical strikes cause bleed for 60% of weapon damage." },
                    { pts = 20, name = "Sweeping Strikes", active = false, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Next 5 melee strikes hit an additional nearby enemy." },
                    { pts = 30, name = "Mortal Strike", active = false, icon = "Interface\\Icons\\Ability_Warrior_SavageBlow", desc = "A vicious strike dealing heavy damage." },
                },
                talents = {
                    { name = "Deflection", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases parry chance by 5%." },
                    { name = "Iron Will", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\INV_Helmet_08", desc = "Increases resistance to stun and charm effects by 15%." },
                },
            },
            {
                name = "Fury", points = 36, icon = "Interface\\Icons\\Ability_Warrior_InnerRage",
                milestones = {
                    { pts = 10, name = "Sweeping Strikes", active = true, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Milestone. Your next 5 attacks strike an extra nearby target." },
                    { pts = 20, name = "Bloodthirst", active = true, icon = "Interface\\Icons\\Spell_Nature_BloodLust", desc = "Milestone. Instantly attacks target and heals for a percentage of health." },
                    { pts = 30, name = "Bladestorm", active = true, icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Capstone. Whirlwind continuously shreds surrounding enemies." },
                },
                talents = {
                    { name = "Booming Voice", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases the area of effect and duration of Battle Shout and Demoralizing Shout." },
                    { name = "Cruelty", row = 1, col = 3, points = 2, max = 5, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate", desc = "Increases critical strike chance with melee weapons by 2%." },
                    { name = "Unbridled Wrath", row = 2, col = 1, points = 1, max = 5, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Gives a chance to generate an additional Rage point on hits." },
                    { name = "Improved Battle Shout", row = 2, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_BattleShout", desc = "Increases the melee attack power bonus of Battle Shout by 25%." },
                    { name = "Dual Wield Spec", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_DualWield", desc = "Increases damage dealt by off-hand weapons by 15%." },
                    { name = "Flurry", row = 4, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Increases attack speed by 30% for your next 3 swings after a critical hit." },
                    { name = "Death Wish", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_AbolishMagic", desc = "Increases physical damage dealt by 20%." },
                    { name = "Berserker Stance Spec", row = 5, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Racial_Avatar", desc = "Increases critical strike chance while in Berserker Stance." },
                    { name = "Blood Craze", row = 6, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_SummonImp", desc = "Regenerates 3% of total health after being critically struck." },
                    { name = "Improved Whirlwind", row = 6, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Reduces the cooldown of Whirlwind by 2 sec." },
                },
            },
            {
                name = "Protection", points = 4, icon = "Interface\\Icons\\INV_Shield_06",
                milestones = {
                    { pts = 10, name = "Last Stand", active = false, icon = "Interface\\Icons\\Spell_Holy_AshesToAshes", desc = "Grants 30% of maximum health for 20 sec." },
                    { pts = 20, name = "Concussion Blow", active = false, icon = "Interface\\Icons\\Ability_ThunderBolt", desc = "Stuns target for 5 sec." },
                    { pts = 30, name = "Shield Slam", active = false, icon = "Interface\\Icons\\INV_Shield_05", desc = "Slams target with shield, dealing heavy damage." },
                },
                talents = {
                    { name = "Anticipation", row = 1, col = 3, points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_MirrorImage", desc = "Increases Defense skill by 8." },
                },
            },
        },
    },

    warrior_shield_slam = {
        summary = "11 / 9 / 31",
        trees = {
            {
                name = "Arms", points = 11, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Deep Wounds", active = true, icon = "Interface\\Icons\\Ability_BackStab", desc = "Milestone. Critical strikes cause bleed for 60% of weapon damage." },
                    { pts = 20, name = "Sweeping Strikes", active = false, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Next 5 melee strikes hit an additional nearby enemy." },
                    { pts = 30, name = "Mortal Strike", active = false, icon = "Interface\\Icons\\Ability_Warrior_SavageBlow", desc = "A vicious strike dealing heavy damage." },
                },
                talents = {
                    { name = "Deflection", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases parry chance by 5%." },
                    { name = "Iron Will", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\INV_Helmet_08", desc = "Increases resistance to stun and charm effects by 15%." },
                },
            },
            {
                name = "Fury", points = 9, icon = "Interface\\Icons\\Ability_Warrior_InnerRage",
                milestones = {
                    { pts = 10, name = "Piercing Howl", active = false, icon = "Interface\\Icons\\Spell_Shadow_DeathScream", desc = "Slows all nearby enemies by 50%." },
                    { pts = 20, name = "Death Wish", active = false, icon = "Interface\\Icons\\Spell_Shadow_DeathPact", desc = "Increases physical damage by 20%." },
                    { pts = 30, name = "Bloodthirst", active = false, icon = "Interface\\Icons\\Spell_Nature_BloodLust", desc = "Instantly attacks target and causes next attacks to heal." },
                },
                talents = {
                    { name = "Booming Voice", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases area of effect and duration of Battle Shout and Demoralizing Shout by 50%." },
                    { name = "Unbridled Wrath", row = 2, col = 1, points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Gives a chance to generate an additional Rage point when dealing melee damage." },
                },
            },
            {
                name = "Protection", points = 31, icon = "Interface\\Icons\\INV_Shield_06",
                milestones = {
                    { pts = 10, name = "Toughness", active = true, icon = "Interface\\Icons\\Spell_Holy_Devotion", desc = "Milestone. Greatly increases defensive survivability and armor." },
                    { pts = 20, name = "Shield Slam", active = true, icon = "Interface\\Icons\\INV_Shield_05", desc = "Milestone. Slams targets with your shield for devastating physical damage." },
                    { pts = 30, name = "Shield Mastery", active = true, icon = "Interface\\Icons\\INV_Shield_06", desc = "Capstone. Maximizes shield block value and Shield Slam damage." },
                },
                talents = {
                    { name = "Shield Specialization", row = 1, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases block chance by 5% and generates rage on block." },
                    { name = "Anticipation", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_MirrorImage", desc = "Increases Defense skill by 10." },
                    { name = "Defiance", row = 3, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_InnerRage", desc = "Increases threat and physical damage mitigation." },
                    { name = "Improved Bloodrage", row = 3, col = 2, points = 1, max = 1, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases rage generated by Bloodrage." },
                    { name = "Improved Taunt", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_Reincarnation", desc = "Reduces cooldown of defensive abilities." },
                    { name = "Concussion Blow", row = 4, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_ThunderBolt", desc = "Increases stun and staggering effect on impact." },
                    { name = "Improved Shield Block", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Defensivestate", desc = "Increases block chance and value." },
                    { name = "One-Handed Spec", row = 5, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\INV_Sword_20", desc = "Increases damage dealt when a one-handed melee weapon is equipped." },
                    { name = "Improved Shield Wall", row = 6, col = 1, points = 1, max = 1, icon = "Interface\\Icons\\Ability_Warrior_ShieldWall", desc = "Increases duration and damage reduction of Shield Wall." },
                    { name = "Shield Mastery", row = 6, col = 3, points = 2, max = 3, icon = "Interface\\Icons\\INV_Shield_04", desc = "Increases shield damage and block absorption." },
                },
            },
        },
    },
    warrior_shield_slam_prot = {
        summary = "11 / 9 / 31",
        trees = {
            {
                name = "Arms", points = 11, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Deep Wounds", active = true, icon = "Interface\\Icons\\Ability_BackStab", desc = "Milestone. Critical strikes cause bleed for 60% of weapon damage." },
                    { pts = 20, name = "Sweeping Strikes", active = false, icon = "Interface\\Icons\\Ability_Rogue_DualWeild", desc = "Next 5 melee strikes hit an additional nearby enemy." },
                    { pts = 30, name = "Mortal Strike", active = false, icon = "Interface\\Icons\\Ability_Warrior_SavageBlow", desc = "A vicious strike dealing heavy damage." },
                },
                talents = {
                    { name = "Deflection", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases parry chance by 5%." },
                    { name = "Iron Will", row = 2, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\INV_Helmet_08", desc = "Increases resistance to stun and charm effects by 15%." },
                },
            },
            {
                name = "Fury", points = 9, icon = "Interface\\Icons\\Ability_Warrior_InnerRage",
                milestones = {
                    { pts = 10, name = "Piercing Howl", active = false, icon = "Interface\\Icons\\Spell_Shadow_DeathScream", desc = "Slows all nearby enemies by 50%." },
                    { pts = 20, name = "Death Wish", active = false, icon = "Interface\\Icons\\Spell_Shadow_DeathPact", desc = "Increases physical damage by 20%." },
                    { pts = 30, name = "Bloodthirst", active = false, icon = "Interface\\Icons\\Spell_Nature_BloodLust", desc = "Instantly attacks target and causes next attacks to heal." },
                },
                talents = {
                    { name = "Booming Voice", row = 1, col = 2, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases area of effect and duration of Battle Shout and Demoralizing Shout by 50%." },
                    { name = "Unbridled Wrath", row = 2, col = 1, points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Gives a chance to generate an additional Rage point when dealing melee damage." },
                },
            },
            {
                name = "Protection", points = 31, icon = "Interface\\Icons\\INV_Shield_06",
                milestones = {
                    { pts = 10, name = "Toughness", active = true, icon = "Interface\\Icons\\Spell_Holy_Devotion", desc = "Milestone. Greatly increases defensive survivability and armor." },
                    { pts = 20, name = "Shield Slam", active = true, icon = "Interface\\Icons\\INV_Shield_05", desc = "Milestone. Slams targets with your shield for devastating physical damage." },
                    { pts = 30, name = "Shield Mastery", active = true, icon = "Interface\\Icons\\INV_Shield_06", desc = "Capstone. Maximizes shield block value and Shield Slam damage." },
                },
                talents = {
                    { name = "Shield Specialization", row = 1, col = 1, points = 5, max = 5, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases block chance by 5% and generates rage on block." },
                    { name = "Anticipation", row = 1, col = 3, points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_MirrorImage", desc = "Increases Defense skill by 10." },
                    { name = "Defiance", row = 3, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_InnerRage", desc = "Increases threat and physical damage mitigation." },
                    { name = "Improved Bloodrage", row = 3, col = 2, points = 1, max = 1, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases rage generated by Bloodrage." },
                    { name = "Improved Taunt", row = 3, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_Reincarnation", desc = "Reduces cooldown of defensive abilities." },
                    { name = "Concussion Blow", row = 4, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\Ability_ThunderBolt", desc = "Increases stun and staggering effect on impact." },
                    { name = "Improved Shield Block", row = 4, col = 3, points = 3, max = 3, icon = "Interface\\Icons\\Ability_Defensivestate", desc = "Increases block chance and value." },
                    { name = "One-Handed Spec", row = 5, col = 1, points = 3, max = 3, icon = "Interface\\Icons\\INV_Sword_20", desc = "Increases damage dealt when a one-handed melee weapon is equipped." },
                    { name = "Improved Shield Wall", row = 6, col = 1, points = 1, max = 1, icon = "Interface\\Icons\\Ability_Warrior_ShieldWall", desc = "Increases duration and damage reduction of Shield Wall." },
                    { name = "Shield Mastery", row = 6, col = 3, points = 2, max = 3, icon = "Interface\\Icons\\INV_Shield_04", desc = "Increases shield damage and block absorption." },
                },
            },
        },
    },

    mage_arcane_missiles = {
        summary = "31 / 0 / 20",
        trees = {
            {
                name = "Arcane", points = 31, icon = "Interface\\Icons\\Spell_Nature_WispSplode",
                milestones = {
                    { pts = 10, name = "Arcane Concentration", active = true, desc = "Clearcasting state reduces next spell mana cost to 0." },
                    { pts = 20, name = "Presence of Mind", active = true, desc = "When activated, causes your next spell to become instant cast." },
                    { pts = 30, name = "Arcane Power", active = true, desc = "When activated, causes your spells to deal 30% more damage." },
                },
                talents = {
                    { name = "Arcane Subtlety", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_DispelMagic", desc = "Reduces target resistance to all spells by 10 and reduces threat." },
                    { name = "Arcane Focus", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Increases hit chance of Arcane spells by 10%." },
                    { name = "Arcane Impact", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_WispSplode", desc = "Increases critical strike chance of Arcane spells by 6%." },
                    { name = "Arcane Meditation", points = 1, max = 3, icon = "Interface\\Icons\\Spell_Shadow_SiphonMana", desc = "Allows mana regen to continue while casting." },
                    { name = "Improved Arcane Missiles", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_StarFall", desc = "Gives you a 100% chance to avoid interruption while channeling Arcane Missiles." },
                    { name = "Arcane Mind", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_Charm", desc = "Increases your maximum Mana by 6%." },
                    { name = "Arcane Instability", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_Teleport", desc = "Increases your spell damage and critical strike chance by 3%." },
                    { name = "Arcane Potency", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Arcane_ArcaneTorrent", desc = "Increases critical strike chance of spells by 30% when Clearcasting is active." },
                },
            },
            {
                name = "Fire", points = 0, icon = "Interface\\Icons\\Spell_Fire_FireBolt02",
                milestones = {
                    { pts = 10, name = "Ignite", active = false, desc = "Crits deal 40% additional damage." },
                    { pts = 20, name = "Blast Wave", active = false, desc = "Wave of flame radiates outward." },
                    { pts = 30, name = "Combustion", active = false, desc = "Critical strike chance increased." },
                },
                talents = {},
            },
            {
                name = "Frost", points = 20, icon = "Interface\\Icons\\Spell_Frost_FrostBolt02",
                milestones = {
                    { pts = 10, name = "Ice Barrier", active = true, desc = "Shields you, absorbing heavy damage and preventing spell interruption." },
                    { pts = 20, name = "Cold Snap", active = false, desc = "Instantly finishes cooldown of all Frost spells." },
                    { pts = 30, name = "Ice Block", active = false, desc = "Encases you in ice." },
                },
                talents = {
                    { name = "Frostbite", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_FrostArmor", desc = "Chills and slows approaching enemies, creating crit opportunities." },
                    { name = "Elemental Precision", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Ice_MagicDamage", desc = "Reduces chance enemies resist spells by 6%." },
                    { name = "Ice Shards", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_IceShard", desc = "Increases critical strike damage bonus of spells by 100%." },
                    { name = "Frost Channeling", points = 1, max = 3, icon = "Interface\\Icons\\Spell_Frost_Stun", desc = "Reduces mana cost and cooldown of Frost spells." },
                    { name = "Shatter", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_FrostShock", desc = "Increases critical strike chance against frozen targets by 50%." },
                },
            },
        },
    },

    mage_pyroblast = {
        summary = "10 / 31 / 10",
        trees = {
            {
                name = "Arcane", points = 10, icon = "Interface\\Icons\\Spell_Nature_WispSplode",
                milestones = {
                    { pts = 10, name = "Arcane Concentration", active = true, desc = "Clearcasting state reduces next spell mana cost to 0." },
                    { pts = 20, name = "Arcane Meditation", active = false, desc = "Allows mana regeneration while casting." },
                    { pts = 30, name = "Arcane Power", active = false, desc = "Increases spell damage by 30%." },
                },
                talents = {
                    { name = "Arcane Focus", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Increases spell hit chance and reduces target resistance." },
                    { name = "Arcane Concentration", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_ManaBurn", desc = "10% chance of entering Clearcasting state after dealing damage." },
                },
            },
            {
                name = "Fire", points = 31, icon = "Interface\\Icons\\Spell_Fire_FireBolt02",
                milestones = {
                    { pts = 10, name = "Pyroblast", active = true, desc = "Hurls an immense fiery boulder that causes massive burn." },
                    { pts = 20, name = "Blast Wave", active = true, desc = "Wave of flame radiates outward, dazing and knocking back enemies." },
                    { pts = 30, name = "Combustion", active = true, desc = "Guarantees consecutive fire critical strikes until 3 crits occur." },
                },
                talents = {
                    { name = "Impact", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Fire_MeteorStorm", desc = "Gives your Fire spells a 10% chance to stun the target for 2 sec." },
                    { name = "Ignite", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Fire_Incinerate", desc = "Fire spell crits burn target for an additional 40% damage over 4 sec." },
                    { name = "Flame Throwing", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Fire_Flare", desc = "Increases range of all Fire spells by 6 yards." },
                    { name = "Incinerate", points = 2, max = 5, icon = "Interface\\Icons\\Spell_Fire_SoulBurn", desc = "Increases critical strike chance of Fire spells by 4%." },
                    { name = "Burning Soul", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_Fire", desc = "Reduces pushback on Fire spells by 70%." },
                    { name = "Improved Scorch", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_SoulBurn", desc = "Fire attacks cause enemies to take 15% more Fire damage." },
                    { name = "Critical Mass", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_WispHeal", desc = "Increases critical strike chance of all Fire spells by 6%." },
                    { name = "Fire Power", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_Immolation", desc = "Increases damage of all Fire spells by 10%." },
                },
            },
            {
                name = "Frost", points = 10, icon = "Interface\\Icons\\Spell_Frost_FrostBolt02",
                milestones = {
                    { pts = 10, name = "Ice Shards", active = true, desc = "Increases critical strike damage bonus of spells by 100%." },
                    { pts = 20, name = "Cold Snap", active = false, desc = "Resets cooldown of all Frost spells." },
                    { pts = 30, name = "Ice Barrier", active = false, desc = "Shields you, absorbing heavy damage." },
                },
                talents = {
                    { name = "Frostbite", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_FrostArmor", desc = "Chills and slows approaching enemies, creating crit opportunities." },
                    { name = "Ice Shards", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_IceShard", desc = "Increases the critical strike damage bonus of spells by 100%." },
                },
            },
        },
    },

    warlock_searing_pain = {
        summary = "5 / 32 / 14",
        trees = {
            {
                name = "Affliction", points = 5, icon = "Interface\\Icons\\Spell_Shadow_DeathCoil",
                milestones = {
                    { pts = 10, name = "Nightfall", active = false, desc = "Corruption ticks have chance to grant instant Shadow Bolt." },
                    { pts = 20, name = "Siphon Life", active = false, desc = "Transfers health from target to caster." },
                    { pts = 30, name = "Shadow Mastery", active = false, desc = "Increases damage dealt by Shadow spells." },
                },
                talents = {
                    { name = "Suppression", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_UnsummonBuilding", desc = "Reduces the chance enemies resist your spells by 10%." },
                },
            },
            {
                name = "Demonology", points = 32, icon = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
                milestones = {
                    { pts = 10, name = "Fel Domination", active = true, desc = "Empowers your demonic summons and casting efficiency." },
                    { pts = 20, name = "Master Demonologist", active = true, desc = "Grants powerful passive combat bonuses and damage boosts." },
                    { pts = 30, name = "Soul Link", active = true, desc = "Shares damage taken with demon companion and boosts spell damage." },
                },
                talents = {
                    { name = "Improved Imp", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_SummonImp", desc = "Increases the effect of Firebolt and spell damage." },
                    { name = "Demonic Embrace", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_Metamorphosis", desc = "Increases total Stamina by 15%." },
                    { name = "Fel Stamina", points = 2, max = 3, icon = "Interface\\Icons\\Spell_Shadow_AntiShadow", desc = "Increases maximum health and stamina." },
                    { name = "Fel Intellect", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_MagicalSentry", desc = "Increases maximum mana and intellect by 15%." },
                    { name = "Demonic Aegis", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_RagingScream", desc = "Increases the effectiveness of Demon Armor and Fel Armor by 30%." },
                    { name = "Master Summoner", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ImpPhaseShift", desc = "Increases casting speed and attack power." },
                    { name = "Demonic Knowledge", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ImprovedVampiricEmbrace", desc = "Increases your spell damage by an amount equal to demon stamina and intellect." },
                    { name = "Demonic Tactics", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_DemonicEmpathy", desc = "Increases melee and spell critical strike chance by 10%." },
                },
            },
            {
                name = "Destruction", points = 14, icon = "Interface\\Icons\\Spell_Shadow_RainOfFire",
                milestones = {
                    { pts = 10, name = "Bane", active = true, desc = "Reduces the cast time and cooldown of Shadow Bolt and Destruction spells." },
                    { pts = 20, name = "Ruin", active = false, desc = "Increases critical strike damage bonus by 100%." },
                    { pts = 30, name = "Conflagrate", active = false, desc = "Ignites fire spells to trigger massive explosions." },
                },
                talents = {
                    { name = "Improved Shadow Bolt", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt", desc = "Critical strikes increase your Shadow spell damage dealt to the target by 20%." },
                    { name = "Cataclysm", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Fire_WindBreath", desc = "Reduces the mana cost of your Destruction spells by 5%." },
                    { name = "Devastation", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_FlameShock", desc = "Increases the critical strike chance of your Destruction spells by 5%." },
                },
            },
        },
    },

    warlock_corruption = {
        summary = "30 / 21 / 0",
        trees = {
            {
                name = "Affliction", points = 30, icon = "Interface\\Icons\\Spell_Shadow_DeathCoil",
                milestones = {
                    { pts = 10, name = "Nightfall", active = true, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Corruption ticks have a chance to enter a Trance state." },
                    { pts = 20, name = "Siphon Life", active = true, icon = "Interface\\Icons\\Spell_Shadow_Requiem", desc = "Transfers health from target to caster." },
                    { pts = 30, name = "Dark Pact", active = true, icon = "Interface\\Icons\\Spell_Shadow_DarkRitual", desc = "Drains mana and energy from minion to restore your own." },
                },
                talents = {
                    { name = "Suppression", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_UnsummonBuilding", desc = "Reduces enemy spell resist by 10%." },
                    { name = "Improved Corruption", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_AbominationExplosion", desc = "Increases damage of Corruption by 10% and reduces cast time." },
                    { name = "Improved Curse of Agony", points = 2, max = 3, icon = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras", desc = "Increases damage dealt by Curse of Agony by 6%." },
                    { name = "Nightfall", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Corruption ticks have a chance to grant instant cast." },
                    { name = "Empowered Corruption", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_AbominationExplosion", desc = "Increases damage of Corruption by an additional 12%." },
                    { name = "Amplify Curse", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Shadow_Contagion", desc = "Increases the effect of your next Curse by 50%." },
                    { name = "Shadow Mastery", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_Shade", desc = "Increases damage dealt by Shadow spells or effects by 10%." },
                    { name = "Siphon Life", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Shadow_Requiem", desc = "Periodic leech siphoning life force from targets." },
                    { name = "Contagion", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_PainSpike", desc = "Increases damage of Curse of Agony and Corruption by 5%." },
                    { name = "Dark Pact", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Shadow_DarkRitual", desc = "Milestone. Leech and mana sustain." },
                    { name = "Malediction", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_CurseOfAchimonde", desc = "Increases spell damage taken by cursed targets." },
                },
            },
            {
                name = "Demonology", points = 21, icon = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
                milestones = {
                    { pts = 10, name = "Fel Domination", active = true, icon = "Interface\\Icons\\Spell_Nature_RemoveCurse", desc = "Empowers your demonic summons and casting efficiency." },
                    { pts = 20, name = "Master Demonologist", active = true, icon = "Interface\\Icons\\Spell_Shadow_ShadowPact", desc = "Grants powerful passive combat bonuses and damage boosts." },
                    { pts = 30, name = "Soul Link", active = false, icon = "Interface\\Icons\\Spell_Shadow_GatherShadows", desc = "Shares damage taken with demon companion and boosts spell damage." },
                },
                talents = {
                    { name = "Improved Imp", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_SummonImp", desc = "Increases the effect of Firebolt and spell damage." },
                    { name = "Demonic Embrace", points = 1, max = 5, icon = "Interface\\Icons\\Spell_Shadow_Metamorphosis", desc = "Increases total Stamina by 3%." },
                    { name = "Fel Intellect", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_MagicalSentry", desc = "Increases maximum mana and intellect by 15%." },
                    { name = "Demonic Aegis", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_RagingScream", desc = "Increases the effectiveness of Demon Armor and Fel Armor by 30%." },
                    { name = "Master Summoner", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ImpPhaseShift", desc = "Increases casting speed and demon synergy." },
                    { name = "Demonic Tactics", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_DemonicEmpathy", desc = "Increases melee and spell critical strike chance by 10%." },
                    { name = "Fel Domination", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Nature_RemoveCurse", desc = "Milestone. Greatly empowers demonic flow." },
                },
            },
            {
                name = "Destruction", points = 0, icon = "Interface\\Icons\\Spell_Shadow_RainOfFire",
                milestones = {
                    { pts = 10, name = "Bane", active = false, icon = "Interface\\Icons\\Spell_Shadow_DeathPact", desc = "Reduces cast time of Destruction spells." },
                    { pts = 20, name = "Ruin", active = false, icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain", desc = "Increases critical strike damage bonus by 100%." },
                    { pts = 30, name = "Conflagrate", active = false, icon = "Interface\\Icons\\Spell_Fire_Fireball", desc = "Ignites Immolate to trigger massive explosion." },
                },
                talents = {},
            },
        },
    },

    rogue_crit = {
        summary = "32 / 11 / 8",
        trees = {
            {
                name = "Assassination", points = 32, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Relentless Strikes", active = true, desc = "Finishing moves refund energy." },
                    { pts = 20, name = "Cold Blood", active = true, desc = "Guarantees a critical strike on next ability." },
                    { pts = 30, name = "Vigor", active = true, desc = "Increases maximum energy and combat power." },
                },
                talents = {
                    { name = "Remorseless Attacks", points = 5, max = 5, icon = "Interface\\Icons\\Ability_FuriousSlash", desc = "Increases critical strike chance after killing an enemy." },
                    { name = "Malice", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases critical strike chance by 5%." },
                    { name = "Ruthlessness", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Druid_Disembowel", desc = "60% chance to add combo point on finishing move." },
                    { name = "Murder", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_DeathPact", desc = "Increases all damage dealt by 5%." },
                    { name = "Lethality", points = 5, max = 5, icon = "Interface\\Icons\\Ability_CriticalStrike", desc = "Increases critical strike damage bonus by 30%." },
                    { name = "Improved Expose Armor", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_Riposte", desc = "Increases armor reduction and physical puncture." },
                    { name = "Seal Fate", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ChillTouch", desc = "Critical strikes grant additional combo point." },
                },
            },
            {
                name = "Combat", points = 11, icon = "Interface\\Icons\\Ability_BackStab",
                milestones = {
                    { pts = 10, name = "Blade Flurry", active = true, desc = "Sinister Strike & Eviscerate strike additional nearby targets." },
                    { pts = 20, name = "Adrenaline Rush", active = false, desc = "Every 15th kill floods you with adrenaline." },
                    { pts = 30, name = "Surprise Attacks", active = false, desc = "Finishing moves cannot be dodged." },
                },
                talents = {
                    { name = "Improved Sinister Strike", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice", desc = "Reduces energy cost and increases Sinister Strike damage." },
                    { name = "Deflection", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Parry", desc = "Increases parry chance by 3%." },
                    { name = "Precision", points = 2, max = 5, icon = "Interface\\Icons\\Ability_Marksmanship", desc = "Increases melee hit chance by 2%." },
                },
            },
            {
                name = "Subtlety", points = 8, icon = "Interface\\Icons\\Ability_Stealth",
                milestones = {
                    { pts = 10, name = "Ghostly Strike", active = false, desc = "Strikes target and increases dodge chance." },
                    { pts = 20, name = "Preparation", active = false, desc = "Resets cooldown of rogue abilities." },
                    { pts = 30, name = "Premeditation", active = false, desc = "Adds 2 combo points immediately." },
                },
                talents = {
                    { name = "Opportunity", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Warrior_WarCry", desc = "Increases damage of Backstab and melee abilities from behind by 20%." },
                    { name = "Sleight of Hand", points = 3, max = 5, icon = "Interface\\Icons\\Ability_Rogue_Feint", desc = "Reduces chance to be critically hit and increases threat reduction." },
                },
            },
        },
    },

    rogue_backstab = {
        summary = "7 / 11 / 33",
        trees = {
            {
                name = "Assassination", points = 7, icon = "Interface\\Icons\\Ability_Rogue_Eviscerate",
                milestones = {
                    { pts = 10, name = "Relentless Strikes", active = false, desc = "Finishing moves refund energy." },
                    { pts = 20, name = "Cold Blood", active = false, desc = "Guarantees next ability deals critical damage." },
                    { pts = 30, name = "Vigor", active = false, desc = "Increases maximum energy and combat power." },
                },
                talents = {
                    { name = "Remorseless Attacks", points = 5, max = 5, icon = "Interface\\Icons\\Ability_FuriousSlash", desc = "Increases critical strike chance after killing an enemy." },
                    { name = "Malice", points = 2, max = 5, icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Increases critical strike chance by 2%." },
                },
            },
            {
                name = "Combat", points = 11, icon = "Interface\\Icons\\Ability_BackStab",
                milestones = {
                    { pts = 10, name = "Blade Flurry", active = true, desc = "Sinister Strike & Eviscerate strike additional nearby targets." },
                    { pts = 20, name = "Adrenaline Rush", active = false, desc = "Every 15th kill floods you with adrenaline." },
                    { pts = 30, name = "Surprise Attacks", active = false, desc = "Finishing moves cannot be dodged." },
                },
                talents = {
                    { name = "Improved Sinister Strike", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice", desc = "Reduces energy cost and increases strike damage." },
                    { name = "Lightning Reflexes", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Invisibility", desc = "Increases dodge chance by 5%." },
                },
            },
            {
                name = "Subtlety", points = 33, icon = "Interface\\Icons\\Ability_Stealth",
                milestones = {
                    { pts = 10, name = "Ghostly Strike", active = true, desc = "Strikes target and increases dodge chance." },
                    { pts = 20, name = "Preparation", active = true, desc = "Resets cooldown of rogue abilities." },
                    { pts = 30, name = "Premeditation", active = true, desc = "Adds 2 combo points immediately." },
                },
                talents = {
                    { name = "Master of Deception", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_Charm", desc = "Reduces chance enemies detect stealth." },
                    { name = "Opportunity", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Warrior_WarCry", desc = "Increases damage of Backstab and melee abilities from behind by 20%." },
                    { name = "Camouflage", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Stealth", desc = "Increases speed while stealthed and reduces stealth cooldown." },
                    { name = "Initiative", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_Fumble", desc = "75% chance to add combo point on opening moves." },
                    { name = "Improved Ambush", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Rogue_Ambush", desc = "Increases critical strike chance of Ambush by 45% and armor penetration." },
                    { name = "Setup", points = 2, max = 3, icon = "Interface\\Icons\\Spell_Shadow_EyeForAnEye", desc = "Chance to add a combo point after dodging." },
                    { name = "Deadliness", points = 5, max = 5, icon = "Interface\\Icons\\INV_Weapon_Crossbow_01", desc = "Increases attack power by 10%." },
                    { name = "Dirty Deeds", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Shadow_SummonSuccubus", desc = "Reduces energy cost of Cheap Shot and finishing moves." },
                },
            },
        },
    },

    shaman_magma_totem = {
        summary = "22 / 12 / 17",
        trees = {
            {
                name = "Elemental", points = 22, icon = "Interface\\Icons\\Spell_Nature_Lightning",
                milestones = {
                    { pts = 10, name = "Lightning Overload", active = false, desc = "Spells have chance to strike again." },
                    { pts = 20, name = "Elemental Fury", active = false, desc = "Increases crit damage by 100%." },
                    { pts = 30, name = "Elemental Mastery", active = false, desc = "Guarantees critical strike." },
                },
                talents = {
                    { name = "Convection", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_WispSplode", desc = "Reduces mana cost and cooldown of Shock and Lightning spells." },
                    { name = "Concussion", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Fire_Fireball", desc = "Increases damage of Shock and Lightning spells by 5%." },
                    { name = "Earth's Grasp", points = 2, max = 3, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Increases health of Stoneclaw and radius of Earthbind." },
                    { name = "Call of Flame", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Fire_Immolation", desc = "Increases damage of Fire totems by 15%." },
                    { name = "Call of Thunder", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_CallStorm", desc = "Increases critical strike chance of Lightning spells by 6%." },
                    { name = "Improved Fire Totems", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Fire_SealOfFire", desc = "Reduces delay before Fire Nova activates and Magma Totem threat." },
                },
            },
            {
                name = "Enhancement", points = 12, icon = "Interface\\Icons\\Spell_Nature_LightningShield",
                milestones = {
                    { pts = 10, name = "Windfury", active = false, desc = "Melee swings can proc extra hits." },
                    { pts = 20, name = "Maelstrom Weapon", active = false, desc = "Reduces spell cast times." },
                    { pts = 30, name = "Feral Spirit", active = false, desc = "Summons spirit wolves." },
                },
                talents = {
                    { name = "Shield Specialization", points = 5, max = 5, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases armor and block chance with shields." },
                    { name = "Guardian Totems", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Increases amount of damage reduced by Stoneskin and Grounding." },
                    { name = "Ancestral Knowledge", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_GrimWard", desc = "Increases maximum mana by 5%." },
                },
            },
            {
                name = "Restoration", points = 17, icon = "Interface\\Icons\\Spell_Nature_MagicImmunity",
                milestones = {
                    { pts = 10, name = "Call of the Elements", active = true, desc = "Totem pulse radius increased and pulse intervals faster." },
                    { pts = 20, name = "Reincarnation", active = false, desc = "Upon death, rise again at half health." },
                    { pts = 30, name = "Totemic Wrath", active = false, desc = "All totems emit damaging shockwaves." },
                },
                talents = {
                    { name = "Tidal Focus", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_ManaRecharge", desc = "Reduces mana cost of healing spells." },
                    { name = "Improved Healing Wave", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_MagicImmunity", desc = "Reduces cast time of Healing Wave by 0.5 sec." },
                    { name = "Totemic Focus", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_MoonKey", desc = "Reduces mana cost and cooldown of totems." },
                    { name = "Restorative Totems", points = 3, max = 5, icon = "Interface\\Icons\\Spell_Nature_HealingTouch", desc = "Increases effect of Mana Spring and Healing Stream totems." },
                },
            },
        },
    },

    shaman_earth_shock = {
        summary = "30 / 21 / 0",
        trees = {
            {
                name = "Elemental", points = 30, icon = "Interface\\Icons\\Spell_Nature_Lightning",
                milestones = {
                    { pts = 10, name = "Lightning Overload", active = true, desc = "Lightning Bolt and Chain Lightning have a 25% chance to strike again for free." },
                    { pts = 20, name = "Elemental Fury", active = true, desc = "Increases critical strike damage bonus of your spells by 100%." },
                    { pts = 30, name = "Elemental Mastery", active = false, desc = "Guarantees critical strike." },
                },
                talents = {
                    { name = "Convection", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_WispSplode", desc = "Reduces the mana cost and cooldown of your Shock and Lightning spells." },
                    { name = "Concussion", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Fire_Fireball", desc = "Increases the damage of your Shock and Lightning spells by 5%." },
                    { name = "Reverberation", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Frost_FrostWard", desc = "Reduces the cooldown of your Shock spells by 1 sec." },
                    { name = "Call of Thunder", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_CallStorm", desc = "Increases the critical strike chance of your Lightning and Shock spells by 5%." },
                    { name = "Lightning Mastery", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Lightning_LightningBolt01", desc = "Reduces the cast time and cooldown of your Lightning spells." },
                    { name = "Eye of the Storm", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Nature_EyeOfTheStorm", desc = "Grants 100% pushback resistance on critical hit." },
                    { name = "Elemental Focus", points = 1, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ManaBurn", desc = "Gives you a 10% chance to enter a Clearcasting state after dealing a critical strike." },
                },
            },
            {
                name = "Enhancement", points = 21, icon = "Interface\\Icons\\Spell_Nature_LightningShield",
                milestones = {
                    { pts = 10, name = "Flurry", active = true, desc = "Increases attack and casting speed by 30% after dealing a critical strike." },
                    { pts = 20, name = "Stormstrike", active = true, desc = "Attacks with weapons and causes the target to take 20% additional Nature damage." },
                    { pts = 30, name = "Feral Spirit", active = false, desc = "Summons spirit wolves." },
                },
                talents = {
                    { name = "Ancestral Knowledge", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_GrimWard", desc = "Increases your maximum Mana by 5%." },
                    { name = "Shield Specialization", points = 5, max = 5, icon = "Interface\\Icons\\INV_Shield_06", desc = "Increases block chance by 5% and block value by 25%." },
                    { name = "Thundering Strikes", points = 5, max = 5, icon = "Interface\\Icons\\Ability_ThunderBolt", desc = "Increases critical strike chance with all attacks and spells by 5%." },
                    { name = "Weapon Mastery", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Warrior_WeaponMastery", desc = "Increases the damage you deal with all weapons and shocks by 6%." },
                    { name = "Anticipation", points = 1, max = 5, icon = "Interface\\Icons\\Spell_Nature_MirrorImage", desc = "Increases Dodge and avoidance chance." },
                },
            },
            {
                name = "Restoration", points = 0, icon = "Interface\\Icons\\Spell_Nature_MagicImmunity",
                milestones = {
                    { pts = 10, name = "Call of the Elements", active = false, desc = "Totem pulse radius increased." },
                    { pts = 20, name = "Reincarnation", active = false, desc = "Upon death, rise again at half health." },
                    { pts = 30, name = "Totemic Wrath", active = false, desc = "All totems emit damaging shockwaves." },
                },
                talents = {},
            },
        },
    },

    priest_mind_blast = {
        summary = "19 / 0 / 32",
        trees = {
            {
                name = "Discipline", points = 19, icon = "Interface\\Icons\\Spell_Holy_WordFortitude",
                milestones = {
                    { pts = 10, name = "Inner Fire", active = true, desc = "Armor and spell power boost." },
                    { pts = 20, name = "Meditation", active = false, desc = "Mana regeneration continues while casting." },
                    { pts = 30, name = "Power Infusion", active = false, desc = "Infuses target with power, increasing spell damage by 20%." },
                },
                talents = {
                    { name = "Unbreakable Will", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Magic_MageArmor", desc = "Increases resistance to Stun, Fear, and Silence by 15%." },
                    { name = "Improved Power Word: Shield", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", desc = "Increases damage absorbed by shield by 15%." },
                    { name = "Martyrdom", points = 2, max = 5, icon = "Interface\\Icons\\Spell_Nature_Trance", desc = "Reduces pushback and increases resistance after critical hits." },
                    { name = "Mental Agility", points = 4, max = 5, icon = "Interface\\Icons\\Ability_Hibernation", desc = "Reduces mana cost and cooldown of instant cast spells." },
                    { name = "Mental Strength", points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_EnchantArmor", desc = "Increases maximum mana and spell damage by 8%." },
                },
            },
            {
                name = "Holy", points = 0, icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                milestones = {
                    { pts = 10, name = "Holy Nova", active = false, desc = "Burst of light damaging enemies and healing allies." },
                    { pts = 20, name = "Inspiration", active = false, desc = "Increases armor on critical heals." },
                    { pts = 30, name = "Spirit of Redemption", active = false, desc = "Become spirit upon death." },
                },
                talents = {},
            },
            {
                name = "Shadow", points = 32, icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
                milestones = {
                    { pts = 10, name = "Mind Flay", active = true, desc = "Assaults enemy mind with shadow damage and slows movement." },
                    { pts = 20, name = "Silence", active = true, desc = "Silences enemy, preventing all spellcasting." },
                    { pts = 30, name = "Shadowform", active = true, desc = "Assume a Shadowform, increasing shadow damage dealt by 15% and reducing physical damage taken." },
                },
                talents = {
                    { name = "Blackout", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_GatherShadows", desc = "Shadow damage spells have a 10% chance to stun target for 3 sec." },
                    { name = "Shadow Affinity", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Shadow_ShadowWard", desc = "Reduces threat and increases shadow resistance." },
                    { name = "Shadow Focus", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_BurningSpirit", desc = "Reduces chance enemies resist Shadow spells by 10%." },
                    { name = "Improved Mind Blast", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy", desc = "Reduces cooldown of Mind Blast by 2.5 sec." },
                    { name = "Improved Shadow Word: Pain", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain", desc = "Increases duration and periodic damage of Shadow Word: Pain." },
                    { name = "Shadow Reach", points = 1, max = 3, icon = "Interface\\Icons\\Spell_Shadow_ChillTouch", desc = "Increases range of Shadow spells by 7%." },
                    { name = "Shadow Weaving", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_BlackPlague", desc = "Shadow damage increases target shadow vulnerability by up to 15%." },
                    { name = "Darkness", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Increases Shadow spell damage by 10%." },
                },
            },
        },
    },

    priest_mind_flay = {
        summary = "19 / 0 / 32",
        trees = {
            {
                name = "Discipline", points = 19, icon = "Interface\\Icons\\Spell_Holy_WordFortitude",
                milestones = {
                    { pts = 10, name = "Inner Fire", active = true, desc = "Armor and spell power boost." },
                    { pts = 20, name = "Meditation", active = false, desc = "Mana regeneration continues while casting." },
                    { pts = 30, name = "Power Infusion", active = false, desc = "Infuses target with power, increasing spell damage by 20%." },
                },
                talents = {
                    { name = "Unbreakable Will", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Magic_MageArmor", desc = "Increases resistance to Stun, Fear, and Silence by 15%." },
                    { name = "Silent Resolve", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_ManaRegenTotem", desc = "Reduces threat and pushback from spell damage." },
                    { name = "Mental Agility", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Hibernation", desc = "Reduces mana cost and cooldown of instant cast spells." },
                    { name = "Mental Strength", points = 4, max = 5, icon = "Interface\\Icons\\Spell_Nature_EnchantArmor", desc = "Increases maximum mana and spell damage by 8%." },
                },
            },
            {
                name = "Holy", points = 0, icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                milestones = {
                    { pts = 10, name = "Holy Nova", active = false, desc = "Burst of light damaging enemies and healing allies." },
                    { pts = 20, name = "Inspiration", active = false, desc = "Increases armor on critical heals." },
                    { pts = 30, name = "Spirit of Redemption", active = false, desc = "Become spirit upon death." },
                },
                talents = {},
            },
            {
                name = "Shadow", points = 32, icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
                milestones = {
                    { pts = 10, name = "Mind Flay", active = true, desc = "Assaults enemy mind with shadow damage and slows movement." },
                    { pts = 20, name = "Silence", active = true, desc = "Silences enemy, preventing all spellcasting." },
                    { pts = 30, name = "Shadowform", active = true, desc = "Assume a Shadowform, increasing shadow damage dealt by 15% and reducing physical damage taken." },
                },
                talents = {
                    { name = "Blackout", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_GatherShadows", desc = "Shadow damage spells have a 10% chance to stun target for 3 sec." },
                    { name = "Improved Shadow Word: Pain", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain", desc = "Increases duration of Shadow Word: Pain by 6 sec." },
                    { name = "Shadow Focus", points = 4, max = 5, icon = "Interface\\Icons\\Spell_Shadow_BurningSpirit", desc = "Reduces chance enemies resist Shadow spells by 8%." },
                    { name = "Improved Mind Blast", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy", desc = "Reduces cooldown of Mind Blast by 2.5 sec." },
                    { name = "Shadow Reach", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Shadow_ChillTouch", desc = "Increases range of Shadow spells by 20%." },
                    { name = "Shadow Affinity", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Shadow_ShadowWard", desc = "Reduces threat and increases shadow resistance." },
                    { name = "Shadow Weaving", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_BlackPlague", desc = "Shadow damage increases target shadow vulnerability by up to 15%." },
                    { name = "Darkness", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Shadow_Twilight", desc = "Increases Shadow spell damage by 10%." },
                },
            },
        },
    },

    druid_starfire_moonkin = {
        summary = "33 / 0 / 18",
        trees = {
            {
                name = "Balance", points = 33, icon = "Interface\\Icons\\Spell_Nature_StarFall",
                milestones = {
                    { pts = 10, name = "Omen of Clarity", active = true, icon = "Interface\\Icons\\Spell_Nature_CrystalBall", desc = "Every spell cast has an 11% chance to call down a free Starfire." },
                    { pts = 20, name = "Moonkin Form", active = true, icon = "Interface\\Icons\\Spell_Nature_ForceOfNature", desc = "Stars fall around you: a free Starfire strikes every 4 sec." },
                    { pts = 30, name = "Starfall", active = true, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Calls down relentless lunar strikes that obliterate swarms." },
                },
                talents = {
                    { name = "Starlight Wrath", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_AbolishPoison", desc = "Reduces the cast time of your Wrath and Starfire spells by 0.5 sec." },
                    { name = "Improved Moonfire", points = 2, max = 5, icon = "Interface\\Icons\\Spell_Nature_StarFall", desc = "Increases damage and critical strike chance of Moonfire by 4%." },
                    { name = "Moonglow", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Sentinal", desc = "Reduces the Mana cost of your Moonfire, Starfire and Wrath spells by 15%." },
                    { name = "Nature's Grace", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Nature_NaturesBlessing", desc = "All spell critical strikes grace you with a blessing that reduces cast time." },
                    { name = "Vengeance", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases the critical strike damage bonus of Starfire, Moonfire, and Wrath by 100%." },
                    { name = "Improved Starfire", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Increases the critical strike chance of Starfire by 15% and has a 15% chance to stun." },
                    { name = "Celestial Focus", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Gives Starfire a 15% chance to stun the target and increases haste." },
                    { name = "Moonkin Form", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Nature_ForceOfNature", desc = "Increases spell critical strike chance of all party members by 5%." },
                    { name = "Moonfury", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_StarFall", desc = "Increases the damage done by your Starfire, Moonfire and Wrath spells by 10%." },
                    { name = "Brambles", points = 2, max = 2, icon = "Interface\\Icons\\Spell_Nature_Thorns", desc = "Increases damage dealt by Thorns and roots." },
                    { name = "Starfall", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Capstone. Calls down waves of stars upon enemies." },
                },
            },
            {
                name = "Feral", points = 0, icon = "Interface\\Icons\\Ability_Racial_BearForm",
                milestones = {
                    { pts = 10, name = "Feral Charge", active = false, icon = "Interface\\Icons\\Ability_Hunter_Pet_Bear", desc = "Charges enemy, immobilizing them." },
                    { pts = 20, name = "Blood Frenzy", active = false, icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Increases physical damage." },
                    { pts = 30, name = "Leader of the Pack", active = false, icon = "Interface\\Icons\\Spell_Nature_UnyeildingStamina", desc = "Increases critical strike chance." },
                },
                talents = {},
            },
            {
                name = "Restoration", points = 18, icon = "Interface\\Icons\\Spell_Nature_HealingTouch",
                milestones = {
                    { pts = 10, name = "Swiftmend", active = false, icon = "Interface\\Icons\\INV_Relics_IdolOfRejuvenation", desc = "Consumes a HoT effect to instantly heal." },
                    { pts = 20, name = "Tranquility", active = false, icon = "Interface\\Icons\\Spell_Nature_Tranquility", desc = "Heals all nearby party members." },
                    { pts = 30, name = "Gift of Nature", active = false, icon = "Interface\\Icons\\Spell_Nature_ProtectionformNature", desc = "Increases all healing effects by 10%." },
                },
                talents = {
                    { name = "Improved Mark of the Wild", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Regeneration", desc = "Increases the effects of Mark of the Wild and Gift of the Wild by 35%." },
                    { name = "Furor", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Unregenerate", desc = "Gives 100% chance to gain 10 Rage or 40 Energy when shapeshifting." },
                    { name = "Naturalist", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_HealingTouch", desc = "Reduces the cast time of Healing Touch and increases physical damage by 10%." },
                    { name = "Intensity", points = 3, max = 5, icon = "Interface\\Icons\\Spell_Frost_WindWalkOn", desc = "Allows mana regeneration to continue while casting." },
                },
            },
        },
    },

    druid_hurricane_cat = {
        summary = "18 / 33 / 0",
        trees = {
            {
                name = "Balance", points = 18, icon = "Interface\\Icons\\Spell_Nature_StarFall",
                milestones = {
                    { pts = 10, name = "Omen of Clarity", active = false, icon = "Interface\\Icons\\Spell_Nature_CrystalBall", desc = "Chance to grant free Starfire." },
                    { pts = 20, name = "Moonkin Form", active = false, icon = "Interface\\Icons\\Spell_Nature_ForceOfNature", desc = "Free Starfire every 4 sec." },
                    { pts = 30, name = "Starfall", active = false, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Hurricane reaches 50% farther." },
                },
                talents = {
                    { name = "Starlight Wrath", points = 2, max = 5, icon = "Interface\\Icons\\Spell_Nature_AbolishPoison", desc = "Reduces the cast time of your Wrath and Starfire spells by 0.2 sec." },
                    { name = "Brambles", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Nature_Thorns", desc = "Increases damage dealt by Thorns and roots." },
                    { name = "Moonglow", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Sentinal", desc = "Reduces the Mana cost of your Moonfire, Starfire and Wrath spells by 15%." },
                    { name = "Vengeance", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Nature_Purge", desc = "Increases the critical strike damage bonus of Starfire, Moonfire, and Wrath by 100%." },
                    { name = "Celestial Focus", points = 3, max = 3, icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Gives Starfire a 15% chance to stun the target and increases spell haste." },
                },
            },
            {
                name = "Feral", points = 33, icon = "Interface\\Icons\\Ability_Racial_BearForm",
                milestones = {
                    { pts = 10, name = "Feral Charge", active = true, icon = "Interface\\Icons\\Ability_Hunter_Pet_Bear", desc = "Charges enemy, immobilizing them." },
                    { pts = 20, name = "Blood Frenzy", active = true, icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Critical strikes rip the target open, causing bleed for 6 sec." },
                    { pts = 30, name = "Leader of the Pack", active = true, icon = "Interface\\Icons\\Spell_Nature_UnyeildingStamina", desc = "Increases melee and ranged critical strike chance of all party members by 3%." },
                },
                talents = {
                    { name = "Ferocity", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Hunter_Pet_Hyena", desc = "Reduces the cost of Maul, Swipe, Claw, and Rake by 5." },
                    { name = "Feral Aggression", points = 5, max = 5, icon = "Interface\\Icons\\Ability_Druid_DemoralizingRoar", desc = "Increases attack power reduction and Ferocious Bite damage by 15%." },
                    { name = "Brutal Impact", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Druid_Bash", desc = "Increases the stun duration of Bash and Pounce." },
                    { name = "Feral Charge", points = 1, max = 1, icon = "Interface\\Icons\\Ability_Hunter_Pet_Bear", desc = "Milestone. Causes you to charge an enemy, immobilizing them." },
                    { name = "Sharpened Claws", points = 3, max = 3, icon = "Interface\\Icons\\INV_Misc_MonsterClaw_04", desc = "Increases critical strike chance in Bear and Cat forms by 6%." },
                    { name = "Predatory Strikes", points = 1, max = 3, icon = "Interface\\Icons\\Ability_Hunter_Pet_Cat", desc = "Increases attack power in Cat and Bear forms." },
                    { name = "Primal Fury", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Racial_Cannibalize", desc = "Critical strikes in Cat form add an extra combo point." },
                    { name = "Blood Frenzy", points = 1, max = 1, icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Milestone. Bleeds cause critical strikes to deal additional damage." },
                    { name = "Savage Fury", points = 3, max = 3, icon = "Interface\\Icons\\Ability_Druid_Ravage", desc = "Increases the damage dealt by Claw, Rake, and Mangle by 20%." },
                    { name = "Heart of the Wild", points = 5, max = 5, icon = "Interface\\Icons\\Spell_Holy_BlessingOfAgility", desc = "Increases total Stamina by 20% and Strength by 20%." },
                    { name = "Survival of the Fittest", points = 2, max = 2, icon = "Interface\\Icons\\Ability_Druid_Enrage", desc = "Increases all attributes by 3% and reduces chance to be critically hit." },
                    { name = "Leader of the Pack", points = 1, max = 1, icon = "Interface\\Icons\\Spell_Nature_UnyeildingStamina", desc = "Capstone. Increases melee and spell crit aura." },
                },
            },
            {
                name = "Restoration", points = 0, icon = "Interface\\Icons\\Spell_Nature_HealingTouch",
                milestones = {
                    { pts = 10, name = "Swiftmend", active = false, icon = "Interface\\Icons\\INV_Relics_IdolOfRejuvenation", desc = "Consumes a HoT effect to instantly heal." },
                    { pts = 20, name = "Tranquility", active = false, icon = "Interface\\Icons\\Spell_Nature_Tranquility", desc = "Heals all nearby party members." },
                    { pts = 30, name = "Gift of Nature", active = false, icon = "Interface\\Icons\\Spell_Nature_ProtectionformNature", desc = "Increases all healing effects by 10%." },
                },
                talents = {},
            },
        },
    },
};

TALENT_DB.paladin_exorcism = TALENT_DB.paladin_retribution;
TALENT_DB.warrior_shield_slam_prot = TALENT_DB.warrior_shield_slam;
TALENT_DB.hunter_aimed_sniper = TALENT_DB.hunter_aimed_shot;
TALENT_DB.hunter_volley_trapper = TALENT_DB.hunter_multi_shot;
TALENT_DB.rogue_blade_flurry = TALENT_DB.rogue_crit;
TALENT_DB.rogue_shadow_assassin = TALENT_DB.rogue_backstab;
TALENT_DB.priest_shadow_melter = TALENT_DB.priest_mind_blast;
TALENT_DB.priest_holy_smiter = TALENT_DB.priest_mind_flay;
TALENT_DB.shaman_chain_lightning = TALENT_DB.shaman_magma_totem;
TALENT_DB.shaman_windfury_brawler = TALENT_DB.shaman_earth_shock;
TALENT_DB.shaman_totem_overlord = TALENT_DB.shaman_earth_shock;
TALENT_DB.mage_firestorm = TALENT_DB.mage_pyroblast;
TALENT_DB.mage_frost_shatter = TALENT_DB.mage_arcane_missiles;
TALENT_DB.warlock_affliction_vampire = TALENT_DB.warlock_searing_pain;
TALENT_DB.warlock_destruction_hellfire = TALENT_DB.warlock_corruption;
TALENT_DB.warlock_corruption_dot = TALENT_DB.warlock_corruption;
TALENT_DB.druid_balance_hurricane = TALENT_DB.druid_starfire_moonkin;
TALENT_DB.druid_starfire = TALENT_DB.druid_starfire_moonkin;
TALENT_DB.druid_feral_shredder = TALENT_DB.druid_hurricane_cat;
TALENT_DB.druid_hurricane = TALENT_DB.druid_hurricane_cat;

-- Bind talents to each build in BordoUI_BuildData.Builds
for classKey, classBuildList in pairs(BordoUI_BuildData.Builds) do
    for bIdx = 1, table.getn(classBuildList) do
        local b = classBuildList[bIdx];
        if b and b.id and TALENT_DB[b.id] then
            b.talents = TALENT_DB[b.id];
        end
    end
end

-- ============================================================================
-- BORDOUI MASTER CATALOG: ALL CLASS SPELLS & JEWELRY / TRINKETS FOR CUSTOM BUILDS
-- ============================================================================
BordoUI_Catalog = {};

BordoUI_Catalog.Spells = {
    PALADIN = {
        { name = "Consecration", key = "consecration", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_InnerFire", desc = "Core persistent holy field. Damages all enemies walking through it." },
        { name = "Holy Wrath", key = "holy_wrath", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_Excorcism", desc = "Radial holy blast. Delivers massive damage and brief stuns to demons and undead." },
        { name = "Judgement", key = "judgement", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_RighteousFury", desc = "Frequent targeted holy burst with short cooldown." },
        { name = "Exorcism", key = "exorcism", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_Excorcism_02", desc = "Heavy direct holy nuke that deals bonus damage against undead." },
        { name = "Hammer of Wrath", key = "hammer_of_wrath", school = "Holy", icon = "Interface\\Icons\\Ability_ThunderClap", desc = "The holy execute hammer. Deals gigantic damage to enemies below 20% HP." },
        { name = "Hammer of Justice", key = "hammer_of_justice", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_SealOfMight", desc = "Essential 5-second stun to lock down charging elites and interrupt dangerous casts." },
        { name = "Holy Shield", key = "holy_shield", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_BlessingOfProtection", desc = "Increases block chance and retaliates with holy damage whenever an attack is blocked." },
        { name = "Holy Shock", key = "holy_shock", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_SearingLight", desc = "Instant holy energy burst that blasts enemies and can leap to extra targets." },
        { name = "Holy Light", key = "holy_light", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_HolyBolt", desc = "Core holy healing wave that refills massive chunks of health." },
        { name = "Divine Shield", key = "divine_shield", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_DivineIntervention", desc = "Complete invulnerability bubble protecting you from all damage." },
        { name = "Redemption", key = "redemption", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_Resurrection", desc = "Empowered holy light that blasts surrounding foes and restores massive health." },
    },
    WARRIOR = {
        { name = "Whirlwind", school = "Physical", icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Core spinning attack hitting all surrounding targets in a 360-degree radius." },
        { name = "Cleave", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_Cleave", desc = "Sweeping strike that cuts through multiple foes in front of you." },
        { name = "Mortal Strike", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_SavageBlow", desc = "Primary weapon nuke delivering high base physical damage and mortal wounds." },
        { name = "Bloodthirst", school = "Physical", icon = "Interface\\Icons\\Spell_Nature_BloodLust", desc = "Instantly attacks the target and heals for a percentage of maximum health." },
        { name = "Shield Slam", school = "Physical", icon = "Interface\\Icons\\INV_Shield_05", desc = "Bashes target for massive physical damage scaled by your shield block value." },
        { name = "Execute", school = "Physical", icon = "Interface\\Icons\\INV_Sword_48", desc = "Devastating execution blow against wounded enemies below 20% health." },
        { name = "Revenge", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_Revenge", desc = "Counterattack triggered by blocking, dodging or parrying." },
        { name = "Thunder Clap", school = "Physical", icon = "Interface\\Icons\\Spell_Nature_ThunderClap", desc = "Blasts the ground, damaging nearby enemies and slowing their attack speed." },
        { name = "Rend", school = "Physical", icon = "Interface\\Icons\\Ability_Gouge", desc = "Wounds the target causing severe bleeding over several seconds." },
        { name = "Battle Shout", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_BattleShout", desc = "Increases attack power of you and all nearby allies." },
        { name = "Shield Block", school = "Physical", icon = "Interface\\Icons\\Ability_Defensivestate", desc = "Raises block chance by 100%, absorbing physical damage." },
        { name = "Sweeping Strikes", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_SliceDice", desc = "Causes your next attacks to strike an additional nearby enemy." },
        { name = "Overpower", school = "Physical", icon = "Interface\\Icons\\Ability_MeleeDamage", desc = "Unavoidable counter-strike when an enemy dodges your attack." },
        { name = "Slam", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_DecisiveStrike", desc = "Heavy focused overhead swing dealing high single-target damage." },
        { name = "Demoralizing Shout", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_WarCry", desc = "Shouts at nearby enemies, reducing their attack power and movement speed." },
        { name = "Bloodrage", school = "Physical", icon = "Interface\\Icons\\Ability_Racial_BloodRage", desc = "Instantly generates rage and grants bonus attack power over time." },
    },
    HUNTER = {
        { name = "Volley", school = "Arcane", icon = "Interface\\Icons\\Ability_Marksmanship", desc = "Continuously rains arrows in a large radius, decimating dense enemy packs." },
        { name = "Aimed Shot", school = "Physical", icon = "Interface\\Icons\\INV_Spear_07", desc = "Premier boss killing nuke. High multiplier dealing colossal single-target chunks." },
        { name = "Multi-Shot", school = "Physical", icon = "Interface\\Icons\\Ability_UpgradeMoonGlaive", desc = "Fires a volley of 3 arrows, hitting multiple enemies simultaneously." },
        { name = "Serpent Sting", school = "Nature", icon = "Interface\\Icons\\Ability_Hunter_Quickshot", desc = "Stings the target, dealing nature damage over 15 seconds." },
        { name = "Explosive Trap", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SelfDestruct", desc = "Places a fire trap that detonates, creating a persistent fire ring." },
        { name = "Immolation Trap", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Immolation", desc = "Detonates for heavy initial fire damage and ignites targets." },
        { name = "Frost Trap", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_FreezingBreath", desc = "Creates an ice slick that heavily slows all entering enemies." },
        { name = "Arcane Shot", school = "Arcane", icon = "Interface\\Icons\\Ability_ImpalingBolt", desc = "An instant shot that causes arcane damage to the target." },
        { name = "Concussive Shot", school = "Physical", icon = "Interface\\Icons\\Spell_Frost_Stun", desc = "Dazes the target, slowing its movement speed by 50%." },
        { name = "Rapid Fire", school = "Physical", icon = "Interface\\Icons\\Ability_Hunter_RunningShot", desc = "Increases ranged attack speed by 40% for 15 seconds." },
        { name = "Auto Shot", school = "Physical", icon = "Interface\\Icons\\Ability_Whirlwind", desc = "Automatic ranged attacks firing arrows continuously." },
        { name = "Hunter's Mark", school = "Physical", icon = "Interface\\Icons\\Ability_Hunter_SniperShot", desc = "Marks target, increasing all ranged damage dealt to it." },
    },
    MAGE = {
        { name = "Blizzard", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_IceStorm", desc = "Screen-wide ice storm heavily slowing all approaching mobs with continuous damage." },
        { name = "Cone of Cold", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_Glacier", desc = "Short-range frontal cone frost burst that freezes and slows advancing waves." },
        { name = "Frostbolt", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_FrostBolt02", desc = "Single-target frost projectile dealing heavy damage and slowing movement." },
        { name = "Flamestrike", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SelfDestruct", desc = "Pillar of fire that deals massive initial burst and leaves burning ground." },
        { name = "Pyroblast", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Fireball02", desc = "Giant fiery boulder that deals catastrophic damage and burns over time." },
        { name = "Fireball", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_FlameBolt", desc = "Classic incendiary projectile that burns for lingering fire damage." },
        { name = "Blast Wave", school = "Fire", icon = "Interface\\Icons\\Spell_Holy_Excorcism_02", desc = "Radial wave of flame detonating around you, dazing all enemies hit." },
        { name = "Arcane Missiles", school = "Arcane", icon = "Interface\\Icons\\Spell_Nature_StarFall", desc = "Channels a stream of arcane missiles into target with no travel delay." },
        { name = "Arcane Explosion", school = "Arcane", icon = "Interface\\Icons\\Spell_Nature_WispSplode", desc = "Instant blast of arcane magic dealing damage to all nearby enemies." },
        { name = "Scorch", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SoulBurn", desc = "Fast-casting fire spell that stacks Fire vulnerability on the target." },
        { name = "Frost Nova", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_FrostNova", desc = "Blasts nearby enemies for frost damage and freezes them in place for 8 sec." },
        { name = "Ice Barrier", school = "Frost", icon = "Interface\\Icons\\Spell_Ice_Lament", desc = "Instantly shields you with a thick frost barrier absorbing incoming damage." },
        { name = "Polymorph", school = "Arcane", icon = "Interface\\Icons\\Spell_Nature_Polymorph", desc = "Transforms enemy into a sheep, dealing arcane burst on detonation." },
        { name = "Fire Blast", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Fireball", desc = "Instant fire strike dealing quick direct damage to target." },
    },
    WARLOCK = {
        { name = "Corruption", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_AbominationExplosion", desc = "Core shadow curse ticking relentless damage while feeding passives." },
        { name = "Curse of Agony", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras", desc = "Curse of increasing agony that ramps up damage over time." },
        { name = "Shadow Bolt", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt", desc = "Premier shadow projectile hitting hard and applying Shadow Vulnerability." },
        { name = "Drain Life", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_LifeDrain02", desc = "Core channeled siphon dealing continuous damage while refilling health." },
        { name = "Siphon Life", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_Requiem", desc = "Persistent leech pulling health from target to restore your pool." },
        { name = "Death Coil", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_DeathCoil", desc = "Emergency life drain and fear that instantly heals you." },
        { name = "Hellfire", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Incinerate", desc = "High-frequency radial inferno vaporizing all enemies in close quarters." },
        { name = "Rain of Fire", school = "Fire", icon = "Interface\\Icons\\Spell_Shadow_RainOfFire", desc = "Fiery meteors raining down continuously in a designated target zone." },
        { name = "Immolate", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Immolation", desc = "Burns the enemy for initial fire damage plus periodic burn." },
        { name = "Searing Pain", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SoulBurn", desc = "Instant searing blast with high critical strike chance." },
        { name = "Soul Fire", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Fireball02", desc = "Massive demon flame nuke incinerating target for colossal single-hit damage." },
    },
    ROGUE = {
        { name = "Blade Flurry", school = "Physical", icon = "Interface\\Icons\\Ability_Warrior_PunishingBlow", desc = "Core cleave ability causing melee attacks to strike adjacent enemies." },
        { name = "Sinister Strike", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_RitualOfSacrifice", desc = "Primary combo generator delivering reliable physical weapon strikes." },
        { name = "Eviscerate", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_Eviscerate", desc = "Finishing move that unloads combo points for catastrophic burst damage." },
        { name = "Backstab", school = "Physical", icon = "Interface\\Icons\\Ability_BackStab", desc = "Extreme critical damage attack when striking enemies from behind." },
        { name = "Ambush", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_Ambush", desc = "Devastating opening strike from stealth dealing lethal critical damage." },
        { name = "Slice and Dice", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_SliceDice", desc = "Increases melee attack speed by 30% for high sustained DPS." },
        { name = "Rupture", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_Rupture", desc = "Finishing move causing targets to bleed heavily over time." },
        { name = "Hemorrhage", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_LifeDrain", desc = "Physical strike causing target to take additional damage from all physical sources." },
        { name = "Gouge", school = "Physical", icon = "Interface\\Icons\\Ability_Gouge", desc = "Gouges the enemy's eyes, incapacitating them for up to 5.5 seconds." },
        { name = "Ghostly Strike", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_Curse", desc = "Strikes the enemy and increases your dodge chance by 15%." },
        { name = "Adrenaline Rush", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_ShadowWordDominate", desc = "Increases energy regeneration and attack tempo by 100%." },
        { name = "Kidney Shot", school = "Physical", icon = "Interface\\Icons\\Ability_Rogue_KidneyShot", desc = "Finishing move that stuns the target for up to 6 seconds." },
        { name = "Seal Fate", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_ChillTouch", desc = "Critical strikes with combo-generating abilities add an additional combo point." },
    },
    SHAMAN = {
        { name = "Chain Lightning", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_ChainLightning", desc = "Core bouncing lightning strike that arcs across multiple enemies." },
        { name = "Lightning Bolt", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Lightning", desc = "Cast of pure electrical energy dealing heavy single-target nature damage." },
        { name = "Earth Shock", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_EarthShock", desc = "Instant shock dealing nature damage and interrupting enemy spellcasting." },
        { name = "Flame Shock", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_FlameShock", desc = "Instant shock burning target for fire damage and periodic burn." },
        { name = "Frost Shock", school = "Frost", icon = "Interface\\Icons\\Spell_Frost_FrostShock", desc = "Instant frost blast slowing target movement speed by 50%." },
        { name = "Magma Totem", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SelfDestruct", desc = "Pulsating fire AoE totem emitting radial fire pulses that incinerate mobs." },
        { name = "Searing Totem", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SearingTotem", desc = "Summons a stationary totem that fires continuous searing fire bolts." },
        { name = "Fire Nova", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_SealOfFire", desc = "Causes your active fire totem to detonate with a massive nova wave." },
        { name = "Stormstrike", school = "Physical", icon = "Interface\\Icons\\Spell_Holy_SealOfMight", desc = "Double weapon strike granting +20% nature damage debuff on target." },
        { name = "Windfury", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Cyclone", desc = "Imbues your weapon for a chance to unleash 2 extra instant attacks." },
        { name = "Lightning Shield", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_LightningShield", desc = "Surrounds you with lightning orbs that shock attackers." },
        { name = "Healing Wave", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_MagicImmunity", desc = "Heals you for a significant amount of lost health." },
        { name = "Call of Flame", school = "Fire", icon = "Interface\\Icons\\Spell_Fire_Immolation", desc = "Empowers fire totems, increasing their radius and damage output." },
    },
    PRIEST = {
        { name = "Shadow Word: Pain", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_ShadowWordPain", desc = "Core shadow DoT spreading across approaching enemies, ticking down life." },
        { name = "Mind Flay", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_SiphonMana", desc = "Channels shadow energy to assault the mind, slowing movement by 50%." },
        { name = "Mind Blast", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_UnholyFrenzy", desc = "High-damage shadow burst dealing critical direct damage." },
        { name = "Devouring Plague", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_BlackPlague", desc = "Vile disease afflicting target for continuous shadow damage." },
        { name = "Holy Nova", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_HolyNova", desc = "Core radial burst dealing holy damage to all enemies and healing simultaneously." },
        { name = "Smite", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_HolySmite", desc = "Direct holy beam dealing focused single-target holy damage." },
        { name = "Holy Fire", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_SearingLight", desc = "Engulfs target in holy flames with heavy direct and lingering damage." },
        { name = "Power Word: Shield", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", desc = "Draws on the soul of the friendly target to shield them from all damage." },
        { name = "Renew", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_Renew", desc = "Heals target over 15 seconds, providing persistent survival." },
        { name = "Psychic Scream", school = "Shadow", icon = "Interface\\Icons\\Spell_Shadow_PsychicScream", desc = "Emits a psychic scream, causing 5 nearby enemies to flee in terror." },
        { name = "Lightwell", school = "Holy", icon = "Interface\\Icons\\Spell_Holy_SummonLightwell", desc = "Creates a holy lightwell that continuously heals you and pulses holy radiant damage." },
    },
    DRUID = {
        { name = "Hurricane", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Cyclone", desc = "Screen-wide swirling tempest slowing enemy move speed and dealing rapid nature damage." },
        { name = "Moonfire", school = "Arcane", icon = "Interface\\Icons\\Spell_Nature_StarFall", desc = "Instant lunar strike dealing arcane damage and burning over 12 seconds." },
        { name = "Starfire", school = "Arcane", icon = "Interface\\Icons\\Spell_Arcane_StarFire", desc = "Calls down a heavy celestial blast dealing catastrophic arcane damage." },
        { name = "Wrath", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_AbolishPoison", desc = "Quick nature bolt that continuously chips away at advancing foes." },
        { name = "Swipe", school = "Physical", icon = "Interface\\Icons\\INV_Misc_MonsterClaw_03", desc = "Bear form claw swipe hitting multiple surrounding enemies." },
        { name = "Shred", school = "Physical", icon = "Interface\\Icons\\Spell_Shadow_VampiricAura", desc = "Cat form claw strike dealing extreme damage from behind targets." },
        { name = "Rip", school = "Physical", icon = "Interface\\Icons\\Ability_GhoulFrenzy", desc = "Finishing move causing target to bleed for heavy physical damage." },
        { name = "Rake", school = "Physical", icon = "Interface\\Icons\\Ability_Druid_Disembowel", desc = "Rakes the target for bleed damage over 9 seconds." },
        { name = "Ferocious Bite", school = "Physical", icon = "Interface\\Icons\\Ability_Druid_FerociousBite", desc = "Cat finisher biting target with raw kinetic force." },
        { name = "Barkskin", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem", desc = "Turns skin as tough as bark, reducing all damage taken by 20%." },
        { name = "Entangling Roots", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_StrangleVines", desc = "Roots target in place, rendering them completely immobile." },
        { name = "Thorns", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Thorns", desc = "Sprouts thorns on you that retaliate with nature damage when struck." },
        { name = "Rejuvenation", school = "Nature", icon = "Interface\\Icons\\Spell_Nature_Rejuvenation", desc = "Heals the target continuously over 12 seconds." },
    },
};

BordoUI_Catalog.Jewelry = {
    -- UNIVERSAL NECKLACES (Authentic Azeroth Survivors Codex)
    { slotType = "NECK", name = "Amulet of Vek'nilash", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_01", quality = 4, benefit = "Spells: +1 Target, +5% Dmg", desc = "Your spells: +1 target\n+5% damage" },
    { slotType = "NECK", name = "Amulet of the Darkmoon", icon = "Interface\\Icons\\INV_Jewelry_Necklace_14", quality = 2, benefit = "-12% Cooldowns, +8% Spd", desc = "-12% cooldowns\n+8% movement speed" },
    { slotType = "NECK", name = "Animated Chain Necklace", icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", quality = 2, benefit = "+25% Max HP, +8% Dmg Red", desc = "+25% max health\n+8% damage reduction" },
    { slotType = "NECK", name = "Choker of Enlightenment", icon = "Interface\\Icons\\INV_Jewelry_Necklace_10", quality = 4, benefit = "Hits leap to 1 more for 30%", desc = "Your hits leap to 1 more enemy for 30%" },
    { slotType = "NECK", name = "Choker of the Fire Lord",
                    icon = "Interface\\Icons\\INV_Jewelry_Amulet_05", quality = 5, benefit = "Kills explode for 15% HP", desc = "Enemies you kill explode for 15% of their max health" },
    { slotType = "NECK", name = "Jeklik's Opaline Talisman", icon = "Interface\\Icons\\INV_Jewelry_Necklace_03", quality = 3, benefit = "3% Leech, +1.0 Heal on Kill", desc = "3% of damage dealt heals\nEach kill heals 1.0" },
    { slotType = "NECK", name = "Malice Stone Pendant", icon = "Interface\\Icons\\INV_Jewelry_Necklace_29", quality = 4, benefit = "20% Cast Twice, -8% CD", desc = "20% chance to cast twice\n-8% cooldowns" },
    { slotType = "NECK", name = "Mark of Fordring", icon = "Interface\\Icons\\INV_Jewelry_Talisman_07", quality = 1, benefit = "+15% Damage" },
    { slotType = "NECK", name = "Medallion of Steadfast Might",
                    icon = "Interface\\Icons\\INV_Jewelry_Amulet_03", quality = 3, benefit = "+10% Red, +15% HP, Thorns", desc = "+10% damage reduction\n+15% max health\nMelee attackers take 100% of their damage" },
    { slotType = "NECK", name = "Onyxia Tooth Pendant",
                    icon = "Interface\\Icons\\INV_Jewelry_Necklace_09", quality = 5, benefit = "+4% Crit, +20% Crit Dmg, Splash", desc = "+4% critical strike\n+20% critical strike damage\nCrits splash 30% within 5 yd" },
    { slotType = "NECK", name = "Pendant of the Fallen Dragon", icon = "Interface\\Icons\\INV_Jewelry_Necklace_12", quality = 4, benefit = "Cheat Death 60s, +20% HP, +5 HP/s", desc = "A killing blow leaves you at 50% health, once every 60 sec\n+20% max health\n+5.0 health per second" },
    { slotType = "NECK", name = "Prestor's Talisman of Connivery", icon = "Interface\\Icons\\INV_Jewelry_Necklace_17", quality = 2, benefit = "+16% Damage, +4% Crit", desc = "+16% damage\n+4% critical strike" },
    { slotType = "NECK", name = "Pristine Enchanted South Seas Kelp", icon = "Interface\\Icons\\INV_Jewelry_Necklace_26", quality = 1, benefit = "+30% Luck, +25% Gold", desc = "+30% luck\n+25% gold" },
    { slotType = "NECK", name = "Talvash's Enhancing Necklace", icon = "Interface\\Icons\\INV_Jewelry_Necklace_02", quality = 1, benefit = "-10% Cooldowns" },
    { slotType = "NECK", name = "The Eye of Hakkar", icon = "Interface\\Icons\\INV_Jewelry_Necklace_22", quality = 3, benefit = "+5% Crit, Crits burn/bleed 80%", desc = "+5% critical strike\nCrits burn and bleed for 80% more over 4 sec" },
    { slotType = "NECK", name = "Woven Ivy Necklace", icon = "Interface\\Icons\\INV_Misc_Herb_15", quality = 2, benefit = "+6.0 HP/s, +12% HP, +12% Spd", desc = "+6.0 health per second\n+12% max health\n+12% movement speed" },

    -- UNIVERSAL RINGS (Authentic Azeroth Survivors Codex - Base Rank I)
    { slotType = "RING", name = "Archimtiros' Ring of Reckoning",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_35", quality = 3, benefit = "+4.4% Dmg Red, +18% Max HP", desc = "+4.4% damage reduction, +18% max health" },
    { slotType = "RING", name = "Band of Accuria",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_15", quality = 4, benefit = "+26% Damage" },
    { slotType = "RING", name = "Blooddrinker's Band",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_49Naxxramas", quality = 3, benefit = "1.5% Leech", desc = "1.5% of damage dealt heals" },
    { slotType = "RING", name = "Heavy Dark Iron Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_14", quality = 2, benefit = "+25% Max HP" },
    { slotType = "RING", name = "Master Dragonslayer's Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_41", quality = 4, benefit = "+6% Critical Strike", desc = "+6% critical strike chance" },
    { slotType = "RING", name = "Quick Strike Ring",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_07", quality = 4, benefit = "-14% Cooldowns" },
    { slotType = "RING", name = "Ring of Spell Power",
                    icon = "Interface\\Icons\\INV_Jewelry_Ring_38", quality = 3, benefit = "+21% Area of Effect" },
    { slotType = "RING", name = "Ring of the Devoured", icon = "Interface\\Icons\\INV_Jewelry_Ring_AhnQiraj_05", quality = 4, benefit = "+2.2 Health/sec" },
    { slotType = "RING", name = "Seal of the Damned", icon = "Interface\\Icons\\INV_Jewelry_Ring_51Naxxramas", quality = 4, benefit = "Faster DoT ticks", desc = "Faster damage over time" },

    -- UNIVERSAL TRINKETS (Authentic Azeroth Survivors Codex - Base Rank I)
    { slotType = "TRINKET", name = "Blackhand's Breadth",
                    icon = "Interface\\Icons\\INV_Misc_ArmorKit_09", quality = 3, benefit = "+29% Critical Strike Damage" },
    { slotType = "TRINKET", name = "Carrot on a Stick", icon = "Interface\\Icons\\INV_Misc_Food_54", quality = 2, benefit = "+12% Movement Speed" },
    { slotType = "TRINKET", name = "Earthstrike",
                    icon = "Interface\\Icons\\Spell_Nature_AbolishMagic", quality = 4, benefit = "+20% Damage" },
    { slotType = "TRINKET", name = "Gnomish Universal Remote", icon = "Interface\\Icons\\INV_Misc_PocketWatch_01", quality = 2, benefit = "+52% Pickup Range" },
    { slotType = "TRINKET", name = "Hand of Justice",
                    icon = "Interface\\Icons\\INV_Jewelry_Talisman_01", quality = 4, benefit = "9% Chance to Cast Twice", desc = "9% chance to cast twice" },
    { slotType = "TRINKET", name = "Horn of the Warchief", icon = "Interface\\Icons\\INV_Misc_Horn_01", quality = 3, benefit = "Buffs 22% Stronger" },
    { slotType = "TRINKET", name = "Insignia of the Horde", icon = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02", quality = 3, benefit = "+18% Experience" },
    { slotType = "TRINKET", name = "Lifegiving Gem",
                    icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_05", quality = 4, benefit = "+20% Max HP" },
    { slotType = "TRINKET", name = "Major Soulstone", icon = "Interface\\Icons\\INV_Misc_Orb_04", quality = 4, benefit = "+1 Return to Life" },
    { slotType = "TRINKET", name = "Mark of the Chosen", icon = "Interface\\Icons\\INV_Jewelry_Talisman_08", quality = 2, benefit = "+22% Luck" },
    { slotType = "TRINKET", name = "Onyxia Blood Talisman", icon = "Interface\\Icons\\Spell_Shadow_LifeDrain", quality = 4, benefit = "Each kill heals 3.0", desc = "Each kill heals 3.0" },
    { slotType = "TRINKET", name = "Royal Seal of Eldre'Thalas", icon = "Interface\\Icons\\INV_Jewelry_Talisman_10", quality = 3, benefit = "+38% Gold" },
    { slotType = "TRINKET", name = "Star of Mystaria",
                    icon = "Interface\\Icons\\INV_Enchant_EssenceMagicLarge", quality = 3, benefit = "+25% Max HP, +4% Dmg Red", desc = "+25% max health, +4% damage reduction" },
    { slotType = "TRINKET", name = "Talisman of Ephemeral Power",
                    icon = "Interface\\Icons\\INV_Misc_StoneTablet_11", quality = 4, benefit = "-10% Cooldowns" },

    -- CLASS-SPECIFIC LEGENDARY NECKLACES (Remakes class spells)
    -- PALADIN Legendary Amulets
    { slotType = "NECK", class = "PALADIN", spell = "Consecration", name = "Eye of the Splitting Sky: Consecration", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Consecration", desc = "Legendary amulet - remakes Consecration\nConsecration strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "PALADIN", spell = "Holy Shock", name = "Eye of the Splitting Sky: Holy Shock", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Holy Shock", desc = "Legendary amulet - remakes Holy Shock\nReduces Holy Shock cooldown by 15% and increases damage by 20%." },
    { slotType = "NECK", class = "PALADIN", spell = "Exorcism", name = "Eye of the Splitting Sky: Exorcism", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "+1 Tgt, +24% Dmg, Leap", desc = "Legendary amulet - remakes Exorcism\nEquip: Exorcism strikes 1 more target.\nEquip: Increases the damage of Exorcism by 24%.\nEquip: Exorcism's hits leap to 2 more enemies for 36%." },
    { slotType = "NECK", class = "PALADIN", spell = "Holy Wrath", name = "Eye of the Splitting Sky: Holy Wrath", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Holy Wrath", desc = "Legendary amulet - remakes Holy Wrath\nHoly Wrath strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "PALADIN", spell = "Judgement", name = "Eye of the Splitting Sky: Judgement", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Judgement", desc = "Legendary amulet - remakes Judgement\nReduces Judgement cooldown by 15% and increases damage by 25%." },
    { slotType = "NECK", class = "PALADIN", spell = "Hammer of Wrath", name = "Eye of the Splitting Sky: Hammer of Wrath", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Hammer of Wrath", desc = "Legendary amulet - remakes Hammer of Wrath\nIncreases the damage of Hammer of Wrath by 30%." },
    { slotType = "NECK", class = "PALADIN", spell = "Holy Shield", name = "Eye of the Splitting Sky: Holy Shield", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Holy Shield", desc = "Legendary amulet - remakes Holy Shield\nIncreases Holy Shield absorb by 25% and damage by 15%." },
    { slotType = "NECK", class = "PALADIN", spell = "Divine Shield", name = "Eye of the Splitting Sky: Divine Shield", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Divine Shield", desc = "Legendary amulet - remakes Divine Shield\nReduces the cooldown of Divine Shield by 20%." },
    { slotType = "NECK", class = "PALADIN", spell = "Holy Light", name = "Eye of the Splitting Sky: Holy Light", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Holy Light", desc = "Legendary amulet - remakes Holy Light\nIncreases the healing of Holy Light by 30%." },
    { slotType = "NECK", class = "PALADIN", spell = "Redemption", name = "Eye of the Splitting Sky: Redemption", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Redemption", desc = "Legendary amulet - remakes Redemption\nIncreases Redemption damage by 25% and healing by 20%." },
    { slotType = "NECK", class = "PALADIN", spell = "Hammer of Justice", name = "Eye of the Splitting Sky: Hammer of Justice", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_04", quality = 5, benefit = "Remakes Hammer of Justice", desc = "Legendary amulet - remakes Hammer of Justice\nIncreases stun duration by 1.5s and reduces cooldown by 20%." },
    -- WARRIOR Legendary Amulets
    { slotType = "NECK", class = "WARRIOR", spell = "Shield Slam", name = "Medallion of the Bladestorm", icon = "Interface\\Icons\\INV_Misc_Cape_18", quality = 5, benefit = "Remakes Shield Slam", desc = "Legendary amulet - remakes Shield Slam\nSlams through multiple targets with devastating force." },
    { slotType = "NECK", class = "WARRIOR", spell = "Whirlwind", name = "Heart of the Earthshaker", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Whirlwind", desc = "Legendary amulet - remakes Whirlwind\nWhirlwind hits all surrounding targets with massive earthshaking force." },
    { slotType = "NECK", class = "WARRIOR", spell = "Whirlwind", name = "Eye of the Splitting Sky: Whirlwind", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Whirlwind", desc = "Legendary amulet - remakes Whirlwind\nWhirlwind strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "WARRIOR", spell = "Cleave", name = "Eye of the Splitting Sky: Cleave", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Cleave", desc = "Legendary amulet - remakes Cleave\nCleave strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "WARRIOR", spell = "Mortal Strike", name = "Eye of the Splitting Sky: Mortal Strike", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Mortal Strike", desc = "Legendary amulet - remakes Mortal Strike\nIncreases Mortal Strike damage by 30%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Shield Slam", name = "Eye of the Splitting Sky: Shield Slam", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Shield Slam", desc = "Legendary amulet - remakes Shield Slam\nShield Slam deals extra damage equal to 15% of your max health." },
    { slotType = "NECK", class = "WARRIOR", spell = "Execute", name = "Eye of the Splitting Sky: Execute", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Execute", desc = "Legendary amulet - remakes Execute\nIncreases Execute damage by 35%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Bloodthirst", name = "Eye of the Splitting Sky: Bloodthirst", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Bloodthirst", desc = "Legendary amulet - remakes Bloodthirst\nIncreases Bloodthirst damage by 25% and healing by 30%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Thunder Clap", name = "Eye of the Splitting Sky: Thunder Clap", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Thunder Clap", desc = "Legendary amulet - remakes Thunder Clap\nIncreases Thunder Clap area by 25% and damage by 20%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Demoralizing Shout", name = "Eye of the Splitting Sky: Demoralizing Shout", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Demoralizing Shout", desc = "Legendary amulet - remakes Demoralizing Shout\nIncreases Demoralizing Shout weakening by 25%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Battle Shout", name = "Eye of the Splitting Sky: Battle Shout", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Battle Shout", desc = "Legendary amulet - remakes Battle Shout\nIncreases Battle Shout strength buff by 30%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Rend", name = "Eye of the Splitting Sky: Rend", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Rend", desc = "Legendary amulet - remakes Rend\nIncreases Rend bleed damage by 30%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Bloodrage", name = "Eye of the Splitting Sky: Bloodrage", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Bloodrage", desc = "Legendary amulet - remakes Bloodrage\nBloodrage procs 25% more often and grants extra attack power." },
    { slotType = "NECK", class = "WARRIOR", spell = "Revenge", name = "Eye of the Splitting Sky: Revenge", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Revenge", desc = "Legendary amulet - remakes Revenge\nRevenge strikes 2 additional targets and deals +35% damage." },
    { slotType = "NECK", class = "WARRIOR", spell = "Shield Block", name = "Eye of the Splitting Sky: Shield Block", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Shield Block", desc = "Legendary amulet - remakes Shield Block\nShield Block reflects 30% absorbed damage back to attacker." },
    { slotType = "NECK", class = "WARRIOR", spell = "Sweeping Strikes", name = "Eye of the Splitting Sky: Sweeping Strikes", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Sweeping Strikes", desc = "Legendary amulet - remakes Sweeping Strikes\nSweeping Strikes cleaves to 2 additional enemies with +20% damage." },
    { slotType = "NECK", class = "WARRIOR", spell = "Overpower", name = "Eye of the Splitting Sky: Overpower", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Overpower", desc = "Legendary amulet - remakes Overpower\nOverpower critical strike damage increased by 50%." },
    { slotType = "NECK", class = "WARRIOR", spell = "Slam", name = "Eye of the Splitting Sky: Slam", icon = "Interface\\Icons\\INV_Jewelry_Necklace_18", quality = 5, benefit = "Remakes Slam", desc = "Legendary amulet - remakes Slam\nSlam becomes instant cast and deals +25% damage." },
    -- SHAMAN Legendary Amulets
    { slotType = "NECK", class = "SHAMAN", spell = "Magma Totem", name = "Amulet of the Ancients", icon = "Interface\\Icons\\INV_Jewelry_Talisman_07", quality = 5, benefit = "Remakes Magma Totem", desc = "Legendary amulet - remakes Magma Totem\nMagma Totem pulses with immense fiery volcanic force across the battlefield." },
    { slotType = "NECK", class = "SHAMAN", spell = "Magma Totem", name = "Eye of the Splitting Sky: Magma Totem", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Magma Totem", desc = "Legendary amulet - remakes Magma Totem\nEvery Magma Totem pulse heals you for 2% of max health and deals +25% damage." },
    { slotType = "NECK", class = "SHAMAN", spell = "Searing Totem", name = "Eye of the Splitting Sky: Searing Totem", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Searing Totem", desc = "Legendary amulet - remakes Searing Totem\nIncreases Searing Totem attack rate and damage by 30%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Flame Shock", name = "Eye of the Splitting Sky: Flame Shock", icon = "Interface\\Icons\\INV_Jewelry_Necklace_28", quality = 5, benefit = "Remakes Flame Shock", desc = "Legendary amulet - remakes Flame Shock\nFlame Shock burn damage ticks 40% faster and deals +25% damage." },
    { slotType = "NECK", class = "SHAMAN", spell = "Lightning Bolt", name = "Eye of the Splitting Sky: Lightning Bolt", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Lightning Bolt", desc = "Legendary amulet - remakes Lightning Bolt\nLightning Bolt strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "SHAMAN", spell = "Chain Lightning", name = "Eye of the Splitting Sky: Chain Lightning", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Chain Lightning", desc = "Legendary amulet - remakes Chain Lightning\nChain Lightning jumps to 2 more targets and loses nothing per jump." },
    { slotType = "NECK", class = "SHAMAN", spell = "Earth Shock", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Earth Shock", desc = "Legendary amulet - remakes Earth Shock\nReduces Earth Shock cooldown by 20% and increases damage by 25%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Earth Shock", name = "Eye of the Splitting Sky: Earth Shock", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Earth Shock", desc = "Legendary amulet - remakes Earth Shock\nReduces Earth Shock cooldown by 20% and increases damage by 25%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Frost Shock", name = "Eye of the Splitting Sky: Frost Shock", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Frost Shock", desc = "Legendary amulet - remakes Frost Shock\nIncreases Frost Shock slow duration and damage by 25%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Lightning Shield", name = "Eye of the Splitting Sky: Lightning Shield", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02", quality = 5, benefit = "Remakes Lightning Shield", desc = "Legendary amulet - remakes Lightning Shield\nLightning Shield discharges retaliate for 35% more damage." },
    { slotType = "NECK", class = "SHAMAN", spell = "Fire Nova", name = "Eye of the Splitting Sky: Fire Nova", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Fire Nova", desc = "Legendary amulet - remakes Fire Nova\nIncreases Fire Nova area by 30% and damage by 25%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Healing Wave", name = "Eye of the Splitting Sky: Healing Wave", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Healing Wave", desc = "Legendary amulet - remakes Healing Wave\nIncreases Healing Wave healing by 35%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Call of Flame", name = "Eye of the Splitting Sky: Call of Flame", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Call of Flame", desc = "Legendary amulet - remakes Call of Flame\nIncreases all fire totem damage and radius by 30%." },
    { slotType = "NECK", class = "SHAMAN", spell = "Stormstrike", name = "Eye of the Splitting Sky: Stormstrike", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Stormstrike", desc = "Legendary amulet - remakes Stormstrike\nStormstrike grants +30% nature damage bonus and strikes 1 more target." },
    { slotType = "NECK", class = "SHAMAN", spell = "Windfury", name = "Eye of the Splitting Sky: Windfury", icon = "Interface\\Icons\\INV_Jewelry_Necklace_23", quality = 5, benefit = "Remakes Windfury", desc = "Legendary amulet - remakes Windfury\nWindfury extra attacks deal +35% attack power bonus." },
    -- MAGE Legendary Amulets
    { slotType = "NECK", class = "MAGE", spell = "Blizzard", name = "Eye of the Splitting Sky: Blizzard", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Blizzard", desc = "Legendary amulet - remakes Blizzard\nBlizzard area increased by 25% and damage increased by 20%." },
    { slotType = "NECK", class = "MAGE", spell = "Frostbolt", name = "Eye of the Splitting Sky: Frostbolt", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Frostbolt", desc = "Legendary amulet - remakes Frostbolt\nFrostbolt strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Fireball", name = "Eye of the Splitting Sky: Fireball", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Fireball", desc = "Legendary amulet - remakes Fireball\nFireball deals +30% damage and burns for 40% more." },
    { slotType = "NECK", class = "MAGE", spell = "Flamestrike", name = "Eye of the Splitting Sky: Flamestrike", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Flamestrike", desc = "Legendary amulet - remakes Flamestrike\nFlamestrike area increased by 30% and lingering burn by 35%." },
    { slotType = "NECK", class = "MAGE", spell = "Arcane Missiles", name = "Stormcaller's Amulet", icon = "Interface\\Icons\\INV_Jewelry_Necklace_26", quality = 5, benefit = "Remakes Arcane Missiles", desc = "Legendary amulet - remakes Arcane Missiles\nFires rapid barrages of Arcane Missiles with increased missile count and damage." },
    { slotType = "NECK", class = "MAGE", spell = "Arcane Missiles", name = "Eye of the Splitting Sky: Arcane Missiles", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Arcane Missiles", desc = "Legendary amulet - remakes Arcane Missiles\nFires 2 additional missiles and deals +25% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Arcane Explosion", name = "Eye of the Splitting Sky: Arcane Explosion", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Arcane Explosion", desc = "Legendary amulet - remakes Arcane Explosion\nArcane Explosion area increased by 25% and damage by 25%." },
    { slotType = "NECK", class = "MAGE", spell = "Cone of Cold", name = "Eye of the Splitting Sky: Cone of Cold", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Cone of Cold", desc = "Legendary amulet - remakes Cone of Cold\nCone of Cold width increased and deals +30% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Pyroblast", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Pyroblast", desc = "Legendary amulet - remakes Pyroblast\nPyroblast explosion splashes for 40% within 8 yd." },
    { slotType = "NECK", class = "MAGE", spell = "Pyroblast", name = "Eye of the Splitting Sky: Pyroblast", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Pyroblast", desc = "Legendary amulet - remakes Pyroblast\nPyroblast explosion splashes for 40% within 8 yd." },
    { slotType = "NECK", class = "MAGE", spell = "Blast Wave", name = "Eye of the Splitting Sky: Blast Wave", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Blast Wave", desc = "Legendary amulet - remakes Blast Wave\nBlast Wave daze duration increased by 2s and deals +25% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Frost Nova", name = "Eye of the Splitting Sky: Frost Nova", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Frost Nova", desc = "Legendary amulet - remakes Frost Nova\nReduces Frost Nova cooldown by 25% and deals +30% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Ice Barrier", name = "Eye of the Splitting Sky: Ice Barrier", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Ice Barrier", desc = "Legendary amulet - remakes Ice Barrier\nIce Barrier absorb increased by 35%." },
    { slotType = "NECK", class = "MAGE", spell = "Scorch", name = "Eye of the Splitting Sky: Scorch", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Scorch", desc = "Legendary amulet - remakes Scorch\nScorch casts 25% faster and deals +25% damage." },
    { slotType = "NECK", class = "MAGE", spell = "Polymorph", name = "Eye of the Splitting Sky: Polymorph", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Polymorph", desc = "Legendary amulet - remakes Polymorph\nEquip: Polymorph strikes 1 more target.\nEquip: Increases the damage of Polymorph by 60%.\nEquip: Polymorph explodes a second time for 50% of its damage." },
    { slotType = "NECK", class = "MAGE", spell = "Fire Blast", name = "Eye of the Splitting Sky: Fire Blast", icon = "Interface\\Icons\\INV_Jewelry_Necklace_30", quality = 5, benefit = "Remakes Fire Blast", desc = "Legendary amulet - remakes Fire Blast\nFire Blast cooldown reduced by 25% and deals +30% critical damage." },
    -- ROGUE Legendary Amulets
    { slotType = "NECK", class = "ROGUE", spell = "Backstab", name = "The Reaper's Amulet", icon = "Interface\\Icons\\INV_Jewelry_Necklace_19", quality = 5, benefit = "Remakes Backstab", desc = "Legendary amulet - remakes Backstab\nBackstab deals devastating damage and pierces through enemies." },
    { slotType = "NECK", class = "ROGUE", spell = "Sinister Strike", name = "Eye of the Splitting Sky: Sinister Strike", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Sinister Strike", desc = "Legendary amulet - remakes Sinister Strike\nSinister Strike deals +25% damage and has 15% chance to hit twice." },
    { slotType = "NECK", class = "ROGUE", spell = "Blade Flurry", name = "Eye of the Splitting Sky: Blade Flurry", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Blade Flurry", desc = "Legendary amulet - remakes Blade Flurry\nBlade Flurry cleaves to 1 additional target for 50% damage." },
    { slotType = "NECK", class = "ROGUE", spell = "Eviscerate", name = "Eye of the Splitting Sky: Eviscerate", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Eviscerate", desc = "Legendary amulet - remakes Eviscerate\nEviscerate deals +35% damage on finishing moves." },
    { slotType = "NECK", class = "ROGUE", spell = "Backstab", name = "Eye of the Splitting Sky: Backstab", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Backstab", desc = "Legendary amulet - remakes Backstab\nBackstab critical damage multiplier increased by 40%." },
    { slotType = "NECK", class = "ROGUE", spell = "Ambush", name = "Eye of the Splitting Sky: Ambush", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Ambush", desc = "Legendary amulet - remakes Ambush\nAmbush critical strike damage increased by 50%." },
    { slotType = "NECK", class = "ROGUE", spell = "Rupture", name = "Eye of the Splitting Sky: Rupture", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Rupture", desc = "Legendary amulet - remakes Rupture\nRupture bleed ticks 30% faster and deals +30% damage." },
    { slotType = "NECK", class = "ROGUE", spell = "Slice and Dice", name = "Eye of the Splitting Sky: Slice and Dice", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Slice and Dice", desc = "Legendary amulet - remakes Slice and Dice\nSlice and Dice attack speed bonus increased by 15%." },
    { slotType = "NECK", class = "ROGUE", spell = "Gouge", name = "Eye of the Splitting Sky: Gouge", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Gouge", desc = "Legendary amulet - remakes Gouge\nGouge incapacitate duration increased by 2s." },
    { slotType = "NECK", class = "ROGUE", spell = "Ghostly Strike", name = "Eye of the Splitting Sky: Ghostly Strike", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Ghostly Strike", desc = "Legendary amulet - remakes Ghostly Strike\nGhostly Strike dodge chance increased by 10% and deals +25% damage." },
    { slotType = "NECK", class = "ROGUE", spell = "Adrenaline Rush", name = "Eye of the Splitting Sky: Adrenaline Rush", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Adrenaline Rush", desc = "Legendary amulet - remakes Adrenaline Rush\nAdrenaline Rush duration increased by 3s and cooldown reduced by 20%." },
    { slotType = "NECK", class = "ROGUE", spell = "Seal Fate", name = "Eye of the Splitting Sky: Seal Fate", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Seal Fate", desc = "Legendary amulet - remakes Seal Fate\nSeal Fate generates combo points 25% faster." },
    { slotType = "NECK", class = "ROGUE", spell = "Hemorrhage", name = "Eye of the Splitting Sky: Hemorrhage", icon = "Interface\\Icons\\INV_Jewelry_Necklace_27", quality = 5, benefit = "Remakes Hemorrhage", desc = "Legendary amulet - remakes Hemorrhage\nHemorrhage vulnerability increased by 30% and strikes bleed target." },
    -- PRIEST Legendary Amulets
    { slotType = "NECK", class = "PRIEST", spell = "Shadow Word: Pain", name = "Eye of the Splitting Sky: Shadow Word: Pain", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Shadow Word: Pain", desc = "Legendary amulet - remakes Shadow Word: Pain\nShadow Word: Pain ticks 30% faster and deals +25% damage." },
    { slotType = "NECK", class = "PRIEST", spell = "Mind Flay", name = "Breath of the Black Dragon", icon = "Interface\\Icons\\INV_Jewelry_Necklace_17", quality = 5, benefit = "Remakes Mind Flay", desc = "Legendary amulet - remakes Mind Flay\nMind Flay channels rapid multi-target shadow beams slowing and destroying enemies." },
    { slotType = "NECK", class = "PRIEST", spell = "Mind Flay", name = "Eye of the Splitting Sky: Mind Flay", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Mind Flay", desc = "Legendary amulet - remakes Mind Flay\nMind Flay slow increased to 60% and deals +25% damage." },
    { slotType = "NECK", class = "PRIEST", spell = "Mind Blast", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Mind Blast", desc = "Legendary amulet - remakes Mind Blast\nMind Blast deals +35% damage and cooldown reduced by 15%." },
    { slotType = "NECK", class = "PRIEST", spell = "Mind Blast", name = "Eye of the Splitting Sky: Mind Blast", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Mind Blast", desc = "Legendary amulet - remakes Mind Blast\nMind Blast deals +35% damage and cooldown reduced by 15%." },
    { slotType = "NECK", class = "PRIEST", spell = "Devouring Plague", name = "Eye of the Splitting Sky: Devouring Plague", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Devouring Plague", desc = "Legendary amulet - remakes Devouring Plague\nDevouring Plague damage and self-heal increased by 30%." },
    { slotType = "NECK", class = "PRIEST", spell = "Holy Nova", name = "Eye of the Splitting Sky: Holy Nova", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Holy Nova", desc = "Legendary amulet - remakes Holy Nova\nHoly Nova area increased by 25%, damage and heal increased by 25%." },
    { slotType = "NECK", class = "PRIEST", spell = "Smite", name = "Eye of the Splitting Sky: Smite", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Smite", desc = "Legendary amulet - remakes Smite\nSmite strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "PRIEST", spell = "Holy Fire", name = "Eye of the Splitting Sky: Holy Fire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Holy Fire", desc = "Legendary amulet - remakes Holy Fire\nHoly Fire direct and burn damage increased by 30%." },
    { slotType = "NECK", class = "PRIEST", spell = "Power Word: Shield", name = "Eye of the Splitting Sky: Power Word: Shield", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Power Word: Shield", desc = "Legendary amulet - remakes Power Word: Shield\nPower Word: Shield absorb increased by 30%." },
    { slotType = "NECK", class = "PRIEST", spell = "Renew", name = "Eye of the Splitting Sky: Renew", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Renew", desc = "Legendary amulet - remakes Renew\nRenew healing increased by 35% and ticks 25% faster." },
    { slotType = "NECK", class = "PRIEST", spell = "Psychic Scream", name = "Eye of the Splitting Sky: Psychic Scream", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Psychic Scream", desc = "Legendary amulet - remakes Psychic Scream\nReduces Psychic Scream cooldown by 25% and affects 2 more targets." },
    { slotType = "NECK", class = "PRIEST", spell = "Lightwell", name = "Eye of the Splitting Sky: Lightwell", icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", quality = 5, benefit = "Remakes Lightwell", desc = "Legendary amulet - remakes Lightwell\nLightwell turn interval accelerated by 30%." },
    -- WARLOCK Legendary Amulets
    { slotType = "NECK", class = "WARLOCK", spell = "Shadow Bolt", name = "Eye of the Splitting Sky: Shadow Bolt", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Shadow Bolt", desc = "Legendary amulet - remakes Shadow Bolt\nShadow Bolt strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Corruption", name = "Pendant of the Plague", icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", quality = 5, benefit = "Remakes Corruption", desc = "Legendary amulet - remakes Corruption\nCorruption ticks at high frequency and deals devastating plague damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Corruption", name = "Eye of the Splitting Sky: Corruption", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Corruption", desc = "Legendary amulet - remakes Corruption\nCorruption ticks 35% faster and deals +25% damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Curse of Agony", name = "Eye of the Splitting Sky: Curse of Agony", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Curse of Agony", desc = "Legendary amulet - remakes Curse of Agony\nCurse of Agony ramp-up accelerated and deals +30% damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Immolate", name = "Eye of the Splitting Sky: Immolate", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Immolate", desc = "Legendary amulet - remakes Immolate\nImmolate initial burst and burn increased by 30%." },
    { slotType = "NECK", class = "WARLOCK", spell = "Drain Life", name = "Eye of the Splitting Sky: Drain Life", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Drain Life", desc = "Legendary amulet - remakes Drain Life\nDrain Life siphons 35% more damage and healing." },
    { slotType = "NECK", class = "WARLOCK", spell = "Hellfire", name = "Eye of the Splitting Sky: Hellfire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Hellfire", desc = "Legendary amulet - remakes Hellfire\nHellfire area increased by 25% and self-damage reduced by 50%." },
    { slotType = "NECK", class = "WARLOCK", spell = "Rain of Fire", name = "Eye of the Splitting Sky: Rain of Fire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Rain of Fire", desc = "Legendary amulet - remakes Rain of Fire\nRain of Fire meteors fall 30% faster with +25% damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Searing Pain", name = "Stormcaller's Amulet", icon = "Interface\\Icons\\INV_Jewelry_Necklace_26", quality = 5, benefit = "Remakes Searing Pain", desc = "Legendary amulet - remakes Searing Pain\nSearing Pain deals devastating fire bursts and hits in a wider area." },
    { slotType = "NECK", class = "WARLOCK", spell = "Searing Pain", name = "Eye of the Splitting Sky: Searing Pain", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Searing Pain", desc = "Legendary amulet - remakes Searing Pain\nSearing Pain critical strike chance increased by 20%." },
    { slotType = "NECK", class = "WARLOCK", spell = "Death Coil", name = "Eye of the Splitting Sky: Death Coil", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Death Coil", desc = "Legendary amulet - remakes Death Coil\nDeath Coil cooldown reduced by 25% and heal increased by 35%." },
    { slotType = "NECK", class = "WARLOCK", spell = "Soul Fire", name = "Eye of the Splitting Sky: Soul Fire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Soul Fire", desc = "Legendary amulet - remakes Soul Fire\nSoul Fire deals +40% catastrophic damage." },
    { slotType = "NECK", class = "WARLOCK", spell = "Siphon Life", name = "Eye of the Splitting Sky: Siphon Life", icon = "Interface\\Icons\\INV_Jewelry_Necklace_13", quality = 5, benefit = "Remakes Siphon Life", desc = "Legendary amulet - remakes Siphon Life\nSiphon Life heals for 50% more and drains 2 additional targets." },
    -- DRUID Legendary Amulets
    { slotType = "NECK", class = "DRUID", spell = "Wrath", name = "Eye of the Splitting Sky: Wrath", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Wrath", desc = "Legendary amulet - remakes Wrath\nWrath strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "DRUID", spell = "Moonfire", name = "Eye of the Splitting Sky: Moonfire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Moonfire", desc = "Legendary amulet - remakes Moonfire\nMoonfire burn ticks 30% faster and deals +25% damage." },
    { slotType = "NECK", class = "DRUID", spell = "Starfire", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Starfire", desc = "Legendary amulet - remakes Starfire\nStarfire splashes heavy arcane damage to surrounding enemies in wide celestial bursts." },
    { slotType = "NECK", class = "DRUID", spell = "Starfire", name = "Eye of the Splitting Sky: Starfire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Starfire", desc = "Legendary amulet - remakes Starfire\nStarfire splashes 35% damage to nearby enemies." },
    { slotType = "NECK", class = "DRUID", spell = "Hurricane", name = "Amulet of the Inferno", icon = "Interface\\Icons\\INV_Jewelry_Necklace_19", quality = 5, benefit = "Remakes Hurricane", desc = "Legendary amulet - remakes Hurricane\nHurricane expands across the entire map with devastating swirling storms." },
    { slotType = "NECK", class = "DRUID", spell = "Hurricane", name = "Eye of the Splitting Sky: Hurricane", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Hurricane", desc = "Legendary amulet - remakes Hurricane\nHurricane area increased by 25% and damage by 25%." },
    { slotType = "NECK", class = "DRUID", spell = "Swipe", name = "Eye of the Splitting Sky: Swipe", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Swipe", desc = "Legendary amulet - remakes Swipe\nSwipe strikes 1 more target and deals +25% damage." },
    { slotType = "NECK", class = "DRUID", spell = "Shred", name = "Eye of the Splitting Sky: Shred", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Shred", desc = "Legendary amulet - remakes Shred\nShred critical strike damage multiplier increased by 35%." },
    { slotType = "NECK", class = "DRUID", spell = "Rip", name = "Eye of the Splitting Sky: Rip", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Rip", desc = "Legendary amulet - remakes Rip\nRip bleed damage increased by 30%." },
    { slotType = "NECK", class = "DRUID", spell = "Rake", name = "Eye of the Splitting Sky: Rake", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Rake", desc = "Legendary amulet - remakes Rake\nRake bleed ticks 25% faster and deals +25% damage." },
    { slotType = "NECK", class = "DRUID", spell = "Ferocious Bite", name = "Eye of the Splitting Sky: Ferocious Bite", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Ferocious Bite", desc = "Legendary amulet - remakes Ferocious Bite\nFerocious Bite deals +35% damage." },
    { slotType = "NECK", class = "DRUID", spell = "Entangling Roots", name = "Eye of the Splitting Sky: Entangling Roots", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Entangling Roots", desc = "Legendary amulet - remakes Entangling Roots\nRoots deal periodic nature damage while holding targets." },
    { slotType = "NECK", class = "DRUID", spell = "Thorns", name = "Eye of the Splitting Sky: Thorns", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Thorns", desc = "Legendary amulet - remakes Thorns\nThorns retaliate for 100% more nature damage." },
    { slotType = "NECK", class = "DRUID", spell = "Rejuvenation", name = "Eye of the Splitting Sky: Rejuvenation", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Rejuvenation", desc = "Legendary amulet - remakes Rejuvenation\nWhile Rejuvenation heals you, 5% of damage dealt heals you too." },
    { slotType = "NECK", class = "DRUID", spell = "Barkskin", name = "Eye of the Splitting Sky: Barkskin", icon = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_03", quality = 5, benefit = "Remakes Barkskin", desc = "Legendary amulet - remakes Barkskin\nBarkskin damage reduction increased by 20% and reflects 50% damage." },
    -- HUNTER Legendary Amulets
    { slotType = "NECK", class = "HUNTER", spell = "Auto Shot", name = "Eye of the Splitting Sky: Auto Shot", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Auto Shot", desc = "Legendary amulet - remakes Auto Shot\nAuto Shot fires 1 additional projectile at nearest enemy." },
    { slotType = "NECK", class = "HUNTER", spell = "Arcane Shot", name = "Eye of the Splitting Sky: Arcane Shot", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Arcane Shot", desc = "Legendary amulet - remakes Arcane Shot\nArcane Shot deals +30% damage and cooldown reduced by 15%." },
    { slotType = "NECK", class = "HUNTER", spell = "Multi-Shot", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Multi-Shot", desc = "Legendary amulet - remakes Multi-Shot\nMulti-Shot splits into additional arrows with devastating piercing force." },
    { slotType = "NECK", class = "HUNTER", spell = "Multi-Shot", name = "Eye of the Splitting Sky: Multi-Shot", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Multi-Shot", desc = "Legendary amulet - remakes Multi-Shot\nMulti-Shot strikes 2 more targets and deals +25% damage." },
    { slotType = "NECK", class = "HUNTER", spell = "Serpent Sting", name = "Eye of the Splitting Sky: Serpent Sting", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Serpent Sting", desc = "Legendary amulet - remakes Serpent Sting\nSerpent Sting ticks 30% faster and deals +25% damage." },
    { slotType = "NECK", class = "HUNTER", spell = "Volley", name = "Eye of the Splitting Sky: Volley", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Volley", desc = "Legendary amulet - remakes Volley\nVolley area increased by 25% and damage by 25%." },
    { slotType = "NECK", class = "HUNTER", spell = "Explosive Trap", name = "Eye of the Splitting Sky: Explosive Trap", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Explosive Trap", desc = "Legendary amulet - remakes Explosive Trap\nExplosive Trap explosion radius increased by 30% and damage by 30%." },
    { slotType = "NECK", class = "HUNTER", spell = "Concussive Shot", name = "Eye of the Splitting Sky: Concussive Shot", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Concussive Shot", desc = "Legendary amulet - remakes Concussive Shot\nConcussive Shot daze duration increased by 2s and deals +25% damage." },
    { slotType = "NECK", class = "HUNTER", spell = "Aimed Shot", name = "Eye of the Splitting Sky", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Aimed Shot", desc = "Legendary amulet - remakes Aimed Shot\nAimed Shot critical damage multiplier increased by 40%." },
    { slotType = "NECK", class = "HUNTER", spell = "Aimed Shot", name = "Eye of the Splitting Sky: Aimed Shot", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Aimed Shot", desc = "Legendary amulet - remakes Aimed Shot\nAimed Shot critical damage multiplier increased by 40%." },
    { slotType = "NECK", class = "HUNTER", spell = "Immolation Trap", name = "Eye of the Splitting Sky: Immolation Trap", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Immolation Trap", desc = "Legendary amulet - remakes Immolation Trap\nImmolation Trap burn damage increased by 35%." },
    { slotType = "NECK", class = "HUNTER", spell = "Frost Trap", name = "Eye of the Splitting Sky: Frost Trap", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Frost Trap", desc = "Legendary amulet - remakes Frost Trap\nFrost Trap ice patch area increased by 30% and slow increased." },
    { slotType = "NECK", class = "HUNTER", spell = "Hunter's Mark", name = "Eye of the Splitting Sky: Hunter's Mark", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Hunter's Mark", desc = "Legendary amulet - remakes Hunter's Mark\nHunter's Mark increases all damage dealt to target by an extra 15%." },
    { slotType = "NECK", class = "HUNTER", spell = "Rapid Fire", name = "Eye of the Splitting Sky: Rapid Fire", icon = "Interface\\Icons\\INV_Jewelry_Necklace_16", quality = 5, benefit = "Remakes Rapid Fire", desc = "Legendary amulet - remakes Rapid Fire\nRapid Fire duration increased by 40% and grants +25% attack speed." },
};

-- Master alias to guarantee BordoUI_BuildData.Spells points to Catalog
BordoUI_BuildData.Spells = BordoUI_Catalog.Spells;
