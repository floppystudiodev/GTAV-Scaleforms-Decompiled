class com.rockstargames.gtav.web.foreclosures.SalvageYard
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
   var tintCosts;
   var repairBayCosts;
   var towTruckCosts;
   var wallSafeCosts;
   var staffCosts;
   var tintSaleCosts;
   var repairBaySaleCosts;
   var towTruckSaleCosts;
   var wallSafeSaleCosts;
   var staffSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var REPAIR_BAY_COST_RANGE = [9,9];
   static var TOW_TRUCK_COST_RANGE = [10,11];
   static var WALL_SAFE_COST_RANGE = [12,12];
   static var STAFF_COST_RANGE = [13,13];
   static var TINT_COST_RANGE = [14,22];
   static var BASE_SALE_COST = 23;
   static var REPAIR_BAY_SALE_COST_RANGE = [24,24];
   static var TOW_TRUCK_SALE_COST_RANGE = [25,26];
   static var WALL_SAFE_SALE_COST_RANGE = [27,27];
   static var STAFF_SALE_COST_RANGE = [28,28];
   static var TINT_SALE_COST_RANGE = [29,37];
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function SalvageYard(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.X] * com.rockstargames.gtav.web.foreclosures.SalvageYard.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.SalvageYard.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.Y] * (- com.rockstargames.gtav.web.foreclosures.SalvageYard.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.SalvageYard.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.TXD];
      this._isOwned = _isOwned;
      this._isInStarterPack = false;
      this.baseCost = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.BASE_COST];
      this.baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.SalvageYard.BASE_SALE_COST];
      this.tintCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.TINT_COST_RANGE);
      this.repairBayCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.REPAIR_BAY_COST_RANGE,true);
      this.towTruckCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.TOW_TRUCK_COST_RANGE,true);
      this.wallSafeCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.WALL_SAFE_COST_RANGE,true);
      this.staffCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.STAFF_COST_RANGE,true);
      this.tintSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.TINT_SALE_COST_RANGE);
      this.repairBaySaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.REPAIR_BAY_SALE_COST_RANGE,true);
      this.towTruckSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.TOW_TRUCK_SALE_COST_RANGE,true);
      this.wallSafeSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.WALL_SAFE_SALE_COST_RANGE,true);
      this.staffSaleCosts = this.setupCosts(data,com.rockstargames.gtav.web.foreclosures.SalvageYard.STAFF_SALE_COST_RANGE,true);
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
   function getRepairBayCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.repairBayCosts,selection,purchasedSelection);
   }
   function getRepairBaySaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.repairBaySaleCosts,selection,purchasedSelection);
   }
   function getRepairBayBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.repairBayCosts[selection],this.repairBaySaleCosts[selection]);
   }
   function getRepairBayRawSaleCost(selection)
   {
      return this.repairBaySaleCosts[selection];
   }
   function getTowTruckCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.towTruckCosts,selection,purchasedSelection);
   }
   function getTowTruckSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.towTruckSaleCosts,selection,purchasedSelection);
   }
   function getTowTruckBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.towTruckCosts[selection],this.towTruckSaleCosts[selection]);
   }
   function getTowTruckRawSaleCost(selection)
   {
      return this.towTruckSaleCosts[selection];
   }
   function getWallSafeCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallSafeCosts,selection,purchasedSelection);
   }
   function getWallSafeSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallSafeSaleCosts,selection,purchasedSelection);
   }
   function getWallSafeBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.wallSafeCosts[selection],this.wallSafeSaleCosts[selection]);
   }
   function getWallSafeRawSaleCost(selection)
   {
      return this.wallSafeSaleCosts[selection];
   }
   function getStaffCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staffCosts,selection,purchasedSelection);
   }
   function getStaffSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.staffSaleCosts,selection,purchasedSelection);
   }
   function getStaffBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.staffCosts[selection],this.staffSaleCosts[selection]);
   }
   function getStaffRawSaleCost(selection)
   {
      return this.staffSaleCosts[selection];
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
