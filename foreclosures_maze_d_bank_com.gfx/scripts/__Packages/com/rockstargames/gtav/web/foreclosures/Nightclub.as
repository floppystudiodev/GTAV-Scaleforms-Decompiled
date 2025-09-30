class com.rockstargames.gtav.web.foreclosures.Nightclub
{
   var _address;
   var _description;
   var _id;
   var _isInStarterPack;
   var _isOwned;
   var _name;
   var _txd;
   var _type;
   var _x;
   var _y;
   var baseCost;
   var baseSaleCost;
   var dancersCosts;
   var dancersSaleCosts;
   var dryIceCosts;
   var dryIceSaleCosts;
   var garageCosts;
   var garageSaleCosts;
   var lightingCosts;
   var lightingSaleCosts;
   var nameCosts;
   var nameSaleCosts;
   var storageCosts;
   var storageSaleCosts;
   var styleCosts;
   var styleSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var STYLE_COST_RANGE = [9,11];
   static var LIGHTING_COST_RANGE = [12,16];
   static var DRY_ICE_COST_RANGE = [17,17];
   static var DANCERS_COST_RANGE = [18,26];
   static var STORAGE_COST_RANGE = [27,30];
   static var GARAGE_COST_RANGE = [31,34];
   static var NAME_COST_RANGE = [35,43];
   static var BASE_SALE_COST = 44;
   static var STYLE_SALE_COST_RANGE = [45,47];
   static var LIGHTING_SALE_COST_RANGE = [48,52];
   static var DRY_ICE_SALE_COST_RANGE = [53,53];
   static var DANCERS_SALE_COST_RANGE = [54,62];
   static var STORAGE_SALE_COST_RANGE = [63,66];
   static var GARAGE_SALE_COST_RANGE = [67,70];
   static var NAME_SALE_COST_RANGE = [71,79];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Nightclub(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Nightclub.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Nightclub.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Nightclub.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Nightclub.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Nightclub.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Nightclub.X] * com.rockstargames.gtav.web.foreclosures.Nightclub.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Nightclub.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Nightclub.Y] * (- com.rockstargames.gtav.web.foreclosures.Nightclub.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Nightclub.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Nightclub.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.Nightclub.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Nightclub.BASE_SALE_COST];
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.STYLE_COST_RANGE);
      this.lightingCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.LIGHTING_COST_RANGE);
      this.dancersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.DANCERS_COST_RANGE,true);
      this.storageCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.STORAGE_COST_RANGE,true);
      this.garageCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.GARAGE_COST_RANGE,true);
      this.nameCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.NAME_COST_RANGE);
      this.dryIceCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.DRY_ICE_COST_RANGE,true);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.STYLE_SALE_COST_RANGE);
      this.lightingSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.LIGHTING_SALE_COST_RANGE);
      this.dancersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.DANCERS_SALE_COST_RANGE,true);
      this.storageSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.STORAGE_SALE_COST_RANGE,true);
      this.garageSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.GARAGE_SALE_COST_RANGE,true);
      this.nameSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.NAME_SALE_COST_RANGE);
      this.dryIceSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Nightclub.DRY_ICE_SALE_COST_RANGE,true);
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
   function get numAvailableStorage()
   {
      var _loc2_ = 4;
      var _loc3_ = this.storageCosts.length - 1;
      while(this.storageCosts[_loc3_--] == -1)
      {
         _loc2_ = _loc2_ - 1;
      }
      return _loc2_;
   }
   function get numAvailableGarage()
   {
      var _loc2_ = 4;
      var _loc3_ = this.garageCosts.length - 1;
      while(this.garageCosts[_loc3_--] == -1)
      {
         _loc2_ = _loc2_ - 1;
      }
      return _loc2_;
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
   function getLightingCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.lightingCosts,selection,purchasedSelection);
   }
   function getLightingSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.lightingSaleCosts,selection,purchasedSelection);
   }
   function getLightingBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.lightingCosts[selection],this.lightingSaleCosts[selection]);
   }
   function getLightingRawSaleCost(selection)
   {
      return this.lightingSaleCosts[selection];
   }
   function getDancersCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.dancersCosts,selection,purchasedSelection);
   }
   function getDancersSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.dancersSaleCosts,selection,purchasedSelection);
   }
   function getDancersBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.dancersCosts[selection],this.dancersSaleCosts[selection]);
   }
   function getDancersRawSaleCost(selection)
   {
      return this.dancersSaleCosts[selection];
   }
   function getStorageCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.storageCosts,selection,purchasedSelection);
   }
   function getStorageSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.storageSaleCosts,selection,purchasedSelection);
   }
   function getStorageBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.storageCosts[selection],this.storageSaleCosts[selection]);
   }
   function getStorageRawSaleCost(selection)
   {
      return this.storageSaleCosts[selection];
   }
   function getGarageCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.garageCosts,selection,purchasedSelection);
   }
   function getGarageSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.garageSaleCosts,selection,purchasedSelection);
   }
   function getGarageBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garageCosts[selection],this.garageSaleCosts[selection]);
   }
   function getGarageRawSaleCost(selection)
   {
      return this.garageSaleCosts[selection];
   }
   function getNameCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.nameCosts,selection,purchasedSelection);
   }
   function getNameSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.nameSaleCosts,selection,purchasedSelection);
   }
   function getNameBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.nameCosts[selection],this.nameSaleCosts[selection]);
   }
   function getNameRawSaleCost(selection)
   {
      return this.nameSaleCosts[selection];
   }
   function getDryIceCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.dryIceCosts,selection,purchasedSelection);
   }
   function getDryIceSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.dryIceSaleCosts,selection,purchasedSelection);
   }
   function getDryIceBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.dryIceCosts[selection],this.dryIceSaleCosts[selection]);
   }
   function getDryIceRawSaleCost(selection)
   {
      return this.dryIceSaleCosts[selection];
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
