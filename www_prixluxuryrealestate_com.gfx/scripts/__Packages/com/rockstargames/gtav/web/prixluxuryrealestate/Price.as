class com.rockstargames.gtav.web.prixluxuryrealestate.Price
{
   var _isOnSale;
   var _originalPrice;
   var _salePrice;
   function Price(_originalPrice, _salePrice)
   {
      this._originalPrice = _originalPrice;
      this._salePrice = _salePrice;
      this._isOnSale = _salePrice >= 0 && _salePrice < _originalPrice;
   }
   function get originalPrice()
   {
      return this._originalPrice;
   }
   function get salePrice()
   {
      return this._salePrice;
   }
   function get isOnSale()
   {
      return this._isOnSale;
   }
   function get numericPrice()
   {
      return !this._isOnSale ? this._originalPrice : this._salePrice;
   }
   function applyFormattedPrice(tf)
   {
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(this.numericPrice,tf);
   }
   function applyOriginalFormattedPrice(tf)
   {
      com.rockstargames.gtav.web.WWW_PRIXLUXURYREALESTATE_COM.formatDollarValue(this._originalPrice,tf);
   }
}
