class com.rockstargames.gtav.web.foreclosures.Base
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
   var styleCosts;
   var graphicsCosts;
   var weaponCosts;
   var securityCosts;
   var loungeCosts;
   var quartersCosts;
   var windowCosts;
   var styleSaleCosts;
   var graphicsSaleCosts;
   var weaponSaleCosts;
   var securitySaleCosts;
   var loungeSaleCosts;
   var quartersSaleCosts;
   var windowSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var STYLE_COST_RANGE = [9,17];
   static var GRAPHICS_COST_RANGE = [18,26];
   static var WEAPON_COST_RANGE = [27,27];
   static var SECURITY_COST_RANGE = [28,28];
   static var LOUNGE_COST_RANGE = [29,31];
   static var QUARTERS_COST_RANGE = [32,34];
   static var WINDOW_COST_RANGE = [35,35];
   static var BASE_SALE_COST = 36;
   static var STYLE_SALE_COST_RANGE = [37,45];
   static var GRAPHICS_SALE_COST_RANGE = [46,54];
   static var WEAPON_SALE_COST_RANGE = [55,55];
   static var SECURITY_SALE_COST_RANGE = [56,56];
   static var LOUNGE_SALE_COST_RANGE = [57,59];
   static var QUARTERS_SALE_COST_RANGE = [60,62];
   static var WINDOW_SALE_COST_RANGE = [63,63];
   static var STARTER_PACK_FLAG = 64;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Base(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Base.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Base.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Base.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Base.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Base.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Base.X] * com.rockstargames.gtav.web.foreclosures.Base.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Base.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Base.Y] * (- com.rockstargames.gtav.web.foreclosures.Base.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Base.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Base.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = data[com.rockstargames.gtav.web.foreclosures.Base.STARTER_PACK_FLAG];
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.Base.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Base.BASE_SALE_COST];
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.STYLE_COST_RANGE);
      this.graphicsCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.GRAPHICS_COST_RANGE);
      this.weaponCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.WEAPON_COST_RANGE,true);
      this.securityCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.SECURITY_COST_RANGE,true);
      this.loungeCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.LOUNGE_COST_RANGE);
      this.quartersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.QUARTERS_COST_RANGE,true);
      this.windowCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.WINDOW_COST_RANGE,true);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.STYLE_SALE_COST_RANGE);
      this.graphicsSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.GRAPHICS_SALE_COST_RANGE);
      this.weaponSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.WEAPON_SALE_COST_RANGE,true);
      this.securitySaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.SECURITY_SALE_COST_RANGE,true);
      this.loungeSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.LOUNGE_SALE_COST_RANGE);
      this.quartersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.QUARTERS_SALE_COST_RANGE,true);
      this.windowSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Base.WINDOW_SALE_COST_RANGE,true);
   }
   function setupCosts(data, indexes, prefixZero)
   {
      var _loc3_ = !prefixZero ? [] : [0];
      var _loc1_ = indexes[0];
      while(_loc1_ <= indexes[1])
      {
         _loc3_.push(data[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
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
   function getStyleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.styleCosts,selection,purchasedSelection);
   }
   function getStyleSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.styleSaleCosts,selection,purchasedSelection);
   }
   function getStyleBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.styleCosts[selection],this.styleSaleCosts[selection]);
   }
   function getStyleRawSaleCost(selection)
   {
      return this.styleSaleCosts[selection];
   }
   function getGraphicsCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.graphicsCosts,selection,purchasedSelection);
   }
   function getGraphicsSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.graphicsSaleCosts,selection,purchasedSelection);
   }
   function getGraphicsBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.graphicsCosts[selection],this.graphicsSaleCosts[selection]);
   }
   function getGraphicsRawSaleCost(selection)
   {
      return this.graphicsSaleCosts[selection];
   }
   function getWeaponCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.weaponCosts,selection,purchasedSelection);
   }
   function getWeaponSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.weaponSaleCosts,selection,purchasedSelection);
   }
   function getWeaponBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.weaponCosts[selection],this.weaponSaleCosts[selection]);
   }
   function getWeaponRawSaleCost(selection)
   {
      return this.weaponSaleCosts[selection];
   }
   function getSecurityCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.securityCosts,selection,purchasedSelection);
   }
   function getSecuritySaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.securitySaleCosts,selection,purchasedSelection);
   }
   function getSecurityBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.securityCosts[selection],this.securitySaleCosts[selection]);
   }
   function getSecurityRawSaleCost(selection)
   {
      return this.securitySaleCosts[selection];
   }
   function getLoungeCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.loungeCosts,selection,purchasedSelection);
   }
   function getLoungeSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.loungeSaleCosts,selection,purchasedSelection);
   }
   function getLoungeBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.loungeCosts[selection],this.loungeSaleCosts[selection]);
   }
   function getLoungeRawSaleCost(selection)
   {
      return this.loungeSaleCosts[selection];
   }
   function getQuartersCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.quartersCosts,selection,purchasedSelection);
   }
   function getQuartersSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.quartersSaleCosts,selection,purchasedSelection);
   }
   function getQuartersBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.quartersCosts[selection],this.quartersSaleCosts[selection]);
   }
   function getQuartersRawSaleCost(selection)
   {
      return this.quartersSaleCosts[selection];
   }
   function getWindowCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.windowCosts,selection,purchasedSelection);
   }
   function getWindowSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.windowSaleCosts,selection,purchasedSelection);
   }
   function getWindowBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.windowCosts[selection],this.windowSaleCosts[selection]);
   }
   function getWindowRawSaleCost(selection)
   {
      if(selection == 0)
      {
         return -1;
      }
      return this.windowSaleCosts[selection];
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
   function getPositivePrice(prices, index, purchasedSelection)
   {
      if(this._isOwned && index == purchasedSelection)
      {
         return 0;
      }
      if(index == undefined || index < 0 || index >= prices.length)
      {
         return 0;
      }
      return prices[index] >= 0 ? prices[index] : 0;
   }
}
