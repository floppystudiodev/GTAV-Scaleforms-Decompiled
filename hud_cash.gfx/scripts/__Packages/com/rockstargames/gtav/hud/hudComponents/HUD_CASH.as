class com.rockstargames.gtav.hud.hudComponents.HUD_CASH extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var fadeState;
   var isFadingOut;
   var isFadingIn;
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var defaultX;
   var defaultY;
   var bSettingSPCash;
   var stayOnForever;
   var _enumID;
   var _HUD;
   function HUD_CASH()
   {
      super();
      this.fadeState = 0;
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
   function SET_PLAYER_CASH(params)
   {
      this.bSettingSPCash = true;
      var _loc2_ = params[0];
      if(_loc2_ <= 9999999999)
      {
         this.CONTENT.cashTF.text = "$" + String(_loc2_);
      }
      this.SHOW(params[1]);
   }
   function SET_PLAYER_MP_CASH(params)
   {
      this.bSettingSPCash = false;
      var _loc2_ = params[0];
      this.stayOnForever = params[1];
      if(_loc2_ <= 9999999999)
      {
         this.CONTENT.cashTF.text = "$" + String(_loc2_);
      }
      this.SHOW();
   }
   function REMOVE_PLAYER_MP_CASH()
   {
      this.HIDE();
   }
   function SHOW(bSkipFade)
   {
      if(this.bSettingSPCash)
      {
         if(this.fadeState != 1)
         {
            if(bSkipFade)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100});
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onCompleteScope:this,onComplete:this.STAY_ON_SCREEN});
            }
            this.fadeState = 1;
         }
      }
      else if(!this.isFadingIn)
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
   function HIDE()
   {
      if(this.bSettingSPCash)
      {
         if(this.fadeState != -1)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
            this.fadeState = -1;
         }
      }
      else if(!this.isFadingOut)
      {
         this.isFadingOut = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onCompleteScope:this,onComplete:this.REMOVE});
      }
   }
   function REMOVE()
   {
      this.fadeState = 0;
      this.isFadingOut = false;
      this.isFadingIn = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function getTopCompOffset()
   {
      return -3;
   }
   function getBottomCompOffset()
   {
      return -7;
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
}
