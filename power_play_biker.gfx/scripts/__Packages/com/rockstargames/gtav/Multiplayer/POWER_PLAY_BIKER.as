class com.rockstargames.gtav.Multiplayer.POWER_PLAY_BIKER extends com.rockstargames.gtav.Multiplayer.POWER_PLAY
{
   var iconTypeList;
   var myHudColourT3;
   var myHudColourT4;
   var icCurVals;
   var CONTENT;
   var myHudColourT1;
   var myHudColourT2;
   var iconList;
   var teamThreeColourHex = 16777215;
   var teamFourColourHex = 0;
   var IS_DEBUG = false;
   function POWER_PLAY_BIKER()
   {
      super();
      this.iconTypeList = ["zoned","boost","jump_icon"];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.myHudColourT3 = new com.rockstargames.ui.utils.HudColour();
      this.myHudColourT4 = new com.rockstargames.ui.utils.HudColour();
      if(!this.IS_DEBUG)
      {
      }
      this.icCurVals = [];
      this.icCurVals[0] = 0;
      this.icCurVals[1] = 0;
      this.icCurVals[2] = 0;
      this.icCurVals[3] = 0;
      this.icCurVals[4] = 0;
      this.icCurVals[5] = 0;
      this.icCurVals[6] = 0;
      this.icCurVals[7] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
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
      if(this.IS_DEBUG)
      {
         this.teamOneColourHex = 39168;
         this.teamTwoColourHex = 6710937;
         this.teamThreeColourHex = 10027008;
         this.teamFourColourHex = 153;
      }
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         var _loc4_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIconEx();
         var _loc3_ = this.CONTENT.createEmptyMovieClip("icon" + _loc2_,this.CONTENT.getNextHighestDepth());
         _loc3_._x = this.CONTENT.icon_one._x + (this.CONTENT.icon_one._width + 15) * _loc2_;
         _loc3_._y = this.CONTENT.icon_one._y;
         _loc4_.init(_loc3_,this.iconTypeList[_loc2_],this.teamOneColourHex,this.teamTwoColourHex,this.teamThreeColourHex,this.teamFourColourHex);
         this.iconList[_loc2_] = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function SET_ICON_TIMERS(t1_ic1, t1_ic2, t1_ic3, t2_ic1, t2_ic2, t2_ic3, t3_ic1, t3_ic2, t3_ic3, t4_ic1, t4_ic2, t4_ic3)
   {
      this.iconList[0].updateTimer(t1_ic1,t2_ic1,t3_ic1,t4_ic1);
      this.iconList[1].updateTimer(t1_ic2,t2_ic2,t3_ic2,t4_ic2);
      this.iconList[2].updateTimer(t1_ic3,t2_ic3,t3_ic3,t4_ic3);
   }
   function REMOVE_SRPRESSED_STATE()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function surpressIcons()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
   }
   function animateIcon(iconID, style)
   {
      if(iconID > 3)
      {
         iconID -= 3;
      }
      if(iconID > 3)
      {
         iconID -= 3;
      }
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
