class com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen extends com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen
{
   var app;
   var cursor;
   var itemsInCategory;
   var navElements;
   var view;
   var handleMin;
   var handleRange;
   var safeZoneRight;
   var scrollTimeDelta;
   static var MAX_COLS = 4;
   static var HEADER_HEIGHT = 235;
   static var COL_OFFSET = 180;
   static var COL_WIDTH = 227.5;
   static var ROW_HEIGHT = 201;
   static var SUBCAT_HEADER_HEIGHT = 52;
   static var SCROLL_SPEED = 450;
   static var SCROLL_FADE_UP_SPEED = 400;
   static var SCROLL_FADE_DOWN_DURATION = 1;
   static var CONTENT_Y_HISTORY = 0;
   static var SCROLLBAR_Y_HISTORY = -1.7976931348623157e+308;
   function CategoryScreen(app, viewContainer, cursor, items, activeItem, activeCategory)
   {
      super(app,cursor,viewContainer,"categoryScreen");
      this.init(items,activeCategory);
   }
   function init(items, activeCategory)
   {
      this.initSafeZone();
      this.initItemList(items,activeCategory);
      this.initItemListView(activeCategory);
      this.cursor.setChangeListener(this.app.delegate(this,this.onTargetChange));
      this.updateButtons();
   }
   function initItemList(items, activeCategory)
   {
      this.itemsInCategory = [];
      var _loc2_ = 0;
      var _loc4_ = items.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = items[_loc2_];
         if(_loc3_.category == activeCategory)
         {
            this.itemsInCategory.push(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.itemsInCategory.sortOn("subCategory",Array.NUMERIC);
   }
   function initItemListView(activeCategory)
   {
      this.navElements = [];
      var _loc4_ = 0;
      var _loc2_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.HEADER_HEIGHT;
      var _loc8_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Item.SUBCAT_NONE;
      var _loc3_ = 0;
      var _loc9_ = this.itemsInCategory.length;
      while(_loc3_ < _loc9_)
      {
         var _loc6_ = this.itemsInCategory[_loc3_];
         if(_loc6_.subCategory != _loc8_)
         {
            _loc8_ = _loc6_.subCategory;
            if(_loc8_ != com.rockstargames.gtav.levelDesign.starterPackBrowser.Item.SUBCAT_NONE)
            {
               if(_loc4_ > 0)
               {
                  _loc2_ += com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.ROW_HEIGHT;
               }
               this.initSubCategoryHeader(activeCategory,_loc8_,_loc2_);
               _loc4_ = 0;
               _loc2_ += com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.SUBCAT_HEADER_HEIGHT;
            }
         }
         else if(_loc3_ == 0)
         {
            var _loc7_ = this.view.itemList.getNextHighestDepth();
            var _loc5_ = this.view.itemList.attachMovie("dividerLine","dividerLine" + _loc7_,_loc7_);
            _loc5_._x = com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.COL_OFFSET;
            _loc5_._y = _loc2_;
            _loc2_ += _loc5_._height + 10;
         }
         this.navElements.push(this.initButton(_loc6_,_loc4_ * com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.COL_WIDTH + com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.COL_OFFSET,_loc2_));
         if((_loc4_ = _loc4_ + 1) == com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.MAX_COLS)
         {
            _loc4_ = 0;
            _loc2_ += com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.ROW_HEIGHT;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = this.view.itemList._height;
      _loc7_ = this.view.itemList.getNextHighestDepth();
      var _loc11_ = this.view.itemList.attachMovie("itemListFooter","itemListFooter" + _loc7_,_loc7_);
      _loc11_._x = com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.COL_OFFSET;
      _loc11_._y = _loc2_;
      this.view.scrollbar.handle._y = Math.max(com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.SCROLLBAR_Y_HISTORY,this.view.scrollbar.track._y);
      this.view.scrollbar.handle._height = this.view.scrollbar.track._height * com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT / this.view.itemList._height;
      this.view.scrollbar._visible = this.view.scrollbar.handle._height < this.view.scrollbar.track._height;
      this.handleMin = this.view.scrollbar.track._y;
      var _loc12_ = this.view.scrollbar.track._y + this.view.scrollbar.track._height - this.view.scrollbar.handle._height;
      this.handleRange = _loc12_ - this.handleMin;
      this.view.scrollbar._x = this.safeZoneRight - this.view.scrollbar._width;
      this.app.setLocalisedText(this.view.itemList.description,"SPK_CAT_" + activeCategory);
      this.view.itemList._y = com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.CONTENT_Y_HISTORY;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,1,{_alpha:0});
   }
   function initSubCategoryHeader(category, subCategory, y)
   {
      var _loc4_ = this.view.itemList;
      var _loc3_ = _loc4_.getNextHighestDepth();
      var _loc2_ = _loc4_.attachMovie("subCategoryHeader","subCategoryHeader" + _loc3_,_loc3_);
      _loc2_._x = com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.COL_OFFSET;
      _loc2_._y = y;
      this.app.setLocalisedText(_loc2_.label,"SPK_SUBCAT_" + category + "_" + subCategory);
      return _loc2_;
   }
   function initButton(item, x, y)
   {
      var _loc5_ = this.view.itemList;
      var _loc4_ = _loc5_.getNextHighestDepth();
      var _loc2_ = _loc5_.attachMovie("itemButton","itemButton" + _loc4_,_loc4_);
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.label.text = item.title;
      _loc2_.tick._visible = item.equipped;
      this.app.imageManager.addImage(item.thumbTextureDictionary,item.thumbTexture,_loc2_.texture);
      return new com.rockstargames.gtav.levelDesign.starterPackBrowser.NavigationElement(_loc2_.highlight,item.id);
   }
   function handleAccept(activeElementID)
   {
      var _loc2_ = 0;
      var _loc4_ = this.itemsInCategory.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.itemsInCategory[_loc2_];
         if(activeElementID == _loc3_.id)
         {
            this.app.setActiveItem(_loc3_);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(activeElementID != -1)
      {
         this.app.showScreen(this.app.ITEM_SCREEN);
      }
   }
   function handleCancel()
   {
      com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.CONTENT_Y_HISTORY = 0;
      com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.SCROLLBAR_Y_HISTORY = -1.7976931348623157e+308;
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
      if(!isLeftStick)
      {
         var _loc6_ = getTimer();
         var _loc3_ = _loc6_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         var _loc7_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STICK_SCROLL_SPEED * _loc3_ / 32;
         this.scrollTimeDelta = _loc6_;
         var _loc2_ = this.view.itemList._y - _loc7_ * _loc5_;
         var _loc4_ = com.rockstargames.gtav.levelDesign.starterPackBrowser.Screen.STAGE_HEIGHT - this.view.itemList._height;
         if(_loc2_ > 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ < _loc4_)
         {
            _loc2_ = _loc4_;
         }
         this.view.itemList._y = _loc2_;
         var _loc8_ = _loc2_ / _loc4_;
         this.view.scrollbar.handle._y = _loc8_ * this.handleRange + this.handleMin;
         this.updateButtons();
         com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.CONTENT_Y_HISTORY = this.view.itemList._y;
         com.rockstargames.gtav.levelDesign.starterPackBrowser.CategoryScreen.SCROLLBAR_Y_HISTORY = this.view.scrollbar.handle._y;
         this.view.scrollbar._alpha = 50;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,2,{_alpha:0});
      }
   }
   function updateButtons()
   {
      var _loc5_ = [];
      var _loc3_ = 0;
      var _loc4_ = this.navElements.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.navElements[_loc3_];
         _loc2_.updateBounds();
         if(_loc2_.bottom > _loc2_.top)
         {
            _loc5_.push(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.cursor.setTargetRects(_loc5_);
   }
   function onTargetChange(activeElementID)
   {
      var _loc2_ = 0;
      var _loc4_ = this.navElements.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.navElements[_loc2_];
         _loc3_.view._parent.highlight._visible = _loc3_.id == activeElementID;
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      super.dispose();
   }
}
