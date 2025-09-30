class com.rockstargames.gtav.levelDesign.BREAKING_NEWS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var FILE_WIDTH;
   var FOUR_THREE_PADDING;
   var bottomMC;
   var bottomStrings;
   var isHiDef;
   var isWideScreen;
   var liveMC;
   var logoMC;
   var lowerThirdMC;
   var mainBarMC;
   var rimMC;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   var screenWidthPixels;
   var staticMC;
   var storedStrings;
   var titleTextTF;
   var topMC;
   var topStrings;
   static var SCREEN_STATIC_NONE = -1;
   static var SCREEN_STATIC_NOISE = 0;
   static var SCREEN_STATIC_BLUE = 1;
   static var TICKER_TOP = 0;
   static var TICKER_BOTTOM = 1;
   var _buttonYClearance = 20;
   var subTitleText = "";
   function BREAKING_NEWS()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.topStrings = [];
      this.bottomStrings = [];
      this.storedStrings = [];
      this.storedStrings[com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_TOP] = this.topStrings;
      this.storedStrings[com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM] = this.bottomStrings;
      this.lowerThirdMC = this.CONTENT.attachMovie("lowerThird","lowerThirdMC",this.CONTENT.getNextHighestDepth());
      this.topMC = com.rockstargames.gtav.levelDesign.BreakingNewsTicker(this.lowerThirdMC.attachMovie("tickerTop","topMC",this.lowerThirdMC.getNextHighestDepth()));
      this.bottomMC = com.rockstargames.gtav.levelDesign.BreakingNewsTicker(this.lowerThirdMC.attachMovie("tickerBottom","bottomMC",this.lowerThirdMC.getNextHighestDepth(),{_y:80}));
      this.lowerThirdMC.logoMC.swapDepths(this.lowerThirdMC.getNextHighestDepth());
      this.lowerThirdMC.titleTextMC.swapDepths(this.lowerThirdMC.getNextHighestDepth());
      this.titleTextTF.fauxBold = true;
      this.titleTextTF = this.lowerThirdMC.titleTextMC.titleTextTF;
      this.rimMC = this.lowerThirdMC.rimMC;
      this.rimMC.swapDepths(this.lowerThirdMC.getNextHighestDepth());
      this.logoMC = this.lowerThirdMC.logoMC;
      this.logoMC.swapDepths(this.lowerThirdMC.getNextHighestDepth());
      this.mainBarMC = this.lowerThirdMC.mainBarMC;
      this.liveMC = this.lowerThirdMC.liveMC;
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.topMC.setLabelSafeZone(this.safeLeft);
      this.bottomMC.setLabelSafeZone(this.safeLeft);
      this.lowerThirdMC._y = this.safeBottom - 150 - this._buttonYClearance;
      this.liveMC._x = this.safeRight;
      this.liveMC.barMC._width = this.FILE_WIDTH - this.safeRight + 1;
      this.logoMC._x = this.safeRight;
      this.mainBarMC.barMC._width = this.mainBarMC.tipMC._x = this.safeRight - 256;
      this.titleTextTF._x = this.safeLeft;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.topMC.setLabelSafeZone(this.safeLeft);
      this.bottomMC.setLabelSafeZone(this.safeLeft);
      this.initScreenLayout();
   }
   function SET_TEXT(titleT, subT)
   {
      if(titleT != undefined)
      {
         this.titleTextTF.text = titleT;
      }
      var _loc2_;
      if(subT != undefined)
      {
         _loc2_ = this.bottomStrings.length;
         this.SET_SCROLL_TEXT(com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM,_loc2_,subT);
         this.DISPLAY_SCROLL_TEXT(com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM,_loc2_);
      }
   }
   function SET_SCROLL_TEXT(slot, id, str)
   {
      this.storedStrings[slot][id] = str;
   }
   function DISPLAY_SCROLL_TEXT(slot, id, scrollSpeed)
   {
      var _loc2_ = this.storedStrings[slot][id];
      var _loc3_;
      if(_loc2_ != undefined && _loc2_ != "")
      {
         _loc3_ = this.getTicker(slot);
         _loc3_.DISPLAY_SCROLL_TEXT(_loc2_,scrollSpeed);
      }
      else
      {
         this.CLEAR_SCROLL_TEXT(slot);
      }
   }
   function CLEAR_SCROLL_TEXT(slot)
   {
      var _loc2_ = this.getTicker(slot);
      _loc2_.CLEAR_SCROLL_TEXT();
   }
   function getTicker(slot)
   {
      return slot != com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM ? this.topMC : this.bottomMC;
   }
   function SHOW_STATIC(staticType)
   {
      this.lowerThirdMC._visible = false;
      switch(staticType)
      {
         case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_NONE:
            this.staticMC.removeMovieClip();
            this.staticMC = undefined;
            this.lowerThirdMC._visible = true;
            return;
         case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_BLUE:
            this.staticMC = this.CONTENT.attachMovie("noise_animation_blue","staticMC",1000,{_width:this.screenWidthPixels});
            return;
         case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_NOISE:
         default:
            this.staticMC = this.CONTENT.attachMovie("noise_animation","staticMC",1000,{_width:this.screenWidthPixels});
            return;
      }
   }
}
