class com.rockstargames.gtav.Multiplayer.RACE_MESSAGE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var DispConf;
   var CONTENT;
   var TIMELINE;
   var currentPct = 1;
   var count = 0;
   var DURATION = 2;
   var teamOneColourHex = 16777215;
   var teamTwoColourHex = 0;
   var iActualWidth = 1280;
   function RACE_MESSAGE()
   {
      super();
      _global.gfxExtensions = true;
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.SET_MESSAGE_VISIBILITY(true);
   }
   function debug()
   {
      this.SET_RACE_MESSAGE("BIG COJONES","3x BACKFLIPS");
   }
   function initScreenLayout()
   {
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian, _actualWidth, _actualHeight)
   {
   }
   function SET_RACE_MESSAGE(titleText, strapText, iconID)
   {
      this.CONTENT.MAIN_TITLE.BIG_TEXT_MC.BIG_TEXT_TF.htmlText = titleText;
      this.CONTENT.MAIN_TITLE.STRAP_LINE.MESSAGE_TEXT.htmlText = strapText;
      this.CONTENT.MAIN_TITLE._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.TIMELINE,this.DURATION,{onComplete:this.REMOVE_MESSAGE,onCompleteScope:this});
   }
   function REMOVE_MESSAGE()
   {
      this.CONTENT.MAIN_TITLE._alpha = 0;
   }
   function OVERRIDE_DURATION(dur)
   {
      this.DURATION = dur;
   }
   function SET_MESSAGE_VISIBILITY(isVisible)
   {
      this.CONTENT.MAIN_TITLE._visible = isVisible;
   }
   function log(str)
   {
   }
}
