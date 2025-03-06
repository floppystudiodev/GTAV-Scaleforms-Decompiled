class com.rockstargames.gtav.web.foreclosures.BailOffice
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
   var staff1Costs;
   var staff2Costs;
   var quartersCosts;
   var gunLockerCosts;
   var transporterCosts;
   var styleCosts;
   var staff1SaleCosts;
   var staff2SaleCosts;
   var quartersSaleCosts;
   var gunLockerSaleCosts;
   var transporterSaleCosts;
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
   static var STAFF_1_COST_RANGE = [9,9];
   static var STAFF_2_COST_RANGE = [10,10];
   static var QUARTERS_COST_RANGE = [11,11];
   static var GUN_LOCKER_COST_RANGE = [12,12];
   static var TRANSPORTER_COST_RANGE = [13,13];
   static var STYLE_COST_RANGE = [14,16];
   static var BASE_SALE_COST = 17;
   static var STAFF_1_SALE_COST_RANGE = [18,18];
   static var STAFF_2_SALE_COST_RANGE = [19,19];
   static var QUARTERS_SALE_COST_RANGE = [20,20];
   static var GUN_LOCKER_SALE_COST_RANGE = [21,21];
   static var TRANSPORTER_SALE_COST_RANGE = [22,22];
   static var STYLE_SALE_COST_RANGE = [23,25];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function BailOffice(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.BailOffice.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.BailOffice.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.BailOffice.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.BailOffice.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.BailOffice.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.BailOffice.X] * com.rockstargames.gtav.web.foreclosures.BailOffice.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.BailOffice.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.BailOffice.Y] * (- com.rockstargames.gtav.web.foreclosures.BailOffice.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.BailOffice.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.BailOffice.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.BailOffice.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.BailOffice.BASE_SALE_COST];
      this.staff1Costs = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STAFF_1_COST_RANGE,true);
      this.staff2Costs = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STAFF_2_COST_RANGE,true);
      this.quartersCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.QUARTERS_COST_RANGE,true);
      this.gunLockerCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.GUN_LOCKER_COST_RANGE,true);
      this.transporterCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.TRANSPORTER_COST_RANGE,true);
      this.styleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STYLE_COST_RANGE);
      this.staff1SaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STAFF_1_SALE_COST_RANGE,true);
      this.staff2SaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STAFF_2_SALE_COST_RANGE,true);
      this.quartersSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.QUARTERS_SALE_COST_RANGE,true);
      this.gunLockerSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.GUN_LOCKER_SALE_COST_RANGE,true);
      this.transporterSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.TRANSPORTER_SALE_COST_RANGE,true);
      this.styleSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.BailOffice.STYLE_SALE_COST_RANGE);
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
   function getGunLockerCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.gunLockerCosts,selection,purchasedSelection);
   }
   function getGunLockerSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.gunLockerSaleCosts,selection,purchasedSelection);
   }
   function getGunLockerBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.gunLockerCosts[selection],this.gunLockerSaleCosts[selection]);
   }
   function getGunLockerRawSaleCost(selection)
   {
      return this.gunLockerSaleCosts[selection];
   }
   function getTransporterCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.transporterCosts,selection,purchasedSelection);
   }
   function getTransporterSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.transporterSaleCosts,selection,purchasedSelection);
   }
   function getTransporterBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.transporterCosts[selection],this.transporterSaleCosts[selection]);
   }
   function getTransporterRawSaleCost(selection)
   {
      return this.transporterSaleCosts[selection];
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
