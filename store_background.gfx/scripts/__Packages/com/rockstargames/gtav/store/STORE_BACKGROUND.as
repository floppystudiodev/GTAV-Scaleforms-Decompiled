class com.rockstargames.gtav.store.STORE_BACKGROUND extends com.rockstargames.ui.core.BaseScriptUI
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var fadeInTime = 1;
   function STORE_BACKGROUND()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth(),{_visible:false});
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth(),{_visible:false});
      this.fadeInBackground();
   }
   function fadeInBackground()
   {
      this.CONTENT._alpha = 0;
      this.CONTENT.stripsUp._alpha = 0;
      this.CONTENT.stripsDown._alpha = 0;
      this.CONTENT._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.fadeInTime,{_alpha:100,delay:0.5,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.CONTENT]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.stripsUp,this.fadeInTime + 0.125,{_alpha:100,delay:0.5,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.CONTENT.stripsUp]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.stripsDown,this.fadeInTime + 0.125,{_alpha:100,delay:0.5,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.CONTENT.stripsDown]});
   }
   function ANIMATE_BACKGROUND(_speed)
   {
      if(_speed == undefined)
      {
         _speed = 240;
      }
      this.scrollUp(this.CONTENT.stripsUp,_speed);
      this.scrollDown(this.CONTENT.stripsDown,_speed);
   }
   function scrollUp(mc, _speed)
   {
      if(typeof mc == "movieclip")
      {
         if(mc != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
            mc._y = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,_speed,{_y:-512,onCompleteScope:this,onComplete:this.scrollUp,onCompleteArgs:[mc,_speed]});
         }
      }
   }
   function scrollDown(mc, _speed)
   {
      if(typeof mc == "movieclip")
      {
         if(mc != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
            mc._y = -768;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,_speed,{_y:-256,onCompleteScope:this,onComplete:this.scrollDown,onCompleteArgs:[mc,_speed]});
         }
      }
   }
}
