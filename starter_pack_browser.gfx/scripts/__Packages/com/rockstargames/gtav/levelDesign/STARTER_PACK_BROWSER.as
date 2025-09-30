class com.rockstargames.gtav.levelDesign.STARTER_PACK_BROWSER extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var activeCategory;
   var activeItem;
   var currScreen;
   var currScreenID;
   var cursor;
   var displayConfig;
   var imageManager;
   var items;
   var prevScreenID;
   var screenContainer;
   var showPurchaseButtons;
   var HOME_SCREEN = 0;
   var CATEGORY_SCREEN = 1;
   var ITEM_SCREEN = 2;
   static var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen,com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen,com.rockstargames.gtav.levelDesign.starterPackBrowser.ItemScreen];
   function STARTER_PACK_BROWSER()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "STARTER_PACK_BROWSER";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.imageManager = new com.rockstargames.gtav.levelDesign.starterPackBrowser.ImageManager(this._name);
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.items = [];
      this.showPurchaseButtons = false;
      this.prevScreenID = -1;
      this.currScreenID = -1;
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor(_loc3_,_loc2_,this.displayConfig);
      this.showScreen(this.HOME_SCREEN);
   }
   function showScreen(screenID)
   {
      this.prevScreenID = this.currScreenID;
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.currScreen = new com.rockstargames.gtav.levelDesign.STARTER_PACK_BROWSER.SCREEN_CLASSES[screenID](this,this.screenContainer,this.cursor,this.items,this.activeItem,this.activeCategory);
         this.currScreenID = screenID;
         if(this.currScreenID != this.ITEM_SCREEN)
         {
            this.activeItem = null;
         }
         if(this.currScreenID == this.HOME_SCREEN)
         {
            this.activeCategory = -1;
         }
      }
      this.cursor.setState(com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.STATE_ARROW);
   }
   function setActiveItem(activeItem)
   {
      this.activeItem = activeItem;
   }
   function setActiveCategory(activeCategory)
   {
      this.activeCategory = activeCategory;
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this.imageManager.textureLoaded(txd);
      }
   }
   function SET_INPUT_EVENT(inputID)
   {
      var _loc2_ = this.cursor.getTargetIDUnderCursor();
      var _loc3_;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.LEFT:
            _loc3_ = this.cursor.setTarget(inputID);
            if(_loc3_)
            {
               this.playSound("NAV_LEFT_RIGHT");
            }
            break;
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.ACCEPT:
            this.currScreen.handleAccept(_loc2_);
            if(_loc2_ != -1)
            {
               this.playSound("SELECT");
            }
            break;
         case com.rockstargames.gtav.levelDesign.starterPackBrowser.Cursor.CANCEL:
            if(this.currScreenID != this.HOME_SCREEN)
            {
               this.playSound("BACK");
            }
            this.currScreen.handleCancel();
         default:
            return;
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this.cursor.moveBy(x,y);
      }
      this.currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this.cursor.moveTo(x,y,true);
   }
   function PURCHASE_BUTTONS_VISIBLE(isVisible)
   {
      this.showPurchaseButtons = isVisible;
      if(this.currScreenID == this.HOME_SCREEN)
      {
         com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen(this.currScreen).updatePurchaseButtons();
      }
   }
   function GET_CURRENT_ITEM()
   {
      if(this.currScreenID == this.HOME_SCREEN)
      {
         return this.cursor.getTargetIDUnderCursor();
      }
      if(this.prevScreenID == this.ITEM_SCREEN)
      {
         if(this.cursor.getTargetIDUnderCursor() != -1)
         {
            return this.activeItem.id;
         }
      }
      return -1;
   }
   function GET_CURRENT_SCREEN()
   {
      return this.prevScreenID;
   }
   function ADD_ITEM(id, category, title, description, textureDictionary, texture, link, equipped, subCategory, thumbTextureDictionary, thumbTexture)
   {
      var _loc3_;
      var _loc2_ = 0;
      var _loc4_ = this.items.length;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.items[_loc2_];
         if(_loc3_.id == id)
         {
            break;
         }
         _loc3_ = null;
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ == null)
      {
         _loc3_ = new com.rockstargames.gtav.levelDesign.starterPackBrowser.Item();
         this.items.push(_loc3_);
      }
      if(thumbTextureDictionary == undefined)
      {
         thumbTextureDictionary = textureDictionary;
      }
      if(thumbTexture == undefined)
      {
         thumbTexture = texture;
      }
      _loc3_.setData(id,category,subCategory,title,description,textureDictionary,texture,thumbTextureDictionary,thumbTexture,link,equipped);
   }
   function REMOVE_ITEM(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         if(this.items[_loc2_].id == id)
         {
            this.items.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setLocalisedText(tf, label)
   {
      tf.text = label;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function truncate(tf, txt, autoSize, letterSpacing)
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
   function setEllipsis(label, tf)
   {
      tf.text = label;
      var _loc1_;
      if(tf.textWidth > tf._width - 4)
      {
         _loc1_ = label.length;
         while(_loc1_ > 0)
         {
            tf.text = label.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function formatNumber(value)
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
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function playSound(soundName)
   {
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,"HUD_FRONTEND_DEFAULT_SOUNDSET");
   }
}
