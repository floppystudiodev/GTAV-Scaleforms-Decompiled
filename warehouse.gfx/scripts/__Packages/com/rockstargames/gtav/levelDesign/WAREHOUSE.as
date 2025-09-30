class com.rockstargames.gtav.levelDesign.WAREHOUSE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var activeUsers;
   var buyerAmounts;
   var buyerOrganizations;
   var cursor;
   var displayConfig;
   var gamerTag;
   var imageManager;
   var numSales;
   var offerPrices;
   var organizationName;
   var screen;
   var screenContainer;
   var sellerRating;
   var totalEarnings;
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
   static var SCROLL_UP_MOUSE = 241;
   static var SCROLL_DOWN_MOUSE = 242;
   function WAREHOUSE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "WAREHOUSE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.activeUsers = [];
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.imageManager = new com.rockstargames.gtav.levelDesign.securoserv.WarehouseImageManager();
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.securoserv.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.cursor.setState(com.rockstargames.gtav.levelDesign.securoserv.Cursor.STATE_ARROW);
      this.screen = new com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen(this,this.screenContainer,this.cursor);
   }
   function SET_WAREHOUSE_DATA(nameLabel, locationLabel, txd, size, capacity, amountStored, currentValue, specialItems, sellCooldown)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.securoserv.Warehouse(0,0,0,0,nameLabel,locationLabel,"",txd,true,size,capacity,amountStored,currentValue,specialItems,sellCooldown);
      this.screen.activate(_loc2_);
   }
   function SET_PLAYER_DATA(gamerTag, organizationName, sellerRating, numSales, totalEarnings)
   {
      this.gamerTag = gamerTag;
      this.organizationName = organizationName;
      this.sellerRating = sellerRating;
      this.numSales = numSales;
      this.totalEarnings = totalEarnings;
   }
   function SET_BUYER_DATA(buyerOrganization0, amount0, offerPrice0, buyerOrganization1, amount1, offerPrice1, buyerOrganization2, amount2, offerPrice2, buyerOrganization3, amount3, offerPrice3)
   {
      this.buyerOrganizations = [buyerOrganization0,buyerOrganization1,buyerOrganization2,buyerOrganization3];
      this.buyerAmounts = [amount0,amount1,amount2,amount3];
      this.offerPrices = [offerPrice0,offerPrice1,offerPrice2,offerPrice3];
   }
   function ADD_ACTIVE_USER(gamerTag, organisation)
   {
      this.activeUsers.push({name:gamerTag,organisation:organisation});
   }
   function REMOVE_ACTIVE_USER(gamerTag)
   {
      var _loc2_ = 0;
      var _loc3_ = this.activeUsers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.activeUsers[_loc2_].name == gamerTag)
         {
            this.activeUsers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function SHOW_OVERLAY(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.screen.showOverlay(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
   }
   function HIDE_OVERLAY()
   {
      this.screen.hideOverlay();
   }
   function GET_CURRENT_SELECTION()
   {
      return this.cursor.getTargetIDUnderCursor();
   }
   function SET_INPUT_EVENT(inputID)
   {
      var _loc3_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.securoserv.Cursor.LEFT:
            _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.WAREHOUSE.playSound("Mouse_Move_Cursor");
            }
      }
      this.screen.handleButtonInput(inputID);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y)
   {
      if(isLeftStick)
      {
         this.cursor.moveBy(x,y);
      }
      this.screen.handleJoystickInput(isLeftStick,x,y);
   }
   function SET_CURSOR_SPEED(speed)
   {
      this.cursor.setSpeed(speed);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this.cursor.moveTo(x,y,true);
      this.screen.handleMouseInput(x,y);
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function setSpacedTextField(tf, label, letterSpacing, isLiteralLabel)
   {
      if(isLiteralLabel)
      {
         tf.text = label;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(tf,label);
      }
      var _loc2_ = tf.getTextFormat();
      _loc2_.letterSpacing = letterSpacing;
      tf.setTextFormat(_loc2_);
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
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc3_;
      if(!isNaN(letterSpacing))
      {
         _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      var _loc6_;
      var _loc2_;
      if(tf.textWidth > tf._width)
      {
         _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
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
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "GTAO_Exec_SecuroServ_Computer_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
}
