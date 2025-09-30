class com.rockstargames.gtav.Multiplayer.POWER_PLAY extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var DispConf;
   var TIMELINE;
   var icCurVals;
   var iconList;
   var iconTypeList;
   var myHudColourT1;
   var myHudColourT2;
   var descenders = [103,121,113,71,89,81,1062,1065,1094,1097];
   var currentPct = 1;
   var count = 0;
   var DURATION = 2;
   var MAX_ICONS = 6;
   var teamOneColourHex = 16777215;
   var teamTwoColourHex = 0;
   var iActualWidth = 1280;
   function POWER_PLAY()
   {
      super();
      _global.gfxExtensions = true;
      this.iconList = [];
      this.iconTypeList = ["off_radar","rage","beast_mode","dope","inverse","zoned"];
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
      this.myHudColourT1 = new com.rockstargames.ui.utils.HudColour();
      this.myHudColourT2 = new com.rockstargames.ui.utils.HudColour();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.icCurVals = [];
      this.icCurVals[0] = 0;
      this.icCurVals[1] = 0;
      this.icCurVals[2] = 0;
      this.icCurVals[3] = 0;
      this.icCurVals[4] = 0;
      this.icCurVals[5] = 0;
      this.icCurVals[6] = 0;
      this.icCurVals[7] = 0;
      this.icCurVals[8] = 0;
      this.icCurVals[9] = 0;
      this.icCurVals[10] = 0;
      this.icCurVals[11] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function initScreenLayout()
   {
   }
   function SETUP_TEAM_COLOURS(teamOneColour, teamTwoColour)
   {
      com.rockstargames.ui.utils.Colour.setHudColour(teamOneColour,this.myHudColourT1);
      com.rockstargames.ui.utils.Colour.setHudColour(teamTwoColour,this.myHudColourT2);
      this.teamOneColourHex = this.RGBToHex(this.myHudColourT1.r,this.myHudColourT1.g,this.myHudColourT1.b);
      this.teamTwoColourHex = this.RGBToHex(this.myHudColourT2.r,this.myHudColourT2.g,this.myHudColourT2.b);
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < 6)
      {
         _loc4_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon();
         _loc3_ = this.CONTENT.createEmptyMovieClip("icon" + _loc2_,this.CONTENT.getNextHighestDepth());
         _loc3_._x = this.CONTENT.icon_one._x + (this.CONTENT.icon_one._width + 15) * _loc2_;
         _loc3_._y = this.CONTENT.icon_one._y;
         _loc4_.init(_loc3_,this.iconTypeList[_loc2_],this.teamOneColourHex,this.teamTwoColourHex);
         this.iconList[_loc2_] = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function RGBToHex(r, g, b)
   {
      return r << 16 | g << 8 | b;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian, _actualWidth, _actualHeight)
   {
      this.DispConf.isCircleAccept = _isCircleAccept;
      this.DispConf.isWideScreen = _isWideScreen;
      this.DispConf.safeBottom = _safeBottomPercent;
      this.DispConf.safeLeft = _safeLeftPercent;
      this.DispConf.safeRight = _safeRightPercent;
      this.DispConf.safeTop = _safeTopPercent;
      this.DispConf.screenHeight = _screenHeightPixels;
      this.DispConf.screenWidth = _screenWidthPixels;
      if(_actualWidth != undefined)
      {
         if(_actualHeight != undefined)
         {
            if(_actualWidth / _actualHeight > 1.5)
            {
               this.iActualWidth = 1280;
            }
            else
            {
               this.iActualWidth = 890;
            }
         }
         else
         {
            this.iActualWidth = 1280;
         }
      }
      this.initScreenLayout();
   }
   function SET_ICON_TIMERS(t1_ic1, t1_ic2, t1_ic3, t1_ic4, t1_ic5, t1_ic6, t2_ic1, t2_ic2, t2_ic3, t2_ic4, t2_ic5, t2_ic6)
   {
      this.iconList[0].updateTimer(t1_ic1,t2_ic1);
      this.iconList[1].updateTimer(t1_ic2,t2_ic2);
      this.iconList[2].updateTimer(t1_ic3,t2_ic3);
      this.iconList[3].updateTimer(t1_ic4,t2_ic4);
      this.iconList[4].updateTimer(t1_ic5,t2_ic5);
      this.iconList[5].updateTimer(t1_ic6,t2_ic6);
   }
   function ACTIVATE_ICON(iconID, titleText, strapText, greyOtherIcons, teamColourID)
   {
      this.SET_MESSAGE_VISIBILITY(true);
      var _loc11_;
      var _loc12_;
      var _loc10_;
      var _loc13_;
      this.icCurVals[iconID] = 1;
      if(teamColourID == 0)
      {
         _loc10_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.BIG_TEXT_MC;
         _loc13_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.BIG_TEXT_BG_MC;
         _loc11_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.STRAP_LINE;
         _loc12_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.STRAP_LINE_BG;
         this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 100;
         this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
         _loc10_.BIG_TEXT_TF.text = titleText;
         _loc13_.BIG_TEXT_TF.text = titleText;
         _loc11_.MESSAGE_TEXT.text = strapText;
         _loc12_.MESSAGE_TEXT.text = strapText;
      }
      if(teamColourID == 1)
      {
         _loc10_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.BIG_TEXT_MC;
         _loc13_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.BIG_TEXT_BG_MC;
         _loc11_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.STRAP_LINE;
         _loc12_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.STRAP_LINE_BG;
         this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 100;
         this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
         _loc10_.BIG_TEXT_TF.text = titleText;
         _loc13_.BIG_TEXT_TF.text = titleText;
         _loc11_.MESSAGE_TEXT.text = strapText;
         _loc12_.MESSAGE_TEXT.text = strapText;
      }
      var _loc7_ = false;
      var _loc5_ = 0;
      var _loc9_ = 22;
      var _loc4_ = 0;
      var _loc8_ = titleText.length;
      var _loc2_;
      var _loc3_;
      while(_loc4_ < _loc8_)
      {
         _loc2_ = 0;
         _loc3_ = this.descenders.length;
         while(_loc2_ < _loc3_)
         {
            if(titleText.charCodeAt(_loc4_) == this.descenders[_loc2_])
            {
               _loc5_ = -6;
               _loc9_ = 36 + _loc5_;
               _loc7_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc7_)
         {
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc10_.BIG_TEXT_TF._y = _loc5_;
      _loc13_.BIG_TEXT_TF._y = _loc5_;
      _loc11_._y = _loc10_._y + _loc10_.BIG_TEXT_TF.textHeight + _loc9_;
      _loc12_._y = _loc11_._y + 1;
      if(greyOtherIcons)
      {
         this.surpressIcons();
      }
      this.iconList[iconID].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE);
      this.animateIcon(iconID,0);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.TIMELINE,this.DURATION,{onComplete:this.REMOVE_SRPRESSED_STATE,onCompleteScope:this});
   }
   function REMOVE_SRPRESSED_STATE()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[4].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[5].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function animateIcon(iconID, style)
   {
      if(iconID > this.MAX_ICONS)
      {
         iconID -= this.MAX_ICONS;
      }
      var _loc3_ = MovieClip(this.iconList[iconID].CONTAINER);
      switch(style)
      {
         case 0:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.2,{_xscale:125,_yscale:125,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,1]});
            break;
         case 1:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.2,{_xscale:100,_yscale:100,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,2]});
         default:
            return;
      }
   }
   function surpressIcons()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[4].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[5].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
   }
   function loop()
   {
      this.count = this.count + 1;
      this.currentPct -= 0.01;
      this.icCurVals[0] -= 0.001;
      this.icCurVals[1] -= 0.01;
      this.icCurVals[2] -= 0.01;
      this.icCurVals[3] -= 0.01;
      this.icCurVals[4] -= 0.01;
      this.icCurVals[5] -= 0.01;
      this.icCurVals[6] -= 0.01;
      this.icCurVals[7] -= 0.01;
      this.icCurVals[8] -= 0.01;
      this.icCurVals[9] -= 0.01;
      this.icCurVals[10] -= 0.01;
      this.icCurVals[11] -= 0.01;
      this.SET_ICON_TIMERS(this.icCurVals[0],this.icCurVals[1],this.icCurVals[2],this.icCurVals[3],this.icCurVals[4],this.icCurVals[5],this.icCurVals[6],this.icCurVals[7],this.icCurVals[8],this.icCurVals[9],this.icCurVals[10],this.icCurVals[11]);
   }
   function OVERRIDE_DURATION(dur)
   {
      this.DURATION = dur;
   }
   function SET_MESSAGE_VISIBILITY(isVisible)
   {
      this.CONTENT.MAIN_TITLE_TEAM_ONE._visible = isVisible;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._visible = isVisible;
   }
   function log(str)
   {
   }
}
