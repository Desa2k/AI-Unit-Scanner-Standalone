/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 * created by Jaxx0rr
 * Reworked into Standalone by Desa2k
 * Some EXAD functions have been reworked into this standalone
 */
params ["_display","_idc","_types","_radius","_picture","_xc","_yc","_playerx","_playery","_vposx","_vposy","_log","_cs","_idcCounter","_vlist"];

_playerx = getPos player select 0;
_playery = getPos player select 1;

_log = "ShowUnits>>";

_idcCounter = _idc;

//scan the area

_vlist = [];
{
	if (alive _x) then {
		_vlist pushBack _x;
	};
} forEach nearestObjects [player, _types, _radius];

_log = _log + "Units:";

{
	_objClass = if(typeName _x isEqualTo "ARRAY") then{_x select 1} else {typeOf _x};
	_tposition = format [" POS:%1,%2,%3", getPos _x select 0, getPos _x select 1, getPos _x select 2];

	if (_objClass != "Exile_Unit_Player" && _objClass != "Salema_F" && _objClass != "Ornate_random_F" && _objClass != "Mackerel_F" && _objClass != "Tuna_F" && _objClass != "Mullet_F" && _objClass != "CatShark_F" && _objClass != "Rabbit_F" && _objClass != "Snake_random_F" && _objClass != "Turtle_F" && _objClass != "Hen_random_F" && _objClass != "Cock_random_F" && _objClass != "Cock_white_F" && _objClass != "Goat_random_F" && _objClass != "Sheep_random_F") then {

		_log = _log + _objClass + " | ";

		_vposx = getPos _x select 0;
		_vposy = getPos _x select 1;

		if (_playerx > _vposx) then {
			_xc = d2k_US_middleX-(_playerx-_vposx)/d2k_US_mapDivFactorX;
		} else {
			_xc = d2k_US_middleX+(_vposx-_playerx)/d2k_US_mapDivFactorX;
		};

		if (_playery > _vposy) then {
			_yc = d2k_US_middleY+(_playery-_vposy)/d2k_US_mapDivFactorY;
		} else {
			_yc = d2k_US_middleY-(_vposy-_playery)/d2k_US_mapDivFactorY;
		};
		_cs = ([_objClass, 0, 9] call BIS_fnc_trimString);
		
		if (_cs == "RyanZombie") then {
			_picture = d2k_US_pZom;
		};

		if (_idcCounter <= _idc+29) then {
			_ctrl = _display ctrlCreate ["RscPicture", _idcCounter];
			_ctrl ctrlSetPosition [safeZoneX + safeZoneW *_xc, safeZoneY + safeZoneH *_yc, safeZoneW * d2k_US_pictureW , safeZoneH * d2k_US_pictureH];
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTextColor [1,1,1,1];
			_ctrl ctrlEnable false;
			_ctrl ctrlCommit 0;
			//diag_log format["Created %1",_ctrl];
		};
		_idcCounter =_idcCounter + 1;
	};
} forEach _vlist;

_log;