class com.rockstargames.gtav.levelDesign.BreakingNewsTicker extends MovieClip
{
   var labelMC;
   var curLabel;
   var labelCount = 0;
   function BreakingNewsTicker()
   {
      super();
      this.labelMC._visible = false;
   }
   function DISPLAY_SCROLL_TEXT(str)
   {
      this.CLEAR_SCROLL_TEXT();
      this.labelCount = this.labelCount + 1;
      this.curLabel = this.labelMC.duplicateMovieClip("l" + this.labelCount,this.getNextHighestDepth(),{_x:this.labelMC._x + 100,_alpha:0,_visible:true});
      this.curLabel.labelTF.htmlText = str;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.curLabel,0.3,{_x:this.labelMC._x,_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function CLEAR_SCROLL_TEXT()
   {
      var _loc2_ = this.curLabel;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{_x:this.labelMC._x - 50,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onComplete:this.removeMovieClip,onCompleteScope:_loc2_});
   }
}
