class com.rockstargames.gtav.web.foreclosures.AutoShop
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
   var tintCosts;
   var emblemCosts;
   var nameCosts;
   var staff1Costs;
   var staff2Costs;
   var carLiftCosts;
   var quartersCosts;
   var membershipCosts;
   var styleSaleCosts;
   var tintSaleCosts;
   var emblemSaleCosts;
   var nameSaleCosts;
   var staff1SaleCosts;
   var staff2SaleCosts;
   var carLiftSaleCosts;
   var quartersSaleCosts;
   var membershipSaleCosts;
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
   static var TINT_COST_RANGE = [18,26];
   static var EMBLEM_COST_RANGE = [27,35];
   static var NAME_COST_RANGE = [36,36];
   static var STAFF1_COST_RANGE = [37,37];
   static var STAFF2_COST_RANGE = [38,38];
   static var CAR_LIFT_COST_RANGE = [39,39];
   static var QUARTERS_COST_RANGE = [40,40];
   static var MEMBERSHIP_COST_RANGE = [41,41];
   static var BASE_SALE_COST = 42;
   static var STYLE_SALE_COST_RANGE = [43,51];
   static var TINT_SALE_COST_RANGE = [52,60];
   static var EMBLEM_SALE_COST_RANGE = [61,69];
   static var NAME_SALE_COST_RANGE = [70,70];
   static var STAFF1_SALE_COST_RANGE = [71,71];
   static var STAFF2_SALE_COST_RANGE = [72,72];
   static var CAR_LIFT_SALE_COST_RANGE = [73,73];
   static var QUARTERS_SALE_COST_RANGE = [74,74];
   static var MEMBERSHIP_SALE_COST_RANGE = [75,75];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function AutoShop(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.AutoShop.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.AutoShop.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.AutoShop.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.AutoShop.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.AutoShop.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.AutoShop.X] * com.rockstargames.gtav.web.foreclosures.AutoShop.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.AutoShop.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.AutoShop.Y] * (- com.rockstargames.gtav.web.foreclosures.AutoShop.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.AutoShop.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.AutoShop.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.AutoShop.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.AutoShop.BASE_SALE_COST];
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STYLE_COST_RANGE);
      this.tintCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.TINT_COST_RANGE);
      this.emblemCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.EMBLEM_COST_RANGE);
      this.nameCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.NAME_COST_RANGE,true);
      this.staff1Costs = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STAFF1_COST_RANGE,true);
      this.staff2Costs = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STAFF2_COST_RANGE,true);
      this.carLiftCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.CAR_LIFT_COST_RANGE,true);
      this.quartersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.QUARTERS_COST_RANGE,true);
      this.membershipCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.MEMBERSHIP_COST_RANGE,true);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STYLE_SALE_COST_RANGE);
      this.tintSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.TINT_SALE_COST_RANGE);
      this.emblemSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.EMBLEM_SALE_COST_RANGE);
      this.nameSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.NAME_SALE_COST_RANGE,true);
      this.staff1SaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STAFF1_SALE_COST_RANGE,true);
      this.staff2SaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.STAFF2_SALE_COST_RANGE,true);
      this.carLiftSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.CAR_LIFT_SALE_COST_RANGE,true);
      this.quartersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.QUARTERS_SALE_COST_RANGE,true);
      this.membershipSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.AutoShop.MEMBERSHIP_SALE_COST_RANGE,true);
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
   function getTintCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.tintCosts,selection,purchasedSelection);
   }
   function getTintSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.tintSaleCosts,selection,purchasedSelection);
   }
   function getTintBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.tintCosts[selection],this.tintSaleCosts[selection]);
   }
   function getTintRawSaleCost(selection)
   {
      return this.tintSaleCosts[selection];
   }
   function getEmblemCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.emblemCosts,selection,purchasedSelection);
   }
   function getEmblemSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.emblemSaleCosts,selection,purchasedSelection);
   }
   function getEmblemBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.emblemCosts[selection],this.emblemSaleCosts[selection]);
   }
   function getEmblemRawSaleCost(selection)
   {
      return this.emblemSaleCosts[selection];
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
      if(selection == 0)
      {
         return -1;
      }
      return this.nameSaleCosts[selection];
   }
   function getStaff1Cost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staff1Costs,selection,purchasedSelection);
   }
   function getStaff1SaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staff1SaleCosts,selection,purchasedSelection);
   }
   function getStaff1BestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.staff1Costs[selection],this.staff1SaleCosts[selection]);
   }
   function getStaff1RawSaleCost(selection)
   {
      return this.staff1SaleCosts[selection];
   }
   function getStaff2Cost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staff2Costs,selection,purchasedSelection);
   }
   function getStaff2SaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staff2SaleCosts,selection,purchasedSelection);
   }
   function getStaff2BestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.staff2Costs[selection],this.staff2SaleCosts[selection]);
   }
   function getStaff2RawSaleCost(selection)
   {
      return this.staff2SaleCosts[selection];
   }
   function getCarLiftCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.carLiftCosts,selection,purchasedSelection);
   }
   function getCarLiftSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.carLiftSaleCosts,selection,purchasedSelection);
   }
   function getCarLiftBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.carLiftCosts[selection],this.carLiftSaleCosts[selection]);
   }
   function getCarLiftRawSaleCost(selection)
   {
      if(selection == 0)
      {
         return -1;
      }
      return this.carLiftSaleCosts[selection];
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
   function getMembershipCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.membershipCosts,selection,purchasedSelection);
   }
   function getMembershipSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.membershipSaleCosts,selection,purchasedSelection);
   }
   function getMembershipBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.membershipCosts[selection],this.membershipSaleCosts[selection]);
   }
   function getMembershipRawSaleCost(selection)
   {
      return this.membershipSaleCosts[selection];
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
