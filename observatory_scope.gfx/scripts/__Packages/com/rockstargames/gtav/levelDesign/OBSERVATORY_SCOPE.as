class com.rockstargames.gtav.levelDesign.OBSERVATORY_SCOPE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var isHiDef;
   var isWideScreen;
   var positionToScreenLayout;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   function OBSERVATORY_SCOPE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc9_;
      var _loc8_;
      var _loc4_;
      var _loc7_;
      if(!_isWideScreen)
      {
         _loc9_ = 1.7777777777777777;
         _loc8_ = 1.3333333333333333;
         _loc4_ = 1280;
         _loc7_ = 720;
         _loc3_ = (_loc4_ - Math.round(_loc4_ / _loc9_ * _loc8_)) / 2;
         _loc2_ = 0;
         _screenWidthPixels = _loc4_ - _loc3_ * 2;
         _screenHeightPixels = _loc7_ - _loc2_ * 2;
      }
      this.safeTop = _loc2_ + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
      this.safeBottom = _loc2_ + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
      this.safeLeft = _loc3_ + Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100));
      this.safeRight = _loc3_ + Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100));
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
      }
      this.isHiDef = _isHiDef;
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.positionToScreenLayout(this.CONTENT.scopeMC,"CC",true);
   }
}
