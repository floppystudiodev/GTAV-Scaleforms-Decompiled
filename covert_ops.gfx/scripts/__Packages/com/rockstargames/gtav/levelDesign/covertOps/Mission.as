class com.rockstargames.gtav.levelDesign.covertOps.Mission
{
   var _id;
   var _missionName;
   var _description;
   var _txd;
   var _lockNum;
   var _enabled;
   var _cashBonus;
   var _rpBonus;
   function Mission(_id, _missionName, _description, _txd, _lockNum, _enabled, _cashBonus, _rpBonus)
   {
      this._id = _id;
      this._missionName = _missionName;
      this._description = _description;
      this._txd = _txd;
      this._lockNum = _lockNum;
      this._enabled = _enabled;
      this._cashBonus = _cashBonus != undefined ? _cashBonus : 0;
      this._rpBonus = _rpBonus != undefined ? _rpBonus : 0;
   }
   function get id()
   {
      return this._id;
   }
   function get missionName()
   {
      return this._missionName;
   }
   function get description()
   {
      return this._description;
   }
   function get txd()
   {
      return this._txd;
   }
   function get lockNum()
   {
      return this._lockNum;
   }
   function get cashBonus()
   {
      return this._cashBonus;
   }
   function get rpBonus()
   {
      return this._rpBonus;
   }
   function get enabled()
   {
      return this._enabled;
   }
}
