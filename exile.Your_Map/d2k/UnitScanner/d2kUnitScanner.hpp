/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 * created by Jaxx0rr
 * Reworked into Standalone by Desa2k
 * Some EXAD functions have been reworked into this standalone
 */

class d2kUnitScanner
{
	idd = 9001;
	onLoad = "uiNamespace setVariable ['d2kUnitScanner', (_this select 0)]; [] spawn d2k_fnc_loadcontent;";
	onUnLoad = "uiNamespace setVariable ['d2kUnitScanner', displayNull];";
	movingEnable = false;
	
	class ControlsBackground
	{
		class Control1812126473
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.296875;
			y = safeZoneY + safeZoneH * 0.24722223;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 48;
			text = "d2k\UnitScanner\icons\Tablet_Radar_ca.paa";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
	
};
