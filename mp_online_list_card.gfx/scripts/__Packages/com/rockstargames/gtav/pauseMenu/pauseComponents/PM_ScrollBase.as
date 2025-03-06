class com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase extends MovieClip
{
   var scrollPosTXT;
   var scrollPosMC;
   var upDownMC;
   var allArrowsMC;
   var bgMC;
   var _currentPosition;
   var _maxPosition;
   var _maxVisible;
   var _caption;
   var _component;
   var _model;
   var _columnSpan;
   var _scrollType;
   var _arrowPosition;
   var arrowsMC;
   var captionBlipLayer;
   static var SCROLL_TYPE_ALL = 0;
   static var SCROLL_TYPE_UP_DOWN = 1;
   static var SCROLL_TYPE_LEFT_RIGHT = 2;
   static var SCROLL_TYPE_NONE = 3;
   static var POSITION_ARROW_LEFT = 0;
   static var POSITION_ARROW_CENTER = 1;
   static var POSITION_ARROW_RIGHT = 2;
   var _maxPositionSet = false;
   var _captionOn = false;
   var _codeOverride = false;
   var forceInvisible = false;
   function PM_ScrollBase()
   {
      super();
      this.scrollPosTXT = this.scrollPosMC.scrollPosTXT;
      this.scrollPosTXT.autoSize = true;
      this.scrollPosTXT.html = true;
      this.scrollPosMC._visible = false;
      this.upDownMC._visible = false;
      this.allArrowsMC._visible = false;
      this._y = 432;
      this._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.allArrowsMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.upDownMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, columnXOffset, forceInvisible)
   {
      this._codeOverride = override;
      this.setColumnSpan(columns);
      this.setArrows(scrollType,arrowPosition);
      if(columnXOffset != undefined)
      {
         this._x = 290 * columnXOffset;
      }
      this.forceInvisible = forceInvisible;
      this._visible = !forceInvisible ? (visible == undefined ? false : visible) : false;
      this.updateScroll();
   }
   function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption, forceInvisible)
   {
      this._currentPosition = currentPosition;
      this._maxPosition = maxPosition;
      this._maxVisible = maxVisible;
      this.forceInvisible = forceInvisible;
      if(caption != undefined && caption != "")
      {
         this.SET_CAPTION(caption);
      }
      else
      {
         this.CLEAR_CAPTION();
      }
   }
   function SET_CAPTION(caption)
   {
      this._captionOn = true;
      this._caption = caption;
      this.updateScroll();
   }
   function CLEAR_CAPTION()
   {
      this._captionOn = false;
      this._caption = undefined;
      this.updateScroll();
   }
   function displayEnabled()
   {
      return !this.forceInvisible ? this._currentPosition != -1 || this._maxPosition != -1 || this._maxVisible != -1 || this._captionOn : false;
   }
   function init(component, columns, scrollType, arrowPosition, codeOverride)
   {
      this._codeOverride = codeOverride;
      this.setComponent(component);
      this.setColumnSpan(columns);
      this.setArrows(scrollType,arrowPosition);
      this.updateScroll();
   }
   function setComponent(component)
   {
      this._component = component == undefined ? null : component;
      this._model = this._component.model;
      this.updateScroll();
   }
   function setColumnSpan(columns)
   {
      if(columns > 0)
      {
         this._visible = this.displayEnabled();
         this._columnSpan = columns;
         this.bgMC._width = 290 * this._columnSpan - 2;
         this.updateDisplay();
      }
      this._visible = false;
      return undefined;
   }
   function setArrows(type, position)
   {
      this._scrollType = type;
      this._arrowPosition = position;
      switch(this._scrollType)
      {
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_ALL:
            this.upDownMC._visible = false;
            this.allArrowsMC._visible = true;
            this.arrowsMC = this.allArrowsMC;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_LEFT_RIGHT:
            this.allArrowsMC._visible = false;
            this.upDownMC._visible = true;
            this.upDownMC._rotation = 90;
            this.arrowsMC = this.upDownMC;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_NONE:
            this.allArrowsMC._visible = false;
            this.upDownMC._visible = false;
            this.arrowsMC = this.upDownMC;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_UP_DOWN:
         default:
            this.allArrowsMC._visible = false;
            this.upDownMC._visible = true;
            this.upDownMC._rotation = 0;
            this.arrowsMC = this.upDownMC;
      }
      this.scrollPosMC._visible = false;
      switch(this._arrowPosition)
      {
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT:
            this.scrollPosMC._visible = true;
            this.arrowsMC._x = this.bgMC._width - this.arrowsMC._width / 2 - 8;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_LEFT:
            this.arrowsMC._x = 8 + this.arrowsMC._width / 2;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_CENTER:
         default:
            this.arrowsMC._x = this.bgMC._width / 2;
      }
      this.updateDisplay();
   }
   function updateScroll()
   {
      if(!this._codeOverride)
      {
         this._currentPosition = this._model.getCurrentSelection();
         this._maxPosition = this._model.getCurrentView().maxitems;
         this._maxVisible = this._model.getCurrentView().visibleItems;
      }
      this.updateDisplay();
   }
   function updateDisplay()
   {
      this.scrollPosMC._visible = false;
      if(this.captionBlipLayer != undefined)
      {
         this.captionBlipLayer.removeMovieClip();
      }
      if(this._captionOn)
      {
         this.scrollPosMC._visible = true;
         this.captionBlipLayer = this.scrollPosMC.createEmptyMovieClip("captionBlipLayer",1000);
         var _loc3_ = new com.rockstargames.ui.utils.Text();
         _loc3_.setTextWithIcons(this._caption,this.captionBlipLayer,this.scrollPosTXT,0,13.5,0,false);
      }
      else if(this._arrowPosition == com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT && this._maxPosition > 0)
      {
         this.scrollPosMC._visible = true;
         if(this._currentPosition >= 0)
         {
            var _loc2_ = this._currentPosition;
            _loc2_ = _loc2_++ <= this._maxPosition ? _loc2_ : this._maxPosition;
            this.scrollPosTXT.text = _loc2_ + "/" + this._maxPosition;
         }
         else
         {
            this.scrollPosTXT.text = this._maxPosition + "";
         }
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.scrollPosMC.scrollPosTXT,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this._visible = this.displayEnabled();
   }
}
