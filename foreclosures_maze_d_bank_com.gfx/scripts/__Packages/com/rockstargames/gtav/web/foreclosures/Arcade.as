class com.rockstargames.gtav.web.foreclosures.Arcade
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
   var floorCosts;
   var styleCosts;
   var muralCosts;
   var quartersCosts;
   var garageCosts;
   var neonCosts;
   var highScoresCosts;
   var floorSaleCosts;
   var styleSaleCosts;
   var muralSaleCosts;
   var quartersSaleCosts;
   var garageSaleCosts;
   var neonSaleCosts;
   var highScoresSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var FLOOR_COST_RANGE = [9,17];
   static var STYLE_COST_RANGE = [18,20];
   static var MURAL_COST_RANGE = [21,29];
   static var QUARTERS_COST_RANGE = [30,30];
   static var GARAGE_COST_RANGE = [31,31];
   static var NEON_COST_RANGE = [32,40];
   static var HIGH_SCORES_COST_RANGE = [41,41];
   static var BASE_SALE_COST = 42;
   static var FLOOR_SALE_COST_RANGE = [43,51];
   static var STYLE_SALE_COST_RANGE = [52,54];
   static var MURAL_SALE_COST_RANGE = [55,63];
   static var QUARTERS_SALE_COST_RANGE = [64,64];
   static var GARAGE_SALE_COST_RANGE = [65,65];
   static var NEON_SALE_COST_RANGE = [66,74];
   static var HIGH_SCORES_SALE_COST_RANGE = [75,75];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Arcade(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Arcade.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Arcade.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Arcade.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Arcade.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Arcade.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Arcade.X] * com.rockstargames.gtav.web.foreclosures.Arcade.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Arcade.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Arcade.Y] * (- com.rockstargames.gtav.web.foreclosures.Arcade.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Arcade.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Arcade.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.Arcade.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Arcade.BASE_SALE_COST];
      this.floorCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.FLOOR_COST_RANGE);
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.STYLE_COST_RANGE);
      this.muralCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.MURAL_COST_RANGE);
      this.quartersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.QUARTERS_COST_RANGE,true);
      this.garageCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.GARAGE_COST_RANGE,true);
      this.neonCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.NEON_COST_RANGE);
      this.highScoresCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.HIGH_SCORES_COST_RANGE,true);
      this.floorSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.FLOOR_SALE_COST_RANGE);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.STYLE_SALE_COST_RANGE);
      this.muralSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.MURAL_SALE_COST_RANGE);
      this.quartersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.QUARTERS_SALE_COST_RANGE,true);
      this.garageSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.GARAGE_SALE_COST_RANGE,true);
      this.neonSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.NEON_SALE_COST_RANGE);
      this.highScoresSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.Arcade.HIGH_SCORES_SALE_COST_RANGE,true);
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
   function getFloorCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.floorCosts,selection,purchasedSelection);
   }
   function getFloorSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.floorSaleCosts,selection,purchasedSelection);
   }
   function getFloorBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.floorCosts[selection],this.floorSaleCosts[selection]);
   }
   function getFloorRawSaleCost(selection)
   {
      return this.floorSaleCosts[selection];
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
   function getMuralCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.muralCosts,selection,purchasedSelection);
   }
   function getMuralSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.muralSaleCosts,selection,purchasedSelection);
   }
   function getMuralBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.muralCosts[selection],this.muralSaleCosts[selection]);
   }
   function getMuralRawSaleCost(selection)
   {
      return this.muralSaleCosts[selection];
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
      if(selection == 0)
      {
         return -1;
      }
      return this.quartersSaleCosts[selection];
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
   function getNeonCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.neonCosts,selection,purchasedSelection);
   }
   function getNeonSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.neonSaleCosts,selection,purchasedSelection);
   }
   function getNeonBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.neonCosts[selection],this.neonSaleCosts[selection]);
   }
   function getNeonRawSaleCost(selection)
   {
      return this.neonSaleCosts[selection];
   }
   function getHighScoresCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.highScoresCosts,selection,purchasedSelection);
   }
   function getHighScoresSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.highScoresSaleCosts,selection,purchasedSelection);
   }
   function getHighScoresBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.highScoresCosts[selection],this.highScoresSaleCosts[selection]);
   }
   function getHighScoresRawSaleCost(selection)
   {
      if(selection == 0)
      {
         return -1;
      }
      return this.highScoresSaleCosts[selection];
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
