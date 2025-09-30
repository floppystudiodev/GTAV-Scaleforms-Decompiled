class com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIconEx extends com.rockstargames.gtav.Multiplayer.powerplay.PowerPlayIcon
{
   var CONTAINER;
   var background;
   var currentState;
   var pickup;
   var teamFour;
   var teamFourActive;
   var teamOne;
   var teamOneActive;
   var teamThree;
   var teamThreeActive;
   var teamTwo;
   var teamTwoActive;
   var _teamOneColourHex = 15306063;
   var _teamTwoColourHex = 10521793;
   var _teamThreeColourHex = 10521793;
   var _teamFourColourHex = 10521793;
   function PowerPlayIconEx()
   {
      super();
   }
   function init(mc, iconLinkage, teamOneColour, teamTwoColour, teamThreeColour, teamFourColour)
   {
      this.CONTAINER = mc;
      this.setTeamColours(teamOneColour,teamTwoColour,teamThreeColour,teamFourColour);
      this.background = this.CONTAINER.attachMovie("icon","background",this.CONTAINER.getNextHighestDepth());
      this.background._alpha = 50;
      this.teamOne = this.CONTAINER.createEmptyMovieClip("TEAM_ONE",this.CONTAINER.getNextHighestDepth());
      this.teamTwo = this.CONTAINER.createEmptyMovieClip("TEAM_TWO",this.CONTAINER.getNextHighestDepth());
      this.teamThree = this.CONTAINER.createEmptyMovieClip("TEAM_THREE",this.CONTAINER.getNextHighestDepth());
      this.teamFour = this.CONTAINER.createEmptyMovieClip("TEAM_FOUR",this.CONTAINER.getNextHighestDepth());
      this.pickup = this.CONTAINER.attachMovie(iconLinkage,"pickup",100);
      this.pickup._alpha = 50;
      this.setPickupActiveState(0);
      this.teamOne._rotation = 180;
      this.teamTwo._rotation = 180;
      this.teamThree._rotation = 180;
      this.teamFour._rotation = 180;
   }
   function updateTimer(teamOnePct, teamTwoPct, teamThreePct, teamFourPct)
   {
      this.teamOneActive = false;
      this.teamTwoActive = false;
      this.teamThreeActive = false;
      this.teamFourActive = false;
      var _loc6_ = this.roundVal(teamOnePct);
      var _loc5_ = this.roundVal(teamTwoPct);
      var _loc4_ = this.roundVal(teamThreePct);
      var _loc3_ = this.roundVal(teamFourPct);
      if(_loc6_ == 0 && _loc5_ == 0 && _loc4_ == 0 && _loc3_ == 0)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE);
      }
      else
      {
         if(_loc6_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamOneActive = true;
            }
            this.drawIcon(this.teamOne,_loc6_,this._teamOneColourHex);
         }
         else
         {
            this.teamOne.clear();
         }
         if(_loc5_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamTwoActive = true;
            }
            this.drawIcon(this.teamTwo,_loc5_,this._teamTwoColourHex);
         }
         else
         {
            this.teamTwo.clear();
         }
         if(_loc4_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamThreeActive = true;
            }
            this.drawIcon(this.teamThree,_loc4_,this._teamThreeColourHex);
         }
         else
         {
            this.teamThree.clear();
         }
         if(_loc3_ > 0)
         {
            if(this.currentState != com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE)
            {
               this.teamFourActive = true;
            }
            this.drawIcon(this.teamFour,_loc3_,this._teamFourColourHex);
         }
         else
         {
            this.teamFour.clear();
         }
      }
      var _loc2_ = [{mc:this.teamOne,percent:_loc6_},{mc:this.teamTwo,percent:_loc5_},{mc:this.teamThree,percent:_loc4_},{mc:this.teamFour,percent:_loc3_}];
      _loc2_.sortOn("percent",Array.DESCENDING | Array.NUMERIC);
      if(this.teamOneActive == true || this.teamTwoActive == true || this.teamThreeActive == true || this.teamFourActive == true)
      {
         this.setPickupActiveState(com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE);
      }
      _loc2_[0].mc.swapDepths(10);
      _loc2_[1].mc.swapDepths(20);
      _loc2_[2].mc.swapDepths(30);
      _loc2_[3].mc.swapDepths(40);
      switch(this.currentState)
      {
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.HIGHLIGHTED_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            this.teamTwo._visible = true;
            this.teamThree._visible = true;
            this.teamFour._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.ACTIVE_STATE:
            this.pickup._alpha = 100;
            this.teamOne._visible = true;
            this.teamTwo._visible = true;
            this.teamThree._visible = true;
            this.teamFour._visible = true;
            break;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.INACTIVE_STATE:
            this.pickup._alpha = 50;
            this.teamOne._visible = false;
            this.teamTwo._visible = false;
            this.teamThree._visible = false;
            this.teamFour._visible = false;
         default:
            return;
         case com.rockstargames.gtav.Multiplayer.powerplay.IconStates.SURPRESSED_STATE:
            this.pickup._alpha = 25;
            this.teamOne._visible = false;
            this.teamTwo._visible = false;
            this.teamThree._visible = false;
            this.teamFour._visible = false;
            return undefined;
      }
   }
   function setTeamColours(teamOne, teamTwo, teamThree, teamFour)
   {
      this._teamOneColourHex = teamOne;
      this._teamTwoColourHex = teamTwo;
      this._teamThreeColourHex = teamThree;
      this._teamFourColourHex = teamFour;
   }
}
