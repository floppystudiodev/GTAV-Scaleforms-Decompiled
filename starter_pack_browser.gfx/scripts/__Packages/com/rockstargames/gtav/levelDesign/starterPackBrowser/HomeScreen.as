class com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen extends com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen
{
   var app;
   var bottomPurchaseButton;
   var categoryIDs;
   var cursor;
   var handleMin;
   var handleRange;
   var initSafeZone;
   var navElements;
   var safeZoneRight;
   var scrollTimeDelta;
   var topPurchaseButton;
   var view;
   static var NUM_CATEGORIES = 5;
   static var CONTENT_Y_HISTORY = 0;
   static var SCROLLBAR_Y_HISTORY = -1.7976931348623157e+308;
   static var POSITIONS_WITHOUT_PURCHASE = [531,806,1081,1356,1631];
   static var POSITIONS_WITH_PURCHASE = [616,891,1166,1441,1716];
   function HomeScreen(app, viewContainer, cursor, items, activeItem, activeCategory)
   {
      super(app,cursor,viewContainer,"homeScreen");
      this.init(items,activeItem);
   }
   function init(items, activeItem)
   {
      this.initSafeZone();
      this.scrollTimeDelta = 0;
      this.categoryIDs = [];
      this.navElements = [];
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.NUM_CATEGORIES)
      {
         _loc3_ = this.view.itemList["category" + _loc2_];
         _loc3_.icon.gotoAndStop(_loc2_ + 1);
         _loc3_.highlight._visible = false;
         _loc3_.description.textAutoSize = "shrink";
         this.app.setLocalisedText(_loc3_.title,"SPK_CAT_" + _loc2_);
         this.app.setLocalisedText(_loc3_.description,"SPK_CAT_" + _loc2_ + "_DESC");
         this.app.setLocalisedText(_loc3_.action,"SPK_CAT_" + _loc2_ + "_BTN");
         this.app.setLocalisedText(_loc3_.highlight.label,"SPK_CAT_" + _loc2_ + "_BTN");
         _loc4_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs["CATEGORY_" + _loc2_];
         this.categoryIDs.push(_loc4_);
         this.navElements.push(new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(_loc3_.hitRect,_loc4_));
         this.navElements.push(new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(this.view.itemList["image" + _loc2_],_loc4_));
         this.view.itemList["image" + _loc2_]._visible = true;
         _loc2_ = _loc2_ + 1;
      }
      this.topPurchaseButton = new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(this.view.itemList.topBuyPackButton.hitRect,com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs.BUY_PACK);
      this.navElements.push(this.topPurchaseButton);
      this.view.itemList.topBuyPackButton.action.textAutoSize = "shrink";
      this.view.itemList.topBuyPackButton.highlight.label.textAutoSize = "shrink";
      this.app.setLocalisedText(this.view.itemList.topBuyPackButton.action,"SPK_BUYPACK");
      this.app.setLocalisedText(this.view.itemList.topBuyPackButton.highlight.label,"SPK_BUYPACK");
      this.view.itemList.topBuyPackButton.highlight._visible = false;
      this.view.itemList.topBuyPackButton._visible = true;
      this.bottomPurchaseButton = new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(this.view.itemList.bottomBuyPackButton.hitRect,com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs.BUY_PACK);
      this.navElements.push(this.bottomPurchaseButton);
      this.view.itemList.bottomBuyPackButton.action.textAutoSize = "shrink";
      this.view.itemList.bottomBuyPackButton.highlight.label.textAutoSize = "shrink";
      this.app.setLocalisedText(this.view.itemList.bottomBuyPackButton.action,"SPK_BUYPACK");
      this.app.setLocalisedText(this.view.itemList.bottomBuyPackButton.highlight.label,"SPK_BUYPACK");
      this.view.itemList.bottomBuyPackButton.highlight._visible = false;
      this.view.itemList.bottomBuyPackButton._visible = true;
      this.cursor.setChangeListener(this.app.delegate(this,this.onTargetChange));
      this.updateButtons();
      this.app.setLocalisedText(this.view.itemList.description,"SPK_DESC");
      this.view.scrollbar.handle._y = Math.max(com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.SCROLLBAR_Y_HISTORY,this.view.scrollbar.track._y);
      this.view.scrollbar.handle._height = this.view.scrollbar.track._height * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT / this.view.itemList._height;
      this.view.scrollbar._visible = this.view.scrollbar.handle._height < this.view.scrollbar.track._height;
      this.handleMin = this.view.scrollbar.track._y;
      var _loc5_ = this.view.scrollbar.track._y + this.view.scrollbar.track._height - this.view.scrollbar.handle._height;
      this.handleRange = _loc5_ - this.handleMin;
      this.view.scrollbar._x = this.safeZoneRight - this.view.scrollbar._width;
      this.view.itemList._y = com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.CONTENT_Y_HISTORY;
      this.handleJoystickInput(false,0,0,false);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,1,{_alpha:0});
      this.updatePurchaseButtons();
   }
   function updatePurchaseButtons()
   {
      this.view.itemList.topBuyPackButton._visible = this.app.showPurchaseButtons;
      this.topPurchaseButton.enabled = this.app.showPurchaseButtons;
      this.view.itemList.bottomBuyPackButton._visible = this.app.showPurchaseButtons;
      this.bottomPurchaseButton.enabled = this.app.showPurchaseButtons;
      var _loc3_ = !this.app.showPurchaseButtons ? com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.POSITIONS_WITHOUT_PURCHASE : com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.POSITIONS_WITH_PURCHASE;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.NUM_CATEGORIES)
      {
         this.view.itemList["category" + _loc2_]._y = _loc3_[_loc2_];
         this.view.itemList["image" + _loc2_]._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this.updateButtons();
   }
   function handleAccept(activeElementID)
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.NUM_CATEGORIES)
      {
         if(activeElementID == this.categoryIDs[_loc2_])
         {
            this.app.setActiveCategory(_loc2_);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(activeElementID != com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElementIDs.BUY_PACK)
      {
         if(activeElementID != -1)
         {
            this.app.showScreen(this.app.CATEGORY_SCREEN);
         }
      }
   }
   function handleCancel()
   {
      com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.CONTENT_Y_HISTORY = 0;
      com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.SCROLLBAR_Y_HISTORY = -1.7976931348623157e+308;
      this.app.showScreen(this.app.HOME_SCREEN);
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      if(this.view.itemList._height < com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT)
      {
         return undefined;
      }
      var _loc5_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc5_ *= 2;
      }
      var _loc6_;
      var _loc3_;
      var _loc7_;
      var _loc2_;
      var _loc4_;
      var _loc8_;
      if(!isLeftStick)
      {
         _loc6_ = getTimer();
         _loc3_ = _loc6_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         _loc7_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STICK_SCROLL_SPEED * _loc3_ / 32;
         this.scrollTimeDelta = _loc6_;
         _loc2_ = this.view.itemList._y - _loc7_ * _loc5_;
         _loc4_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT - this.view.itemList._height;
         if(_loc2_ > 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ < _loc4_)
         {
            _loc2_ = _loc4_;
         }
         this.view.itemList._y = _loc2_;
         _loc8_ = _loc2_ / _loc4_;
         this.view.scrollbar.handle._y = _loc8_ * this.handleRange + this.handleMin;
         this.updateButtons();
         com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.CONTENT_Y_HISTORY = this.view.itemList._y;
         com.rockstargames.gtav.levelDesign.starterPackBrowser.HomeScreen.SCROLLBAR_Y_HISTORY = this.view.scrollbar.handle._y;
         this.view.scrollbar._alpha = 50;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,1,{_alpha:0});
      }
   }
   function updateButtons()
   {
      var _loc5_ = [];
      var _loc3_ = 0;
      var _loc4_ = this.navElements.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.navElements[_loc3_];
         _loc2_.updateBounds();
         if(_loc2_.bottom > _loc2_.top && _loc2_.enabled)
         {
            _loc5_.push(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.cursor.setTargetRects(_loc5_);
   }
   function onTargetChange(activeElementID)
   {
      var _loc3_ = 0;
      var _loc4_ = this.navElements.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.navElements[_loc3_];
         if(_loc2_.view._parent.highlight)
         {
            _loc2_.view._parent.highlight._visible = _loc2_.id == activeElementID;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      super.dispose();
   }
}
