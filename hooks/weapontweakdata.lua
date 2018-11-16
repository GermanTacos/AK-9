Hooks:PostHook( WeaponTweakData, "init", "AK9ModInit", function(self)

if ( self.heffy_939 ) then

---- Bipod Stuff ----
--[[self.heffy_939.animations.bipod_enter = "bipod_enter"
	self.heffy_939.animations.bipod_exit = "bipod_exit"
	self.heffy_939.animations.bipod_recoil = "bipod_recoil"
	self.heffy_939.animations.bipod_recoil_enter = "bipod_recoil"
	self.heffy_939.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.heffy_939.animations.bipod_recoil_exit = "bipod_recoil_exit"
	self.heffy_939.animations.use_stance = "ak74"	
	self.heffy_939.spread.bipod = default_bipod_spread
	self.heffy_939.bipod_camera_spin_limit = 45
	self.heffy_939.bipod_camera_pitch_limit = 20
	self.heffy_939.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.heffy_939.bipod_deploy_multiplier = 1
	self.heffy_939.timers.deploy_bipod = 1]]--
	
---- CAP aka YEEET ----	

--- Base stuff ---	
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -15.75, 0 ), -- -16
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( -0.4, 0, -1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_gl", 
        base_a_obj = "a_fl", 
        position = Vector3( -2.88, 27.2, -3.1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -7, 0.5 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_os", 
        base_a_obj = "a_os", 
        position = Vector3( 0, 1.5, 1.1 ), 
        rotation = Rotation( 0, 10, 0 )
	})
--- Scope Mount ---
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o_mount", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0, 2.85 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Front sights ---
-- Override by lfg ---
--- Rear sights ---
-- Override by barrel --
-- Override by receiver ---
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_ro_tiss_std", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 3.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
-- Barrel fo positions --
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_fo_ak9", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -20.7, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_fo_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -23.1, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Barrel positions with different FGs ---
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_b_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -2.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_b_tiss_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -4.8, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	
--- Barrel extensions ---
-- Default positions --
-- Overide positions --
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_ns_tiss", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -18.15, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Stocks ---
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_s_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.875, 0.6875 ), --0.7, 0.55 | 0.175, 0.1375
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_s_ak101", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.875, 1.8 ), --0.7, 0.55 | 0.175, 0.1375
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_s_akmsu_ak47", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -0.35, -0.275 ), 
        rotation = Rotation( 0, -2.5, 0 ) 
	})
	
--- Pistol Grips ---
	
--- Stock Pads ---
	
--- Magazines ---
	
--- Russian Sights ---
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o_1p29",
		base_a_obj = "a_o",
		position = Vector3(0.6, -13, 0.2),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o_1pn93",
		base_a_obj = "a_o",
		position = Vector3(-0.7, -13, 1.55),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o_ekp_1s_03",
		base_a_obj = "a_o",
		position = Vector3(0, -7, -1.2),	--	position = Vector3(-0.3, -2, -1.7),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("heffy_939", {
		name = "a_o_pso1",
		base_a_obj = "a_o",
		position = Vector3(-0.7, -7, -1.2),
		rotation = Rotation(0, 0, 0)
	})
end

if ( self.x_heffy_939 ) then

---- Bipod Stuff ----
--[[self.heffy_939.animations.bipod_enter = "bipod_enter"
	self.heffy_939.animations.bipod_exit = "bipod_exit"
	self.heffy_939.animations.bipod_recoil = "bipod_recoil"
	self.heffy_939.animations.bipod_recoil_enter = "bipod_recoil"
	self.heffy_939.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.heffy_939.animations.bipod_recoil_exit = "bipod_recoil_exit"
	self.heffy_939.animations.use_stance = "ak74"	
	self.heffy_939.spread.bipod = default_bipod_spread
	self.heffy_939.bipod_camera_spin_limit = 45
	self.heffy_939.bipod_camera_pitch_limit = 20
	self.heffy_939.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.heffy_939.bipod_deploy_multiplier = 1
	self.heffy_939.timers.deploy_bipod = 1]]--
	
---- CAP aka YEEET ----	

--- Base stuff ---	
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -15.75, 0 ), -- -16
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( -0.4, 0, -1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_gl", 
        base_a_obj = "a_fl", 
        position = Vector3( -2.88, 27.2, -3.1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -7, 0.5 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_os", 
        base_a_obj = "a_os", 
        position = Vector3( 0, 1.5, 1.1 ), 
        rotation = Rotation( 0, 10, 0 )
	})
--- Scope Mount ---
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_o_mount", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0, 2.85 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Front sights ---
-- Override by lfg ---
--- Rear sights ---
-- Override by barrel --
-- Override by receiver ---
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_ro_tiss_std", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 3.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
-- Barrel fo positions --
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_fo_ak9", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -20.7, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_fo_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -23.1, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Barrel positions with different FGs ---
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_b_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -2.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_b_tiss_tiss", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -4.8, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Barrel extensions ---
-- Default positions --
-- Overide positions --
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_ns_tiss", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -18.15, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Stocks ---
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_s_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.875, 0.6875 ), --0.7, 0.55 | 0.175, 0.1375
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_s_ak101", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.875, 1.8 ), --0.7, 0.55 | 0.175, 0.1375
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("x_heffy_939", {
		name = "a_s_akmsu_ak47", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -0.35, -0.275 ), 
        rotation = Rotation( 0, -2.5, 0 ) 
	})
	
-- Barrel fo positions --
	self:SetupAttachmentPoint("x_heffy_939", {
        name = "a_fo_ak9",
        base_a_obj = "a_body",
        part_attach_data = {{"wpn_fps_ass_heffy_939_ba_ak9"},"g_body"},
        position = Vector3(0, -20.7, 0),
        rotation = RotationCAP(0, 0, 0)
    })
end
end)



