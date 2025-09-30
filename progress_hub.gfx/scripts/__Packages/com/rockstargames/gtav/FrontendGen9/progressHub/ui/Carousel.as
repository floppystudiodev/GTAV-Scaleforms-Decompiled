class com.rockstargames.gtav.FrontendGen9.progressHub.ui.Carousel extends MovieClip
{
   var _carouselItems;
   var _carouselMask;
   var _itemContainer;
   var bounds;
   var cursor;
   var leftGradient;
   var onMove;
   var rightGradient;
   var tempItem;
   var _carouselStartPos = 0;
   var _rightGradientPadding = 10;
   var _padding = 14.66666;
   var _currentPosition = 0;
   var _currentSelectedItem = 0;
   var _currentOffset = 0;
   var _currentVisibleIndex = 0;
   var _maxOffset = 0;
   var _numberOfVisibleItems = 5;
   var _maxVisibleItems = 5;
   var showAnimation = false;
   function Carousel()
   {
      super();
      this._carouselItems = [];
      this._itemContainer = this.createEmptyMovieClip("itemContainer",10);
      this.tempItem = new com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem();
      this._carouselMask = this.attachMovie("carouselMask","carouselMask",20,{_x:this._itemContainer._x - 10,_y:this._itemContainer._y - 10});
      var _loc4_ = this._carouselMask.getBounds(_root);
      this.bounds = new flash.geom.Rectangle(_loc4_.xMin,_loc4_.yMin,_loc4_.xMax - _loc4_.xMin,_loc4_.yMax - _loc4_.yMin);
      this._itemContainer.setMask(this._carouselMask);
   }
   function setCursor(cursor)
   {
      this.cursor = cursor;
   }
   function CLEAR_ALL_ITEMS()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._carouselItems.length)
      {
         _loc3_ = this._carouselItems[_loc2_];
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this._carouselItems = [];
      this._currentPosition = 0;
      this._currentSelectedItem = 0;
      this._currentOffset = 0;
      this._currentVisibleIndex = 0;
      this._maxOffset = 0;
   }
   function ADD_CAROUSEL_ITEM(title, itemImage, status, TXD, meterValue, app)
   {
      var _loc3_ = this._carouselItems.length;
      var _loc6_ = "item" + _loc3_;
      var _loc5_ = com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem(this._carouselItems[_loc3_ - 1]);
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem(this._itemContainer.attachMovie("carouselItem",_loc6_,this._itemContainer.getNextHighestDepth()));
      _loc2_.SET_CAROUSEL_ITEM_DETAILS(title,itemImage,status,TXD,meterValue,app);
      if(_loc3_ < 1)
      {
         _loc2_.index = 0;
         _loc2_._x = this._carouselStartPos;
      }
      else
      {
         _loc2_.index = _loc3_;
         _loc2_._x = _loc5_._x + _loc5_.itemWidth + this._padding;
      }
      this._carouselItems.push(_loc2_);
      this.rightGradient._x = _loc2_._x + _loc2_.itemWidth + this._rightGradientPadding;
      var _loc4_ = 1280 - this.rightGradient._width;
      if(this.rightGradient._x > _loc4_)
      {
         this.rightGradient._x = _loc4_;
      }
      if(this._carouselItems.length <= this._maxVisibleItems)
      {
         this._numberOfVisibleItems = this._carouselItems.length;
      }
      this._maxOffset = this._carouselItems.length - 1 - this._numberOfVisibleItems;
      return _loc2_;
   }
   function SET_CAROUSEL_ITEM_STATE(whichTab, state)
   {
      if(state == 1)
      {
         this._currentSelectedItem = whichTab;
      }
      this.UNHIGHLIGHT_ALL_CAROUSEL_ITEMS();
      var _loc3_ = com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem(this._carouselItems[whichTab]);
      _loc3_.SET_STATE(state);
      if(state == 1)
      {
         this.handleScroll();
      }
   }
   function SET_CAROUSEL_ITEM_ENABLED(whichTab, isEnabled)
   {
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem(this._carouselItems[whichTab]);
      _loc2_.SET_ENABLED(isEnabled);
   }
   function UNHIGHLIGHT_ALL_CAROUSEL_ITEMS()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._carouselItems.length)
      {
         _loc3_ = this._carouselItems[_loc2_];
         _loc3_.SET_STATE(0);
         _loc2_ = _loc2_ + 1;
      }
   }
   function HIGHLIGHT_CURRENT_CAROUSEL_ITEM()
   {
      this.SET_CAROUSEL_ITEM_STATE(this._currentSelectedItem,1);
   }
   function SET_CAROUSEL_ITEM_HOVER_STATE(whichItem, state, enabled)
   {
      var _loc2_ = this._carouselItems[whichItem];
      _loc2_.SET_HOVER_STATE(state);
   }
   function SHOW_CURRENT_ITEM()
   {
      if(this._currentSelectedItem > this._carouselItems.length - 1)
      {
         this._currentSelectedItem = this._carouselItems.length - 1;
      }
      if(this._currentSelectedItem < 0)
      {
         this._currentSelectedItem = 0;
      }
      var _loc3_ = this._currentOffset;
      var _loc2_ = this._currentOffset + this._maxVisibleItems - 1;
      if(this._currentSelectedItem < _loc3_)
      {
         this._currentOffset = this._currentSelectedItem;
      }
      else if(this._currentSelectedItem > _loc2_)
      {
         this._currentOffset = this._currentSelectedItem - this._maxVisibleItems + 1;
      }
      if(!this.showAnimation)
      {
         this._itemContainer._x = - this._currentOffset * (this.tempItem.itemWidth + this._padding);
         this.showAnimation = true;
      }
      this.animate();
   }
   function isInVisibleRange(itemIndex)
   {
      return itemIndex >= this._currentOffset && itemIndex < this._currentOffset + this._numberOfVisibleItems;
   }
   function handleScroll()
   {
      if(this._numberOfVisibleItems > this._carouselItems.length)
      {
         this._numberOfVisibleItems = this._carouselItems.length;
      }
      if(this._currentSelectedItem < this._currentOffset)
      {
         this._currentOffset = this._currentSelectedItem;
         this.animate();
      }
      else if(this._currentSelectedItem >= this._currentOffset + this._numberOfVisibleItems)
      {
         this._currentOffset = this._currentSelectedItem - this._numberOfVisibleItems + 1;
         this.animate();
      }
      this._currentVisibleIndex = this._currentSelectedItem - this._currentOffset;
      this.setMouseActiveOnVisibleItems();
   }
   function setMouseActiveOnVisibleItems()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._carouselItems.length)
      {
         _loc3_ = this._carouselItems[_loc2_];
         if(this.isInVisibleRange(_loc2_))
         {
            _loc3_.SET_MOUSE_ACTIVE(true);
         }
         else
         {
            _loc3_.SET_MOUSE_ACTIVE(false);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function NAV_RIGHT()
   {
      this._currentSelectedItem = this._currentSelectedItem + 1;
      if(this._currentSelectedItem > this._carouselItems.length - 1)
      {
         this._currentSelectedItem = this._carouselItems.length - 1;
      }
      this.SET_CAROUSEL_ITEM_STATE(this._currentSelectedItem,1);
   }
   function NAV_LEFT()
   {
      this._currentSelectedItem = this._currentSelectedItem - 1;
      if(this._currentSelectedItem < 0)
      {
         this._currentSelectedItem = 0;
      }
      this.SET_CAROUSEL_ITEM_STATE(this._currentSelectedItem,1);
   }
   function animate()
   {
      var newX = - this._currentOffset * (this.tempItem.itemWidth + this._padding);
      if(newX != this._x)
      {
         var c = this;
         var step = [0];
         this._itemContainer.onEnterFrame = function()
         {
            c.updateScrollPosition(this._x,newX,step,6);
         };
      }
   }
   function updateScrollPosition(start, goal, step, numSteps)
   {
      this._itemContainer._x = (goal - start) * (++step[0] / numSteps) + start;
      if(step[0] == numSteps)
      {
         this._itemContainer.onEnterFrame = undefined;
      }
      this.onMove();
   }
   function RESET_CAROUSEL_POSITION()
   {
      this._currentPosition = 0;
      this._currentSelectedItem = 0;
      this._currentOffset = 0;
      this._currentVisibleIndex = 0;
      this._itemContainer._x = 0;
      this.onMove();
   }
   function SET_SPINNER_VISIBLE(whichItem, isVisible)
   {
      var _loc2_ = this._carouselItems[whichItem];
      _loc2_.SET_SPINNER_VISIBLE(isVisible);
   }
   function GET_INDEX()
   {
      return this._currentSelectedItem;
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc6_ = 0.1 * sequenceIndex;
      var _loc5_ = 0.367;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc5_,{_alpha:100});
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._carouselItems.length)
      {
         _loc3_ = this._carouselItems[_loc2_];
         _loc3_.ANIMATE_IN(_loc2_ + sequenceIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
      this.rightGradient = null;
      this.leftGradient = null;
      this._carouselItems = null;
      this._itemContainer = null;
      this._carouselMask = null;
      this.tempItem = null;
      this.cursor = null;
   }
}
