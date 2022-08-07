/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 * created by Jaxx0rr
 * Reworked into Standalone by Desa2k
 * Some EXAD functions have been reworked into this standalone
 */
scriptName "d2k_fnc_loadContent";
private ["_display","_idc","_error","_log"];

_display = uiNamespace getVariable ["d2kUnitScanner", displayNull];
if (isNull _display) exitWith {_error = "Error Unit Scanner, display is null"; systemChat _error; diag_log _error;};

/////////////  Cooldown Timer ////////////////////////
if (!isNil "d2k_US_lastUsedTime") then
{
_timeRemainingReuse = d2k_US_coolDownTime - (diag_tickTime - d2k_US_lastUsedTime);
if ((_timeRemainingReuse) > 0) exitWith
	{
		["ErrorTitleAndText",["Unit Scanner Error", format["You need to wait %1 seconds before using this service again!", ceil _timeRemainingReuse]]] call ExileClient_gui_toaster_addTemplateToast;
		playSound "FD_CP_Not_Clear_F";
		_display closeDisplay 0;
		breakOut "d2k_fnc_loadContent";
	};
};

_log = "loadContent>>";
_idc = 1400;
_log = _log + str([_display, _idc, ["Car","Air","Tank"], d2k_US_scanRadius, d2k_US_pCar] call d2k_fnc_showUnits);
_idc = 1430;
_log = _log + str([_display, _idc, ["Man"], d2k_US_scanRadius, d2k_US_pMan] call d2k_fnc_showUnits);
_idc = 1460;
_log = _log + str([_display, _idc, ["StaticWeapon"], d2k_US_scanRadius, d2k_US_pStatic] call d2k_fnc_showUnits);
d2k_US_lastUsedTime = diag_tickTime;
//diag_log _log;

true