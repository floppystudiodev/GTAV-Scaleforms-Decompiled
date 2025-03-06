class com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon
{
   var currentState;
   var CONTAINER;
   var background;
   var teamOne;
   var teamTwo;
   var pickup;
   var teamOneActive;
   var teamTwoActive;
   var _teamOneColourHex = 15306063;
   var _teamTwoColourHex = 10521793;
   static var PROGRESS_RADIUS = 22;
   static var ANGLE_GRANULARITY = 12;
   var currentPct = 0;
   var _isActive = false;
   function PowerPlayIcon()
   {
      this.currentState = com.rockstargames.gtav.Multiplayer.powerplay.IconStates.DEFAULT_STATE;
   }
   function init(mc, iconLinkage, teamOneColour, teamTwoColour)
   {
      this.CONTAINER = mc;
      this.background = this.CONTAINER.attachMovie("icon","background",this.CONTAINER.getNextHighestDepth());
      this.background._alpha = 50;
      this.teamOne = this.CONTAINER.createEmptyMovieClip("TEAM_ONE",this.CONTAINER.getNextHighestDepth());
      this.teamTwo = this.CONTAINER.createEmptyMovieClip("TEAM_TWO",this.CONTAINER.getNextHighestDepth());
      this.pickup = this.CONTAINER.attachMovie(iconLinkage,"pickup",this.CONTAINER.getNextHighestDepth());
      this.pickup._alpha = 50;
      this.setPickupActiveState(0);
      this.teamOne._rotation = 180;
      this.teamTwo._rotation = 180;
   }
   function updateTimer(teamOnePct, teamTwoPct)
   {
      this.log("teamOnePct :::::::::::::::::::::::::::::::::::" + teamOnePct);
      this.log("teamTwoPct :::::::::::::::::::::::::::::::::::" + teamTwoPct);
      this.teamOneActive = false;
      this.teamTwoActive = false;
      var _loc3_ = this.roundVal(teamOnePct);
      var _loc2_ = this.roundVal(teamTwoPct);
      this.log("T1pct :::::::::::: " + _loc3_);
      this.log("T2pct :::::::::::: " + _loc2_);
      if(_loc3_ == 0 && _loc2_ == 0)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE);
      }
      else
      {
         if(_loc3_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamOneActive = true;
            }
            this.drawIcon(this.teamOne,_loc3_,15306063);
         }
         else
         {
            this.teamOne.clear();
         }
         if(_loc2_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamTwoActive = true;
            }
            this.drawIcon(this.teamTwo,_loc2_,10521793);
         }
         else
         {
            this.teamTwo.clear();
         }
      }
      if(this.teamOneActive == true || this.teamTwoActive == true)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE);
      }
      if(_loc3_ > _loc2_ && this.teamOne.getDepth() > this.teamTwo.getDepth())
      {
         this.teamOne.swapDepths(this.teamTwo);
      }
      if(_loc3_ < _loc2_ && this.teamOne.getDepth() < this.teamTwo.getDepth())
      {
         this.teamTwo.swapDepths(this.teamOne);
      }
      this.log("updateTimer : : currentState ::: " + this.currentState);
      switch(this.currentState)
      {
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.HIGHLIGHTED_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            this.teamTwo._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            this.teamTwo._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE:
            this.pickup._alpha = 50;
            this.teamOne._visible = false;
            this.teamTwo._visible = false;
            break;
         default:
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE:
            this.pickup._alpha = 25;
            this.teamOne._visible = false;
            this.teamTwo._visible = false;
            return undefined;
      }
   }
   function drawIcon(ICON, pct, colour)
   {
      pct = Math.round(pct * 100) / 100;
      ICON.clear();
      ICON.moveTo(0,0);
      ICON.beginFill(colour,100);
      var _loc4_ = Math.min(pct * 360,360);
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
   function lineToPtOnWheel(ICON, angle)
   {
      var _loc1_ = Math.sin(angle * com.rockstargames.ui.utils.MathStar.PI_OVER_180) * com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon.PROGRESS_RADIUS;
      var _loc2_ = Math.cos(angle * com.rockstargames.ui.utils.MathStar.PI_OVER_180) * com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon.PROGRESS_RADIUS;
      ICON.lineTo(_loc1_,_loc2_);
   }
   function setPickupActiveState(state)
   {
      this.currentState = state;
   }
   function roundVal(val)
   {
      val = Math.round(val * 100) / 100;
      return val;
   }
   function log(str)
   {
   }
}
