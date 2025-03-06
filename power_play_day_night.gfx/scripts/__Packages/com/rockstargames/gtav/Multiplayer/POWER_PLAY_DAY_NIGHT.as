class com.rockstargames.gtav.Multiplayer.POWER_PLAY_DAY_NIGHT extends com.rockstargames.gtav.Multiplayer.POWER_PLAY
{
   var iconList;
   var iconTypeList;
   var icCurVals;
   var CONTENT;
   var myHudColourT1;
   var myHudColourT2;
   var _initIconType = -1;
   var MAX_ICONS = 4;
   function POWER_PLAY_DAY_NIGHT()
   {
      super();
      this.iconList = [];
      this.iconTypeList = ["day","night"];
      this.icCurVals[0] = 0;
      this.icCurVals[1] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.icCurVals = [];
      this.icCurVals[0] = 0;
      this.icCurVals[1] = 0;
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function SET_INITIAL_ICON(iconType)
   {
      this._initIconType = iconType;
      if(iconType == 0)
      {
         this.iconList[0].CONTAINER._visible = true;
         this.iconList[1].CONTAINER._visible = false;
         this.iconList[2].CONTAINER._visible = true;
         this.iconList[3].CONTAINER._visible = false;
      }
      else
      {
         this.iconList[0].CONTAINER._visible = false;
         this.iconList[1].CONTAINER._visible = true;
         this.iconList[2].CONTAINER._visible = false;
         this.iconList[3].CONTAINER._visible = true;
      }
   }
   function SETUP_TEAM_COLOURS(teamOneColour, teamTwoColour)
   {
      com.rockstargames.ui.utils.Colour.setHudColour(teamOneColour,this.myHudColourT1);
      com.rockstargames.ui.utils.Colour.setHudColour(teamTwoColour,this.myHudColourT2);
      this.teamOneColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT1.r,this.myHudColourT1.g,this.myHudColourT1.b);
      this.teamTwoColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(this.myHudColourT2.r,this.myHudColourT2.g,this.myHudColourT2.b);
      var _loc2_ = 0;
      while(_loc2_ < 2)
      {
         var _loc4_ = new com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon();
         var _loc3_ = this.CONTENT.createEmptyMovieClip("icon" + _loc2_,this.CONTENT.getNextHighestDepth());
         _loc3_._x = this.CONTENT.icon_one._x;
         _loc3_._y = this.CONTENT.icon_one._y;
         _loc4_.init(_loc3_,this.iconTypeList[_loc2_],this.teamOneColourHex,this.teamTwoColourHex);
         _loc4_.CONTAINER._visible = false;
         this.iconList[_loc2_] = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_ONE,teamOneColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.MAIN_TITLE_TEAM_TWO,teamTwoColour);
      this.CONTENT.MAIN_TITLE_TEAM_ONE._alpha = 0;
      this.CONTENT.MAIN_TITLE_TEAM_TWO._alpha = 0;
   }
   function SET_ICON_TIMERS(t1_ic1, t1_ic2, t2_ic1, t2_ic2)
   {
      this.iconList[0].updateTimer(t1_ic1,t2_ic1);
      this.iconList[1].updateTimer(t1_ic2,t2_ic2);
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
   function surpressIcons()
   {
      this.iconList[0].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[1].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[2].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
      this.iconList[3].setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE);
   }
   function animateIcon(iconID, style)
   {
      if(iconID > 1)
      {
         iconID -= 1;
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
   function ACTIVATE_ICON(iconID, titleText, strapText, greyOtherIcons, teamColourID)
   {
      super.ACTIVATE_ICON(iconID,titleText,strapText,greyOtherIcons,teamColourID);
      if(iconID == 0 || iconID == 2)
      {
         this.iconList[0].CONTAINER._visible = true;
         this.iconList[1].CONTAINER._visible = false;
         this.iconList[2].CONTAINER._visible = true;
         this.iconList[3].CONTAINER._visible = false;
      }
      else
      {
         this.iconList[0].CONTAINER._visible = false;
         this.iconList[1].CONTAINER._visible = true;
         this.iconList[2].CONTAINER._visible = false;
         this.iconList[3].CONTAINER._visible = true;
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
}
