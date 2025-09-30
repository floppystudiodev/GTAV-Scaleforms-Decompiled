class com.rockstargames.gtav.web.foreclosures.Clubhouse
{
   var _address;
   var _baseCost;
   var _baseSaleCost;
   var _description;
   var _id;
   var _isInStarterPack;
   var _isOwned;
   var _name;
   var _txd;
   var _type;
   var _x;
   var _y;
   var bikeShopCosts;
   var bikeShopSaleCosts;
   var emblemCosts;
   var emblemSaleCosts;
   var fontCosts;
   var fontSaleCosts;
   var furnitureCosts;
   var furnitureSaleCosts;
   var gunLockerCosts;
   var gunLockerSaleCosts;
   var hangingCosts;
   var hangingSaleCosts;
   var muralCosts;
   var muralSaleCosts;
   var signageCost;
   var signageSaleCost;
   var wallCosts;
   var wallSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var TYPE = 2;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var ADDRESS = 7;
   static var BASE_COST = 8;
   static var WALL_1_COST = 9;
   static var WALL_2_COST = 10;
   static var HANGING_1_COST = 11;
   static var HANGING_2_COST = 12;
   static var FURNITURE_1_COST = 13;
   static var FURNITURE_2_COST = 14;
   static var MURAL_1_COST = 15;
   static var MURAL_2_COST = 16;
   static var MURAL_3_COST = 17;
   static var MURAL_4_COST = 18;
   static var MURAL_5_COST = 19;
   static var MURAL_6_COST = 20;
   static var MURAL_7_COST = 21;
   static var MURAL_8_COST = 22;
   static var MURAL_9_COST = 23;
   static var FONT_COST = 24;
   static var SIGNAGE_COST = 25;
   static var EMBLEM_1_COST = 26;
   static var EMBLEM_2_COST = 27;
   static var EMBLEM_3_COST = 28;
   static var EMBLEM_4_COST = 29;
   static var EMBLEM_5_COST = 30;
   static var EMBLEM_6_COST = 31;
   static var EMBLEM_7_COST = 32;
   static var EMBLEM_8_COST = 33;
   static var EMBLEM_9_COST = 34;
   static var CREW_EMBLEM_COST = 35;
   static var GUN_LOCKER_COST = 36;
   static var BIKE_SHOP_COST = 37;
   static var BASE_SALE_COST = 38;
   static var WALL_1_SALE_COST = 39;
   static var WALL_2_SALE_COST = 40;
   static var HANGING_1_SALE_COST = 41;
   static var HANGING_2_SALE_COST = 42;
   static var FURNITURE_1_SALE_COST = 43;
   static var FURNITURE_2_SALE_COST = 44;
   static var MURAL_1_SALE_COST = 45;
   static var MURAL_2_SALE_COST = 46;
   static var MURAL_3_SALE_COST = 47;
   static var MURAL_4_SALE_COST = 48;
   static var MURAL_5_SALE_COST = 49;
   static var MURAL_6_SALE_COST = 50;
   static var MURAL_7_SALE_COST = 51;
   static var MURAL_8_SALE_COST = 52;
   static var MURAL_9_SALE_COST = 53;
   static var FONT_SALE_COST = 54;
   static var SIGNAGE_SALE_COST = 55;
   static var EMBLEM_1_SALE_COST = 56;
   static var EMBLEM_2_SALE_COST = 57;
   static var EMBLEM_3_SALE_COST = 58;
   static var EMBLEM_4_SALE_COST = 59;
   static var EMBLEM_5_SALE_COST = 60;
   static var EMBLEM_6_SALE_COST = 61;
   static var EMBLEM_7_SALE_COST = 62;
   static var EMBLEM_8_SALE_COST = 63;
   static var EMBLEM_9_SALE_COST = 64;
   static var CREW_EMBLEM_SALE_COST = 65;
   static var GUN_LOCKER_SALE_COST = 66;
   static var BIKE_SHOP_SALE_COST = 67;
   static var STARTER_PACK_FLAG = 68;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Clubhouse(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.ID];
      this._name = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.NAME];
      this._type = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.TYPE];
      this._address = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.ADDRESS];
      this._description = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.X] * com.rockstargames.gtav.web.foreclosures.Clubhouse.MAP_COORD_SCALE + com.rockstargames.gtav.web.foreclosures.Clubhouse.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.Y] * (- com.rockstargames.gtav.web.foreclosures.Clubhouse.MAP_COORD_SCALE) + com.rockstargames.gtav.web.foreclosures.Clubhouse.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.TXD];
      this._isOwned = _isOwned;
      this._baseCost = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.BASE_COST];
      this._baseSaleCost = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.BASE_SALE_COST];
      this._isInStarterPack = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.STARTER_PACK_FLAG];
      this.wallCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.WALL_1_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.WALL_2_COST]];
      this.hangingCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.HANGING_1_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.HANGING_2_COST]];
      this.furnitureCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FURNITURE_1_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FURNITURE_2_COST]];
      this.muralCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_1_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_2_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_3_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_4_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_5_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_6_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_7_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_8_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_9_COST]];
      this.fontCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_COST]];
      this.signageCost = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.SIGNAGE_COST];
      this.emblemCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.CREW_EMBLEM_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_1_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_2_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_3_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_4_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_5_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_6_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_7_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_8_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_9_COST]];
      this.gunLockerCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Clubhouse.GUN_LOCKER_COST]];
      this.bikeShopCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Clubhouse.BIKE_SHOP_COST]];
      this.wallSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.WALL_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.WALL_2_SALE_COST]];
      this.hangingSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.HANGING_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.HANGING_2_SALE_COST]];
      this.furnitureSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FURNITURE_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FURNITURE_2_SALE_COST]];
      this.muralSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_2_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_3_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_4_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_5_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_6_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_7_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_8_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.MURAL_9_SALE_COST]];
      this.fontSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.FONT_SALE_COST]];
      this.signageSaleCost = data[com.rockstargames.gtav.web.foreclosures.Clubhouse.SIGNAGE_SALE_COST];
      this.emblemSaleCosts = [data[com.rockstargames.gtav.web.foreclosures.Clubhouse.CREW_EMBLEM_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_1_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_2_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_3_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_4_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_5_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_6_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_7_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_8_SALE_COST],data[com.rockstargames.gtav.web.foreclosures.Clubhouse.EMBLEM_9_SALE_COST]];
      this.gunLockerSaleCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Clubhouse.GUN_LOCKER_SALE_COST]];
      this.bikeShopSaleCosts = [0,data[com.rockstargames.gtav.web.foreclosures.Clubhouse.BIKE_SHOP_SALE_COST]];
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
      return this._baseCost;
   }
   function getBaseSaleCost()
   {
      return !(this._baseSaleCost == undefined || this._baseSaleCost < 0) ? this._baseSaleCost : 0;
   }
   function getBaseBestCost()
   {
      return this.getBestPrice(this._baseCost,this._baseSaleCost);
   }
   function getWallCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallCosts,selection,purchasedSelection);
   }
   function getWallSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallSaleCosts,selection,purchasedSelection);
   }
   function getWallBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.wallCosts[selection],this.wallSaleCosts[selection]);
   }
   function getWallRawSaleCost(selection)
   {
      return this.wallSaleCosts[selection];
   }
   function getHangingCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.hangingCosts,selection,purchasedSelection);
   }
   function getHangingSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.hangingSaleCosts,selection,purchasedSelection);
   }
   function getHangingBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.hangingCosts[selection],this.hangingSaleCosts[selection]);
   }
   function getHangingRawSaleCost(selection)
   {
      return this.hangingSaleCosts[selection];
   }
   function getFurnitureCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.furnitureCosts,selection,purchasedSelection);
   }
   function getFurnitureSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.furnitureSaleCosts,selection,purchasedSelection);
   }
   function getFurnitureBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.furnitureCosts[selection],this.furnitureSaleCosts[selection]);
   }
   function getFurnitureRawSaleCost(selection)
   {
      return this.furnitureSaleCosts[selection];
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
   function getFontCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.fontCosts,selection,purchasedSelection);
   }
   function getFontSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.fontSaleCosts,selection,purchasedSelection);
   }
   function getFontBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.fontCosts[selection],this.fontSaleCosts[selection]);
   }
   function getFontRawSaleCost(selection)
   {
      return this.fontSaleCosts[selection];
   }
   function getSignageCost(currentSignage, purchasedSignage)
   {
      if(currentSignage != purchasedSignage && currentSignage != "" && purchasedSignage != "")
      {
         return this.signageCost;
      }
      return 0;
   }
   function getSignageSaleCost(currentSignage, purchasedSignage)
   {
      if(currentSignage != purchasedSignage && currentSignage != "" && purchasedSignage != "")
      {
         if(this.signageSaleCost != undefined && this.signageSaleCost >= 0)
         {
            return this.signageSaleCost;
         }
      }
      return 0;
   }
   function getSignageBestCost(currentSignage, purchasedSignage)
   {
      if(currentSignage != purchasedSignage && currentSignage != "" && purchasedSignage != "")
      {
         if(this.signageSaleCost != undefined && this.signageSaleCost >= 0)
         {
            return Math.min(this.signageCost,this.signageSaleCost);
         }
         return this.signageCost;
      }
      return 0;
   }
   function getSignageRawSaleCost()
   {
      return this.signageSaleCost != undefined ? this.signageSaleCost : -1;
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
   function getEmblemRawSaleCost(selection, purchasedSelection)
   {
      return this.emblemSaleCosts[selection];
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
   function getBikeShopCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.bikeShopCosts,selection,purchasedSelection);
   }
   function getBikeShopSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.bikeShopSaleCosts,selection,purchasedSelection);
   }
   function getBikeShopBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.bikeShopCosts[selection],this.bikeShopSaleCosts[selection]);
   }
   function getBikeShopRawSaleCost(selection)
   {
      return this.bikeShopSaleCosts[selection];
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
