class com.rockstargames.gtav.hud.hudComponents.HUD_CASH_CHANGE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var defaultX;
   var defaultY;
   var _enumID;
   var _HUD;
   function HUD_CASH_CHANGE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
   }
   function READY(id)
   {
      super.READY(id);
      this.defaultX = this.TIMELINE._x;
      this.defaultY = this.TIMELINE._y;
      this.CONTENT._alpha = 0;
   }
   function SET_PLAYER_CASH_CHANGE(params)
   {
      var _loc3_ = params[0];
      var _loc4_ = params[1];
      var _loc2_ = undefined;
      if(_loc4_)
      {
         _loc2_ = "+$";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,102,152,104,100);
      }
      else
      {
         _loc2_ = "-$";
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT,194,80,80,100);
      }
      if(_loc3_ <= 9999999999)
      {
         this.CONTENT.cashTF.text = _loc2_ + String(_loc3_);
      }
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
