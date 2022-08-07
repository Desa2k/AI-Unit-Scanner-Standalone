/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 * created by Jaxx0rr
 * Reworked into Standalone by Desa2k
 * Some EXAD functions have been reworked into this standalone
 */
scriptName "d2k_fnc_botCheck";
params ["_vehicle","_occupants","_occupantClass","_return"];
_return = false;
_occupants = fullCrew _vehicle;
{
	_occupantClass = if(typeName _x isEqualTo "ARRAY") then{_x select 1} else {typeOf _x};
	if (_occupantClass != "Exile_Unit_Player") then
	{
		_return = true;
	};
} forEach _occupants;
_return