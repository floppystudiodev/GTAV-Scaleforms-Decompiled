class com.rockstargames.gtav.store.STORE_BLACKOUT extends MovieClip
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   function STORE_BLACKOUT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT._alpha = 0;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
   }
   function FADE_TO_BLACK(_speed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,_speed / 1000,{_alpha:100,onComplete:this.CALL_FADETOBLACK_COMPLETED,onCompleteScope:this});
   }
   function CALL_FADETOBLACK_COMPLETED()
   {
      com.rockstargames.ui.game.GameInterface.call("FADE_TO_BLACK_COMPLETED",com.rockstargames.ui.game.GameInterface.STORE);
   }
   function FADE_TO_TRANSPARENT(_speed)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,_speed / 1000,{_alpha:0,onComplete:this.CALL_FADETOTRANSPARENT_COMPLETED,onCompleteScope:this});
   }
   function CALL_FADETOTRANSPARENT_COMPLETED()
   {
      com.rockstargames.ui.game.GameInterface.call("FADE_TO_TRANSPARENT_COMPLETED",com.rockstargames.ui.game.GameInterface.STORE);
   }
}
