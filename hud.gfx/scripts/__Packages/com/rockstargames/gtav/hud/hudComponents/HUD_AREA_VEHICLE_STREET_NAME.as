class com.rockstargames.gtav.hud.hudComponents.HUD_AREA_VEHICLE_STREET_NAME extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var BOUNDING_BOX;
   var CONTENT;
   var FADE_DURATION;
   var ON_SCREEN_DURATION;
   var TIMELINE;
   var _HUD;
   var _enumID;
   var forceShow = false;
   function HUD_AREA_VEHICLE_STREET_NAME()
   {
      super();
      this.ON_SCREEN_DURATION = 4000;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.CONTENT.nameText.textAutoSize = "shrink";
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._alpha = 0;
   }
   function SET_AREA_NAME(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.SET_NAME([_loc2_,_loc3_]);
   }
   function SET_STREET_NAME(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.SET_NAME([_loc2_,_loc3_]);
   }
   function SET_VEHICLE_NAME(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.SET_NAME([_loc2_,_loc3_]);
   }
   function SET_NAME(params)
   {
      var _loc5_ = params[0];
      var _loc4_ = params[1];
      if(_loc4_ != undefined)
      {
         this.ON_SCREEN_DURATION = _loc4_;
      }
      var _loc2_ = this.CONTENT.nameText;
      _loc2_.text = _loc5_;
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
