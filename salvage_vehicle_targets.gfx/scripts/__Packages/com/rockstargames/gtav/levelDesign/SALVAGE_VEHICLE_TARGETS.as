class com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var cursor;
   var deactivated;
   var displayConfig;
   var imageManager;
   var inputReceived;
   var lastClickedButtonID;
   var overlay;
   var screenContainer;
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
   static var STAGE_WIDTH = 1920;
   static var STAGE_HEIGHT = 1440;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_HEIGHT;
   static var IS_ASIAN = false;
   function SALVAGE_VEHICLE_TARGETS()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "SALVAGE_VEHICLE_TARGETS";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.lastClickedButtonID = -1;
      this.inputReceived = false;
      this.deactivated = false;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.IS_ASIAN = this.displayConfig.isAsian;
      this.imageManager = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.ui.ImageManager(this._name);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("overlay","overlay",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursor",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.createEmptyMovieClip("cursorDebug",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Cursor(_loc2_);
      this.overlay = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.ui.Overlay(this,_loc3_,this.cursor);
      this.currScreen = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.screens.Screen(this,this.screenContainer,this.cursor);
      this.currScreen.setButtonsEnabled(!this.deactivated);
   }
   function ENABLE()
   {
      this.deactivated = false;
      this.currScreen.setButtonStates(true);
   }
   function DISABLE()
   {
      this.deactivated = true;
      this.currScreen.setButtonStates(false);
   }
   function SET_VEHICLE(index, name, value, txn, txd, salvageValue, state, ownable)
   {
      this.currScreen.setVehicle(index,name,value,txn,txd,salvageValue,state,ownable,this.deactivated);
   }
   function CLEAR_VEHICLE(index)
   {
      this.currScreen.clearVehicle(index);
   }
   function SHOW_OVERLAY(message, showCancelButton, isWarning)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.overlay.show(message,showCancelButton !== false,isWarning);
      this.currScreen.onShowOverlay();
   }
   function HIDE_OVERLAY()
   {
      this.overlay.hide();
      this.currScreen.onHideOverlay();
   }
   function GET_CURRENT_SELECTION()
   {
      var _loc2_;
      if(this.inputReceived)
      {
         _loc2_ = this.cursor.getTargetUnderCursor();
         return !_loc2_ ? -1 : _loc2_.id;
      }
      return this.lastClickedButtonID;
   }
   function SET_CURRENT_SELECTION(id)
   {
      this.cursor.snapToTargetID(id);
   }
   function GET_CURRENT_ROLLOVER()
   {
      var _loc2_ = this.cursor.getTargetUnderCursor();
      return !_loc2_ ? -1 : _loc2_.id;
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.deactivated)
      {
         return undefined;
      }
      this.inputReceived = true;
      var _loc2_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Cursor.LEFT:
            this.cursor.snapInDirection(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.ACCEPT:
            _loc2_ = this.cursor.getTargetUnderCursor();
            this.lastClickedButtonID = !_loc2_ ? -1 : _loc2_.id;
            break;
         case com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.CANCEL:
            if(this.overlay.isShowing)
            {
               this.HIDE_OVERLAY();
            }
      }
      this.currScreen.handleButtonInput(inputID);
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
   static function resizeAsianText(tf)
   {
      var _loc1_ = tf.getNewTextFormat();
      _loc1_.size = 30;
      _loc1_.letterSpacing = -1;
      tf.setNewTextFormat(_loc1_);
      tf.setTextFormat(_loc1_);
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc5_;
      if(!isNaN(letterSpacing))
      {
         _loc5_ = tf.getTextFormat();
         _loc5_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc5_);
      }
      var _loc2_;
      var _loc6_;
      if(tf.multiline && tf.maxscroll > 1)
      {
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc5_ = tf.getTextFormat();
               _loc5_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc5_);
            }
            if(tf.maxscroll == 1)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      else if(tf.textWidth > tf._width)
      {
         _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc5_ = tf.getTextFormat();
               _loc5_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc5_);
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
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
      }
   }
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
