class com.rockstargames.gtav.FrontendGen9.components.Sticker extends MovieClip
{
   var _stickerData;
   var stickerBG;
   var stickerBGCircle;
   var stickerIcon;
   var stickerSheen;
   var stickerSheenMask;
   var stickerTF;
   var padding = 6;
   var stickerWidth = 0;
   var _non_member_id = 30;
   var _red = [244,50,50];
   var _yellow = [252,185,48];
   var _blue = [40,110,185];
   var _PSblue = [11,55,123];
   var _purple = [100,65,164];
   var _white = [255,255,255];
   var _grey = [114,114,114];
   var _gold = [226,154,3];
   function Sticker()
   {
      super();
      var _loc3_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._red,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc15_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._red,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.PRIMARY_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc6_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._yellow,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc14_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._yellow,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.SECONDARY_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc8_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._blue,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc12_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._blue,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TERTIARY_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc19_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._PSblue,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc10_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._PSblue,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.BLUE_PLATFORM_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc18_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._purple,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc4_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._purple,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.PURPLE_PLATFORM_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc13_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._white,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TICK_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc9_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._white,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TICK_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_TYPE);
      var _loc16_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._white,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.LOCK_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE);
      var _loc5_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._white,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.LOCK_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_TYPE);
      var _loc17_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._white,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc11_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._grey,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      var _loc7_ = new com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._gold,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NO_ICON,com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE);
      this.stickerTF._x = this.padding - 2;
      this.stickerTF.autoSize = "left";
      this._stickerData = [];
      this._stickerData.push(_loc3_);
      this._stickerData.push(_loc3_);
      this._stickerData.push(_loc15_);
      this._stickerData.push(_loc6_);
      this._stickerData.push(_loc14_);
      this._stickerData.push(_loc8_);
      this._stickerData.push(_loc12_);
      this._stickerData.push(_loc10_);
      this._stickerData.push(_loc4_);
      this._stickerData.push(_loc13_);
      this._stickerData.push(_loc9_);
      this._stickerData.push(_loc16_);
      this._stickerData.push(_loc5_);
      this._stickerData[com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NON_MEMBER] = _loc11_;
      this._stickerData[com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.WHITE_NON_MEMBER] = _loc17_;
      this._stickerData[com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.GOLD_MEMBER] = _loc7_;
   }
   function SET_TYPE_AND_TEXT(id, str, isAsian)
   {
      if(id == 0)
      {
         this.sanitiseSticker();
         return undefined;
      }
      this.stickerTF._x = this.padding - 2;
      if(isAsian)
      {
         this.stickerTF._y = 1;
      }
      else
      {
         this.stickerTF._y = 0;
      }
      var _loc3_ = com.rockstargames.gtav.FrontendGen9.components.StickerTypeData(this._stickerData[id]);
      this.setupSticker(id,_loc3_,str);
      this.addSheen();
      this.colourSticker(id,_loc3_);
   }
   function setupSticker(id, data, str)
   {
      switch(data.type)
      {
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_TYPE:
            this.stickerTF._visible = false;
            this.stickerBG._visible = false;
            this.stickerIcon.gotoAndStop(data.iconID);
            this.stickerIcon._visible = true;
            this.stickerBGCircle._visible = true;
            this.stickerTF.text = "";
            break;
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE:
            this.stickerTF.text = str;
            this.stickerIcon._x = 2 + this.stickerIcon._width / 2;
            this.stickerTF._x = this.stickerIcon._x + this.stickerIcon._width / 2 + 2;
            this.stickerBG._width = this.stickerTF.textWidth + this.padding * 2 + this.stickerIcon._width;
            this.stickerIcon.gotoAndStop(data.iconID);
            this.stickerBGCircle._visible = false;
            this.stickerTF._visible = true;
            this.stickerBG._visible = true;
            this.stickerIcon._visible = true;
            break;
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE:
            this.stickerTF.text = str;
            this.stickerTF._x = this.padding - 2;
            this.stickerBG._width = this.stickerTF.textWidth + this.padding * 2;
            this.stickerIcon._visible = false;
            this.stickerBGCircle._visible = false;
            this.stickerTF._visible = true;
            this.stickerBG._visible = true;
         default:
            return;
      }
   }
   function colourSticker(id, data)
   {
      if(id == 3 || id == 4 || id == 9 || id == 11 || id == 31 || id == 32)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.stickerTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.stickerTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.stickerBG,data.colourData[0],data.colourData[1],data.colourData[2],100);
   }
   function addSheen()
   {
      this.stickerSheenMask._width = this.stickerBG._width;
      this.stickerSheenMask._visible = this.stickerBG._visible;
      this.stickerSheen._visible = this.stickerBG._visible;
      this.stickerSheen.gotoAndPlay(this.myRandom(45,245));
   }
   function sanitiseSticker()
   {
      this.stickerBG._visible = false;
      this.stickerIcon._visible = false;
      this.stickerBGCircle._visible = false;
   }
   function myRandom(minVal, maxVal)
   {
      return minVal + Math.floor(Math.random() * (maxVal + 1 - minVal));
   }
   function getStickerWidth()
   {
      return this.stickerBG._width;
   }
}
