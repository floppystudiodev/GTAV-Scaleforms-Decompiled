class com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   var slots;
   var displayStateBM;
   var titleTF;
   var CONTENT;
   var titleFontSize;
   var panelMC;
   var bgFillMC;
   var bgTopMC;
   var bgBottomMC;
   var barMC;
   var subtitleTF;
   var displayConfig;
   var _slotContainer;
   var slotJustifiedFormat;
   static var SLOT_SELECTED = 0;
   static var SLOT_JUSTIFIED = 1;
   static var DISPLAY_TITLE = 0;
   static var DISPLAY_SUBTITLE = 1;
   static var DISPLAY_SLOTS = 2;
   var rowStartY = 192;
   var rowYSpacing = 25;
   var rowXPadding = 10;
   var widestSlot = 0;
   var _supressUpdate = false;
   function MP_RESULTS_PANEL()
   {
      super();
      this.slots = [];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.displayStateBM = new com.rockstargames.ui.utils.BitMonger();
      this.titleTF = this.CONTENT.titleTF;
      this.titleTF.autoSize = "center";
      this.titleTF.antiAliasType = "normal";
      this.titleFontSize = 67;
      this.panelMC = this.CONTENT.panelMC;
      this.panelMC._visible = false;
      this.bgFillMC = this.panelMC.fillMC;
      this.bgTopMC = this.panelMC.topMC;
      this.bgBottomMC = this.panelMC.bottomMC;
      this.barMC = this.CONTENT.panelMC.barMC;
      this.barMC._visible = false;
      this.barMC._y = 0;
      this.subtitleTF = this.CONTENT.panelMC.subtitleTF;
      this.subtitleTF.autoSize = "center";
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this._slotContainer = this.panelMC.createEmptyMovieClip("_slotContainer",this.panelMC.getNextHighestDepth());
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.CONTENT._x = this.screenWidthPixels / 2;
   }
   function SET_TITLE(title)
   {
      this.titleTF.htmlText = title == undefined ? "" : title;
      if(this.displayConfig.isAsian)
      {
         this.resizeAsianText(this.titleTF);
      }
      if(title != undefined && title != "")
      {
         this.displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_TITLE);
      }
      else
      {
         this.displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_TITLE);
      }
   }
   function SET_SUBTITLE(label)
   {
      if(label != undefined && label != "")
      {
         this.subtitleTF.htmlText = label;
         this.displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE);
      }
      else
      {
         this.displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE);
      }
      this.updateDisplay();
   }
   function SET_SLOT(id, state, label)
   {
      var _loc2_ = this.slots[id];
      if(_loc2_ != undefined)
      {
         _loc2_.removeMovieClip();
      }
      this.slots[id] = _loc2_ = this._slotContainer.attachMovie("Slot","s" + id,this._slotContainer.getNextHighestDepth());
      if(this.slotJustifiedFormat == undefined)
      {
         this.slotJustifiedFormat = _loc2_.labelTF.getTextFormat();
         this.slotJustifiedFormat.align = "justify";
         this.slotJustifiedFormat.leading = 3;
      }
      _loc2_.labelTF.autoSize = true;
      _loc2_.labelTF.htmlText = label;
      _loc2_.bgMC._alpha = 0;
      if(_loc2_.labelTF._height > 25)
      {
         _loc2_.bgMC._height = Math.ceil(_loc2_.labelTF._y + _loc2_.labelTF._height + 3);
      }
      else
      {
         _loc2_.bgMC._height = 25;
      }
      this.displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS);
      var _loc4_ = _loc2_.attachMovie("mouseButton","mouseButton" + id + "MC",1000);
      _loc4_._height = _loc2_.bgMC._height;
      var _loc5_ = 10;
      com.rockstargames.ui.mouse.MouseBtn(_loc4_).setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_REPORT_MENU,_loc5_,[id,0]);
      this.SET_SLOT_STATE(id,state);
   }
   function SET_SLOT_STATE(id, state)
   {
      var _loc4_ = new com.rockstargames.ui.utils.BitMonger(state);
      var _loc2_ = this.slots[id];
      if(com.rockstargames.ui.utils.BitMonger.IS_BIT_SET(state,com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.SLOT_JUSTIFIED))
      {
         _loc2_.labelTF.setTextFormat(this.slotJustifiedFormat);
         _loc2_.labelTF._y = 6;
         _loc2_.bgMC._height = Math.ceil(_loc2_.labelTF._y + _loc2_.labelTF._height + 6);
         var _loc3_ = _loc2_.mouseButtonMC;
         if(_loc3_ != undefined)
         {
            _loc3_._height = _loc2_.bgMC._height;
         }
      }
      if(_loc4_.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.SLOT_SELECTED))
      {
         this.ApplyHudColourToTF(_loc2_.labelTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         _loc2_.bgMC._alpha = 100;
      }
      else
      {
         this.ApplyHudColourToTF(_loc2_.labelTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         _loc2_.bgMC._alpha = 0;
      }
      this.updateDisplay();
   }
   function CLEAR_SLOT(id)
   {
      var _loc3_ = this.slots[id];
      if(_loc3_ != undefined)
      {
         this.slots[id].removeMovieClip();
      }
      if(id == this.slots.length - 1)
      {
         this.slots.pop();
      }
      else
      {
         this.slots[id] = undefined;
      }
      if(this.slots.length == 0)
      {
         this.displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS);
      }
      this.updateDisplay();
   }
   function CLEAR_ALL_SLOTS()
   {
      this._supressUpdate = true;
      var _loc2_ = this.slots.length - 1;
      while(_loc2_ >= 0)
      {
         this.CLEAR_SLOT(_loc2_);
         _loc2_ = _loc2_ - 1;
      }
      this._supressUpdate = false;
      this.updateDisplay();
   }
   function updateDisplay()
   {
      if(this._supressUpdate)
      {
         return undefined;
      }
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc3_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.slots.length)
      {
         if(this.slots[_loc2_] != undefined)
         {
            _loc4_ = _loc5_;
            _loc5_ = this.slots[_loc2_];
            _loc3_ = 0;
         }
         else
         {
            _loc3_ = _loc3_ + 1;
         }
         if(_loc2_ > 0)
         {
            _loc5_._y = Math.round(_loc4_._y + _loc4_._height + _loc3_ * 25);
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.displayStateBM.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE))
      {
         this.barMC._y = Math.ceil(this.subtitleTF._height + 4);
         this.bgFillMC._height = this.barMC._y - 2;
         this.panelMC._visible = true;
         this.subtitleTF._visible = true;
      }
      else
      {
         this.barMC._y = 0;
         this.panelMC._visible = false;
         this.subtitleTF._visible = false;
      }
      if(this.displayStateBM.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS))
      {
         this._slotContainer._y = this.barMC._y + this.barMC._height;
         this.bgFillMC._height = this._slotContainer._y + this._slotContainer._height - 2;
         this.panelMC._visible = true;
         this.barMC._visible = true;
         this._slotContainer._visible = true;
      }
      else
      {
         this.barMC._visible = false;
         this._slotContainer._visible = false;
      }
      this.bgBottomMC._y = this.bgFillMC._y + this.bgFillMC._height;
      this.initScreenLayout();
   }
   function ApplyHudColourToTF(tf, colourId)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc1_);
      tf.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc1_.r,_loc1_.g,_loc1_.b);
   }
   function resizeAsianText(tf)
   {
      var _loc2_ = tf.getTextFormat();
      _loc2_.size = this.titleFontSize * 0.8;
      tf.setTextFormat(_loc2_);
   }
}
