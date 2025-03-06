class com.rockstargames.gtav.Multiplayer.POWER_PLAY_SPECIAL_RACES extends com.rockstargames.gtav.Multiplayer.POWER_PLAY
{
   var iconTypeList;
   var myHudColourT3;
   var myHudColourT4;
   var icCurVals;
   var CONTENT;
   var displayConfig;
   var myHudColourT1;
   var myHudColourT2;
   var iconList;
   var teamThreeColourHex = 16777215;
   var teamFourColourHex = 0;
   function POWER_PLAY_SPECIAL_RACES()
   {
      super();
      this.iconTypeList = ["bomb","inverse","rockets","deadline","machine_gun","ramp_buggy","ruiner"];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.myHudColourT3 = new com.rockstargames.ui.utils.HudColour();
      this.myHudColourT4 = new com.rockstargames.ui.utils.HudColour();
      this.icCurVals = [];
      this.icCurVals[0] = 0;
      this.icCurVals[1] = 0;
      this.icCurVals[2] = 0;
      this.icCurVals[3] = 0;
      this.icCurVals[4] = 0;
      this.icCurVals[5] = 0;
      this.icCurVals[6] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
   }
   function REMOVE_ICON(index)
   {
   }
   function SETUP_TEAM_COLOURS(teamOneColour, teamTwoColour, teamThreeColour, teamFourColour)
   {
      com.rockstargames.ui.utils.Colour.setHudColour(teamOneColour,this.myHudColourT1);
      com.rockstargames.ui.utils.Colour.setHudColour(teamTwoColour,this.myHudColourT2);
      com.rockstargames.ui.utils.Colour.setHudColour(teamThreeColour,this.myHudColourT3);
      com.rockstargames.ui.utils.Colour.setHudColour(teamFourColour,this.myHudColourT4);
      this.teamOneColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT1.r,this.myHudColourT1.g,this.myHudColourT1.b);
      this.teamTwoColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT2.r,this.myHudColourT2.g,this.myHudColourT2.b);
      this.teamThreeColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT3.r,this.myHudColourT3.g,this.myHudColourT3.b);
      this.teamFourColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT4.r,this.myHudColourT4.g,this.myHudColourT4.b);
      var _loc2_ = this.initIcons(this.teamOneColourHex,this.teamTwoColourHex,this.teamThreeColourHex,this.teamFourColourHex);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._y = _loc2_ + 20;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._y = _loc2_ + 20;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function SET_ICON_TIMERS()
   {
   }
   function SET_ICON_TIMER(iconIndex, team1Value, team2Value, team3Value, team4Value)
   {
      this.iconList[iconIndex].updateTimer(team1Value,team2Value,team3Value,team4Value);
   }
   function SET_ICON_BACKGROUND(iconID, teamColourID)
   {
      var _loc3_ = [this.myHudColourT1,this.myHudColourT2,this.myHudColourT3,this.myHudColourT4];
      var _loc2_ = _loc3_[teamColourID];
      this.iconList[iconID].background.transform.colorTransform = new flash.geom.ColorTransform(-1,-1,-1,1,_loc2_.r,_loc2_.g,_loc2_.b,255);
   }
   function RESET_ICON_BACKGROUNDS()
   {
      var _loc2_ = 0;
      var _loc4_ = this.iconList.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.iconList[_loc2_].background;
         _loc3_.transform.colorTransform = new flash.geom.ColorTransform();
         _loc3_._alpha = 50;
         _loc2_ = _loc2_ + 1;
      }
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
   }
   function animateIcon(iconID, style)
   {
      iconID %= this.iconList.length;
      var _loc3_ = MovieClip(this.iconList[iconID].CONTAINER);
      switch(style)
      {
         case 0:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.2,{_xscale:125,_yscale:125,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,1]});
            break;
         case 1:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.2,{_xscale:100,_yscale:100,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,2]});
      }
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
      this.SET_ICON_TIMERS(this.icCurVals[0],this.icCurVals[1],this.icCurVals[2],this.icCurVals[3],this.icCurVals[4],this.icCurVals[5],this.icCurVals[6]);
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
   function initIcons(teamOneColourHex, teamTwoColourHex, teamThreeColourHex, teamFourColourHex)
   {
      var _loc13_ = this.iconTypeList.length;
      var _loc14_ = !this.displayConfig.isWideScreen ? Math.ceil(0.5 * _loc13_) : _loc13_;
      var _loc6_ = 50;
      var _loc21_ = 0.5 * (this.safeRight - this.safeLeft) + this.safeLeft;
      var _loc9_ = _loc21_ - _loc6_ * 0.5 * (_loc14_ - 1);
      var _loc15_ = this.displayConfig.safeTop * this.displayConfig.screenHeight;
      var _loc10_ = _loc21_ - _loc6_ * 0.5 * (_loc13_ - _loc14_ - 1);
      var _loc16_ = _loc14_ * 2 != _loc13_ ? 104 : _loc15_ + _loc6_;
      var _loc8_ = 0;
      var _loc7_ = [];
      var _loc3_ = 0;
      while(_loc3_ < _loc13_)
      {
         var _loc5_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIconEx();
         var _loc2_ = this.CONTENT.createEmptyMovieClip("icon" + _loc3_,this.CONTENT.getNextHighestDepth());
         if(_loc3_ < _loc14_)
         {
            _loc2_._x = _loc9_;
            _loc2_._y = _loc15_;
            _loc9_ += _loc6_;
         }
         else
         {
            _loc2_._x = _loc10_;
            _loc2_._y = _loc16_;
            _loc10_ += _loc6_;
         }
         _loc5_.init(_loc2_,this.iconTypeList[_loc3_],teamOneColourHex,teamTwoColourHex,teamThreeColourHex,teamFourColourHex);
         _loc2_._y += 0.5 * _loc2_._height;
         this.iconList[_loc3_] = _loc5_;
         var _loc4_ = _loc2_._y + 0.5 * _loc2_._height;
         if(_loc4_ > _loc8_)
         {
            _loc8_ = _loc4_;
         }
         _loc7_[_loc3_] = {x:_loc2_._x,y:_loc2_._y};
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = this.iconList[1].CONTAINER;
      _loc2_._x = _loc7_[3].x;
      _loc2_._y = _loc7_[3].y;
      _loc2_ = this.iconList[2].CONTAINER;
      _loc2_._x = _loc7_[1].x;
      _loc2_._y = _loc7_[1].y;
      _loc2_ = this.iconList[3].CONTAINER;
      _loc2_._x = _loc7_[4].x;
      _loc2_._y = _loc7_[4].y;
      _loc2_ = this.iconList[4].CONTAINER;
      _loc2_._x = _loc7_[2].x;
      _loc2_._y = _loc7_[2].y;
      return _loc8_;
   }
}
