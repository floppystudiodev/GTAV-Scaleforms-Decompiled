class com.rockstargames.gtav.levelDesign.securoserv.Warehouse
{
   var _amountStored;
   var _buyCooldown;
   var _capacity;
   var _currentValue;
   var _description;
   var _id;
   var _isOwned;
   var _largeShipmentCost;
   var _largeShipmentSaleCost;
   var _largeShipmentSize;
   var _location;
   var _mediumShipmentCost;
   var _mediumShipmentSaleCost;
   var _mediumShipmentSize;
   var _name;
   var _purchaseCost;
   var _purchaseSaleCost;
   var _sellCooldown;
   var _shipmentDescription;
   var _size;
   var _smallShipmentCost;
   var _smallShipmentIsSpecial;
   var _smallShipmentSaleCost;
   var _smallShipmentSize;
   var _specialItems;
   var _txd;
   var _x;
   var _y;
   var displayOrder;
   static var SIZE_ALL = -1;
   static var SIZE_SMALL = 0;
   static var SIZE_MEDIUM = 1;
   static var SIZE_LARGE = 2;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Warehouse(_id, _px, _py, _purchaseCost, _nameLabel, _locationLabel, _descriptionLabel, _txd, _isOwned, _size, _capacity, _amountStored, _currentValue, _specialItems, _sellCooldown, _buyCooldown, _displayOrder, _purchaseSaleCost)
   {
      this._id = _id;
      this._x = _px * com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_X;
      this._y = _py * (- com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_COORD_SCALE) + com.rockstargames.gtav.levelDesign.securoserv.Warehouse.MAP_ORIGIN_Y;
      this._purchaseCost = _purchaseCost;
      this._name = _nameLabel;
      this._location = _locationLabel;
      this._description = _descriptionLabel;
      this._txd = _txd;
      this._isOwned = _isOwned;
      this._size = _size;
      this._capacity = _capacity;
      this._amountStored = _amountStored;
      this._currentValue = _currentValue;
      this._specialItems = _specialItems;
      var _loc2_ = getTimer();
      if(isNaN(_sellCooldown))
      {
         _sellCooldown = 0;
      }
      if(isNaN(_buyCooldown))
      {
         _buyCooldown = 0;
      }
      this._sellCooldown = 1000 * _sellCooldown + _loc2_;
      this._buyCooldown = 1000 * _buyCooldown + _loc2_;
      this.displayOrder = _displayOrder;
      this._purchaseSaleCost = _purchaseSaleCost;
   }
   function setShipmentData(_shipmentDescription, _smallShipmentSize, _smallShipmentCost, _mediumShipmentSize, _mediumShipmentCost, _largeShipmentSize, _largeShipmentCost, _smallShipmentIsSpecial, _smallShipmentSaleCost, _mediumShipmentSaleCost, _largeShipmentSaleCost)
   {
      this._smallShipmentSize = _smallShipmentSize;
      this._smallShipmentCost = _smallShipmentCost;
      this._mediumShipmentSize = _mediumShipmentSize;
      this._mediumShipmentCost = _mediumShipmentCost;
      this._largeShipmentSize = _largeShipmentSize;
      this._largeShipmentCost = _largeShipmentCost;
      this._shipmentDescription = _shipmentDescription;
      this._smallShipmentIsSpecial = _smallShipmentIsSpecial === true;
      this._smallShipmentSaleCost = _smallShipmentSaleCost;
      this._mediumShipmentSaleCost = _mediumShipmentSaleCost;
      this._largeShipmentSaleCost = _largeShipmentSaleCost;
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
   function get purchaseCost()
   {
      return this._purchaseCost;
   }
   function get purchaseSaleCost()
   {
      return this._purchaseSaleCost;
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
   function get size()
   {
      return this._size;
   }
   function get capacity()
   {
      return this._capacity;
   }
   function get amountStored()
   {
      return this._amountStored;
   }
   function get shipmentDescription()
   {
      return this._shipmentDescription;
   }
   function get smallShipmentSize()
   {
      return this._smallShipmentSize;
   }
   function get smallShipmentCost()
   {
      return this._smallShipmentCost;
   }
   function get smallShipmentSaleCost()
   {
      return this._smallShipmentSaleCost;
   }
   function get mediumShipmentSize()
   {
      return this._mediumShipmentSize;
   }
   function get mediumShipmentCost()
   {
      return this._mediumShipmentCost;
   }
   function get mediumShipmentSaleCost()
   {
      return this._mediumShipmentSaleCost;
   }
   function get largeShipmentSize()
   {
      return this._largeShipmentSize;
   }
   function get largeShipmentCost()
   {
      return this._largeShipmentCost;
   }
   function get largeShipmentSaleCost()
   {
      return this._largeShipmentSaleCost;
   }
   function get specialItems()
   {
      return this._specialItems;
   }
   function get sellCooldown()
   {
      return this._sellCooldown;
   }
   function get buyCooldown()
   {
      return this._buyCooldown;
   }
   function get smallShipmentIsSpecial()
   {
      return this._smallShipmentIsSpecial;
   }
}
