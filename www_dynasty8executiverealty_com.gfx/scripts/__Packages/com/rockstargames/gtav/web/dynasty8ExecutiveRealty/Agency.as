class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency
{
   var _baseCost;
   var _baseSaleCost;
   var _description;
   var _id;
   var _isOwned;
   var _name;
   var _txd;
   var _x;
   var _y;
   var armoryCosts;
   var armorySaleCosts;
   var artCosts;
   var artSaleCosts;
   var highlightCosts;
   var highlightSaleCosts;
   var quartersCosts;
   var quartersSaleCosts;
   var vehicleCosts;
   var vehicleSaleCosts;
   var wallpaperCosts;
   var wallpaperSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var X = 3;
   static var Y = 4;
   static var TXD = 5;
   static var DESCRIPTION = 6;
   static var BASE_COST = 7;
   static var ART_1_COST = 8;
   static var ART_2_COST = 9;
   static var ART_3_COST = 10;
   static var WALLPAPER_1_COST = 11;
   static var WALLPAPER_2_COST = 12;
   static var WALLPAPER_3_COST = 13;
   static var WALLPAPER_4_COST = 14;
   static var WALLPAPER_5_COST = 15;
   static var WALLPAPER_6_COST = 16;
   static var WALLPAPER_7_COST = 17;
   static var WALLPAPER_8_COST = 18;
   static var WALLPAPER_9_COST = 19;
   static var HIGHLIGHT_1_COST = 20;
   static var HIGHLIGHT_2_COST = 21;
   static var HIGHLIGHT_3_COST = 22;
   static var HIGHLIGHT_4_COST = 23;
   static var HIGHLIGHT_5_COST = 24;
   static var HIGHLIGHT_6_COST = 25;
   static var HIGHLIGHT_7_COST = 26;
   static var HIGHLIGHT_8_COST = 27;
   static var HIGHLIGHT_9_COST = 28;
   static var VEHICLE_COST = 29;
   static var ARMORY_COST = 30;
   static var QUARTERS_COST = 31;
   static var BASE_SALE_COST = 32;
   static var ART_1_SALE_COST = 33;
   static var ART_2_SALE_COST = 34;
   static var ART_3_SALE_COST = 35;
   static var WALLPAPER_1_SALE_COST = 36;
   static var WALLPAPER_2_SALE_COST = 37;
   static var WALLPAPER_3_SALE_COST = 38;
   static var WALLPAPER_4_SALE_COST = 39;
   static var WALLPAPER_5_SALE_COST = 40;
   static var WALLPAPER_6_SALE_COST = 41;
   static var WALLPAPER_7_SALE_COST = 42;
   static var WALLPAPER_8_SALE_COST = 43;
   static var WALLPAPER_9_SALE_COST = 44;
   static var HIGHLIGHT_1_SALE_COST = 45;
   static var HIGHLIGHT_2_SALE_COST = 46;
   static var HIGHLIGHT_3_SALE_COST = 47;
   static var HIGHLIGHT_4_SALE_COST = 48;
   static var HIGHLIGHT_5_SALE_COST = 49;
   static var HIGHLIGHT_6_SALE_COST = 50;
   static var HIGHLIGHT_7_SALE_COST = 51;
   static var HIGHLIGHT_8_SALE_COST = 52;
   static var HIGHLIGHT_9_SALE_COST = 53;
   static var VEHICLE_SALE_COST = 54;
   static var ARMORY_SALE_COST = 55;
   static var QUARTERS_SALE_COST = 56;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Agency(data, _isOwned)
   {
      this._id = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ID];
      this._name = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.NAME];
      this._description = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.X] * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.MAP_COORD_SCALE + com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.Y] * (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.MAP_COORD_SCALE) + com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.TXD];
      this._isOwned = _isOwned;
      this._baseCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.BASE_COST];
      this._baseSaleCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.BASE_SALE_COST];
      this.artCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_1_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_2_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_3_COST]];
      this.wallpaperCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_1_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_2_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_3_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_4_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_5_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_6_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_7_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_8_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_9_COST]];
      this.highlightCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_1_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_2_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_3_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_4_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_5_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_6_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_7_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_8_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_9_COST]];
      this.vehicleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.VEHICLE_COST]];
      this.armoryCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ARMORY_COST]];
      this.quartersCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.QUARTERS_COST]];
      this.artSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_1_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_2_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ART_3_SALE_COST]];
      this.wallpaperSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_1_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_2_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_3_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_4_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_5_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_6_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_7_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_8_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.WALLPAPER_9_SALE_COST]];
      this.highlightSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_1_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_2_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_3_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_4_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_5_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_6_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_7_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_8_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.HIGHLIGHT_9_SALE_COST]];
      this.vehicleSaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.VEHICLE_SALE_COST]];
      this.armorySaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.ARMORY_SALE_COST]];
      this.quartersSaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Agency.QUARTERS_SALE_COST]];
   }
   function get id()
   {
      return this._id;
   }
   function get name()
   {
      return this._name;
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
   function getArtCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.artCosts,selection,purchasedSelection);
   }
   function getArtSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.artSaleCosts,selection,purchasedSelection);
   }
   function getArtBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.artCosts[selection],this.artSaleCosts[selection]);
   }
   function getWallpaperCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallpaperCosts,selection,purchasedSelection);
   }
   function getWallpaperSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.wallpaperSaleCosts,selection,purchasedSelection);
   }
   function getWallpaperBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.wallpaperCosts[selection],this.wallpaperSaleCosts[selection]);
   }
   function getHighlightCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.highlightCosts,selection,purchasedSelection);
   }
   function getHighlightSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.highlightSaleCosts,selection,purchasedSelection);
   }
   function getHighlightBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.highlightCosts[selection],this.highlightSaleCosts[selection]);
   }
   function getVehicleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.vehicleCosts,selection,purchasedSelection);
   }
   function getVehicleSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.vehicleSaleCosts,selection,purchasedSelection);
   }
   function getVehicleBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.vehicleCosts[selection],this.vehicleSaleCosts[selection]);
   }
   function getArmoryCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.armoryCosts,selection,purchasedSelection);
   }
   function getArmorySaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.armorySaleCosts,selection,purchasedSelection);
   }
   function getArmoryBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.armoryCosts[selection],this.armorySaleCosts[selection]);
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
   function getPositivePrice(prices, index, purchasedSelection)
   {
      if(this._isOwned && index == purchasedSelection)
      {
         return -1;
      }
      if(index == undefined || index < 0 || index >= prices.length)
      {
         return -1;
      }
      return prices[index] >= 0 ? prices[index] : -1;
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
