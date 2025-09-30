class com.rockstargames.gtav.hud.hudComponents.HUD_MISSION_PASSED_MESSAGE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CONTENT;
   var FADE_DURATION;
   var ON_SCREEN_DURATION;
   var TIMELINE;
   var _HUD;
   var _enumID;
   var defaultX;
   var defaultY;
   var messageMC;
   var messageText;
   function HUD_MISSION_PASSED_MESSAGE()
   {
      super();
   }
   function READY(id)
   {
      super.READY(id);
      this.messageMC = this.CONTENT.attachMovie("messageMC","messageMC",this.CONTENT.getNextHighestDepth());
      this.messageText = this.CONTENT.messageMC.messageTF;
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.CONTENT._alpha = 0;
   }
   function SET_MISSION_PASSED_MESSAGE(params)
   {
      var _loc2_ = String(params[0]);
      this.messageText.text = _loc2_;
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
