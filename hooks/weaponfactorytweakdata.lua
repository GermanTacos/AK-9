------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       ||   ||       ||||     |||||    ||||               --
--                         ||||      ||  ||       || ||    ||   ||  || ||               --
--                        ||  ||     || ||           ||   ||     ||    ||               --
--                       ||||||||    ||||            ||   ||     ||    ||               --
--                      ||      ||   || ||           ||   ||     ||    ||               --
--                     ||        ||  ||  ||          ||    ||   ||     ||               --
--                    ||          || ||   ||      |||||||   |||||   |||||||             --
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


---------------------------------------------------
----<A><K><1><0><1> -Functions- <A><K><1><0><1>----
---------------------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:akpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:akpack_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:akpack_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:akpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:akpack_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:akpack_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:akpack_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:akpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:akpack_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:akpack_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:akpack_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- Part Copy Base ---
function WeaponFactoryTweakData:ak556_copy_part( att_og, att_cp )
    if self.parts[att_og] then
        self.parts[att_cp] = deep_clone(self.parts[att_og])
        self.parts[att_cp].pcs = {}
        self.parts[att_cp].is_a_unlockable = true
        table.insert(self.wpn_fps_ass_heffy_556.uses_parts, att_cp)
    else
        self:akpack_write_error( "copy_part", "fti", "part", att_og )    
    end
end

--- ERROR Base ---
function WeaponFactoryTweakData:akpack_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AK101_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AK101_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AK101_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AK101ModInit", function(self)

------------------------------------------------
----<A><K><1><0><1> -Arrays- <A><K><1><0><1>----
------------------------------------------------

--- Stocks ---
local all_ak101stock = {
	"wpn_fps_ass_heffy_556_st_ak101"
}
local ak101stock = {
	"wpn_fps_ass_heffy_556_st_ak101"
}
--- Stock Pads ---
local ak101stockpad = {
	"wpn_fps_ass_heffy_556_stp_ak101",
	"wpn_fps_ass_heffy_556_stp2_ak101"
}
--- Fore Grip ---
-- Default length --
local all_ak101lowerforegrip = {
	"wpn_fps_ass_heffy_556_lfg_ak101"
}
local ak101foregrip = {
	"wpn_fps_ass_heffy_556_lfg_ak101"
}

--- Barrel ---
-- Default length --
local ak101barrel = {
	"wpn_fps_ass_heffy_556_ba_ak101",
	"wpn_fps_ass_heffy_556_ba_ak108"
}
local all_ak101barrel = {
	"wpn_fps_ass_heffy_556_ba_ak101",
	"wpn_fps_ass_heffy_556_ba_ak102",
	"wpn_fps_ass_heffy_556_ba_ak108"
}

--- Front Sights ---
local all_ak101fo = {
	"wpn_fps_ass_heffy_556_fo_ak101"
}

--- Barrel Extensions --
local all_ak101ext = {
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
	"wpn_fps_ass_heffy_556_fh_dummy",
	"wpn_fps_ass_heffy_556_fh_ak101",
	"wpn_fps_ass_heffy_556_fh_ak102",
	"wpn_fps_ass_heffy_556_fh_ak108"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ak101fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ak101sight = {
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
local ak101grips = {
	"wpn_fps_ass_heffy_556_pg_ak101"
}
--------------------------------------------------
----<A><K><1><0><1> -Override- <A><K><1><0><1>----
--------------------------------------------------

--- Gun ---

--- Barrel ---
for i, ba_id in ipairs(all_ak101barrel) do
	self:akpack_check_override( "part", ba_id )
end
--self.parts.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy = {unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
-- Default length barrel barrel extension and front sight override --
for i, ba_id in ipairs(ak101barrel) do
	for i, ext_id in ipairs(all_ak101ext) do
		if ext_id ~= "wpn_fps_ass_heffy_556_fh_dummy" then
			self.parts[ba_id].override[ext_id] = {a_obj = "a_ns"}
		end
	end
	for i, fo_id in ipairs(all_ak101fo) do
		self.parts[ba_id].override[fo_id] = {}
	end
end

--self.parts.wpn_fps_ass_heffy_556_ba_ak101.override.wpn_fps_ass_heffy_556_fh_dummy   = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_556_ak101_pts/wpn_fps_ass_heffy_556_fh_ak101"}

-- Other length barrel barrel extension overrides --
for i, ext_id in ipairs(all_ak101ext) do
	if ext_id == "wpn_fps_ass_heffy_556_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_556_ba_ak102.override[ext_id] = {a_obj = "a_ns_ak102", unit="units/mods/weapons/wpn_fps_ass_heffy_556_ak102_pts/wpn_fps_ass_heffy_556_fh_ak102"}
	else
		self.parts.wpn_fps_ass_heffy_556_ba_ak102.override[ext_id]	= {a_obj = "a_ns_ak102"}
	end
end
-- Other length barrel Front Sight overrides --
for i, fo_id in ipairs(all_ak101fo) do
	self.parts.wpn_fps_ass_heffy_556_ba_ak102.override[fo_id] = {a_obj = "a_fo_ak102"}
end

--- Fore Grip ---
-- Default length fg barrel position override --
--[[
for i, fg_id in ipairs(ak101foregrip) do
	self:akpack_check_override( "part", fg_id )
	for i, ba_id in ipairs(ak101barrel) do
		self.parts[fg_id].override[ba_id] = {}
	end
end
--]]
-- Barrel position override by lfgs --
--[[self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lfg_m70" )
for i, ba_id in ipairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id]   = {a_obj = "a_b_m70"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override   = self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override or {}
end
-- Front sight overrides by lfgs --
for i, ba_id in ipairs(ak47barrel) do
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m70_std"}
	end
end
for i, fo_id in ipairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id] 	 = {a_obj = "a_fo_m70_rpk"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_m70_tabuk"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_m70_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[fo_id] 	 = {a_obj = "a_fo_m70_m92"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_m70_ak104"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_m70_rk62"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {a_obj = "a_fo_m70_md90"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_m70_vepr"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_m70_amd65"}
end
-- Barrel Extensions position override by lfgs --
for i, ba_id in ipairs(ak47barrel) do
	for i, ext_id in ipairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[ext_id] = {a_obj = "a_ns_m70_std"}
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_m70_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_m70_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_m70_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_m70_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_m70_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_m70_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
	else
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_m70_rpk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_m70_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_m70_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_m70_m92"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_m70_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_m70_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_m70_md90"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_vepr.override[ext_id]  = {a_obj = "a_ns_m70_vepr"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_m70_amd65"}
	end
end]]--
--- Receiver aka Lower ---
self:akpack_check_override( "part", "wpn_fps_ass_heffy_556_lr_ak101" )
--Stock overrides--
--[[for i, st_id in ipairs(akmstock) do
	self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id]  = {a_obj = "a_s_ak47"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id] = {a_obj = "a_s_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id]   = {a_obj = "a_s_akmsu"}
	if st_id ~= "wpn_fps_ass_heffy_762_st_ak103" then
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id] = {a_obj = "a_s_akmsu"}
	end
end]]-- Not used because only one stock on the 101
--Stock Pad overrides--
--[[for i, sp_id in ipairs(akmstockpad) do
	self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[sp_id]  = {a_obj = "a_s_ak47"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[sp_id] = {a_obj = "a_s_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[sp_id] = {a_obj = "a_s_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[sp_id]   = {a_obj = "a_s_akmsu"}
end]]-- Not used because no stock pads on the 101

-- Barrel position override by lrs --
--[[for i, ba_id in ipairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id] = {a_obj = "a_b_akmsu"}	
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override or {}
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id] = {a_obj = "a_b_m92"}	
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override or {}
end]]-- no other lrs on 101
-- Front sight overrides by lrs --
--[[for i, ba_id in ipairs(ak47barrel) do
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[fo_id] = {a_obj = "a_fo_akmsu_std"}
--		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m92_std"}
	end
end]]-- not used
--[[for i, fo_id in ipairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id]   = {a_obj = "a_fo_akmsu_rpk"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_akmsu_tabuk"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_akmsu_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[fo_id]   = {a_obj = "a_fo_akmsu_m92"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_akmsu_ak104"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_akmsu_rk62"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {a_obj = "a_fo_akmsu_md90"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_akmsu_vepr"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_akmsu_amd65"}
end]]--
-- Barrel Extensions position override by lrs --
--[[for i, ba_id in ipairs(ak47barrel) do
	for i, ext_id in ipairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[ext_id] = {a_obj = "a_ns_akmsu_std"}
--			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[ext_id]   = {a_obj = "a_ns_m92_std"}
		end
	end
end]]--
--self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
--self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
--self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

--[[for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
	else
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_akmsu_rpk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_vepr.override[ext_id]  = {a_obj = "a_ns_akmsu_vepr"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_akmsu_amd65"}
	end
end]]--
--self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_lfg_ak47 = {unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_lfg_akmsu"}
--- Magazines ---
--self.parts.wpn_fps_ass_heffy_762_m_steel_75.weapon_reload_override 	 = {bm_w_heffy_762 = "tecci"}

----------------------------------------------
----<A><K><1><0><1> -Adds- <A><K><1><0><1>----
----------------------------------------------
--- Gun ---
self:akpack_check_adds( "wpn", "wpn_fps_ass_heffy_556" )
for i, o_id in ipairs(all_ak101sight) do
	self.wpn_fps_ass_heffy_556.adds[o_id] = {"wpn_fps_upg_o_ak101_scopemount"}
end
	
-------------------------------------------------
----<A><K><1><0><1> -Forbids- <A><K><1><0><1>----
-------------------------------------------------

--- Pistol grips ---
-- AKM grips forbids --
--[[for i, g_id in ipairs(akmgrips) do
	self:akpack_setup_forbid( g_id, "wpn_fps_ass_heffy_762_st_vepr" )
end
for i, lfg_id in ipairs(all_ak47lowerforegrip) do
	if lfg_id ~= "wpn_fps_ass_heffy_762_lfg_ak47" then
		self:akpack_setup_forbid( lfg_id, "wpn_fps_ass_heffy_762_ba_vepr" )
	end
end]]--

------------------------------------------------
----<A><K><1><0><1> -Stance- <A><K><1><0><1>----
------------------------------------------------

--- Stance overrides by barrels ---
--[[self.parts.wpn_fps_ass_heffy_762_ba_akmsu.weapon_stance_override = {bm_w_heffy_762 = "akmsu_ads"}
self.parts.wpn_fps_ass_heffy_762_ba_m92.weapon_stance_override   = {bm_w_heffy_762 = "akmsu_ads"}--]]

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in ipairs(nonacog_aksight) do
	self.parts[o_id].stance_mod.wpn_fps_ass_heffy_556 = {translation = Vector3(0, 7, -3.7)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_heffy_556 			   = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_heffy_556 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_heffy_556 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_heffy_556 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

-----------------------------------------------------
----<A><K><1><0><1> -Underbarrel- <A><K><1><0><1>----
-----------------------------------------------------

--- GP25 ---
--[[if BeardLib.Utils:FindMod("Custom underbarrels for custom weapons") then
	self:cufcw_setup_underbarrel( 
		"wpn_fps_ass_heffy_762",
		"bm_w_heffy_762",
		"wpn_fps_ass_heffy_762_gl_gl25",
		"bm_w_contraband_m203",
		"units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_gl_gl25",
		"units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_gl_gl25",
		"gl25_gl",
		{
			translation = Vector3(-1.05, 0, -12.67),
			rotation = Rotation(0, 0, -45)
		}
	)
else
	self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_gl_gl25" )

	self.parts.wpn_fps_ass_heffy_762_gl_gl25.perks = {"underbarrel"}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_hold_override = {
		bm_w_ak47 = "contraband",
		bm_w_contraband_m203 = "contraband"
	}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_stance_override = {
		bm_w_ak47 = "gl25_gl",
		bm_w_contraband_m203 = "gl25_gl"
	}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_reload_override = {
		bm_w_contraband_m203 = "contraband"
	}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.override.wpn_fps_upg_o_45rds = {
		stance_mod = {
			wpn_fps_ass_heffy_762 = {
				translation = Vector3(-1.05, 0, -12.67),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.override.wpn_fps_upg_o_45rds_v2 = {
		stance_mod = {
			wpn_fps_ass_heffy_762 = {
				translation = Vector3(-1.05, 0, -12.67),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
end]]--

------------------------------------------------
----<A><K><1><0><1> -Tweaks- <A><K><1><0><1>----
------------------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_ass_heffy_556_fh_dummy.pcs = nil

------------------------------------------------
----<A><K><1><0><1> -CLONES- <A><K><1><0><1>----
------------------------------------------------

self:akpack_check_override( "wpn", "wpn_fps_ass_heffy_556" )

if self.wpn_fps_ass_heffy_545 then

	local ak74parts = {
		"wpn_fps_ass_heffy_545_lfg_rpk74",
		"wpn_fps_ass_heffy_545_ufg_rpk74",
		"wpn_fps_ass_heffy_545_st_rpk74",
		"wpn_fps_ass_heffy_545_lfg_mpi",
		"wpn_fps_ass_heffy_545_ufg_mpi",
		"wpn_fps_ass_heffy_545_pg_mpi",
		"wpn_fps_ass_heffy_545_st_mpi",
		"wpn_fps_ass_heffy_545_ufg_tantal",
	}
	
	for i, part_id in ipairs(ak74parts) do
        table.insert(self.wpn_fps_ass_heffy_556.uses_parts, part_id)
    end
	
	self:ak556_copy_part( "wpn_fps_ass_heffy_545_lfg_ak74", "wpn_fps_ass_heffy_556_lfg_ak74")
	self:ak556_copy_part( "wpn_fps_ass_heffy_545_ufg_ak74", "wpn_fps_ass_heffy_556_ufg_ak74")
	self:ak556_copy_part( "wpn_fps_ass_heffy_545_pg_ak74", "wpn_fps_ass_heffy_556_pg_ak74")
	self:ak556_copy_part( "wpn_fps_ass_heffy_545_st_ak74", "wpn_fps_ass_heffy_556_st_ak74")
	
end

---------------------------------------------
----<A><K><1><0><1> -WIP- <A><K><1><0><1>----
---------------------------------------------

---- Override ----


--- Gadget positions ---
--[[ 
for i, part_id in ipairs(all_ak47fl) do
	self.parts.wpn_fps_ass_heffy_762_flp_<insert_flashlight_position_name>.override[part_id] = {a_obj = "a_fl_ak47"}
end
--]]
end )

--[[Hooks:PostHook( WeaponFactoryTweakData, "_init_cc_material_config", "AK47ModInit_cc_material_config", function(self)
local parts = self.parts
----------------------------------------------------------
----<A><K><1><0><1> -Matconfig_Arrays- <A><K><1><0><1>----
----------------------------------------------------------

local ak47_body = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ch_ak47",
	"wpn_fps_ass_heffy_762_sp_ak47",
	"wpn_fps_ass_heffy_762_ufgc_ak47",
	"wpn_fps_ass_heffy_762_ur_ak47",
	"wpn_fps_ass_heffy_762_fgc_ak47",
	"wpn_fps_ass_heffy_762_fh_ak47",
	"wpn_fps_ass_heffy_762_lfgc_ak47",
	"wpn_fps_ass_heffy_762_lr_ak47"
}

--------------------------------------------------------------
----<A><K><1><0><1> -Matconfig_Definition- <A><K><1><0><1>----
--------------------------------------------------------------

--- AK47 ---
-- Body --
for i, part_id in ipairs(ak47_body) do
	if parts[part_id] then
		parts[part_id].material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_body")
		parts[part_id].thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_body_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
--parts.wpn_fps_ass_heffy_762_st_ak47.material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock")
--parts.wpn_fps_ass_heffy_762_st_ak47.thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock_thq")
end)]]--
