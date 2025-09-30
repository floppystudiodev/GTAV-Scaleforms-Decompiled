class com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse
{
   var _currentValue;
   var _description;
   var _id;
   var _interior1Cost;
   var _interior1SaleCost;
   var _interior2Cost;
   var _interior2SaleCost;
   var _interior0Cost;
   var _interior0SaleCost;
   var _isOwned;
   var _location;
   var _name;
   var _numVehiclesStored;
   var _purchasedInterior;
   var _txd;
   var _vehicleCapacity;
   var _x;
   var _y;
   var stealCooldown;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function VehicleWarehouse(_id, _px, _py, _interior0Cost, _interior0SaleCost, _interior1Cost, _interior1SaleCost, _interior2Cost, _interior2SaleCost, _warehouseName, _location, _description, _txd, _isOwned, _vehicleCapacity, _numVehiclesStored, _currentValue, _stealCooldown, _purchasedInterior)
   {
      this._id = _id;
      this._x = _px * com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_ORIGIN_X;
      this._y = _py * (- com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.securoserv.VehicleWarehouse.MAP_ORIGIN_Y;
      this._interior0Cost = _interior0Cost;
      this._interior1Cost = _interior1Cost;
      this._interior2Cost = _interior2Cost;
      this._interior0SaleCost = _interior0SaleCost != undefined ? _interior0SaleCost : -1;
      this._interior1SaleCost = _interior1SaleCost != undefined ? _interior1SaleCost : -1;
      this._interior2SaleCost = _interior2SaleCost != undefined ? _interior2SaleCost : -1;
      this._name = _warehouseName;
      this._location = _location;
      this._description = _description;
      this._txd = _txd;
      this._isOwned = _isOwned;
      this._vehicleCapacity = _vehicleCapacity;
      this._numVehiclesStored = _numVehiclesStored;
      this._currentValue = _currentValue;
      this.stealCooldown = _stealCooldown;
      this._purchasedInterior = _purchasedInterior;
   }
   function get id()
   {
      return this._id;
   }
   function get x()
   {
      return this._x;
   }
   function get y()
   {
      return this._y;
   }
   function get interior0Cost()
   {
      return this._interior0Cost;
   }
   function get interior1Cost()
   {
      return this._interior1Cost;
   }
   function get interior2Cost()
   {
      return this._interior2Cost;
   }
   function get interior0SaleCost()
   {
      return this._interior0SaleCost;
   }
   function get interior1SaleCost()
   {
      return this._interior1SaleCost;
   }
   function get interior2SaleCost()
   {
      return this._interior2SaleCost;
   }
   function get currentValue()
   {
      return this._currentValue;
   }
   function get name()
   {
      return this._name;
   }
   function get location()
   {
      return this._location;
   }
   function get desciption()
   {
      return this._description;
   }
   function get txd()
   {
      return this._txd;
   }
   function get isOwned()
   {
      return this._isOwned;
   }
   function get vehicleCapacity()
   {
      return this._vehicleCapacity;
   }
   function get numVehiclesStored()
   {
      return this._numVehiclesStored;
   }
   function get purchasedInterior()
   {
      return this._purchasedInterior;
   }
}
