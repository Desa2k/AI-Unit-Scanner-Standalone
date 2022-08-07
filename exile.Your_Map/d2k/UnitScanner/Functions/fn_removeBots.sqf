/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 * created by Jaxx0rr
 * Reworked into Standalone by Desa2k
 * Some EXAD functions have been reworked into this standalone
 */
scriptName "d2k_fnc_removeBots";
params ["_vehicle","_occupants","_unit","_occupantClass"];

_occupants = fullCrew _vehicle;
{
	_unit = _x select 0;
	_occupantClass = if(typeName _x isEqualTo "ARRAY") then{_x select 1} else {typeOf _x};
	if (_occupantClass != "Exile_Unit_Player") then
	{
		_unit action ["getOut", _vehicle];
	};
} forEach _occupants;
true