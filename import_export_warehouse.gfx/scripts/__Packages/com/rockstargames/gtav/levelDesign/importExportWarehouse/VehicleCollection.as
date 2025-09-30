class com.rockstargames.gtav.levelDesign.importExportWarehouse.VehicleCollection
{
   var _collectionNameToken;
   var _completionPercentage;
   var _disabled;
   var _id;
   var _selected;
   var _value;
   var _vehicles;
   function VehicleCollection(id, collectionNameToken, value, vehicles, selected, disabled, completionOfCollectionInPercent)
   {
      this._id = id;
      this._collectionNameToken = collectionNameToken;
      this._value = value;
      this._selected = selected;
      this._disabled = disabled;
      this._completionPercentage = completionOfCollectionInPercent;
      this._vehicles = [];
      if(!this._disabled)
      {
         this.checkAndAddVehicleID(vehicles[0]);
         this.checkAndAddVehicleID(vehicles[1]);
         this.checkAndAddVehicleID(vehicles[2]);
         this.checkAndAddVehicleID(vehicles[3]);
      }
   }
   function get id()
   {
      return this._id;
   }
   function get collectionNameToken()
   {
      return this._collectionNameToken;
   }
   function get vehicles()
   {
      return this._vehicles;
   }
   function get requiredDrivers()
   {
      return this._vehicles.length;
   }
   function get value()
   {
      return this._value;
   }
   function get selected()
   {
      return this._selected;
   }
   function get disabled()
   {
      return this._disabled;
   }
   function get completionPercentage()
   {
      return this._completionPercentage;
   }
   function set selected(value)
   {
      this._selected = value;
      var _loc2_ = 0;
      while(_loc2_ < this._vehicles.length)
      {
         this._vehicles[_loc2_].selected = value;
         _loc2_ = _loc2_ + 1;
      }
   }
   function checkAndAddVehicleID(id)
   {
      if(id != undefined || id == -1)
      {
         this._vehicles.push(id);
      }
   }
}
