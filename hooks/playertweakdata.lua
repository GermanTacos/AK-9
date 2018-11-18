Hooks:PostHook( PlayerTweakData, "init", "AK9ModStanceTweakData", function(self)

--AK
	
--	self.stances.heffy_939_ads = deep_clone(self.stances.flint)
--	local ironsight_translation = Vector3(0, -13, 0.518)
--	self.stances.heffy_939_ads.steelsight.shoulders.translation = self.stances.heffy_939_ads.steelsight.shoulders.translation + ironsight_translation 

--TISS
	self.stances.tiss_ads = deep_clone(self.stances.flint)
	local ironsight_translation = Vector3(0, -13, -0.4)
	self.stances.tiss_ads.steelsight.shoulders.translation = self.stances.tiss_ads.steelsight.shoulders.translation + ironsight_translation
	self.stances.tiss_ads.steelsight.shoulders.rotation = Rotation(0, 0.5, 0)

end )