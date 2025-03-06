class com.rockstargames.gtav.hud.hudComponents.HUD_DIRECTOR_MODE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var defaultX;
   var defaultY;
   var _enumID;
   var _HUD;
   var _animationDuration = 1;
   function HUD_DIRECTOR_MODE()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.CONTENT.TextTF.autoSize = "right";
   }
   function READY(id)
   {
      super.READY(id);
      this.defaultX = this.BOUNDING_BOX._x;
      this.defaultY = this.BOUNDING_BOX._y;
      this.CONTENT._alpha = 0;
   }
   function SET_DIRECTOR_MODE_TEXT(params)
   {
      this.CONTENT.TextTF.html = true;
      this.CONTENT.TextTF.htmlText = String(params[0]);
      this.SHOW();
   }
   function REMOVE_DIRECTOR_MODE_TEXT(params)
   {
      this.FORCE_FADE_OUT(params);
   }
   function SHOW()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:100});
   }
   function FORCE_FADE_OUT(params)
   {
      if(params[0])
      {
         this.REMOVE();
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this._animationDuration,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
      }
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
   }
   function REMOVE()
   {
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function getBottomCompOffset()
   {
      return -3;
   }
}
