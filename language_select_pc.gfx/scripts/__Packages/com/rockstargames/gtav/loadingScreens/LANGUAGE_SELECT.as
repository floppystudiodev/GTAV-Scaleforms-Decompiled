class com.rockstargames.gtav.loadingScreens.LANGUAGE_SELECT extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var rowSpace = 40;
   var highlightOffset = 0;
   var highlightHeight = 32;
   var highlightIndex = 0;
   var languageList = new Array();
   var languageCount = 0;
   function LANGUAGE_SELECT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.highlightIndex = 0;
      this.CONTENT.highlightMC.innerMC._height = this.highlightHeight;
      this.CONTENT.highlightMC.acceptMC._y = this.highlightHeight / 2;
      this.CONTENT.highlightMC._visible = this.CONTENT.languagesMC._visible = false;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian)
   {
      if(_isCircleAccept != undefined)
      {
         var _loc2_ = _isCircleAccept != true ? 1 : 2;
         this.CONTENT.highlightMC.acceptMC.gotoAndStop(_loc2_);
      }
   }
   function GET_CURRENT_SELECTION()
   {
      return this.languageList[this.highlightIndex];
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         _loc2_ = this.highlightIndex - 1;
         if(_loc2_ < 0)
         {
            _loc2_ = this.languageCount - 1;
         }
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         _loc2_ = this.highlightIndex + 1;
         if(_loc2_ > this.languageCount - 1)
         {
            _loc2_ = 0;
         }
      }
      this.highlightIndex = _loc2_;
      this.SET_HIGHLIGHT();
   }
   function clearLanguages()
   {
      var _loc4_ = ["LANGUAGE_UNDEFINED","LANGUAGE_ENGLISH","LANGUAGE_FRENCH","LANGUAGE_GERMAN","LANGUAGE_ITALIAN","LANGUAGE_SPANISH","LANGUAGE_PORTUGUESE","LANGUAGE_POLISH","LANGUAGE_RUSSIAN","LANGUAGE_KOREAN","LANGUAGE_CHINESE","LANGUAGE_JAPANESE","LANGUAGE_MEXICAN"];
      var _loc5_ = this.CONTENT.languagesMC;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc5_[_loc4_[_loc2_]];
         _loc3_._visible = false;
         _loc3_._y = 0;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_LANGUAGES()
   {
      var _loc8_ = arguments;
      this.clearLanguages();
      var _loc7_ = ["LANGUAGE_UNDEFINED","LANGUAGE_ENGLISH","LANGUAGE_FRENCH","LANGUAGE_GERMAN","LANGUAGE_ITALIAN","LANGUAGE_SPANISH","LANGUAGE_PORTUGUESE","LANGUAGE_POLISH","LANGUAGE_RUSSIAN","LANGUAGE_KOREAN","LANGUAGE_CHINESE","LANGUAGE_JAPANESE","LANGUAGE_MEXICAN"];
      this.languageList = _loc8_;
      var _loc6_ = this.CONTENT.languagesMC;
      this.languageCount = 0;
      var _loc3_ = 0;
      while(_loc3_ < this.languageList.length)
      {
         var _loc4_ = this.languageList[_loc3_];
         if(_loc4_ != 0 && _loc4_ != undefined)
         {
            var _loc5_ = _loc6_[_loc7_[_loc4_]];
            _loc5_._y = this.languageCount * this.rowSpace;
            _loc5_._visible = true;
            this.languageCount = this.languageCount + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc6_._y = 360 - _loc6_._height / 2;
      this.CONTENT.highlightMC._visible = this.CONTENT.languagesMC._visible = true;
      this.SET_HIGHLIGHT();
   }
   function SET_HIGHLIGHT()
   {
      var _loc3_ = this.CONTENT.highlightMC;
      var _loc2_ = this.CONTENT.languagesMC._y;
      _loc3_._y = _loc2_ + this.highlightIndex * this.rowSpace + this.highlightOffset;
   }
}
