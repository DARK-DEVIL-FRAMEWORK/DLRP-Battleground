print("^2DDFW^7-^2Shops ^4^7^4 ^2Shop Script by ^1DARK DEVIL^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false, -- Enable to add debug boxes and message.
	img = "qb-inventory/html/images/", -- Set this to your inventory
	JimMenu = true, -- Enable this if you are using an updated qb-menu resource with icon support
	ApGov = false, -- Add support for AP-Goverment Tax 
	Peds = true, -- Set to true if you want Shops to have Peds
	Limit = true, -- Enable this to add Stash features, This adds limits to items and gets refilled at each restart
	MaxSlots = 41, -- Set this to your player inventory slot count, this is default "41"
	BlackMarket = false, -- enable to add blackmarket locations (defined at the bottom of this file)
	Measurement = "kg", -- Custom Weight measurement
	Gabz247 = false,  -- Enable if using gabz 247 stores
	GabzAmmu = false, -- Enable if using gabz Ammunation stores
	VendOverride = false, -- Enable this if you want all the vending machines to use this script
	RandomAmount = true, -- Sets wether a stash should have a "random" amount of stock or full.

	Scenarios = { -- List of scenarios the peds do, This is called "fun", much better than standing staring at the void.
		"WORLD_HUMAN_GUARD_PATROL",
		"WORLD_HUMAN_JANITOR",
		"WORLD_HUMAN_MUSCLE_FLEX",
		"WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
		"PROP_HUMAN_STAND_IMPATIENT",
		"WORLD_HUMAN_VALET",
		"WORLD_HUMAN_AA_COFFEE",
		"WORLD_HUMAN_AA_SMOKE",
		"WORLD_HUMAN_DRUG_DEALER",
		"WORLD_HUMAN_GUARD_STAND_CASINO",
	},
	Products = {
		["pistol"] = {
			--addon 
			{ name = "weapon_de", price = 250, amount = 250, },
			{ name = "weapon_fnx45", price = 250, amount = 250, },
			{ name = "weapon_glock17",price = 250, amount = 250, },
			{ name = "weapon_m9", price = 1500, amount = 5, },
			{ name = "weapon_m1911", price = 4000, amount = 5, },
			{ name = "weapon_glock22", price = 250, amount = 250,  },
			{ name = "weapon_glock18c", price = 250, amount = 250, },
			--old 
			{ name = "weapon_pistol", price = 250, amount = 250, },
			{ name = "weapon_pistol_mk2", price = 250, amount = 250, },
			{ name = "weapon_combatpistol",price = 250, amount = 250, },
			{ name = "weapon_pistol50", price = 1500, amount = 5, },
			{ name = "weapon_snspistol", price = 4000, amount = 5, },
			{ name = "weapon_heavypistol", price = 250, amount = 250,  },
			{ name = "weapon_vintagepistol", price = 250, amount = 250, },
			{ name = "weapon_marksmanpistol",price = 250, amount = 250, },
			{ name = "weapon_revolver", price = 2500, amount = 5, },
			{ name = "weapon_revolver_mk2", price = 1500, amount = 5, },
			{ name = "weapon_doubleaction", price = 4000, amount = 5, },
			{ name = "weapon_snspistol_mk2", price = 250, amount = 250,  },
			{ name = "weapon_ceramicpistol", price = 250, amount = 250, },
			{ name = "weapon_navyrevolver",price = 250, amount = 250, },
			{ name = "weapon_gadgetpistol", price = 2500, amount = 5, },
		},
		["shotgun"] = {
			--addon
			{ name = "weapon_mossberg", price = 250, amount = 250, },
			{ name = "weapon_remington", price = 250, amount = 250, },
			--old 
			{ name = "weapon_pumpshotgun", price = 250, amount = 250, },
			{ name = "weapon_sawnoffshotgun", price = 250, amount = 250, },
			{ name = "weapon_assaultshotgun",price = 250, amount = 250, },
			{ name = "weapon_bullpupshotgun", price = 1500, amount = 5, },
			{ name = "weapon_musket", price = 4000, amount = 5, },
			{ name = "weapon_heavyshotgun", price = 250, amount = 250,  },
			{ name = "weapon_dbshotgun", price = 250, amount = 250, },
			{ name = "weapon_autoshotgun",price = 250, amount = 250, },
			{ name = "weapon_pumpshotgun_mk2", price = 2500, amount = 5, },
			{ name = "weapon_combatshotgun", price = 1500, amount = 5, },
		},
		["assault"] = {
			--adon
			{ name = "weapon_ak47", price = 1500, amount = 5, },
			{ name = "weapon_m70", price = 4000, amount = 5, },
			{ name = "weapon_ar15", price = 250, amount = 250,  },
			{ name = "weapon_hk416", price = 250, amount = 250, },
			{ name = "weapon_ak74",price = 250, amount = 250, },
			{ name = "weapon_aks74", price = 2500, amount = 5, },
			{ name = "weapon_m4", price = 1500, amount = 5, },
			{ name = "weapon_scarh", price = 1500, amount = 5, },
			--old 
			{ name = "weapon_assaultrifle", price = 250, amount = 250, },
			{ name = "weapon_assaultrifle_mk2", price = 250, amount = 250, },
			{ name = "weapon_carbinerifle",price = 250, amount = 250, },
			{ name = "weapon_carbinerifle_mk2", price = 1500, amount = 5, },
			{ name = "weapon_advancedrifle", price = 4000, amount = 5, },
			{ name = "weapon_specialcarbine", price = 250, amount = 250,  },
			{ name = "weapon_bullpuprifle", price = 250, amount = 250, },
			{ name = "weapon_compactrifle",price = 250, amount = 250, },
			{ name = "weapon_specialcarbine_mk2", price = 2500, amount = 5, },
			{ name = "weapon_bullpuprifle_mk2", price = 1500, amount = 5, },
			{ name = "weapon_militaryrifle", price = 1500, amount = 5, },

			--adon
		},
		["pharmacy"] = {
			{ name = "ifaks", price = 10, amount = 20000000, },
			{ name = "painkillers", price = 5, amount = 20000000, },
			{ name = "heavyarmor", price = 5, amount = 20000000, },
		},
		["ammo"] = {
			{ name = "pistol_ammo", price = 10, amount = 20000000, },
			{ name = "rifle_ammo", price = 5, amount = 20000000, },
			{ name = "shotgun_ammo", price = 5, amount = 20000000, },
		},
	},
}

Config.Locations = {
    -- 24/7 Locations
    
["ammmo"] = {
        ["label"] = "Ammmo Shop",
        ["targetLabel"] = "Ammmo Shop",
		["type"] = "weapons",
		["model"] = {
			`s_m_m_ammucountry`,
			`S_M_Y_AmmuCity_01`,
			`MP_M_WareMech_01`,
			`A_M_M_Farmer_01`,
			`MP_M_ExArmy_01`,
			`S_M_Y_ArmyMech_01`,
			`S_M_M_Armoured_02`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1072246335576744028/1094223969437102232/banner.gif",
        ["coords"] = {
            vector4(180.8, -932.07, 30.94, 331.16),
		},
        ["products"] = Config.Products["ammo"],
        ["blipsprite"] = 567,
		["blipcolour"] = 1,
    },

    ["pistol"] = {
        ["label"] = "Pistol Shop",
        ["targetLabel"] = "Pistol Shop",
		["type"] = "weapons",
		["model"] = {
			`s_m_m_ammucountry`,
			`S_M_Y_AmmuCity_01`,
			`MP_M_WareMech_01`,
			`A_M_M_Farmer_01`,
			`MP_M_ExArmy_01`,
			`S_M_Y_ArmyMech_01`,
			`S_M_M_Armoured_02`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1072246335576744028/1094223969437102232/banner.gif",
        ["coords"] = {
            vector4(175.64, -928.44, 30.94, 328.25), 
		},
        ["products"] = Config.Products["pistol"],
        ["blipsprite"] = 567,
		["blipcolour"] = 1,
    },
	["shotgun"] = {
        ["label"] = "Shotgun Shop",
        ["targetLabel"] = "Shotgun Shop",
		["type"] = "weapons",
		["model"] = {
			`s_m_m_ammucountry`,
			`S_M_Y_AmmuCity_01`,
			`MP_M_WareMech_01`,
			`A_M_M_Farmer_01`,
			`MP_M_ExArmy_01`,
			`S_M_Y_ArmyMech_01`,
			`S_M_M_Armoured_02`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1072246335576744028/1094223969437102232/banner.gif",
        ["coords"] = {
            vector4(173.13, -926.56, 30.94, 327.43), 
		},
        ["products"] = Config.Products["shotgun"],
        ["blipsprite"] = 567,
		["blipcolour"] = 1,
    },
	["assault"] = {
        ["label"] = "Assault Rifles Shop",
        ["targetLabel"] = "Assault Rifles Shop",
		["type"] = "weapons",
		["model"] = {
			`s_m_m_ammucountry`,
			`S_M_Y_AmmuCity_01`,
			`MP_M_WareMech_01`,
			`A_M_M_Farmer_01`,
			`MP_M_ExArmy_01`,
			`S_M_Y_ArmyMech_01`,
			`S_M_M_Armoured_02`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1072246335576744028/1094223969437102232/banner.gif",
        ["coords"] = {
            vector4(170.47, -924.67, 30.94, 329.63), 
		},
        ["products"] = Config.Products["assault"],
        ["blipsprite"] = 567,
		["blipcolour"] = 1,
    },
	-- pharmacy
	["pharmacy"] = {
        ["label"] = "Pharmacy",
		["targetLabel"] = "Open Pharmacy",
		["type"] = "items",
		["model"] = {
			`s_m_m_autoshop_02`,
			`S_F_M_Autoshop_01`,
			`S_M_M_AutoShop_01`,
			`S_M_M_Autoshop_03`,
			`IG_Benny`,
			`IG_Benny_02`,
			`MP_F_BennyMech_01`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1072246335576744028/1094223969437102232/banner.gif",
        ["coords"] = {
			vector4(178.21, -930.3, 30.94, 321.05),
		},
        ["products"] = Config.Products["pharmacy"],
        ["blipsprite"] = 51,
		["blipcolour"] = 5,
    },
}

--if Gabz locations are enabled, override their coords with these
if Config.Gabz247 then
	Config.Locations["247supermarket"]["coords"] = {
		vector4(24.91, -1346.86, 29.5, 268.37),
		vector4(-3039.64, 584.78, 7.91, 21.88),
		vector4(-3242.73, 1000.46, 12.83, 2.08),
		vector4(1728.44, 6415.4, 35.04, 243.26),
		vector4(1697.96, 4923.04, 42.06, 326.61),
		vector4(1960.26, 3740.6, 32.34, 300.45),
		vector4(548.67, 2670.94, 42.16, 101.0),
		vector4(2677.97, 3279.95, 55.24, 325.89),
		vector4(2556.8, 381.27, 108.62, 359.15),
		vector4(373.08, 326.75, 103.57, 253.14),
		vector4(161.2, 6641.74, 31.7, 221.02),
		vector4(812.86, -782.01, 26.17, 270.01),
	}
end
if Config.GabzAmmu then
	Config.Locations["ammunation"]["coords"] = {
		vector4(-659.16, -939.79, 21.83, 91.25),
		vector4(812.85, -2155.16, 29.62, 355.85),
		vector4(1698.04, 3757.43, 34.71, 136.69),
		vector4(-326.03, 6081.17, 31.45, 138.33),
		vector4(246.87, -51.3, 69.94, 335.47),
		vector4(18.71, -1108.24, 29.8, 158.71),
		vector4(2564.85, 298.83, 108.74, 283.17),
		vector4(-1112.4, 2697.08, 18.55, 152.96),
		vector4(841.16, -1028.63, 28.19, 294.2),
		vector4(-1310.71, -394.33, 36.7, 340.51),
	}
end
if Config.BlackMarket then
	Config.Locations["blackmarket"] = {
		["label"] = "Black Market",
		["type"] = "items",
		["model"] = {
			`mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`A_M_M_RurMeth_01`,
			`MP_F_Meth_01`,
			`MP_M_Meth_01`,
		},
		["logo"] = "https://cdn.discordapp.com/attachments/1060294225503211600/1087038183407112232/DD_profile.gif",
		["coords"] = {
			vector4(776.24, 4184.08, 41.8, 92.12),
			vector4(2482.51, 3722.28, 43.92, 39.98),
			vector4(462.67, -1789.16, 28.59, 317.53),
			vector4(-115.15, 6369.07, 31.52, 232.08),
			vector4(752.52, -3198.33, 6.07, 301.72)
		},
		["products"] = Config.Products["blackmarket"],
		["hideblip"] = true,
	}
end

if Config.VendOverride then
	Config.Locations["vendingmachine"] = {
		["label"] = "Vending Machine",
		["targetIcon"] = "fas fa-calculator",
		["targetLabel"] = "Vending Machine",
		["type"] = "items",
		["logo"] = "https://cdn.discordapp.com/attachments/1060294225503211600/1087038183407112232/DD_profile.gif",
		["model"] = { -- You can add more models to this, but these make the most sense for the vending machine stuff
			`prop_vend_soda_01`,
			`prop_vend_soda_02`,
			`prop_vend_snak_01`,
			`prop_vend_snak_01_tu`
		},
		["coords"] = { -- If you want to place custom vending machine locations
			vector4(131.13, -3007.16, 7.04, 0.0), -- GABZ LS Tuners
		},
		["products"] = Config.Products["vending"],
	}
end
Config.ItemModels = {
	["repairkit"] = `v_ind_cs_toolbox4`,
	["advancedrepairkit"] = `v_ind_cs_toolbox4`,
	["phone"] = `p_amb_phone_01`,
	["tosti"] = `prop_sandwich_01`,
	["sandwich"] = `prop_sandwich_01`,
	["water_bottle"] = `ba_prop_club_water_bottle`,
	["kurkacola"] = `prop_ecola_can`,
	["sprunk"] = `v_res_tt_can03`,
	["sprunklight"] = `v_res_tt_can03`,
	["ecola"] = `prop_ecola_can`,
	["ecolalight"] = `prop_ecola_can`,
	["twerks_candy"] = `prop_choc_pq`,
	["snikkel_candy"] = `prop_choc_pq`,
	["beer"] = `prop_sh_beer_pissh_01`,
	["whiskey"] = `prop_whiskey_bottle`,
	["vodka"] = `prop_vodka_bottle`,
	["lighter"] = `lux_prop_lighter_luxe`,

	["screwdriverset"] = `prop_tool_screwdvr01`,
	["radio"] = `prop_cs_hand_radio`,
	["binoculars"] = `v_serv_ct_binoculars`,
	["cleaningkit"] = `prop_huf_rag_01`,

	["casinochips"] = `vw_prop_chip_100dollar_st`,
	["diving_gear"] = `p_s_scuba_tank_s`,
	["jerry_can"] = `prop_jerrycan_01a`,
	["parachute"] = `p_parachute_s_shop`,

	["coffee"] = `prop_fib_coffee`,
	["fitbit"] = `p_watch_02`,
	["radioscanner"] = `prop_police_radio_main`,
	--Weapons
	["weapon_bat"] = `p_cs_bbbat_01`,
	["weapon_knife"] = `prop_w_me_knife_01`,
	["weapon_hammer"] = `w_me_hammer`,
	["weapon_hatchet"] = `prop_w_me_hatchet`,
	['weapon_dagger'] = `prop_w_me_dagger`,
	['weapon_bottle'] = `prop_w_me_bottle`,
	['weapon_crowbar'] = `prop_ing_crowbar`,
	['weapon_flashlight'] = `w_me_flashlight`,
	['weapon_golfclub'] = `prop_golf_iron_01`,
	['weapon_knuckle'] = `w_me_knuckle`,
	['weapon_machete'] = `prop_ld_w_me_machette`,
	['weapon_switchblade'] = `w_me_switchblade`,
	['weapon_nightstick'] = `w_me_nightstick`,
	['weapon_wrench'] = `v_ind_cs_wrench`,
	['weapon_battleaxe'] = `w_me_battleaxe`,
	['weapon_poolcue'] = `w_me_poolcue`,
	['weapon_handcuffs']  = `prop_cs_cuffs_01`,
	['weapon_bread']  = `v_res_fa_bread01`,
	['weapon_stone_hatchet'] = `w_me_stonehatchet`,

	['weapon_pistol'] = `w_pi_pistol`,
	['weapon_pistol_mk2'] = `w_pi_pistolmk2`,
	['weapon_combatpistol'] = `w_pi_combatpistol`,
	['weapon_appistol']  = `w_pi_appistol`,
	['weapon_stungun'] 	 = `w_pi_stungun`,
	['weapon_pistol50']  = `w_pi_pistol50`,
	['weapon_snspistol']  = `w_pi_sns_pistol`,
	['weapon_heavypistol']  = `w_pi_heavypistol`,
	['weapon_vintagepistol'] = `w_pi_vintage_pistol`,
	['weapon_flaregun'] = `w_pi_flaregun`,
	--['weapon_marksmanpistol'] = ``,
	['weapon_revolver'] = `w_pi_revolver`,
	['weapon_revolver_mk2'] = `w_pi_revolvermk2`,
	['weapon_doubleaction'] = `w_pi_wep1_gun`,
	['weapon_snspistol_mk2'] = `w_pi_sns_pistolmk2`,
	['weapon_raypistol'] = `w_pi_raygun_ev`,
	['weapon_ceramicpistol'] = `w_pi_ceramic_pistol`,
	['weapon_navyrevolver'] = `w_pi_wep2_gun`,
	--['weapon_gadgetpistol'] = ``,
	['weapon_microsmg'] = `w_sb_microsmg`,
	['weapon_smg'] = `w_sb_smg`,
	['weapon_smg_mk2'] = `w_sb_smgmk2`,
	['weapon_assaultsmg'] = `w_sb_assaultsmg`,
	['weapon_combatpdw'] = `w_sb_pdw`,
	--['weapon_machinepistol'] = ``,
	['weapon_minismg'] = `w_sb_minismg`,
	['weapon_raycarbine'] = `w_ar_srifle`,
	['weapon_pumpshotgun'] = `w_sg_pumpshotgun`,
	['weapon_pumpshotgun_mk2'] = `w_sg_pumpshotgunmk2`,
	['weapon_sawnoffshotgun'] = `w_sg_sawnoff`,
	['weapon_assaultshotgun'] = `w_sg_assaultshotgun`,
	['weapon_bullpupshotgun'] = `w_sg_bullpupshotgun`,
	['weapon_musket'] = `w_ar_musket`,
	['weapon_heavyshotgun'] = `w_sg_heavyshotgun`,
	['weapon_dbshotgun'] = `w_sg_doublebarrel`,
	--['weapon_autoshotgun'] = ``,
	--['weapon_combatshotgun'] = ``,

	['weapon_assaultrifle'] = `w_ar_assaultrifle`,
	['weapon_assaultrifle_mk2'] = `w_ar_assaultriflemk2`,
	['weapon_carbinerifle'] = `w_ar_carbinerifle`,
	['weapon_carbinerifle_mk2'] = `w_ar_carbineriflemk2`,
	['weapon_advancedrifle'] = `w_ar_advancedrifle`,
	['weapon_specialcarbine'] = `w_ar_specialcarbine`,
	['weapon_specialcarbine_mk2'] = `w_ar_specialcarbinemk2`,
	['weapon_bullpuprifle'] = `w_ar_bullpuprifle`,
	['weapon_bullpuprifle_mk2'] = `w_ar_bullpupriflemk2`,
	['weapon_compactrifle']  = `w_ar_assaultrifle_smg`,
	['weapon_militaryrifle'] = `w_ar_heavyrifleh`,
	['weapon_mg'] = `w_mg_mg`,
	['weapon_combatmg'] = `w_mg_combatmg`,
	['weapon_combatmg_mk2'] = `w_mg_combatmgmk2`,
	['weapon_gusenberg'] = `w_sb_gusenberg`,

	['weapon_sniperrifle'] = `w_sr_sniperrifle`,
	['weapon_heavysniper'] = `w_sr_heavysniper`,
	['weapon_heavysniper_mk2'] = `w_sr_heavysnipermk2`,
	['weapon_marksmanrifle'] = `w_sr_marksmanrifle`,
	['weapon_marksmanrifle_mk2'] = `w_sr_marksmanriflemk2`,
	--['weapon_remotesniper'] = ``,
	['weapon_rpg'] = `w_lr_rpg`,
	['weapon_grenadelauncher'] = `w_lr_grenadelauncher`,
	['weapon_grenadelauncher_smoke'] = `w_lr_grenadelauncher`,
	['weapon_minigun'] = `prop_minigun_01`,
	['weapon_firework'] = `w_lr_firework`,
	['weapon_railgun'] = `w_ar_railgun`,
	--['weapon_hominglauncher'] = ``,
	--['weapon_compactlauncher'] = ``,
	--['weapon_rayminigun'] = ``,
	['weapon_grenade'] = `w_ex_grenadefrag`,
	['weapon_bzgas'] = `prop_gas_grenade`,
	['weapon_molotov'] = `w_ex_molotov`,
	--['weapon_stickybomb'] = ``,
	['weapon_proxmine'] = `gr_prop_gr_pmine_01a`,
	['weapon_snowball'] = `w_ex_snowball`,
	['weapon_pipebomb'] = `w_ex_pipebomb`,
	['weapon_ball'] = `w_am_baseball`,
	['weapon_smokegrenade'] = `w_ex_grenadesmoke`,
}
