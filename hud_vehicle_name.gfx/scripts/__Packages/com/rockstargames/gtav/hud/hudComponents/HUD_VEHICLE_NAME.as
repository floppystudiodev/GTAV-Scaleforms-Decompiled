class com.rockstargames.gtav.hud.hudComponents.HUD_VEHICLE_NAME extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CONTENT;
   var _enumID;
   var _HUD;
   var forceShow = false;
   function HUD_VEHICLE_NAME()
   {
      super();
      this.ON_SCREEN_DURATION = 2500;
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._alpha = 0;
   }
   function SET_VEHICLE_NAME(newName)
   {
      var _loc2_ = this.CONTENT.nameText;
      _loc2_.text = newName;
      var _loc3_ = _loc2_.getTextFormat();
      _loc3_.rightMargin = 2;
      _loc2_.setTextFormat(_loc3_);
      this.SHOW();
   }
   function FORCE_SHOW(_forceShow)
   {
      this.forceShow = _forceShow == "true";
   }
   function SHOW()
   {
      if(this.forceShow)
      {
         this.CONTENT._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onComplete:this.STAY_ON_SCREEN,onCompleteScope:this});
      }
   }
   function STAY_ON_SCREEN()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE,onCompleteScope:this});
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
