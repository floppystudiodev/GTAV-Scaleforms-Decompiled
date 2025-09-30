class com.rockstargames.gtav.levelDesign.HELI_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var DispConf;
   var FILE_WIDTH;
   var FOUR_THREE_PADDING;
   var altitudeMC;
   var bMC;
   var cWords;
   var compassMC;
   var fovMC;
   var getDisplayConfig;
   var hdAutoMC;
   var logoMC;
   var safeLeft;
   var safeRight;
   var safeTop;
   var screenHeightPixels;
   var tMC;
   static var MAX_ARROW_DX = 169;
   var afactor = 57.2957795130823;
   var compassPointList = new Array();
   var halfWidth = 196;
   var angleSteps = 676;
   var angle = 0;
   var szone = 0.15;
   var borderpadding = 16;
   var logoState = 0;
   function HELI_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
      this.compassPointList = [];
      var _loc5_ = ["N","E","S","W"];
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         mc = this.CONTENT.camMC.compassWordsMC.attachMovie("compassletter","compassletter" + _loc5_[_loc4_],this.CONTENT.camMC.compassWordsMC.getNextHighestDepth());
         mc.blendMode = 8;
         mc.letterTF.text = _loc5_[_loc4_];
         mc._alpha = 0;
         this.compassPointList.push(mc);
         _loc4_ = _loc4_ + 1;
      }
      this.compassMC = this.CONTENT.camMC.compassMC;
      this.altitudeMC = this.CONTENT.camMC.altitudeMC;
      this.cWords = this.CONTENT.camMC.compassWordsMC;
      this.hdAutoMC = this.CONTENT.camMC.hdAutoMC;
      this.logoMC = this.CONTENT.camMC.logoMC;
      this.fovMC = this.CONTENT.camMC.fovMC;
      this.tMC = this.CONTENT.camMC.topMarginMC;
      this.bMC = this.CONTENT.camMC.botMarginMC;
      this.halfWidth = this.compassMC._width / 2;
      this.angleSteps = this.compassMC._width * 2;
      this.SET_AUDIO_STATES(false,false,false);
      this.initScreenLayout();
      this.SET_CAM_ALT(0);
      this.SET_CAM_FOV(0);
   }
   function initScreenLayout()
   {
      var _loc2_ = this.FILE_WIDTH / 2;
      this.CONTENT.camMC.crosshairOutlineMC._x = _loc2_ - this.CONTENT.camMC.crosshairOutlineMC._width / 2;
      this.compassMC._y = this.safeTop;
      this.cWords._y = this.compassMC._y + this.compassMC._height + 20;
      this.hdAutoMC._y = this.safeTop;
      this.tMC._height = Math.round(this.hdAutoMC._y + this.hdAutoMC._height + this.borderpadding);
      this.bMC._height = this.tMC._height + 32;
      this.bMC._y = this.screenHeightPixels - this.bMC._height;
      this.altitudeMC._x = this.FOUR_THREE_PADDING + this.safeLeft;
      this.altitudeMC._y = (this.bMC._y - this.tMC._height - this.altitudeMC._height) / 2 + this.tMC._height;
      this.logoMC._x = this.FOUR_THREE_PADDING + this.safeRight - this.logoMC._width;
      this.hdAutoMC._x = this.FOUR_THREE_PADDING + this.safeRight - this.hdAutoMC._width;
      this.fovMC._x = this.FOUR_THREE_PADDING + this.safeRight - this.fovMC.barMC._width;
      this.logoMC._y = this.tMC._y + this.tMC._height + this.borderpadding;
      this.logoMC._y = this.tMC._y + this.tMC._height + this.borderpadding;
      this.fovMC._y = this.logoMC._y + this.logoMC._height + 10;
   }
   function SET_COMPASS_POINT_POS(mc, a, index)
   {
      mc._x = Math.sin(a / this.afactor) * this.halfWidth;
      mc._alpha = Math.abs(a - 180) / 1.8;
   }
   function SET_CAM_HEADING(a)
   {
      var _loc8_ = Math.max(0,Math.min(a,360));
      var _loc6_ = - _loc8_ / 360 * this.angleSteps;
      var _loc7_ = _loc6_ % 28;
      var _loc3_;
      var _loc2_;
      for(var _loc5_ in this.compassPointList)
      {
         _loc3_ = (a + 90 * _loc5_) % 360;
         _loc2_ = this.compassPointList[_loc5_];
         _loc2_._x = Math.sin(_loc3_ / this.afactor) * this.halfWidth;
         _loc2_._alpha = Math.abs(_loc3_ - 180) / 1.8;
      }
      this.CONTENT.camMC.compassMC.compassInnerMC._x = 14 + _loc7_;
   }
   function SET_CAM_FOV(a)
   {
      this.fovMC.arrowMC._x = (1 - a) * (this.fovMC.barMC._width - 2);
   }
   function SET_CAM_ALT(a)
   {
      var _loc2_ = 400;
      var _loc4_ = Math.max(0,Math.min(a,_loc2_));
      var _loc5_ = 372;
      var _loc3_ = 12;
      this.altitudeMC.arrowMC._y = (_loc2_ - _loc4_) * ((_loc5_ - _loc3_) / _loc2_) + _loc3_;
   }
   function SET_ALT_FOV_HEADING(a, f, h)
   {
      if(a != undefined)
      {
         this.SET_CAM_ALT(a);
      }
      if(f != undefined)
      {
         this.SET_CAM_FOV(f);
      }
      if(h != undefined)
      {
         this.SET_CAM_HEADING(h);
      }
   }
   function SET_CAM_LOGO(value)
   {
      this.logoState = value;
      this.logoMC.gotoAndStop(this.logoState + 1);
   }
   function SET_AUDIO_STATES(smallLine, mediumLine, largeLine)
   {
      this.CONTENT.audioWaveSmallMC._visible = smallLine;
      this.CONTENT.audioWaveMediumMC._visible = mediumLine;
      this.CONTENT.audioWaveBigMC._visible = largeLine;
   }
}
