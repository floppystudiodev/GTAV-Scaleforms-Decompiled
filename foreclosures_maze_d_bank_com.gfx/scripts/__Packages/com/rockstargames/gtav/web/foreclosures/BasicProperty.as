class com.rockstargames.gtav.web.foreclosures.BasicProperty
{
   var _id;
   var _name;
   var _type;
   var _address;
   var _description;
   var _x;
   var _y;
   var _txd;
   var _isOwned;
   var _isInStarterPack;
   var baseCost;
   var baseSaleCost;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var BASE_SALE_COST = 9;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function BasicProperty(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.X] * com.rockstargames.gtav.web.foreclosures.BasicProperty.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.BasicProperty.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.Y] * (- com.rockstargames.gtav.web.foreclosures.BasicProperty.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.BasicProperty.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.BasicProperty.BASE_SALE_COST];
   }
   function setupCosts(data, indexes, prefixZero)
   {
      var _loc2_ = !prefixZero ? [] : [0];
      var _loc1_ = indexes[0];
      while(_loc1_ <= indexes[1])
      {
         if(_loc1_ < data.length)
         {
            _loc2_.push(data[_loc1_]);
         }
         else
         {
            _loc2_.push(-1);
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
   function get id()
   {
      return this._id;
   }
   function get name()
   {
      return this._name;
   }
   function get address()
   {
      return this._address;
   }
   function get type()
   {
      return this._type;
   }
   function get description()
   {
      return this._description;
   }
   function get x()
   {
      return this._x;
   }
   function get y()
   {
      return this._y;
   }
   function get txd()
   {
      return this._txd;
   }
   function get isOwned()
   {
      return this._isOwned;
   }
   function get isInStarterPack()
   {
      return this._isInStarterPack;
   }
   function playerHasPurchased()
   {
      this._isOwned = true;
   }
   function playerHasSold()
   {
      this._isOwned = false;
   }
   function getBaseCost()
   {
      return this.baseCost;
   }
   function getBaseSaleCost()
   {
      return !(this.baseSaleCost == undefined || this.baseSaleCost < 0) ? this.baseSaleCost : 0;
   }
   function getBaseBestCost()
   {
      return this.getBestPrice(this.baseCost,this.baseSaleCost);
   }
   function getBestPrice(normalPrice, salePrice)
   {
      if(normalPrice == undefined)
      {
         normalPrice = 0;
      }
      if(salePrice == undefined)
      {
         salePrice = 0;
      }
      return !(salePrice >= 0 && salePrice < normalPrice) ? normalPrice : salePrice;
   }
}
