class com.rockstargames.gtav.Multiplayer.POWER_PLAY_VEHICLE extends com.rockstargames.gtav.Multiplayer.POWER_PLAY
{
   var CONTENT;
   var descenders;
   var displayConfig;
   var icCurVals;
   var iconList;
   var iconTypeList;
   var myHudColourT1;
   var myHudColourT2;
   var safeLeft;
   var safeRight;
   function POWER_PLAY_VEHICLE()
   {
      super();
      this.iconTypeList = ["zoned","inverse","detonator","bomb","armoured","accelerator","repair","ghost","rockets","deadline"];
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
      this.icCurVals[12] = 0;
      this.icCurVals[13] = 0;
      this.icCurVals[14] = 0;
      this.icCurVals[15] = 0;
      this.icCurVals[16] = 0;
      this.icCurVals[17] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
   }
   function REMOVE_ICON(index)
   {
      this.iconTypeList.splice(index,1);
   }
   function SETUP_TEAM_COLOURS(teamOneColour, teamTwoColour)
   {
      com.rockstargames.ui.utils.Colour.setHudColour(teamOneColour,this.myHudColourT1);
      com.rockstargames.ui.utils.Colour.setHudColour(teamTwoColour,this.myHudColourT2);
      var _loc3_ = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT1.r,this.myHudColourT1.g,this.myHudColourT1.b);
      var _loc4_ = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT2.r,this.myHudColourT2.g,this.myHudColourT2.b);
      var _loc2_ = this.initIcons(_loc3_,_loc4_);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._y = _loc2_ + 20;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._y = _loc2_ + 20;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function initIcons(teamOneColourHex, teamTwoColourHex)
   {
      var _loc10_ = this.iconTypeList.length;
      var _loc11_ = !this.displayConfig.isWideScreen ? Math.ceil(0.5 * _loc10_) : _loc10_;
      var _loc6_ = 50;
      var _loc16_ = 0.5 * (this.safeRight - this.safeLeft) + this.safeLeft;
      var _loc8_ = _loc16_ - _loc6_ * 0.5 * (_loc11_ - 1);
      var _loc12_ = this.displayConfig.safeTop * this.displayConfig.screenHeight;
      var _loc9_ = _loc16_ - _loc6_ * 0.5 * (_loc10_ - _loc11_ - 1);
      var _loc13_ = _loc11_ * 2 != _loc10_ ? 104 : _loc12_ + _loc6_;
      var _loc7_ = 0;
      var _loc3_ = 0;
      var _loc5_;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < _loc10_)
      {
         _loc5_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon();
         _loc2_ = this.CONTENT.createEmptyMovieClip("icon" + _loc3_,this.CONTENT.getNextHighestDepth());
         if(_loc3_ < _loc11_)
         {
            _loc2_._x = _loc8_;
            _loc2_._y = _loc12_;
            _loc8_ += _loc6_;
         }
         else
         {
            _loc2_._x = _loc9_;
            _loc2_._y = _loc13_;
            _loc9_ += _loc6_;
         }
         _loc5_.init(_loc2_,this.iconTypeList[_loc3_],teamOneColourHex,teamTwoColourHex);
         _loc2_._y += 0.5 * _loc2_._height;
         this.iconList[_loc3_] = _loc5_;
         _loc4_ = _loc2_._y + 0.5 * _loc2_._height;
         if(_loc4_ > _loc7_)
         {
            _loc7_ = _loc4_;
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc7_;
   }
   function ACTIVATE_ICON(iconID, titleText, strapText, greyOtherIcons, teamColourID)
   {
      super.ACTIVATE_ICON(iconID,titleText,strapText,greyOtherIcons,teamColourID);
      var _loc10_;
      var _loc12_;
      var _loc11_;
      var _loc14_;
      this.icCurVals[iconID] = 1;
      if(teamColourID == 0)
      {
         _loc11_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.BIG_TEXT_MC;
         _loc14_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.BIG_TEXT_BG_MC;
         _loc10_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.STRAP_LINE;
         _loc12_ = this.CONTENT.MAIN_TITLE_TEAM_ONE.STRAP_LINE_BG;
      }
      else if(teamColourID == 1)
      {
         _loc11_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.BIG_TEXT_MC;
         _loc14_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.BIG_TEXT_BG_MC;
         _loc10_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.STRAP_LINE;
         _loc12_ = this.CONTENT.MAIN_TITLE_TEAM_TWO.STRAP_LINE_BG;
      }
      var _loc6_ = false;
      var _loc9_ = -10;
      var _loc5_ = 0;
      var _loc8_ = titleText.length;
      var _loc3_;
      var _loc4_;
      while(_loc5_ < _loc8_)
      {
         _loc3_ = 0;
         _loc4_ = this.descenders.length;
         while(_loc3_ < _loc4_)
         {
            if(titleText.charCodeAt(_loc5_) == this.descenders[_loc3_])
            {
               _loc9_ = 0;
               _loc6_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc6_)
         {
            break;
         }
         _loc5_ = _loc5_ + 1;
      }
      _loc10_._y = _loc11_._y + _loc11_._height + _loc9_;
      _loc12_._y = _loc10_._y + 1;
   }
   function SET_ICON_BACKGROUND(iconID, teamColourID)
   {
      var _loc2_ = teamColourID != 0 ? this.myHudColourT2 : this.myHudColourT1;
      this.iconList[iconID].background.transform.colorTransform = new flash.geom.ColorTransform(-1,-1,-1,1,_loc2_.r,_loc2_.g,_loc2_.b,255);
   }
   function RESET_ICON_BACKGROUNDS()
   {
      var _loc2_ = 0;
      var _loc4_ = this.iconList.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.iconList[_loc2_].background;
         _loc3_.transform.colorTransform = new flash.geom.ColorTransform();
         _loc3_._alpha = 50;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_ICON_TIMERS(t1_ic1, t1_ic2, t1_ic3, t1_ic4, t1_ic5, t1_ic6, t1_ic7, t1_ic8, t1_ic9, t1_ic10, t2_ic1, t2_ic2, t2_ic3, t2_ic4, t2_ic5, t2_ic6, t2_ic7, t2_ic8, t2_ic9, t2_ic10)
   {
      this.iconList[0].updateTimer(t1_ic1,t2_ic1);
      this.iconList[1].updateTimer(t1_ic2,t2_ic2);
      this.iconList[2].updateTimer(t1_ic3,t2_ic3);
      this.iconList[3].updateTimer(t1_ic4,t2_ic4);
      this.iconList[4].updateTimer(t1_ic5,t2_ic5);
      this.iconList[5].updateTimer(t1_ic6,t2_ic6);
      this.iconList[6].updateTimer(t1_ic7,t2_ic7);
      this.iconList[7].updateTimer(t1_ic8,t2_ic8);
      this.iconList[8].updateTimer(t1_ic9,t2_ic9);
      this.iconList[9].updateTimer(t1_ic10,t2_ic10);
   }
   function REMOVE_SRPRESSED_STATE()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[4].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[5].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[6].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[7].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[8].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[9].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function surpressIcons()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[4].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[5].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[6].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[7].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[8].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[9].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
   }
   function animateIcon(iconID, style)
   {
      if(iconID > 9)
      {
         iconID -= 10;
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
}
