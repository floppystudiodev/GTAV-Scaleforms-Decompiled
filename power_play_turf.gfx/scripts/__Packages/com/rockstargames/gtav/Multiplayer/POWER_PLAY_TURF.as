class com.rockstargames.gtav.Multiplayer.POWER_PLAY_TURF extends com.rockstargames.gtav.Multiplayer.POWER_PLAY
{
   var CONTENT;
   var DURATION;
   var RGBToHex;
   var count;
   var currentPct;
   var icCurVals;
   var iconList;
   var iconTypeList;
   var myHudColourT3;
   var myHudColourT4;
   var safeLeft;
   var safeRight;
   var safeTop;
   var teamColours;
   var timerIcon;
   var MAX_ICONS = 4;
   var IS_DEBUG = false;
   var numberOfIcons = 4;
   function POWER_PLAY_TURF()
   {
      super();
      this.iconTypeList = ["score","score","score","score"];
      this.teamColours = [10,20,30,40];
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
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function SET_NUMBER_OF_TEAMS(numTeams)
   {
      this.numberOfIcons = numTeams;
   }
   function SETUP_TEAM_COLOURS(teamOneColour, teamTwoColour, teamThreeColour, teamFourColour)
   {
      this.teamColours[0] = teamOneColour;
      this.teamColours[1] = teamTwoColour;
      this.teamColours[2] = teamThreeColour;
      this.teamColours[3] = teamFourColour;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
      this.addIconsToStage();
   }
   function SET_TEAM_SCORES(t1, t2, t3, t4)
   {
      this.iconList[0].SET_SCORE(t1);
      this.iconList[1].SET_SCORE(t2);
      this.iconList[2].SET_SCORE(t3);
      this.iconList[3].SET_SCORE(t4);
   }
   function SET_ICON_TIMERS(t1_ic1, t2_ic1, t3_ic1, t4_ic1, t5_ic1, timerTeamColour)
   {
      this.iconList[0].updateTimer(t1_ic1);
      this.iconList[1].updateTimer(t2_ic1);
      this.iconList[2].updateTimer(t3_ic1);
      this.iconList[3].updateTimer(t4_ic1);
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this.numberOfIcons)
      {
         if(arguments[_loc3_] > _loc4_)
         {
            _loc4_ = arguments[_loc3_];
            _loc5_ = _loc3_;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(timerTeamColour == undefined)
      {
         timerTeamColour = _loc5_;
      }
      var _loc7_ = new com.rockstargames.ui.utils.HudColour();
      if(this.teamColours[timerTeamColour] == undefined)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,_loc7_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(this.teamColours[timerTeamColour],_loc7_);
      }
      var _loc8_ = this.RGBToHex(_loc7_.r,_loc7_.g,_loc7_.b);
      this.timerIcon.setTeamColours(_loc8_,_loc8_,_loc8_,_loc8_);
      var _loc6_ = [0,0,0,0];
      _loc6_[_loc5_] = t5_ic1;
      this.timerIcon.updateTimer(_loc6_[0],_loc6_[1],_loc6_[2],_loc6_[3]);
   }
   function REMOVE_SRPRESSED_STATE()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function PULSE_ICON(iconID, pulseCount)
   {
      if(pulseCount == undefined)
      {
         pulseCount = 6;
      }
      var _loc5_ = MovieClip(this.iconList[iconID].CONTAINER);
      var _loc4_ = pulseCount % 2 != 1 ? 125 : 100;
      var _loc2_ = {_xscale:_loc4_,_yscale:_loc4_};
      if(pulseCount > 1)
      {
         _loc2_.onComplete = this.PULSE_ICON;
         _loc2_.onCompleteScope = this;
         _loc2_.onCompleteArgs = [iconID,pulseCount = pulseCount - 1];
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,0.2,_loc2_);
   }
   function addIconsToStage()
   {
      var _loc11_ = 0.5 * (this.safeRight + this.safeLeft);
      this.timerIcon = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIconEx();
      var _loc9_ = this.CONTENT.createEmptyMovieClip("icon" + this.numberOfIcons,this.CONTENT.getNextHighestDepth());
      _loc9_._xscale = -100;
      var _loc8_ = [];
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(this.teamColours[_loc2_],_loc4_);
         _loc8_[_loc2_] = this.RGBToHex(_loc4_.r,_loc4_.g,_loc4_.b);
         _loc2_ = _loc2_ + 1;
      }
      this.timerIcon.init(_loc9_,"score",_loc8_[0],_loc8_[1],_loc8_[2],_loc8_[3]);
      _loc9_._x = _loc11_;
      var _loc7_ = 54;
      _loc11_ = 0.5 * (this.safeRight + this.safeLeft);
      var _loc6_;
      if(this.numberOfIcons % 2 == 1)
      {
         _loc6_ = _loc11_ - _loc7_ * 0.5 * (this.numberOfIcons - 1);
      }
      else
      {
         _loc6_ = _loc11_ - _loc7_ * 0.5 * this.numberOfIcons;
      }
      var _loc10_ = this.safeTop;
      _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      while(_loc2_ < this.numberOfIcons)
      {
         _loc5_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayFill();
         _loc3_ = this.CONTENT.createEmptyMovieClip("icon" + _loc2_,this.CONTENT.getNextHighestDepth());
         _loc5_.init(_loc3_,this.iconTypeList[_loc2_],this.teamColours[_loc2_]);
         if(this.numberOfIcons % 2 == 0 && _loc2_ == 0.5 * this.numberOfIcons)
         {
            _loc6_ += _loc7_;
         }
         _loc3_._x = _loc6_;
         _loc3_._y = _loc10_ + 0.5 * _loc3_.background._height;
         this.iconList[_loc2_] = _loc5_;
         _loc6_ += _loc7_;
         _loc2_ = _loc2_ + 1;
      }
      if(this.numberOfIcons % 2 == 1)
      {
         _loc9_._y = _loc10_ + _loc9_.background._height + 0.5 * _loc3_.background._height + 10;
      }
      else
      {
         _loc9_._y = _loc10_ + 0.5 * _loc9_.background._height;
      }
      this.CONTENT.MAIN_TITLE_TEAM_ONE._y = _loc9_._y + 0.5 * _loc9_._height + 20;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._y = this.CONTENT.MAIN_TITLE_TEAM_ONE._y;
   }
   function surpressIcons()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
   }
   function animateIcon(iconID, style)
   {
      var _loc2_ = MovieClip(this.iconList[iconID].CONTAINER);
      switch(style)
      {
         case 0:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{_xscale:125,_yscale:125,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,1]});
            break;
         case 1:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{_xscale:100,_yscale:100,onComplete:this.animateIcon,onCompleteScope:this,onCompleteArgs:[iconID,2]});
         default:
            return;
      }
   }
   function loop()
   {
      this.count = this.count + 1;
      this.currentPct -= 0.01;
      this.icCurVals[0] -= 0.01;
      this.icCurVals[1] -= 0.01;
      this.icCurVals[2] -= 0.01;
      this.icCurVals[3] -= 0.01;
      this.SET_ICON_TIMERS(this.icCurVals[0],this.icCurVals[1],this.icCurVals[2],this.icCurVals[3]);
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
