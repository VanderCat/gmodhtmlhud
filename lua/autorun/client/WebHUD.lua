local health = {
	number = 0,
	armor = -1
}
local ammo = {
	number = 0,
	left = -1,
	secondary = {
		number = 0
	}
}
hook.Add( "HUDPaint", "VanderHUDmain", function()
	webhudpnl = webhudpnl or vgui.Create("WebHUD")
	local plr = LocalPlayer()
	if (!IsValid(plr)) then return end
		local newhealth = {
			number = plr:Health(),
			armor = plr:Armor(),
		}
		if (newhealth.number-health.number ~= 0) then webhudpnl:Call("setHealth("..newhealth.number..")") end
		if (newhealth.armor-health.armor ~= 0) then webhudpnl:Call("setArmor("..newhealth.armor..")") end
		health = newhealth
		local newammo = {}
		pcall(function()
			newammo.number = plr:GetActiveWeapon():Clip1()
			newammo.secondary.number = plr:GetAmmoCount(plr:GetActiveWeapon():GetSecondaryAmmoType())
			newammo.type = plr:GetActiveWeapon():GetPrimaryAmmoType()
			if newammo.type < 1 then
				if plr:GetAmmoCount(plr:GetActiveWeapon():GetPrimaryAmmoType()) > 0 then
					newammo.number = plr:GetAmmoCount(plr:GetActiveWeapon():GetPrimaryAmmoType())
				elseif plr:GetActiveWeapon():Clip1() > 0 then
					newammo.number = plr:GetActiveWeapon():Clip1()
				else
					newammo.number = -1
				end
				newammo.max = newammo.number
				newammo.left = 0
				if (newammo.secondary.number > 0) and (newammo.number < 0) then
					newammo.number = newammo.secondary.number
					newammo.secondary.number = 0
					newammo.max = newammo.number
				end
			else
				newammo.max = plr:GetActiveWeapon():GetMaxClip1()
				newammo.left = plr:GetAmmoCount(plr:GetActiveWeapon():GetPrimaryAmmoType())
				if (newammo.left > 0) and (newammo.number < 0) then
					newammo.number = newammo.left
					newammo.left = 0
					newammo.max = newammo.number
				end
			end
		end) 
		newammo.secondary = newammo.secondary or {}
		newammo.secondary.number = newammo.secondary.number or 0
		newammo.left = newammo.left or 0
		if (newammo.number-ammo.number ~= 0) then webhudpnl:Call("setAmmo("..newammo.number..")") end
		if (newammo.secondary.number-ammo.secondary.number ~= 0) then webhudpnl:Call("setAlt("..newammo.secondary.number..")") end
		if (newammo.left-ammo.left ~= 0) then webhudpnl:Call("setReserve("..newammo.left..")") end
		ammo = newammo
end)

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
}
hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end
end )