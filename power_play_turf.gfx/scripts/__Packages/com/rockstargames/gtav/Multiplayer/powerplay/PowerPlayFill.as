class com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayFill extends com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIconEx
{
   var myHudColourT1;
   var currentState;
   var CONTAINER;
   var background;
   var teamOne;
   var teamTwo;
   var teamThree;
   var teamFour;
   var maskMC;
   var pickup;
   var teamOneActive;
   var teamColour;
   var hasIconTimer = false;
   function PowerPlayFill()
   {
      super();
      this.myHudColourT1 = new com.rockstargames.ui.utils.HudColour();
      this.currentState = com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE;
   }
   function init(mc, iconLinkage, teamOneColour)
   {
      trace("init was called with args: " + arguments);
      this.CONTAINER = mc;
      this.background = this.CONTAINER.attachMovie("icon","background",this.CONTAINER.getNextHighestDepth());
      this.background._alpha = 50;
      this.teamOne = this.CONTAINER.createEmptyMovieClip("TEAM_ONE",this.CONTAINER.getNextHighestDepth());
      this.teamTwo = this.CONTAINER.createEmptyMovieClip("TEAM_TWO",this.CONTAINER.getNextHighestDepth());
      this.teamThree = this.CONTAINER.createEmptyMovieClip("TEAM_THREE",this.CONTAINER.getNextHighestDepth());
      this.teamFour = this.CONTAINER.createEmptyMovieClip("TEAM_FOUR",this.CONTAINER.getNextHighestDepth());
      this.maskMC = this.CONTAINER.attachMovie("maskMC","maskMC",90);
      this.maskMC._y = this.maskMC._height / 2;
      com.rockstargames.ui.utils.Colour.setHudColour(teamOneColour,this.myHudColourT1);
      com.rockstargames.ui.utils.Colour.Colourise(this.maskMC,this.myHudColourT1.r,this.myHudColourT1.g,this.myHudColourT1.b);
      this.maskMC.setMask(this.teamOne);
      this.pickup = this.CONTAINER.attachMovie(iconLinkage,"pickup",100);
      this.pickup._alpha = 50;
      this.setPickupActiveState(0);
      this.teamOne._rotation = 180;
      this.teamTwo._rotation = 180;
      this.teamThree._rotation = 180;
      this.teamFour._rotation = 180;
   }
   function drawIcon(ICON, pct, colour)
   {
      this.maskMC._yscale = Math.round(pct * 100);
      ICON.clear();
      ICON.moveTo(0,0);
      ICON.beginFill(0,100);
      var _loc4_ = 360;
      var _loc2_ = 0;
      while(_loc2_ <= _loc4_)
      {
         this.lineToPtOnWheel(ICON,_loc2_);
         _loc2_ += com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon.ANGLE_GRANULARITY;
      }
      if(_loc2_ < _loc4_ + com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon.ANGLE_GRANULARITY)
      {
         this.lineToPtOnWheel(ICON,_loc4_);
      }
      ICON.lineTo(0,0);
      ICON.endFill();
   }
   function SET_SCORE(score)
   {
      if(score < 0)
      {
         score == "";
      }
      this.pickup.scoreTF.text = String(score);
   }
   function updateTimer(teamOnePct)
   {
      this.teamOneActive = false;
      var _loc2_ = this.roundVal(teamOnePct);
      if(_loc2_ == 0)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE);
         this.drawIcon(this.teamOne,_loc2_,this.teamColour);
      }
      else if(_loc2_ > 0)
      {
         if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
         {
            this.teamOneActive = true;
         }
         this.drawIcon(this.teamOne,_loc2_,this.teamColour);
      }
      else
      {
         this.teamOne.clear();
      }
      if(this.teamOneActive == true)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE);
      }
      switch(this.currentState)
      {
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.HIGHLIGHTED_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE:
            this.pickup._alpha = 50;
            this.teamOne._visible = false;
            break;
         default:
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE:
            this.pickup._alpha = 25;
            this.teamOne._visible = false;
            return undefined;
      }
   }
}
