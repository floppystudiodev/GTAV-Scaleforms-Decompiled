class com.rockstargames.gtav.hud.hudComponents.HUD_MP_CASH extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var isFadingOut;
   var isFadingIn;
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var defaultX;
   var defaultY;
   var stayOnForever;
   var _enumID;
   var _HUD;
   function HUD_MP_CASH()
   {
      super();
      this.isFadingOut = false;
      this.isFadingIn = false;
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
   function SET_PLAYER_MP_CASH(params)
   {
      var _loc2_ = params[0];
      this.stayOnForever = params[1];
      if(_loc2_ <= 9999999999)
      {
         this.CONTENT.cashTF.text = "$" + String(_loc2_);
      }
      this.SHOW();
   }
   function SHOW()
   {
      if(!this.isFadingIn)
      {
         this.isFadingIn = true;
         if(this.stayOnForever)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
         }
      }
   }
   function STAY_ON_SCREEN()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE,onCompleteScope:this});
   }
   function REMOVE_PLAYER_MP_CASH()
   {
      this.HIDE();
   }
   function HIDE()
   {
      if(!this.isFadingOut)
      {
         this.isFadingOut = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
      }
   }
   function REMOVE()
   {
      this.isFadingOut = false;
      this.isFadingIn = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
