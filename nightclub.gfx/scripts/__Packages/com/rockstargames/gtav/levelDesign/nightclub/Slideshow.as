class com.rockstargames.gtav.levelDesign.nightclub.Slideshow
{
   var crossfadeArgs;
   var index;
   var pauseArgs;
   var slides;
   static var CROSSFADE_TIME = 0.75;
   static var PAUSE_TIME = 3;
   function Slideshow()
   {
      this.slides = [];
      this.index = 0;
      this.crossfadeArgs = {_alpha:100,onCompleteScope:this,onComplete:this.pause};
      this.pauseArgs = {onCompleteScope:this,onComplete:this.crossfade};
   }
   function startSlideshow(view)
   {
      this.stopSlideshow();
      for(var _loc3_ in view)
      {
         if(view[_loc3_] instanceof MovieClip)
         {
            this.slides.push(view[_loc3_]);
         }
      }
      this.slides.sortOn("_name");
      this.slides[0]._alpha = 100;
      this.slides[0].swapDepths(view.getNextHighestDepth());
      this.pause();
   }
   function stopSlideshow()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.slides.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.slides[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.slides.length = 0;
      this.index = 0;
   }
   function crossfade()
   {
      this.index = (this.index + 1) % this.slides.length;
      var _loc2_ = this.slides[this.index];
      _loc2_._alpha = 0;
      _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.levelDesign.nightclub.Slideshow.CROSSFADE_TIME,this.crossfadeArgs);
   }
   function pause()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.slides[this.index],com.rockstargames.gtav.levelDesign.nightclub.Slideshow.PAUSE_TIME,this.pauseArgs);
   }
   function dispose()
   {
      this.stopSlideshow();
      this.crossfadeArgs = null;
      this.pauseArgs = null;
   }
}
