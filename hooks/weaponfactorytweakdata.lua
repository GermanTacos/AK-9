------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       ||   ||        ||||||                              --
--                         ||||      ||  ||        ||    ||                             --
--                        ||  ||     || ||         ||    ||                             --
--                       ||||||||    ||||           |||||||                             --
--                      ||      ||   || ||              ||                              --
--                     ||        ||  ||  ||           |||                               --
--                    ||          || ||   ||        |||                                 --
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--						  	 		   > [Functions]									--
--									   > [Arrays]		   								--
--									   > [Override]				    					--
--									   > [Adds] 										--
--									   > [Forbids] 										--
--									   > [Stance]										--
--									   > [Underbarrel] 							    	--
--									   > [Tweaks] 										--
--									   > [WIP] 											--
--																						--
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


---------------------------------------
----<A><K><9> -Functions- <A><K><9>----
---------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:akpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:ak939_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:ak939_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:akpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:ak939_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:ak939_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:ak939_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:akpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:ak939_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:ak939_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:ak939_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- Part Copy Base ---
function WeaponFactoryTweakData:ak939_copy_part( att_og, att_cp )
    if self.parts[att_og] then
        self.parts[att_cp] = deep_clone(self.parts[att_og])
        self.parts[att_cp].pcs = {}
        self.parts[att_cp].is_a_unlockable = true
        table.insert(self.wpn_fps_ass_heffy_939.uses_parts, att_cp)
    else
        self:ak939_write_error( "copy_part", "fti", "part", att_og )    
    end
end

--- ERROR Base ---
function WeaponFactoryTweakData:ak939_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AK9_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AK9_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AK9_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AK9ModInit", function(self)

------------------------------------
----<A><K><9> -Arrays- <A><K><9>----
------------------------------------

--- Stocks ---
local all_ak9stock = {
	"wpn_fps_ass_heffy_939_st_ak9"
}
local ak9stock = {
	"wpn_fps_ass_heffy_939_st_ak9"
}
--- Stock Pads ---
local ak9stockpad = {
	"wpn_fps_ass_heffy_939_stp_ak9",
	"wpn_fps_ass_heffy_939_stp2_ak9"
}
--- Fore Grip ---
-- Default length --
local all_ak9lowerforegrip = {
	"wpn_fps_ass_heffy_939_lfg_ak9"
}
local ak9foregrip = {
	"wpn_fps_ass_heffy_939_lfg_ak9"
}

--- Barrel ---
-- Default length --
local ak9barrel = {
	"wpn_fps_ass_heffy_939_ba_ak9"
}
local all_ak9barrel = {
	"wpn_fps_ass_heffy_939_ba_ak9",
	"wpn_fps_ass_heffy_939_ba_tiss"
}

--- Front Sights ---
local all_ak9fo = {
	"wpn_fps_ass_heffy_939_fo_ak9"
}

--- Barrel Extensions --
local all_ak9ext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_heffy_939_fh_dummy",
	"wpn_fps_ass_heffy_939_fh_ak9",
	"wpn_fps_ass_heffy_939_fh_tiss"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ak9fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ak9sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local nonacog_aksight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}

--- Grips ---
local ak9grips = {
	"wpn_fps_ass_heffy_939_pg_ak9"
}

--- Compatibility Array Insertion ---

self.parts.wpn_fps_ass_heffy_939_lr_ak9.override = {}

self:akpack_check_override( "part", "wpn_fps_ass_heffy_939_lr_ak9" )

if self.wpn_fps_ass_heffy_762 then

	local ak47stocks = {
		"wpn_fps_ass_heffy_all_st_ak47",
		"wpn_fps_ass_heffy_762_st_akm",
		"wpn_fps_ass_heffy_762_st_akm_worn",
		"wpn_fps_ass_heffy_762_st_akms",
		"wpn_fps_ass_heffy_762_st_akmsu",
		"wpn_fps_ass_heffy_762_st_rpk",
		"wpn_fps_ass_heffy_762_st_ak103",
		"wpn_fps_ass_heffy_762_st_bl_t56",
		"wpn_fps_ass_heffy_762_st_br_t56",
		"wpn_fps_ass_heffy_762_st_mpi",
		"wpn_fps_ass_heffy_762_st_2_mpi",
		"wpn_fps_ass_heffy_762_st_amd63",
		"wpn_fps_ass_heffy_762_st_amd65",
		"wpn_fps_ass_heffy_762_st_m70",
		"wpn_fps_ass_heffy_762_st_tabuk",
		"wpn_fps_ass_heffy_762_st_rk62",
	}
	
	for i, part_id in pairs(ak47stocks) do
		table.insert(all_ak9stock, part_id)
		table.insert(ak9stock, part_id)
	end
	
	for i, part_id in pairs(ak47stocks) do
		if part_id ~= "wpn_fps_ass_heffy_all_st_ak47" and part_id ~= "wpn_fps_ass_heffy_762_st_ak103" then
			self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu"}
		elseif part_id == "wpn_fps_ass_heffy_all_st_ak47" then
			self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu_ak47"}
		end
	end
	
	local ak47stockparts = {
		"wpn_fps_ass_heffy_762_sp_ak47",
		"wpn_fps_ass_heffy_762_sp_mpi",
		"wpn_fps_ass_heffy_762_sp_2_mpi",
		"wpn_fps_ass_heffy_762_sp_akm",
		"wpn_fps_ass_heffy_762_sp_tabuk",
		"wpn_fps_ass_heffy_762_stp_mpi",
		"wpn_fps_ass_heffy_762_sp_amd63",
	}
	
	for i, part_id in pairs(ak47stockparts) do
		table.insert(ak9stockpad, part_id)
	end
	
	for i, part_id in pairs(ak47stockparts) do
		if part_id ~= "wpn_fps_ass_heffy_762_sp_ak47" then
			self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu"}
		else
			self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu_ak47"}
		end
	end
	
	local ak47grips = {
		"wpn_fps_ass_heffy_all_pg_ak47",
		"wpn_fps_ass_heffy_762_pg_akm",
		"wpn_fps_ass_heffy_762_pg_ak103",
		"wpn_fps_ass_heffy_762_pg_bl_t56",
		"wpn_fps_ass_heffy_762_pg_br_t56",
		"wpn_fps_ass_heffy_762_pg_mpi",
		"wpn_fps_ass_heffy_762_pg_amd63",
		"wpn_fps_ass_heffy_762_pg_amd65",
		"wpn_fps_ass_heffy_762_pg_m92",
		"wpn_fps_ass_heffy_762_pg_rk62",
	}
	
	for i, part_id in pairs(ak47grips) do
		table.insert(ak9grips, part_id)
	end

end

if self.wpn_fps_ass_heffy_545 then

	local ak74stocks = {
		"wpn_fps_ass_heffy_all_st_ak74",
		"wpn_fps_ass_heffy_545_st_rpk74",
		"wpn_fps_ass_heffy_545_st_mpi",
	}
	
	for i, part_id in pairs(ak74stocks) do
		table.insert(all_ak9stock, part_id)
		table.insert(ak9stock, part_id)
	end
	
	for i, part_id in pairs(ak74stocks) do
		self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu"}
	end
	
	local ak74stockparts = {
		"wpn_fps_ass_heffy_545_stp_ak74",
		"wpn_fps_ass_heffy_545_stp_ak74_2",
		"wpn_fps_ass_heffy_545_stp_rpk74",
		"wpn_fps_ass_heffy_545_str_rpk74",
		"wpn_fps_ass_heffy_545_stp_mpi",
	}
	
	for i, part_id in pairs(ak74stockparts) do
		table.insert(ak9stockpad, part_id)
	end
	
	for i, part_id in pairs(ak74stockparts) do
		self.parts.wpn_fps_ass_heffy_939_lr_ak9.override[part_id] = {a_obj="a_s_akmsu"}
	end
	
	local ak74grips = {
		"wpn_fps_ass_heffy_all_pg_ak74",
		"wpn_fps_ass_heffy_545_pg_mpi",
	}
	
	for i, part_id in pairs(ak74grips) do
		table.insert(ak9grips, part_id)
	end

end

-----------------------------------------
----<A><K><4><7> -CAFCW- <A><K><4><7>----
-----------------------------------------
if BeardLib.Utils:FindMod("gsup") then
	local AK9SneakySuppressorPack = {
		"wpn_fps_ass_ns_g_sup3",
		"wpn_fps_ass_ns_g_sup4",
		"wpn_fps_ass_ns_g_sup5"
	}
	for id, part_id in pairs(AK9SneakySuppressorPack) do
		table.insert(self.wpn_fps_ass_heffy_939.uses_parts, part_id)
		table.insert(self.wpn_fps_ass_x_heffy_939.uses_parts, part_id)
		table.insert(all_ak9ext, part_id)
	end
end

if BeardLib.Utils:FindMod("Tromix Barrel-Ext") then
	table.insert(self.wpn_fps_ass_heffy_939.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(self.wpn_fps_ass_x_heffy_939.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(all_ak9ext, "wpn_fps_upg_ns_ass_smg_tromix")
end

if BeardLib.Utils:FindMod("M82 Muzzle Brake") then
	table.insert(all_ak9ext, "wpn_fps_upg_ns_m82")
	table.insert(all_ak9ext, "wpn_fps_upg_ns_aw50")
end


--------------------------------------
----<A><K><9> -Override- <A><K><9>----
--------------------------------------

--- Barrel ---
for i, ba_id in pairs(all_ak9barrel) do
	self:akpack_check_override( "part", ba_id )
end

for id, ext_id in pairs(all_ak9ext) do
	if ext_id == "wpn_fps_ass_heffy_939_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_939_lfg_tiss.override.wpn_fps_ass_heffy_939_ba_ak9.override[ext_id] = {a_obj = "a_ns_tiss", unit="units/mods/weapons/wpn_fps_ass_heffy_939_ak9_pts/wpn_fps_ass_heffy_939_fh_ak9"}
		self.parts.wpn_fps_ass_heffy_939_lfg_tiss.override.wpn_fps_ass_heffy_939_ba_tiss.override[ext_id] = {a_obj = "a_ns_tiss", unit="units/mods/weapons/wpn_fps_ass_heffy_939_tiss_pts/wpn_fps_ass_heffy_939_fh_tiss"}
	else
		self.parts.wpn_fps_ass_heffy_939_lfg_tiss.override.wpn_fps_ass_heffy_939_ba_ak9.override[ext_id] = {a_obj = "a_ns_tiss"}
		self.parts.wpn_fps_ass_heffy_939_lfg_tiss.override.wpn_fps_ass_heffy_939_ba_tiss.override[ext_id] = {a_obj = "a_ns_tiss"}
	end
end

-- Default length barrel barrel extension and front sight override --
for i, ba_id in pairs(ak9barrel) do
	for i, ext_id in pairs(all_ak9ext) do
		if ext_id ~= "wpn_fps_ass_heffy_939_fh_dummy" then
			self.parts[ba_id].override[ext_id] = {a_obj = "a_ns"}
		end
	end
	for i, fo_id in pairs(all_ak9fo) do
		self.parts[ba_id].override[fo_id] = {}
	end
end

-- Other length barrel Front Sight overrides --
--for i, fo_id in pairs(all_ak9fo) do
--	self.parts.wpn_fps_ass_heffy_939_ba_ak9.override[fo_id] = {a_obj = "a_fo_ak9"}
--end

--- Receiver aka Lower ---
self:akpack_check_override( "part", "wpn_fps_ass_heffy_939_lr_ak9" )

--- Foregrips ---
----------------------------------
----<A><K><9> -Adds- <A><K><9>----
----------------------------------

--- Gun ---
self:akpack_check_adds( "wpn", "wpn_fps_ass_heffy_939" )
for i, o_id in pairs(all_ak9sight) do
	self.wpn_fps_ass_heffy_939.adds[o_id] = {"wpn_fps_upg_o_ak9_scopemount"}
	self.wpn_fps_ass_x_heffy_939.adds[o_id] = {"wpn_fps_upg_o_ak9_scopemount"}
end
	
-------------------------------------
----<A><K><9> -Forbids- <A><K><9>----
-------------------------------------

------------------------------------
----<A><K><9> -Stance- <A><K><9>----
------------------------------------

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in pairs(nonacog_aksight) do
	self.parts[o_id].stance_mod.wpn_fps_ass_heffy_939 = {translation = Vector3(0, 7, -3.7)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_heffy_939 			   = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_heffy_939 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_heffy_939 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_heffy_939 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

------------------------------------
----<A><K><9> -Tweaks- <A><K><9>----
------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_ass_heffy_939_fh_dummy.pcs = nil

------------------------------------
----<A><K><9> -CLONES- <A><K><9>----
------------------------------------

self:akpack_check_override( "wpn", "wpn_fps_ass_heffy_939" )

if self.wpn_fps_ass_heffy_762 then

	local ak47parts = {
		"wpn_fps_ass_heffy_all_lfg_ak47",
		"wpn_fps_ass_heffy_all_pg_ak47",
		"wpn_fps_ass_heffy_all_st_ak47",
		"wpn_fps_ass_heffy_762_lfg_akm",
		"wpn_fps_ass_heffy_762_pg_akm",
		"wpn_fps_ass_heffy_762_st_akm",
		"wpn_fps_ass_heffy_762_lfg_akm_worn",
		"wpn_fps_ass_heffy_762_st_akm_worn",
		"wpn_fps_ass_heffy_762_lfg_rpk",
		"wpn_fps_ass_heffy_762_st_rpk",
		"wpn_fps_ass_heffy_762_lfg_bl_t56",
		"wpn_fps_ass_heffy_762_pg_bl_t56",
		"wpn_fps_ass_heffy_762_st_bl_t56",
		"wpn_fps_ass_heffy_762_lfg_br_t56",
		"wpn_fps_ass_heffy_762_pg_br_t56",
		"wpn_fps_ass_heffy_762_st_br_t56",
		"wpn_fps_ass_heffy_762_lfg_mpi",
		"wpn_fps_ass_heffy_762_pg_mpi",
		"wpn_fps_ass_heffy_762_st_mpi",
		"wpn_fps_ass_heffy_762_st_2_mpi",
		"wpn_fps_ass_heffy_762_lfg_mpi_wood",
		"wpn_fps_ass_heffy_762_lfg_amd63",
		"wpn_fps_ass_heffy_762_pg_amd63",
		"wpn_fps_ass_heffy_762_st_amd63",
		"wpn_fps_ass_heffy_762_pg_amd65",
		"wpn_fps_ass_heffy_762_st_amd65",
		"wpn_fps_ass_heffy_762_st_m70",
		"wpn_fps_ass_heffy_762_st_tabuk",
		"wpn_fps_ass_heffy_762_pg_rk62",
		"wpn_fps_ass_heffy_762_st_rk62",
	}
	
	for i, part_id in pairs(ak47parts) do
		if self.parts[part_id].pcs then
			table.insert(self.wpn_fps_ass_heffy_939.uses_parts, part_id)
			table.insert(self.wpn_fps_ass_x_heffy_939.uses_parts, part_id)
		end
    end
	
end

self:akpack_check_override( "wpn", "wpn_fps_ass_heffy_939" )

if self.wpn_fps_ass_heffy_545 then

	local ak74parts = {
		"wpn_fps_ass_heffy_all_lfg_ak74",
		"wpn_fps_ass_heffy_all_pg_ak74",
		"wpn_fps_ass_heffy_all_st_ak74",
		"wpn_fps_ass_heffy_545_lfg_rpk74",
		"wpn_fps_ass_heffy_545_st_rpk74",
		"wpn_fps_ass_heffy_545_lfg_mpi",
		"wpn_fps_ass_heffy_545_pg_mpi",
		"wpn_fps_ass_heffy_545_st_mpi",
	}
	
    for i, part_id in pairs(ak74parts) do
		if self.parts[part_id].pcs then
			table.insert(self.wpn_fps_ass_heffy_939.uses_parts, part_id)
			table.insert(self.wpn_fps_ass_x_heffy_939.uses_parts, part_id)
		end
    end
	
end

if self.parts.wpn_fps_ass_heffy_all_fc_pg_poly_pl and self.wpn_fps_ass_heffy_762 or self.wpn_fps_ass_heffy_545 then

	local akwoodcolors = {
		"wpn_fps_ass_heffy_all_fc_fg_wood_red",
		"wpn_fps_ass_heffy_all_fc_pg_wood_red",
		"wpn_fps_ass_heffy_all_fc_st_wood_red",
		"wpn_fps_ass_heffy_all_fc_fg_wood_ora",
		"wpn_fps_ass_heffy_all_fc_pg_wood_ora",
		"wpn_fps_ass_heffy_all_fc_st_wood_ora",
		"wpn_fps_ass_heffy_all_fc_fg_wood_lac",
		"wpn_fps_ass_heffy_all_fc_pg_wood_lac",
		"wpn_fps_ass_heffy_all_fc_st_wood_lac",
	}

	for i, part_id in pairs (akwoodcolors) do
		table.insert(self.wpn_fps_ass_heffy_939.uses_parts, part_id)
		table.insert(self.wpn_fps_ass_x_heffy_939.uses_parts, part_id)
	end
		
end

---------------------------------
----<A><K><9> -WIP- <A><K><9>----
---------------------------------

end )
