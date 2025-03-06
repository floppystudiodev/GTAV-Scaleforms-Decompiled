class com.rockstargames.gtav.levelDesign.securoserv.SpecialVehicle
{
   var _id;
   var _vehicleName;
   var _description;
   var _txd;
   var _lockNum;
   var _enabled;
   var _cashBonus;
   var _rpBonus;
   function SpecialVehicle(_id, _vehicleName, _description, _txd, _lockNum, _enabled, _cashBonus, _rpBonus)
   {
      this._id = _id;
      this._vehicleName = _vehicleName;
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
   function get vehicleName()
   {
      return this._vehicleName;
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
