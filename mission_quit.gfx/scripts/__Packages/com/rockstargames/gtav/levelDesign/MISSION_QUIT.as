class com.rockstargames.gtav.levelDesign.MISSION_QUIT extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   function MISSION_QUIT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_TEXT(title, copy)
   {
      this.CONTENT.txt_title.text = title;
      this.CONTENT.txt_copy.htmlText = copy;
   }
   function TRANSITION_IN(duration)
   {
      this.CONTENT._visible = true;
      if(duration == undefined || duration == 0)
      {
         this.CONTENT._alpha = 100;
         return undefined;
      }
      duration /= 1000;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,duration,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function TRANSITION_OUT(duration)
   {
      if(duration == undefined || duration == 0)
      {
         this.CONTENT._alpha = 0;
         this._handleTransitionOutComplete();
         return undefined;
      }
      duration /= 1000;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,duration,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this._handleTransitionOutComplete,onCompleteScope:this});
   }
   function _handleTransitionOutComplete()
   {
      this.CONTENT._visible = false;
   }
}
