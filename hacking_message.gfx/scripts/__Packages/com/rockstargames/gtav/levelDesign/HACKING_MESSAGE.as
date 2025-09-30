class com.rockstargames.gtav.levelDesign.HACKING_MESSAGE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var TIMELINE;
   var isWideScreen;
   function HACKING_MESSAGE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_DISPLAY(unlockId, title, message, red, green, blue, stagePassed)
   {
      if(unlockId == -1)
      {
         this.CONTENT.gotoAndStop("hidden");
         this.CONTENT.scanLines.transform.colorTransform = new flash.geom.ColorTransform();
         return undefined;
      }
      this.CONTENT.gotoAndStop("visible");
      var _loc2_ = this.CONTENT.message;
      _loc2_.labels.header.htmlText = !title ? "" : title;
      _loc2_.labels.subHeader.label.htmlText = !message ? "" : message;
      if(unlockId < 4 && stagePassed)
      {
         _loc2_.locks.gotoAndStop("unlock" + (unlockId - 1));
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.TIMELINE,1,{onComplete:this.executeLockAnim,onCompleteScope:this,onCompleteArgs:[unlockId]});
      }
      else
      {
         _loc2_.locks.gotoAndStop("unlock" + unlockId);
      }
      if(unlockId > 3)
      {
         this.initLesterBounce();
      }
      else
      {
         _loc2_.lester.head.laugh = null;
         _loc2_.lester._visible = false;
      }
      var _loc3_;
      if(!isNaN(red) && !isNaN(green) && !isNaN(blue))
      {
         red = Math.max(0,Math.min(255,red));
         green = Math.max(0,Math.min(255,green));
         blue = Math.max(0,Math.min(255,blue));
         _loc3_ = new flash.geom.ColorTransform();
         _loc3_.rgb = red << 16 | green << 8 | blue;
         _loc2_.labels.transform.colorTransform = _loc3_;
         _loc2_.locks.transform.colorTransform = _loc3_;
         _loc2_.warningLines.transform.colorTransform = _loc3_;
         _loc2_.overlay.transform.colorTransform = _loc3_;
      }
      if(_loc2_._currentFrame != 1)
      {
         _loc2_.gotoAndPlay(1);
      }
   }
   function executeLockAnim(unlockId)
   {
      this.playUnlockSound();
      this.CONTENT.message.locks.gotoAndStop("unlock" + unlockId);
   }
   function playLesterLaughSound()
   {
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Lester_Laugh","DLC_HEIST_HACKING_SNAKE_SOUNDS");
   }
   function playUnlockSound()
   {
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Lock_Unlock","DLC_HEIST_HACKING_SNAKE_SOUNDS");
   }
   function initLesterBounce()
   {
      var _loc4_ = this.CONTENT.message.lester;
      var head = _loc4_.head;
      var _loc5_ = 0.58 * head._xscale;
      var _loc6_ = 0.84 * head._yscale;
      var top = 0 + _loc6_;
      var bottom = 720 - _loc6_;
      var left = (!this.isWideScreen ? 160 : 0) + _loc5_;
      var right = (!this.isWideScreen ? 1120 : 1280) - _loc5_;
      var vx = 10;
      var vy = 10;
      head._x = left;
      head._y = top;
      var that = this;
      _loc4_.head.laugh = function()
      {
         that.playLesterLaughSound();
      };
      _loc4_._visible = true;
      _loc4_.onEnterFrame = function()
      {
         var _loc2_ = head._x + vx;
         var _loc1_ = head._y + vy;
         if(_loc2_ <= left)
         {
            _loc2_ = left + left - _loc2_;
            vx = - vx;
         }
         else if(_loc2_ >= right)
         {
            _loc2_ = right + right - _loc2_;
            vx = - vx;
         }
         if(_loc1_ <= top)
         {
            _loc1_ = top + top - _loc1_;
            vy = - vy;
         }
         else if(_loc1_ >= bottom)
         {
            _loc1_ = bottom + bottom - _loc1_;
            vy = - vy;
         }
         head._x = _loc2_;
         head._y = _loc1_;
      };
   }
}
