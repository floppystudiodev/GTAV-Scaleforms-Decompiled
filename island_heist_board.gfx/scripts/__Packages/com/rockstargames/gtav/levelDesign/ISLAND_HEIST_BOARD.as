class com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var currScreenID;
   var deactivated;
   var lastClickedButtonID;
   var displayConfig;
   var imageManager;
   var heistData;
   var colourScheme;
   var screenContainer;
   var overlayView;
   var overlay;
   var cursor;
   var currScreen;
   static var DPAD_DOWN = 187;
   static var DPAD_UP = 188;
   static var DPAD_LEFT = 189;
   static var DPAD_RIGHT = 190;
   static var ACCEPT = 201;
   static var CANCEL = 202;
   static var X = 203;
   static var Y = 204;
   static var LB = 205;
   static var RB = 206;
   static var LT = 207;
   static var RT = 208;
   static var LEFT_MOUSE = 237;
   static var RIGHT_MOUSE = 238;
   static var SCROLL_UP_MOUSE = 241;
   static var SCROLL_DOWN_MOUSE = 242;
   static var KEY_DOWN = 300;
   static var KEY_UP = 301;
   static var ELEMENT_FADE_OUT_DURATION = 0.8;
   static var ELEMENT_FADE_OUT_CURVE = com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT;
   static var IS_ASIAN = false;
   var LOADING_SCREEN = 0;
   var MAIN_SCREEN = 1;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.LoadingScreen,com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen];
   function ISLAND_HEIST_BOARD()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "ISLAND_HEIST_BOARD";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.deactivated = false;
      this.lastClickedButtonID = -1;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.IS_ASIAN = this.displayConfig.isAsian;
      this.imageManager = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ImageManager(this._name);
      this.heistData = new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistData();
      this.colourScheme = new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ColourScheme();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      this.SET_IS_HARD_MODE(false);
      this.overlayView = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      this.overlay = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Overlay(this.overlayView);
      var _loc3_ = this.CONTENT.attachMovie("dither","dither",this.CONTENT.getNextHighestDepth());
      _loc3_._alpha = 20;
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor(_loc4_,_loc2_);
   }
   function SHOW_SCREEN(screenID)
   {
      this.showScreen(screenID);
   }
   function SHOW_OVERLAY(title, message, acceptButtonLabel, cancelButtonLabel)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.show(title,message,acceptButtonLabel,cancelButtonLabel,this.colourScheme);
      this.updateButtons();
   }
   function HIDE_OVERLAY()
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.hide();
      this.updateButtons();
   }
   function REQUEST_CURRENT_SELECTION()
   {
      return this.lastClickedButtonID;
   }
   function REQUEST_CURRENT_ROLLOVER()
   {
      return this.cursor.getTargetIDUnderCursor();
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.LEFT:
            this.cursor.setTarget(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ACCEPT:
            this.lastClickedButtonID = this.cursor.getTargetIDUnderCursor();
            break;
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
      }
      if(!this.overlay.isShowing)
      {
         this.currScreen.handleButtonInput(inputID);
      }
   }
   function SET_CURRENT_SELECTION(itemID)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).setCurrentSelection(itemID);
      }
   }
   function SET_TABS(tab1Label, tab1Locked, tab2Label, tab2Locked, tab3Label, tab3Locked)
   {
      this.heistData.setTabs(tab1Label,tab1Locked,tab2Label,tab2Locked,tab3Label,tab3Locked);
   }
   function ADD_SETUP_ITEM(tabID, parentID, itemID, title, numComplete, numTotal, locked, isMandatory, description, texture, showDollar, count, countMax)
   {
      isMandatory = false;
      this.heistData.addSetupItem(tabID,parentID,itemID,title,numComplete,numTotal,locked,isMandatory,description,texture,showDollar,count,countMax);
   }
   function ADD_FINALE_ITEM(parentID, itemID, title, isSelected, description, texture, locked, showDollar)
   {
      this.heistData.addFinaleItem(parentID,itemID,title,isSelected,description,texture,locked,showDollar);
   }
   function SET_FINALE_MENU_IDS(timeOfDayID, approachVehicleID, entryPointID, exitPointID, weaponsID, supportCrewID, crewCutID, compoundEntryPointID)
   {
      this.heistData.setFinaleMenuIDs(timeOfDayID,approachVehicleID,entryPointID,compoundEntryPointID,exitPointID,weaponsID,supportCrewID,crewCutID);
   }
   function SET_INITIAL_TAB_VIEW(initialView)
   {
      this.heistData.initialView = initialView;
   }
   function SET_IS_HARD_MODE(isHardMode)
   {
      this.heistData.isHardMode = isHardMode;
      this.colourScheme.setScheme(isHardMode);
   }
   function SET_PAYOUTS(isVisible, mainPayout, subPayout, mainPayoutLabel, subPayoutLabel)
   {
      this.heistData.payoutsVisible = isVisible;
      this.heistData.mainPayout = mainPayout;
      this.heistData.subPayout = subPayout;
      this.heistData.mainPayoutLabel = mainPayoutLabel;
      this.heistData.subPayoutLabel = subPayoutLabel;
   }
   function SET_FINALE_COST(itemID, cost)
   {
      var _loc2_ = this.heistData.getFinaleItem(itemID);
      _loc2_.cost = cost;
   }
   function ADD_MAP_ICON(setupItemID, finaleItemID, iconID, mapID, x, y)
   {
      this.heistData.addMapIcon(setupItemID,finaleItemID,iconID,mapID,x,y,false);
   }
   function ADD_WORLD_MAP_ICON(setupItemID, finaleItemID, iconID, mapID, x, y)
   {
      if(mapID == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP)
      {
         var _loc5_ = 3570;
         var _loc3_ = -4185;
         var _loc2_ = 0.535;
      }
      else
      {
         _loc5_ = 4885;
         _loc3_ = -5685;
         _loc2_ = 6.57;
      }
      x = (x - _loc5_) * _loc2_;
      y = (y - _loc3_) * (- _loc2_);
      this.heistData.addMapIcon(setupItemID,finaleItemID,iconID,mapID,x,y,true);
   }
   function SHOW_TIP_TEXT(text)
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).showTipText(text);
      }
   }
   function HIDE_TIP_TEXT()
   {
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).hideTipText();
      }
   }
   function SET_FINALE_ITEM_SELECTED(itemID, isSelected)
   {
      var _loc2_ = this.heistData.setFinaleItemSelected(itemID,isSelected);
      if(_loc2_ && this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateFinaleItem(itemID,isSelected);
      }
   }
   function SET_SETUP_ITEM_NUM_COMPLETE(itemID, numComplete)
   {
      var _loc2_ = this.heistData.setSetupItemNumComplete(itemID,numComplete);
      if(_loc2_ && this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateSetupItem(itemID,numComplete);
      }
   }
   function REMOVE_FINALE_ITEM(itemID)
   {
      var _loc2_ = this.heistData.removeFinaleItem(itemID);
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateListAfterRemoval(itemID,_loc2_);
      }
   }
   function SET_CREW_MEMBER(id, gamertag, percentage, headsetState, isReady)
   {
      var _loc9_ = false;
      var _loc3_ = 0;
      while(_loc3_ < this.heistData.crew.length)
      {
         var _loc2_ = this.heistData.crew[_loc3_];
         if(_loc2_.id == id)
         {
            _loc9_ = true;
            _loc2_.gamertag = gamertag;
            _loc2_.percentage = percentage;
            _loc2_.headsetState = headsetState;
            _loc2_.isReady = isReady;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(!_loc9_)
      {
         _loc3_ = 0;
         while(_loc3_ < this.heistData.crew.length)
         {
            _loc2_ = this.heistData.crew[_loc3_];
            if(_loc2_.id == -1)
            {
               _loc2_.id = id;
               _loc2_.gamertag = gamertag;
               _loc2_.percentage = percentage;
               _loc2_.headsetState = headsetState;
               _loc2_.isReady = isReady;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateCrew();
      }
   }
   function CLEAR_CREW_MEMBER(id)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.heistData.crew.length)
      {
         var _loc2_ = this.heistData.crew[_loc3_];
         if(_loc2_.id == id)
         {
            _loc2_.id = -1;
            _loc2_.gamertag = "";
            _loc2_.percentage = 0;
            _loc2_.isReady = false;
            _loc2_.headsetState = 0;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateCrew();
      }
   }
   function SET_LAUNCH_BUTTON(isEnabled, label)
   {
      this.heistData.launchButtonEnabled = isEnabled;
      this.heistData.launchButtonLabel = label;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateLaunchButton();
      }
   }
   function SET_CREW_CUTS_VISIBLE(isVisible)
   {
      this.heistData.crewCutsVisible = isVisible;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).setCrewCutsVisible(isVisible);
      }
   }
   function SET_MAP_VIEW(mapView)
   {
      this.heistData.mapView = mapView;
      if(this.currScreenID == this.MAIN_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen(this.currScreen).updateMap();
      }
   }
   function SET_FINALE_LIST_TITLE(title)
   {
      this.heistData.finaleListTitle = title;
   }
   function showScreen(screenID)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.imageManager.clearImageQueue();
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.overlay,this.heistData,this.colourScheme);
         this.updateButtons();
      }
   }
   function updateButtons(activeButtonIndex)
   {
      if(this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.overlay.buttons,0);
      }
      else if(this.currScreen)
      {
         this.cursor.setTargetRects(this.currScreen.buttons,activeButtonIndex);
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function formatPercentage(value)
   {
      return int(value * 100) / 100 + "%";
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   static function formatTime(seconds)
   {
      var _loc1_ = seconds % 60;
      var _loc3_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc5_ = Math.floor((seconds - _loc1_ - _loc3_ * 60) / 3600);
      var _loc2_ = ("0" + _loc3_).substr(-2);
      var _loc4_ = ("0" + _loc1_).substr(-2);
      return _loc5_ != 0 ? _loc5_ + ":" + _loc2_ + ":" + _loc4_ : _loc2_ + ":" + _loc4_;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      if(!isNaN(letterSpacing))
      {
         var _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      if(tf.textWidth > tf._width)
      {
         var _loc6_ = tf._width;
         tf.autoSize = autoSize;
         var _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
   static function resizeAsianText(tf, scalar)
   {
      if(com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.IS_ASIAN)
      {
         if(scalar == undefined)
         {
            scalar = 1.3;
         }
         var _loc1_ = tf.getTextFormat();
         _loc1_.size *= scalar;
         tf.setTextFormat(_loc1_);
      }
   }
   static function playSound(soundName, soundSet)
   {
   }
}
