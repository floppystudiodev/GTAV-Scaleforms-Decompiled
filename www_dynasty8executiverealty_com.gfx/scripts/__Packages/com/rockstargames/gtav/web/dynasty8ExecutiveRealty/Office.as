class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office
{
   var _id;
   var _name;
   var _description;
   var _x;
   var _y;
   var _txd;
   var _isOwned;
   var _baseCost;
   var _baseSaleCost;
   var _garageIsOwned;
   var _garageDescription;
   var _baseGarageCost;
   var _baseGarageSaleCost;
   var _isInStarterPack;
   var styleCosts;
   var personnelCosts;
   var fontCosts;
   var signageCost;
   var gunLockerCosts;
   var vaultCosts;
   var bedCosts;
   var garage1StyleCosts;
   var garage1LightingCosts;
   var garage1NumberCosts;
   var garage2StyleCosts;
   var garage2LightingCosts;
   var garage2NumberCosts;
   var garage3StyleCosts;
   var garage3LightingCosts;
   var garage3NumberCosts;
   var modShopCosts;
   var _hasGarage;
   var styleSaleCosts;
   var personnelSaleCosts;
   var fontSaleCosts;
   var signageSaleCost;
   var gunLockerSaleCosts;
   var vaultSaleCosts;
   var bedSaleCosts;
   var garage1StyleSaleCosts;
   var garage1LightingSaleCosts;
   var garage1NumberSaleCosts;
   var garage2StyleSaleCosts;
   var garage2LightingSaleCosts;
   var garage2NumberSaleCosts;
   var garage3StyleSaleCosts;
   var garage3LightingSaleCosts;
   var garage3NumberSaleCosts;
   var modShopSaleCosts;
   static var ID = 0;
   static var NAME = 1;
   static var X = 2;
   static var Y = 3;
   static var TXD = 4;
   static var DESCRIPTION = 5;
   static var BASE_COST = 6;
   static var STYLE_1_COST = 7;
   static var STYLE_2_COST = 8;
   static var STYLE_3_COST = 9;
   static var STYLE_4_COST = 10;
   static var STYLE_5_COST = 11;
   static var STYLE_6_COST = 12;
   static var STYLE_7_COST = 13;
   static var STYLE_8_COST = 14;
   static var STYLE_9_COST = 15;
   static var PERSONNEL_1_COST = 16;
   static var PERSONNEL_2_COST = 17;
   static var FONT_COST = 18;
   static var SIGNAGE_COST = 19;
   static var GUN_LOCKER_COST = 20;
   static var VAULT_COST = 21;
   static var BED_COST = 22;
   static var BASE_SALE_COST = 23;
   static var STYLE_1_SALE_COST = 24;
   static var STYLE_2_SALE_COST = 25;
   static var STYLE_3_SALE_COST = 26;
   static var STYLE_4_SALE_COST = 27;
   static var STYLE_5_SALE_COST = 28;
   static var STYLE_6_SALE_COST = 29;
   static var STYLE_7_SALE_COST = 30;
   static var STYLE_8_SALE_COST = 31;
   static var STYLE_9_SALE_COST = 32;
   static var PERSONNEL_1_SALE_COST = 33;
   static var PERSONNEL_2_SALE_COST = 34;
   static var FONT_SALE_COST = 35;
   static var SIGNAGE_SALE_COST = 36;
   static var GUN_LOCKER_SALE_COST = 37;
   static var VAULT_SALE_COST = 38;
   static var BED_SALE_COST = 39;
   static var GARAGE_DESCRIPTION = 40;
   static var GARAGE_BASE_COST = 41;
   static var GARAGE_1_STYLE_COSTS = [42,43,44,45];
   static var GARAGE_1_LIGHTING_COSTS = [46,47,48,49,50,51,52,53,54];
   static var GARAGE_1_NUMBER_COSTS = [55,56,57,58,59,60,61,62,63];
   static var GARAGE_2_STYLE_COSTS = [64,65,66,67];
   static var GARAGE_2_LIGHTING_COSTS = [68,69,70,71,72,73,74,75,76];
   static var GARAGE_2_NUMBER_COSTS = [77,78,79,80,81,82,83,84,85];
   static var GARAGE_3_STYLE_COSTS = [86,87,88,89];
   static var GARAGE_3_LIGHTING_COSTS = [90,91,92,93,94,95,96,97,98];
   static var GARAGE_3_NUMBER_COSTS = [99,100,101,102,103,104,105,106,107];
   static var MOD_SHOP_COSTS = [108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127];
   static var GARAGE_BASE_SALE_COST = 128;
   static var GARAGE_1_STYLE_SALE_COSTS = [129,130,131,132];
   static var GARAGE_1_LIGHTING_SALE_COSTS = [133,134,135,136,137,138,139,140,141];
   static var GARAGE_1_NUMBER_SALE_COSTS = [142,143,144,145,146,147,148,149,150];
   static var GARAGE_2_STYLE_SALE_COSTS = [151,152,153,154];
   static var GARAGE_2_LIGHTING_SALE_COSTS = [155,156,157,158,159,160,161,162,163];
   static var GARAGE_2_NUMBER_SALE_COSTS = [164,165,166,167,168,169,170,171,172];
   static var GARAGE_3_STYLE_SALE_COSTS = [173,174,175,176];
   static var GARAGE_3_LIGHTING_SALE_COSTS = [177,178,179,180,181,182,183,184,185];
   static var GARAGE_3_NUMBER_SALE_COSTS = [186,187,188,189,190,191,192,193,194];
   static var MOD_SHOP_SALE_COSTS = [195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214];
   static var STARTER_PACK_FLAG = 215;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   function Office(data, _isOwned, _garageIsOwned)
   {
      this._id = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.ID];
      this._name = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.NAME];
      this._description = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.DESCRIPTION];
      this._x = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.X] * com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MAP_COORD_SCALE + com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MAP_ORIGIN_X;
      this._y = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.Y] * (- com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MAP_COORD_SCALE) + com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MAP_ORIGIN_Y;
      this._txd = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.TXD];
      this._isOwned = _isOwned;
      this._baseCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.BASE_COST];
      this._baseSaleCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.BASE_SALE_COST];
      this._garageIsOwned = _garageIsOwned;
      this._garageDescription = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_DESCRIPTION];
      this._baseGarageCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_BASE_COST];
      this._baseGarageSaleCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_BASE_SALE_COST];
      this._isInStarterPack = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STARTER_PACK_FLAG];
      this.styleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_1_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_2_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_3_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_4_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_5_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_6_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_7_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_8_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_9_COST]];
      this.personnelCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.PERSONNEL_1_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.PERSONNEL_2_COST]];
      this.fontCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_COST]];
      this.signageCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.SIGNAGE_COST];
      this.gunLockerCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GUN_LOCKER_COST]];
      this.vaultCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.VAULT_COST]];
      this.bedCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.BED_COST]];
      this.garage1StyleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_COSTS[3]]];
      this.garage1LightingCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_COSTS[8]]];
      this.garage1NumberCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_COSTS[8]]];
      this.garage2StyleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_COSTS[3]]];
      this.garage2LightingCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_COSTS[8]]];
      this.garage2NumberCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_COSTS[8]]];
      this.garage3StyleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_COSTS[3]]];
      this.garage3LightingCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_COSTS[8]]];
      this.garage3NumberCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_COSTS[8]]];
      this.modShopCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[8]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[9]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[10]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[11]],data[com
      .rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[12]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[13]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[14]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[15]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[16]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[17]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[18]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_COSTS[19]]];
      this._hasGarage = true;
      var _loc4_ = [].concat(this.garage1StyleCosts).concat(this.garage2StyleCosts).concat(this.garage3StyleCosts);
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] == -1 || _loc4_[_loc3_] == undefined)
         {
            this._hasGarage = false;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.styleSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_1_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_2_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_3_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_4_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_5_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_6_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_7_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_8_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.STYLE_9_SALE_COST]];
      this.personnelSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.PERSONNEL_1_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.PERSONNEL_2_SALE_COST]];
      this.fontSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.FONT_SALE_COST],data[com.rockstargames.gtav.web
      .dynasty8ExecutiveRealty.Office.FONT_SALE_COST]];
      this.signageSaleCost = data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.SIGNAGE_SALE_COST];
      this.gunLockerSaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GUN_LOCKER_SALE_COST]];
      this.vaultSaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.VAULT_SALE_COST]];
      this.bedSaleCosts = [0,data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.BED_SALE_COST]];
      this.garage1StyleSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_STYLE_SALE_COSTS[3]]];
      this.garage1LightingSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_LIGHTING_SALE_COSTS[8]]];
      this.garage1NumberSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_1_NUMBER_SALE_COSTS[8]]];
      this.garage2StyleSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_STYLE_SALE_COSTS[3]]];
      this.garage2LightingSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_LIGHTING_SALE_COSTS[8]]];
      this.garage2NumberSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_2_NUMBER_SALE_COSTS[8]]];
      this.garage3StyleSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_STYLE_SALE_COSTS[3]]];
      this.garage3LightingSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_LIGHTING_SALE_COSTS[8]]];
      this.garage3NumberSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.GARAGE_3_NUMBER_SALE_COSTS[8]]];
      this.modShopSaleCosts = [data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[0]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[1]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[2]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[3]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[4]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[5]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[6]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[7]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[8]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[9]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[10]],data[com.rockstargames
      .gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[11]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[12]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[13]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[14]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[15]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[16]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[17]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[18]],data[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Office.MOD_SHOP_SALE_COSTS[19]]];
   }
   function logGarageCosts(garage1Style, garage1Lighting, garage1Number, garage2Style, garage2Lighting, garage2Number, garage3Style, garage3Lighting, garage3Number)
   {
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts name [" + this.name + "]");
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts baseGarageCost [" + this._baseGarageCost + "]");
      com.rockstargames.ui.utils.Debug.log("------------------------------------------------------------------------------");
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage1 StyleCosts [" + this.garage1StyleCosts + "] selected: " + this.garage1StyleCosts[garage1Style]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage1 LightingCosts [" + this.garage1LightingCosts + "] selected: " + this.garage1LightingCosts[garage1Lighting]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage1 NumberCosts [" + this.garage1NumberCosts + "] selected: " + this.garage1NumberCosts[garage1Number]);
      com.rockstargames.ui.utils.Debug.log("------------------------------------------------------------------------------");
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage2 StyleCosts [" + this.garage2StyleCosts + "] selected: " + this.garage2StyleCosts[garage2Style]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage2 LightingCosts [" + this.garage2LightingCosts + "] selected: " + this.garage2LightingCosts[garage2Lighting]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage2 NumberCosts [" + this.garage2NumberCosts + "] selected: " + this.garage2NumberCosts[garage2Number]);
      com.rockstargames.ui.utils.Debug.log("------------------------------------------------------------------------------");
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage3 StyleCosts [" + this.garage3StyleCosts + "] selected: " + this.garage3StyleCosts[garage3Style]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage3 LightingCosts [" + this.garage3LightingCosts + "] selected: " + this.garage3LightingCosts[garage3Lighting]);
      com.rockstargames.ui.utils.Debug.log("Office::logGarageCosts garage3 NumberCosts [" + this.garage3NumberCosts + "] selected: " + this.garage3NumberCosts[garage3Number]);
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
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
   function get hasGarage()
   {
      return this._hasGarage;
   }
   function get garageIsOwned()
   {
      return this._garageIsOwned;
   }
   function get garageDescription()
   {
      return this._garageDescription;
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
   function getPersonnelCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.personnelCosts,selection,purchasedSelection);
   }
   function getPersonnelSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.personnelSaleCosts,selection,purchasedSelection);
   }
   function getPersonnelBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.personnelCosts[selection],this.personnelSaleCosts[selection]);
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
      return -1;
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
   function getVaultCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.vaultCosts,selection,purchasedSelection);
   }
   function getVaultSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.vaultSaleCosts,selection,purchasedSelection);
   }
   function getVaultBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.vaultCosts[selection],this.vaultSaleCosts[selection]);
   }
   function getBedCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.bedCosts,selection,purchasedSelection);
   }
   function getBedSaleCost(selection, purchasedSelection)
   {
      return this.getPositivePrice(this.bedSaleCosts,selection,purchasedSelection);
   }
   function getBedBestCost(selection, purchasedSelection)
   {
      if(this._isOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.bedCosts[selection],this.bedSaleCosts[selection]);
   }
   function getBaseGarageCost()
   {
      return this._baseGarageCost;
   }
   function getBaseGarageSaleCost()
   {
      return !(this._baseGarageSaleCost == undefined || this._baseGarageSaleCost < 0) ? this._baseGarageSaleCost : 0;
   }
   function getBaseGarageBestCost()
   {
      return this.getBestPrice(this._baseGarageCost,this._baseGarageSaleCost);
   }
   function getGarage1StyleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1StyleCosts,selection,purchasedSelection);
   }
   function getGarage1StyleSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1StyleSaleCosts,selection,purchasedSelection);
   }
   function getGarage1StyleBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage1StyleCosts[selection],this.garage1StyleSaleCosts[selection]);
   }
   function getGarage1StyleRawSaleCost(selection)
   {
      return this.garage1StyleSaleCosts[selection];
   }
   function getGarage1LightingCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1LightingCosts,selection,purchasedSelection);
   }
   function getGarage1LightingSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1LightingSaleCosts,selection,purchasedSelection);
   }
   function getGarage1LightingBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage1LightingCosts[selection],this.garage1LightingSaleCosts[selection]);
   }
   function getGarage1LightingRawSaleCost(selection)
   {
      return this.garage1LightingSaleCosts[selection];
   }
   function getGarage1NumberCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1NumberCosts,selection,purchasedSelection);
   }
   function getGarage1NumberSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage1NumberSaleCosts,selection,purchasedSelection);
   }
   function getGarage1NumberBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage1NumberCosts[selection],this.garage1NumberSaleCosts[selection]);
   }
   function getGarage1NumberRawSaleCost(selection)
   {
      return this.garage1NumberSaleCosts[selection];
   }
   function getGarage2StyleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2StyleCosts,selection,purchasedSelection);
   }
   function getGarage2StyleSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2StyleSaleCosts,selection,purchasedSelection);
   }
   function getGarage2StyleBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage2StyleCosts[selection],this.garage2StyleSaleCosts[selection]);
   }
   function getGarage2StyleRawSaleCost(selection)
   {
      return this.garage2StyleSaleCosts[selection];
   }
   function getGarage2LightingCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2LightingCosts,selection,purchasedSelection);
   }
   function getGarage2LightingSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2LightingSaleCosts,selection,purchasedSelection);
   }
   function getGarage2LightingBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage2LightingCosts[selection],this.garage2LightingSaleCosts[selection]);
   }
   function getGarage2LightingRawSaleCost(selection)
   {
      return this.garage2LightingSaleCosts[selection];
   }
   function getGarage2NumberCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2NumberCosts,selection,purchasedSelection);
   }
   function getGarage2NumberSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage2NumberSaleCosts,selection,purchasedSelection);
   }
   function getGarage2NumberBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage2NumberCosts[selection],this.garage2NumberSaleCosts[selection]);
   }
   function getGarage2NumberRawSaleCost(selection)
   {
      return this.garage2NumberSaleCosts[selection];
   }
   function getGarage3StyleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3StyleCosts,selection,purchasedSelection);
   }
   function getGarage3StyleSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3StyleSaleCosts,selection,purchasedSelection);
   }
   function getGarage3StyleBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage3StyleCosts[selection],this.garage3StyleSaleCosts[selection]);
   }
   function getGarage3StyleRawSaleCost(selection)
   {
      return this.garage3StyleSaleCosts[selection];
   }
   function getGarage3LightingCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3LightingCosts,selection,purchasedSelection);
   }
   function getGarage3LightingSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3LightingSaleCosts,selection,purchasedSelection);
   }
   function getGarage3LightingBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage3LightingCosts[selection],this.garage3LightingSaleCosts[selection]);
   }
   function getGarage3LightingRawSaleCost(selection)
   {
      return this.garage3LightingSaleCosts[selection];
   }
   function getGarage3NumberCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3NumberCosts,selection,purchasedSelection);
   }
   function getGarage3NumberSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.garage3NumberSaleCosts,selection,purchasedSelection);
   }
   function getGarage3NumberBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.garage3NumberCosts[selection],this.garage3NumberSaleCosts[selection]);
   }
   function getGarage3NumberRawSaleCost(selection)
   {
      return this.garage3NumberSaleCosts[selection];
   }
   function getModShopCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.modShopCosts,selection,purchasedSelection);
   }
   function getModShopSaleCost(selection, purchasedSelection)
   {
      return this.getPositiveGaragePrice(this.modShopSaleCosts,selection,purchasedSelection);
   }
   function getModShopBestCost(selection, purchasedSelection)
   {
      if(this._garageIsOwned && selection == purchasedSelection)
      {
         return 0;
      }
      return this.getBestPrice(this.modShopCosts[selection],this.modShopSaleCosts[selection]);
   }
   function getModShopRawSaleCost(selection)
   {
      return this.modShopSaleCosts[selection];
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
   function getPositiveGaragePrice(prices, index, purchasedSelection)
   {
      if(this._garageIsOwned && index == purchasedSelection)
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
         normalPrice = -1;
      }
      if(salePrice == undefined)
      {
         salePrice = -1;
      }
      return !(salePrice >= 0 && salePrice < normalPrice) ? normalPrice : salePrice;
   }
}
