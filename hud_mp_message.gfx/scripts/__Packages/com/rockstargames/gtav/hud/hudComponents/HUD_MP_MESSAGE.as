class com.rockstargames.gtav.hud.hudComponents.HUD_MP_MESSAGE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var messageMC;
   var CONTENT;
   var defaultX;
   var TIMELINE;
   var defaultY;
   var _enumID;
   var _HUD;
   function HUD_MP_MESSAGE()
   {
      super();
   }
   function READY(id)
   {
      super.READY(id);
      this.messageMC = this.CONTENT.attachMovie("messageMC","messageMC",this.CONTENT.getNextHighestDepth());
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.CONTENT._alpha = 0;
   }
   function SET_MP_MESSAGE(params)
   {
      var _loc3_ = this.CONTENT.messageMC.messageTF;
      var _loc2_ = String(params[0]);
      _loc3_.htmlText = _loc2_;
      this.SHOW();
   }
   function SHOW()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
   }
   function STAY_ON_SCREEN()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE,onCompleteScope:this});
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
