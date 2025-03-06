class com.rockstargames.gtav.levelDesign.TURRET_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var DispConf;
   var CONTENT;
   var compassMC;
   var cWords;
   var fovMC;
   var tMC;
   var bMC;
   static var MAX_ARROW_DX = 169;
   var afactor = 57.2957795130823;
   var compassPointList = new Array();
   var compassPointList2 = new Array();
   var halfWidth = 196;
   var angleSteps = 676;
   var angle = 0;
   var szone = 0.15;
   var borderpadding = 16;
   var logoState = 0;
   function TURRET_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
      this.compassPointList = [];
      this.compassPointList2 = [];
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
      _loc4_ = 0;
      while(_loc4_ < this.compassPointList.length)
      {
         mc = this.CONTENT.camMC.compassWordsMC.attachMovie("compassletter","compassletter" + this.compassPointList[_loc4_] + "2",this.CONTENT.camMC.compassWordsMC.getNextHighestDepth());
         mc.blendMode = 8;
         mc.letterTF.text = _loc5_[_loc4_];
         mc._alpha = 0;
         mc._y = 240;
         this.compassPointList2.push(mc);
         _loc4_ = _loc4_ + 1;
      }
      this.compassMC = this.CONTENT.camMC.compassMC;
      this.cWords = this.CONTENT.camMC.compassWordsMC;
      this.fovMC = this.CONTENT.camMC.fovMC;
      this.tMC = this.CONTENT.camMC.topMarginMC;
      this.bMC = this.CONTENT.camMC.botMarginMC;
      this.halfWidth = this.compassMC._width / 2;
      this.angleSteps = this.compassMC._width * 2;
      this.initScreenLayout();
      this.SET_CAM_ALT(0);
      this.SET_CAM_FOV(0);
   }
   function initScreenLayout()
   {
      var _loc2_ = this.FILE_WIDTH / 2;
      this.CONTENT.camMC.crosshairOutlineMC._x = _loc2_ - this.CONTENT.camMC.crosshairOutlineMC._width / 2;
   }
   function SET_COMPASS_POINT_POS(mc, a, index)
   {
      mc._x = Math.sin(a / this.afactor) * this.halfWidth;
      mc._alpha = Math.abs(a - 180) / 1.8;
   }
   function SET_CAM_HEADING(a)
   {
      var _loc9_ = Math.max(0,Math.min(a,360));
      var _loc8_ = - _loc9_ / 360 * this.angleSteps;
      var _loc6_ = _loc8_ % 28;
      for(var _loc7_ in this.compassPointList)
      {
         var _loc3_ = (a + 90 * _loc7_) % 360;
         var _loc2_ = this.compassPointList[_loc7_];
         var _loc4_ = this.compassPointList2[_loc7_];
         _loc2_._x = Math.sin(_loc3_ / this.afactor) * this.halfWidth;
         _loc4_._x = _loc2_._x;
         _loc2_._alpha = Math.abs(_loc3_ - 180) / 1.8;
         _loc4_._alpha = _loc2_._alpha;
      }
      this.CONTENT.camMC.compassMC.compassInnerMC._x = 14 + _loc6_;
      this.CONTENT.camMC.compassMC.compassInnerMC2._x = 14 + _loc6_;
      this.CONTENT.camMC.compassMC2.compassInnerMC._x = 14 + _loc6_;
      this.CONTENT.camMC.compassMC2.compassInnerMC2._x = 14 + _loc6_;
   }
   function SET_CAM_FOV(a)
   {
      this.fovMC.arrowMC._x = (1 - a) * (this.fovMC.barMC._width - 2);
   }
   function SET_CAM_ALT(a)
   {
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
   }
}
