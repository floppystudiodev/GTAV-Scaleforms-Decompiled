class com.rockstargames.gtav.levelDesign.SUB_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var ref;
   var afactor = 57.2957795130823;
   var compassPointList = new Array();
   var halfWidth = 196;
   var angleSteps = 676;
   var angle = 0;
   var szone = 0.15;
   function SUB_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.compassPointList = [];
      var _loc5_ = ["N","E","S","W"];
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         mc = this.CONTENT.camMC.compassWordsMC.attachMovie("compassletter","compassletter" + _loc5_[_loc3_],this.CONTENT.camMC.compassWordsMC.getNextHighestDepth());
         mc.letterTF.text = _loc5_[_loc3_];
         mc._alpha = 0;
         this.compassPointList.push(mc);
         _loc3_ = _loc3_ + 1;
      }
      this.halfWidth = this.CONTENT.camMC.compassMC._width / 2;
      this.angleSteps = this.CONTENT.camMC.compassMC._width * 2;
   }
   function debug()
   {
      var _loc2_ = 0.15;
      this.SET_DISPLAY_CONFIG(960,720,_loc2_,_loc2_,_loc2_,_loc2_,true,true);
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.update();
      };
   }
   function update()
   {
      if(Key.isDown(37))
      {
         this.angle -= 2;
         if(this.angle < 0)
         {
            this.angle += 360;
         }
         this.SET_CAM_HEADING(this.angle);
         this.SET_CAM_CURSOR_POS(this.szone -= 0.1);
      }
      if(Key.isDown(39))
      {
         this.angle += 2;
         if(this.angle > 360)
         {
            this.angle -= 360;
         }
         this.SET_CAM_HEADING(this.angle);
         this.SET_CAM_CURSOR_POS(this.szone += 0.1);
      }
      if(Key.isDown(38))
      {
         this.szone += 0.05;
         this.SET_DISPLAY_CONFIG(1280,720,this.szone,this.szone,this.szone,this.szone,true,true);
      }
      if(Key.isDown(40))
      {
         this.szone -= 0.05;
         this.SET_DISPLAY_CONFIG(1280,720,this.szone,this.szone,this.szone,this.szone,true,true);
      }
   }
   function initScreenLayout()
   {
      var _loc4_ = this.CONTENT.camMC.borderMC;
      _loc4_._x = this.safeLeft;
      _loc4_._y = this.safeTop;
      _loc4_._width = this.safeRight - this.safeLeft;
      _loc4_._height = this.safeBottom - this.safeTop;
      var _loc3_ = 8;
      var _loc5_ = this.CONTENT.camMC.fovMC;
      _loc5_._x = this.safeRight - _loc5_._width - _loc3_;
      _loc5_._y = this.safeTop + _loc3_;
      this.positionToScreenLayout(this.CONTENT.camMC.crosshairMC,"xCC",true);
      var _loc2_ = this.CONTENT.camMC.compassMC;
      _loc2_._x = this.safeLeft + (this.safeRight - this.safeLeft) / 2;
      _loc2_._y = this.safeTop + _loc3_;
      var _loc6_ = this.CONTENT.camMC.compassWordsMC;
      _loc6_._x = this.safeLeft + (this.safeRight - this.safeLeft) / 2;
      _loc6_._y = _loc2_._y + _loc2_._height + 20;
      var _loc8_ = this.CONTENT.camMC.altitudeMC;
      _loc8_._x = this.safeLeft + _loc3_;
      var _loc7_ = this.CONTENT.camMC.footerMC;
      _loc7_._x = this.safeLeft + (this.safeRight - this.safeLeft) / 2;
      _loc7_._y = this.safeBottom - 20;
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
      for(var _loc5_ in this.compassPointList)
      {
         var _loc3_ = (a + 90 * _loc5_) % 360;
         var _loc2_ = this.compassPointList[_loc5_];
         _loc2_._x = Math.sin(_loc3_ / this.afactor) * this.halfWidth;
         _loc2_._alpha = Math.abs(_loc3_ - 180) / 1.8;
      }
      this.CONTENT.camMC.compassMC.compassInnerMC._x = 14 + _loc7_;
   }
   function SET_CAM_FOV(a)
   {
      var _loc2_ = Math.max(5,Math.min(a,50));
      this.CONTENT.camMC.fovMC.arrowMC._x = 4 + (_loc2_ - 5) * 3.7555555555;
   }
   function SET_CAM_ALT(a)
   {
      var _loc2_ = Math.max(0,Math.min(a,400));
      this.CONTENT.camMC.altitudeMC.arrowMC._y = (- _loc2_) * 0.875;
   }
   function SET_CAM_CURSOR_POS(x, y)
   {
      this.CONTENT.cursorMC._x = x * this.screenWidthPixels;
      this.CONTENT.cursorMC._y = y * this.screenHeightPixels;
   }
}
