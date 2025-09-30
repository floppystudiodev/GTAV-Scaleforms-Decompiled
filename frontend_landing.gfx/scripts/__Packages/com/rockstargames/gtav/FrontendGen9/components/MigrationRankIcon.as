class com.rockstargames.gtav.FrontendGen9.components.MigrationRankIcon extends MovieClip
{
   var rankColour;
   var rankIcon;
   var rankTF_MC;
   function MigrationRankIcon()
   {
      super();
      this.rankColour = new com.rockstargames.ui.utils.HudColour();
   }
   function SET_RANK(rank)
   {
      this._visible = rank > 0;
      this.rankTF_MC.gotoAndStop(this.getRankFrame(rank));
      this.rankTF_MC.rankTF.text = rank;
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.getGlobeColID(rank),this.rankColour);
      com.rockstargames.ui.utils.Colour.Colourise(this.rankIcon,this.rankColour.r,this.rankColour.g,this.rankColour.b,100);
   }
   function getRankFrame(_rankValue)
   {
      var _loc1_ = 1;
      if(_rankValue < 100)
      {
         _loc1_ = 1;
      }
      else if(_rankValue > 99 && _rankValue < 1000)
      {
         _loc1_ = 2;
      }
      else
      {
         _loc1_ = 3;
      }
      return _loc1_;
   }
}
