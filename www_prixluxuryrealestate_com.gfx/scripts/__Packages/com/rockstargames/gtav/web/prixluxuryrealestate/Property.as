class com.rockstargames.gtav.web.prixluxuryrealestate.Property
{
   var _description;
   var _id;
   var _isOwned;
   var _location;
   var _name;
   var _txd;
   var _txn;
   var prices;
   function Property(data)
   {
      this.prices = [];
      this.parseData(data);
   }
   function parseData(data)
   {
   }
   function get id()
   {
      return this._id;
   }
   function get name()
   {
      return this._name;
   }
   function get location()
   {
      return this._location;
   }
   function get description()
   {
      return this._description;
   }
   function get txn()
   {
      return this._txn;
   }
   function get txd()
   {
      return this._txd;
   }
   function get isOwned()
   {
      return this._isOwned;
   }
   function getPrice(itemIndex, itemSubtype)
   {
      var _loc2_ = this.prices[itemIndex][itemSubtype];
      return _loc2_.numericPrice;
   }
   function getOriginalPrice(itemIndex, itemSubtype)
   {
      var _loc2_ = this.prices[itemIndex][itemSubtype];
      return _loc2_.originalPrice;
   }
   function getPriceIsOnSale(itemIndex, itemSubtype)
   {
      var _loc2_ = this.prices[itemIndex][itemSubtype];
      return _loc2_.isOnSale;
   }
   function applyFormattedPrice(itemIndex, itemSubtype, tf)
   {
      var _loc2_ = this.prices[itemIndex][itemSubtype];
      _loc2_.applyFormattedPrice(tf);
   }
   function applyOriginalFormattedPrice(itemIndex, itemSubtype, tf)
   {
      var _loc2_ = this.prices[itemIndex][itemSubtype];
      _loc2_.applyOriginalFormattedPrice(tf);
   }
}
