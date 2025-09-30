class com.rockstargames.gtav.Multiplayer.MP_MISSION_NAME_FREEMODE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var SINGLE_LINE_METRICS;
   var TIMELINE;
   var BACKGROUND_BAR_PADDING = 100;
   var SPACE_BETWEEN_ICON_TEXT = 10;
   function MP_MISSION_NAME_FREEMODE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT._width = 1280;
      this.CONTENT._x = 640;
      this.SINGLE_LINE_METRICS = this.calcMissionNameSize("Through");
      this.CONTENT.background_single_line._visible = false;
      this.CONTENT.background_double_line._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.background_single_line.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.background_double_line.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.CONTENT.infoPanel._visible = false;
   }
   function SET_MISSION_INFO(missionName, missionType, playerInfo, percentage, debugValue, isRockstarVerified, playersRequired, RP, cash, time)
   {
      var _loc3_ = false;
      if(RP == undefined)
      {
         RP = 0;
      }
      if(cash == undefined)
      {
         cash = 0;
      }
      this.CONTENT.background_single_line._visible = false;
      this.CONTENT.background_double_line._visible = false;
      var _loc2_;
      if(missionName != undefined && missionName != "")
      {
         _loc3_ = true;
         this.CONTENT.missionNameTF.text = missionName;
         if(isRockstarVerified)
         {
            this.CONTENT.missionNameTF.text += " " + this.TIMELINE.verified.text;
            this.CONTENT.missionNameTF.autoSize = "center";
         }
      }
      if(percentage == "")
      {
         this.CONTENT.infoPanel.icon_thumb._visible = false;
      }
      this.CONTENT.infoPanel.percentageTF.htmlText = percentage;
      this.CONTENT.missionTypeTF.textAutoSize = "shrink";
      this.CONTENT.missionTypeTF.htmlText = missionType;
      if(playersRequired != undefined && playersRequired != "")
      {
         this.CONTENT.infoPanel.icon_players._visible = true;
         this.CONTENT.infoPanel.playersRequiredTF._visible = true;
         this.CONTENT.infoPanel.playersRequiredTF.autoSize = "right";
         this.CONTENT.infoPanel.playersRequiredTF.htmlText = playersRequired;
      }
      else
      {
         this.CONTENT.infoPanel.icon_players._visible = false;
         this.CONTENT.infoPanel.playersRequiredTF._visible = false;
      }
      if(time != undefined && time != "")
      {
         this.CONTENT.infoPanel.timeTF._visible = true;
         this.CONTENT.infoPanel.timeTF.autoSize = "right";
         this.CONTENT.infoPanel.timeTF.htmlText = time;
         this.CONTENT.infoPanel.timeTF._x = (- this.CONTENT.infoPanel.timeTF._width) / 2;
      }
      else
      {
         this.CONTENT.infoPanel.timeTF._visible = false;
      }
      if(debugValue != undefined)
      {
         this.CONTENT.debugPercentageTF.htmlText = debugValue;
      }
      var _loc6_ = this.calcMissionNameSize(this.CONTENT.missionNameTF.text);
      if(_loc6_.y > this.SINGLE_LINE_METRICS.y)
      {
         _loc2_ = this.CONTENT.background_double_line;
         this.CONTENT.missionNameTF._y = 123;
         this.CONTENT.infoPanel._y = 227;
      }
      else
      {
         this.CONTENT.missionNameTF._y = 125;
         _loc2_ = this.CONTENT.background_single_line;
         this.CONTENT.infoPanel._y = 180;
      }
      this.CONTENT.infoPanel.icon_players._x = this.CONTENT.infoPanel.playersRequiredTF._x - (this.CONTENT.infoPanel.icon_players._width + this.SPACE_BETWEEN_ICON_TEXT);
      _loc2_._visible = _loc3_;
      _loc2_._width = Number(_loc6_.x) + this.BACKGROUND_BAR_PADDING + Number(isRockstarVerified) * 100;
      this.CONTENT.infoPanel._visible = true;
      this.centreInformation(_loc3_,_loc2_);
      if(RP + cash <= 0)
      {
         this.CONTENT.cashAndRP._visible = false;
      }
      else
      {
         this.setupCashAndRP(RP,cash);
      }
   }
   function setupCashAndRP(RP, cash)
   {
      if(RP <= 0 || cash <= 0)
      {
         this.CONTENT.cashAndRP.gotoAndStop(2);
         this.CONTENT.cashAndRP.rpTextMC._visible = false;
         this.CONTENT.cashAndRP.dollarSign._visible = false;
         if(cash > 0)
         {
            this.CONTENT.cashAndRP.dollarSign._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.cashAndRP.rpMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
            this.CONTENT.cashAndRP.rpTF.htmlText = String(cash) + " x";
         }
      }
      else if(cash > 0)
      {
         this.CONTENT.cashAndRP.dollarSign._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.cashAndRP.moneyMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
         this.CONTENT.cashAndRP.moneyTF.htmlText = String(cash) + " x";
      }
      this.CONTENT.cashAndRP.moneyMC._x = this.CONTENT.cashAndRP.moneyTF._x + this.CONTENT.cashAndRP.moneyTF.textWidth + 10;
      this.CONTENT.cashAndRP.dollarSign._x = this.CONTENT.cashAndRP.moneyMC._x + this.CONTENT.cashAndRP.moneyMC._width / 2;
      if(RP > 0)
      {
         this.CONTENT.cashAndRP.rpTextMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.cashAndRP.rpMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
         this.CONTENT.cashAndRP.rpTF.htmlText = String(RP) + " x";
      }
      this.CONTENT.cashAndRP._y = this.CONTENT.missionTypeTF._y - (this.CONTENT.cashAndRP._height + 5);
   }
   function calcMissionNameSize(str)
   {
      this.CONTENT.measuringTF.autoSize = true;
      this.CONTENT.measuringTF.htmlText = str;
      var _loc2_ = new flash.geom.Point(this.CONTENT.measuringTF.textWidth,this.CONTENT.measuringTF.textHeight);
      this.CONTENT.measuringTF.htmlText = "";
      return _loc2_;
   }
   function centreInformation(hasName, mc)
   {
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(this.CONTENT.infoPanel.icon_players._visible)
      {
         _loc2_ = this.CONTENT.infoPanel.icon_players._x;
         _loc3_ = this.CONTENT.infoPanel.percentageTF._x + this.CONTENT.infoPanel.percentageTF.textWidth;
         _loc4_ = _loc3_ - _loc2_;
      }
      else
      {
         _loc2_ = this.CONTENT.infoPanel.icon_thumb._x;
         _loc3_ = this.CONTENT.infoPanel.percentageTF._x + this.CONTENT.infoPanel.percentageTF.textWidth;
         _loc4_ = _loc3_ - _loc2_;
      }
      var _loc5_ = _loc4_ / 2 + _loc2_;
      this.CONTENT.infoPanel._x = 10 - _loc5_;
      if(hasName)
      {
         this.CONTENT.infoPanel._y = mc._y + mc._height + 8;
      }
      else
      {
         this.CONTENT.infoPanel._y = this.CONTENT.missionNameTF._y;
      }
   }
   function debug()
   {
      this.SET_MISSION_INFO("missionName","missionType","playerInfo","percentage","debugValue",true,"playersRequired",2,2);
   }
}
