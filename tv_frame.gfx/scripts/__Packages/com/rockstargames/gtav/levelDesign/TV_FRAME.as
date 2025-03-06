class com.rockstargames.gtav.levelDesign.TV_FRAME extends com.rockstargames.ui.core.BaseScreenLayout
{
   var frameMC;
   var CONTENT;
   var safeMC;
   function TV_FRAME()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.frameMC = this.CONTENT.frameMC;
      this.safeMC = this.frameMC.safeMC;
      this.safeMC._visible = false;
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.frameMC._xscale = (this.safeRight - this.safeLeft) / this.safeMC._width * 100;
      this.frameMC._yscale = (this.safeBottom - this.safeTop) / this.safeMC._height * 100;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
}
