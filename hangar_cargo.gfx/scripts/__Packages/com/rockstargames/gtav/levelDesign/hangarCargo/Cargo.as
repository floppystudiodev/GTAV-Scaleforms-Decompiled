class com.rockstargames.gtav.levelDesign.hangarCargo.Cargo
{
   var _type;
   var _currentStockLevel;
   var _totalStockLevel;
   var _bonusPercent;
   var _sellPrice;
   function Cargo(_type, _currentStockLevel, _totalStockLevel, _bonusPercent, _sellPrice)
   {
      this._type = _type;
      this._currentStockLevel = _currentStockLevel;
      this._totalStockLevel = _totalStockLevel;
      this._bonusPercent = _bonusPercent;
      this._sellPrice = _sellPrice;
   }
   function get type()
   {
      return this._type;
   }
   function get currentStockLevel()
   {
      return this._currentStockLevel;
   }
   function get totalStockLevel()
   {
      return this._totalStockLevel;
   }
   function get bonusPercent()
   {
      return this._bonusPercent;
   }
   function get sellPrice()
   {
      return this._sellPrice;
   }
}
