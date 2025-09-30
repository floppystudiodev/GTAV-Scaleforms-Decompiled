class com.rockstargames.gtav.levelDesign.SECURITY_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var camMC;
   var extraMC;
   var innerFrameMC;
   var layoutType;
   var locationMC;
   var outerFrameMC;
   var timeMC;
   static var CAMERA_TYPE_SECURITY = 0;
   static var CAMERA_TYPE_DSLR = 1;
   var szone = 0;
   var framePadding = 15;
   function SECURITY_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.SET_LAYOUT(com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY);
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      this.isWideScreen = _isWideScreen;
      var _loc7_;
      var _loc6_;
      var _loc4_;
      var _loc5_;
      if(!this.isWideScreen)
      {
         _loc7_ = 1.7777777777777777;
         _loc6_ = 1.3333333333333333;
         _loc4_ = 1280;
         _loc5_ = 720;
         _loc3_ = (_loc4_ - Math.round(_loc4_ / _loc7_ * _loc6_)) / 2;
         _loc2_ = 0;
         this.screenWidthPixels = _loc4_ - _loc3_ * 2;
         this.screenHeightPixels = _loc5_ - _loc2_ * 2;
      }
      this.safeTop = _loc2_ + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
      this.safeBottom = _loc2_ + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
      this.safeLeft = Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100)) + _loc3_;
      this.safeRight = Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100)) - _loc3_;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
      }
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      switch(this.layoutType)
      {
         case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_DSLR:
            this.timeMC._x = this.safeLeft;
            this.timeMC._y = this.safeBottom - this.timeMC._height;
            this.locationMC._x = this.safeLeft;
            this.locationMC._y = this.safeTop - 5;
            this.outerFrameMC._x = this.safeLeft - this.framePadding * 1.5;
            this.outerFrameMC._y = this.safeTop - this.framePadding;
            this.outerFrameMC._width = this.safeRight - this.safeLeft + this.framePadding * 3;
            this.outerFrameMC._height = this.safeBottom - this.safeTop + this.framePadding * 2;
            this.innerFrameMC._width = this.outerFrameMC._width / 3;
            this.innerFrameMC._height = this.outerFrameMC._height / 3;
            this.positionToScreenLayout(this.innerFrameMC,"CC",true);
            return;
         case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY:
         default:
            this.timeMC._x = this.safeLeft;
            this.timeMC._y = this.safeTop;
            this.locationMC._x = this.safeRight - this.locationMC._width;
            this.locationMC._y = this.safeTop;
            this.extraMC._x = this.safeRight - this.extraMC._width;
            this.extraMC._y = !this.locationMC._visible ? this.safeTop : this.safeTop + this.locationMC.bgMC._height + 4;
            return;
      }
   }
   function SET_LAYOUT(type)
   {
      this.layoutType = type;
      if(this.camMC != undefined)
      {
         this.camMC.removeMovieClip();
      }
      switch(this.layoutType)
      {
         case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_DSLR:
            this.camMC = this.CONTENT.attachMovie("lesterCam","camMC",this.CONTENT.getNextHighestDepth(),{_alpha:70});
            this.innerFrameMC = this.camMC.innerFrameMC;
            this.outerFrameMC = this.camMC.outerFrameMC;
            break;
         case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY:
         default:
            this.camMC = this.CONTENT.attachMovie("securityCam","camMC",this.CONTENT.getNextHighestDepth());
            this.extraMC = this.camMC.extraMC;
      }
      this.locationMC = this.camMC.locationMC;
      this.timeMC = this.camMC.timeMC;
      this.locationMC.labelTF.autoSize = "left";
      this.extraMC.labelTF.autoSize = "left";
      this.timeMC.tt.autoSize = "left";
      this.initScreenLayout();
   }
   function SET_LOCATION(loc)
   {
      if(loc != undefined)
      {
         this.locationMC._visible = true;
         this.locationMC.labelTF.htmlText = loc.toUpperCase();
         this.locationMC.bgMC._width = this.locationMC.labelTF._width + 5;
      }
      else
      {
         this.locationMC._visible = false;
      }
      this.initScreenLayout();
   }
   function SET_DETAILS(details)
   {
      if(details != undefined)
      {
         this.extraMC._visible = true;
         this.extraMC.labelTF.htmlText = details.toUpperCase();
         this.extraMC.bgMC._width = this.extraMC.labelTF._width + 5;
      }
      else
      {
         this.extraMC._visible = false;
      }
      this.initScreenLayout();
   }
   function SET_TIME(hh, mm, ss, tt)
   {
      var _loc6_;
      var _loc5_;
      if(arguments.length > 0)
      {
         this.timeMC._visible = true;
         _loc6_ = hh <= 9 ? "0" + hh : String(hh);
         _loc5_ = mm <= 9 ? "0" + mm : String(mm);
         this.timeMC.hh.htmlText = _loc6_;
         this.timeMC.mm.htmlText = _loc5_;
         if(tt != undefined)
         {
            this.timeMC.tt.htmlText = tt.toUpperCase();
         }
         this.timeMC.bgMC._width = this.timeMC.tt._x + this.timeMC.tt._width;
         if(tt != undefined && tt != "")
         {
            this.timeMC.bgMC._width += 6;
         }
      }
      else
      {
         this.timeMC._visible = false;
      }
   }
}
