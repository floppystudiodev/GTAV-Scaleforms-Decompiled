class com.rockstargames.gtav.levelDesign.iaaHeistBoard.Loading
{
   var callback;
   var view;
   function Loading()
   {
   }
   function setView(view)
   {
      this.view = view;
      this.update();
   }
   function setCallback(callback)
   {
      this.callback = callback;
   }
   function reset()
   {
      this.callback = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view = null;
   }
   function update()
   {
      if(this.view._currentframe == this.view._totalframes)
      {
         if(this.callback)
         {
            this.callback();
            this.callback = null;
         }
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.1,{onCompleteScope:this,onComplete:this.update});
      }
   }
}
