class com.rockstargames.gtav.loadingScreens.LANDING_PAGE
{
   var TIMELINE;
   var _availableSpaceForButtons;
   var _buttonsBackground;
   var _buttonsContainer;
   var _landingPageButtons;
   var _totalWidthOfAllButtons;
   static var BUTTONS_BG_HEIGHT = 50;
   static var BUTTONS_TO_LOGO_MIN_SPACING = 20;
   static var BUTTONS_BG_PADDING = 32;
   static var LOGO_WIDTH = 186;
   var _screenWidth = 1280;
   var _screenHeight = 720;
   var _safeTop = 29;
   var _safeBottom = 29;
   var _safeLeft = 51;
   var _safeRight = 51;
   var _isWideScreen = true;
   var _isHiDef = true;
   function LANDING_PAGE()
   {
   }
   function debug()
   {
      var _loc2_;
      var _loc3_;
      if(this._isWideScreen)
      {
         _loc2_ = 1280;
         _loc3_ = 720;
      }
      else
      {
         _loc2_ = 960;
         _loc3_ = 720;
         Stage.scaleMode = "noBorder";
      }
   }
   function INITIALISE(mc)
   {
      _global.gfxExtensions = true;
      this.TIMELINE = mc;
      this._landingPageButtons = [];
      this._totalWidthOfAllButtons = 0;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, isWideScreen, _isHiDef, _isAsian)
   {
      this._isWideScreen = isWideScreen;
      _isHiDef;
      var _loc2_;
      var _loc3_;
      if(this._isWideScreen)
      {
         _loc2_ = 1280;
         _loc3_ = 720;
      }
      else
      {
         _loc2_ = 960;
         _loc3_ = 720;
         Stage.scaleMode = "noBorder";
      }
      this._safeLeft = Math.round(_loc2_ * _safeLeftPercent);
      this._safeRight = Math.round(_loc2_ * _safeRightPercent);
      this._safeTop = Math.round(_loc3_ * _safeTopPercent);
      this._safeBottom = Math.round(_loc3_ * _safeBottomPercent);
      this.alignElements();
   }
   function INIT_LANDING_PAGE()
   {
      var _loc3_ = arguments;
      this.initButtons(_loc3_);
      this.alignElements();
   }
   function SET_BUTTON_SELECTED(buttonId)
   {
      var _loc4_ = this._landingPageButtons.length;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = com.rockstargames.gtav.loadingScreens.LandingPageButton(this._landingPageButtons[_loc2_]);
         _loc3_.setHighlight(_loc3_.buttonId == buttonId);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initButtons(dataArray)
   {
      if(!this._buttonsContainer)
      {
         this._buttonsContainer = this.TIMELINE.createEmptyMovieClip("ButtonsContainer",this.TIMELINE.getNextHighestDepth());
      }
      if(!this._buttonsBackground)
      {
         this._buttonsBackground = this._buttonsContainer.attachMovie("GradientMC","GradientMC",this._buttonsContainer.getNextHighestDepth(),{_height:com.rockstargames.gtav.loadingScreens.LANDING_PAGE.BUTTONS_BG_HEIGHT});
      }
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc4_);
      var _loc5_ = dataArray.length - 1;
      var _loc3_ = _loc5_;
      var _loc2_;
      while(_loc3_ >= 0)
      {
         _loc2_ = com.rockstargames.gtav.loadingScreens.LandingPageButton(this._buttonsContainer.attachMovie("LandingPageButtonMC","LandingPageButtonMC" + _loc3_,this._buttonsContainer.getNextHighestDepth()));
         _loc2_.init(_loc3_,dataArray[_loc3_],_loc4_);
         _loc2_.setHighlight(false);
         _loc2_._x = - _loc2_._width - this._totalWidthOfAllButtons;
         _loc2_._y = - _loc2_._height;
         this._totalWidthOfAllButtons += _loc2_._width;
         this._landingPageButtons.push(_loc2_);
         _loc3_ = _loc3_ - 1;
      }
      this._buttonsBackground._width = Math.max(this._totalWidthOfAllButtons + com.rockstargames.gtav.loadingScreens.LANDING_PAGE.BUTTONS_BG_PADDING,860);
   }
   function alignElements()
   {
      var _loc2_;
      if(this._buttonsContainer)
      {
         this._buttonsContainer._x = this._safeRight;
         this._buttonsContainer._y = this._safeBottom;
         this._buttonsContainer._xscale = this._buttonsContainer._yScale = 100;
         this._availableSpaceForButtons = this._safeRight - this._safeLeft - com.rockstargames.gtav.loadingScreens.LANDING_PAGE.BUTTONS_TO_LOGO_MIN_SPACING - com.rockstargames.gtav.loadingScreens.LANDING_PAGE.LOGO_WIDTH;
         if(this._availableSpaceForButtons < this._totalWidthOfAllButtons)
         {
            _loc2_ = this._totalWidthOfAllButtons - this._availableSpaceForButtons;
            this._buttonsContainer._width -= _loc2_;
            this._buttonsContainer._yscale = this._buttonsContainer._xscale;
         }
      }
   }
}
