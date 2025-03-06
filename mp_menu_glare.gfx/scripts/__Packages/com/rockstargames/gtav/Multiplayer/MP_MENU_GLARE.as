class com.rockstargames.gtav.Multiplayer.MP_MENU_GLARE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var headerMC;
   var CONTENT;
   var glareMC;
   var glareMaskMC;
   var glintMC;
   var easeInCur;
   var easeInDuration;
   var onEnterFrame;
   var ref;
   var gx1 = 230;
   var gr1 = -55;
   var ga1 = 20;
   var gx2 = 290;
   var gr2 = -30;
   var ga2 = 20;
   var targetAngle = 0;
   var position = 0;
   var easedPosition = 0;
   function MP_MENU_GLARE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.headerMC = this.CONTENT.headerMC;
      this.headerMC.ref = this;
      this.glareMC = this.headerMC.glareMC;
      this.glareMaskMC = this.headerMC.glareMaskMC;
      this.glareMC.setMask(this.glareMaskMC);
      this.glintMC = this.headerMC.glintMC;
      this.CONTENT._alpha = 0;
      this.CONTENT.easeInDuration = 30;
      this.CONTENT.easeInCur = 0;
      this.CONTENT.onEnterFrame = function()
      {
         this._alpha = com.rockstargames.ui.tweenStar.easing.Quad.easeOut(this.easeInCur++,0,100,this.easeInDuration);
         if(this.easeInCur >= this.easeInDuration)
         {
            this._alpha == 100;
            this.onEnterFrame = undefined;
         }
      };
   }
   function initScreenLayout()
   {
      this.headerMC._x = this.safeLeft;
      if(this.isWideScreen)
      {
         this.headerMC._xscale = 100;
         this.headerMC._y = this.safeTop;
      }
      else
      {
         this.headerMC._xscale = 75;
         this.headerMC._y = this.safeTop + 1;
      }
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         var _loc4_ = 1.7777777777777777;
         var _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function SET_DATA_SLOT(angle, triggerGlintAni)
   {
      if(triggerGlintAni)
      {
         this.glintMC.gotoAndPlay(2);
      }
      this.targetAngle = angle % 360;
      if(this.headerMC.onEnterFrame == undefined)
      {
         this.headerMC.onEnterFrame = this._updateDisplay;
      }
   }
   function _updateDisplay()
   {
      var targetPosition = this.ref.targetAngle % 180 / 180;
      if(this.ref.targetAngle > 180)
      {
         targetPosition = 1 - targetPosition;
      }
      this.ref.position += (targetPosition - this.ref.position) / 16;
      this.ref.easedPosition = com.rockstargames.ui.tweenStar.easing.Quad.easeInOut(this.ref.position,0,1,1);
      if(this.ref.position > targetPosition - 0.01 && this.ref.position < targetPosition + 0.01)
      {
         this.onEnterFrame = undefined;
      }
      with(this.ref)
      {
         glareMC._x = gx1 + (gx2 - gx1) * easedPosition;
         glareMC._rotation = gr1 + (gr2 - gr1) * easedPosition;
         glareMC._alpha = ga1 + (ga2 - ga1) * easedPosition;
      }
   }
}
