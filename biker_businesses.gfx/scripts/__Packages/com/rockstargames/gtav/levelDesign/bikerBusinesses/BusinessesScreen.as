class com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var controls;
   var filterButtons;
   var tabs;
   var tabContent;
   var ownedBusinessCards;
   var forSaleBusinessCards;
   var activeSortOrder;
   var activeTabIndex;
   var scrollTimeDelta;
   var app;
   var view;
   var filterButtonY0;
   var filterButtonDY;
   var safeZoneBottom;
   var activeScrollKey;
   var activeFilterButtonView;
   var cursor;
   static var OWNED_TAB = 1001;
   static var FOR_SALE_TAB = 1002;
   static var FILTER_ALL = 1003;
   static var FILTER_WEED = 1004;
   static var FILTER_DOCS = 1005;
   static var FILTER_CASH = 1006;
   static var FILTER_METH = 1007;
   static var FILTER_CRACK = 1008;
   static var SORT_LIST = 1009;
   static var SCROLL_SPEED = 20;
   static var NUM_COLS = 3;
   static var COL_WIDTH = 225;
   static var ROW_HEIGHT = 240;
   function BusinessesScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"businessesScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      this.filterButtons = [];
      this.tabs = [];
      this.tabContent = [];
      this.ownedBusinessCards = [];
      this.forSaleBusinessCards = [];
      this.activeSortOrder = Array.NUMERIC;
      this.activeTabIndex = 0;
      this.scrollTimeDelta = 0;
      this.initHeader();
      this.initFilterButtons();
      this.initSortButton();
      this.initTabs();
      this.initTabContent();
      if(this.app.selectedTab != undefined)
      {
         this.showTab(this.app.selectedTab);
      }
      else
      {
         this.showTab(!this.ownedBusinessCards.length ? 1 : 0);
      }
      switch(this.app.selectedFilter)
      {
         case 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_WEED:
            this.applyFilter(this.view.filterWeed,this.app.selectedFilter);
            break;
         case 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_DOCS:
            this.applyFilter(this.view.filterDocs,this.app.selectedFilter);
            break;
         case 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CASH:
            this.applyFilter(this.view.filterCash,this.app.selectedFilter);
            break;
         case 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_METH:
            this.applyFilter(this.view.filterMeth,this.app.selectedFilter);
            break;
         case 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CRACK:
            this.applyFilter(this.view.filterCrack,this.app.selectedFilter);
            break;
         default:
            this.applyFilter(this.view.filterAll,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_WEED | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_DOCS | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CASH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_METH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CRACK);
      }
      if(this.app.selectedSorting != undefined)
      {
         this.applySortOrder(this.app.selectedSorting);
      }
      else
      {
         this.applySortOrder(Array.NUMERIC);
      }
      this.updateScrollbar();
      this.view._visible = true;
   }
   function initHeader()
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.header.version,"BIKEBIZ_VERSION");
   }
   function initFilterButtons()
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.categoriesLabel,"BIKEBIZ_CATEGORIES");
      this.controls.push(this.initFilterButton(this.view.filterAll,"BIKEBIZ_ALL",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_ALL));
      this.filterButtons[0] = this.initFilterButton(this.view.filterDocs,"BIKEBIZ_DOCS",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_DOCS);
      this.filterButtons[1] = this.initFilterButton(this.view.filterWeed,"BIKEBIZ_WEED",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_WEED);
      this.filterButtons[2] = this.initFilterButton(this.view.filterCash,"BIKEBIZ_CASH",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_CASH);
      this.filterButtons[3] = this.initFilterButton(this.view.filterMeth,"BIKEBIZ_METH",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_METH);
      this.filterButtons[4] = this.initFilterButton(this.view.filterCrack,"BIKEBIZ_CRACK",com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_CRACK);
      this.filterButtonY0 = this.view.filterWeed._y;
      this.filterButtonDY = this.view.filterWeed._y - this.view.filterAll._y;
   }
   function initFilterButton(buttonView, label, id)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(id,buttonView);
      buttonView.label.txt.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(buttonView.label.txt,label);
      return _loc2_;
   }
   function initSortButton()
   {
      this.view.sort.label.autoSize = "left";
      var _loc2_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.SORT_LIST,this.view.sort,"BIKEBIZ_SORT_LOW_HIGH");
      this.view.sort.sortLabel.text = com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sort.sortLabel,"BIKEBIZ_SORT") + ": ";
      this.view.sort.label._x = this.view.sort.sortLabel._x + this.view.sort.sortLabel.textWidth;
      this.view.sort.y0 = this.view.sort._y;
      this.controls.push(_loc2_);
   }
   function initTabs()
   {
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.ownedTab.label.txt,"BIKEBIZ_OWNED");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.forSaleTab.label.txt,"BIKEBIZ_FOR_SALE");
      var _loc2_ = Math.round(Math.max(this.view.ownedTab.label.txt.textWidth,this.view.forSaleTab.label.txt.textWidth));
      this.view.ownedTab.label.txt._width = this.view.forSaleTab.label.txt._width = _loc2_ + 20;
      this.view.ownedTab.greyBG._width = this.view.forSaleTab.greyBG._width = _loc2_ + 20;
      this.view.ownedTab.gradientBG._width = this.view.forSaleTab.gradientBG._width = _loc2_ + 18;
      this.view.forSaleTab._x = this.view.ownedTab._x + this.view.ownedTab._width;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.OWNED_TAB,this.view.ownedTab);
      this.controls.push(_loc4_);
      this.tabs.push(_loc4_);
      var _loc3_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FOR_SALE_TAB,this.view.forSaleTab);
      this.controls.push(_loc3_);
      this.tabs.push(_loc3_);
   }
   function initTabContent()
   {
      var _loc7_ = this.view.createEmptyMovieClip("ownedContent",this.view.getNextHighestDepth());
      _loc7_._x = this.view.ownedBusinessesMask._x;
      _loc7_._y = this.view.ownedBusinessesMask._y;
      if(this.safeZoneBottom - this.view.ownedBusinessesMask._y < this.view.ownedBusinessesMask._height)
      {
         this.view.ownedBusinessesMask._height = this.safeZoneBottom - this.view.ownedBusinessesMask._y;
      }
      this.tabContent.push(_loc7_);
      var _loc8_ = this.view.createEmptyMovieClip("forSaleContent",this.view.getNextHighestDepth());
      _loc8_._x = this.view.forSaleBusinessesMask._x;
      _loc8_._y = this.view.forSaleBusinessesMask._y;
      this.view.forSaleBusinessesMask._height = this.safeZoneBottom - this.view.forSaleBusinessesMask._y;
      this.tabContent.push(_loc8_);
      var _loc5_ = [];
      var _loc6_ = [];
      var _loc2_ = 0;
      var _loc4_ = this.app.businesses.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.app.businesses[_loc2_];
         if(_loc3_.isOwned)
         {
            _loc5_.push(_loc3_);
         }
         else
         {
            _loc6_.push(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.initBusinessCardSet(_loc5_,_loc7_,true);
      _loc7_.setMask(this.view.ownedBusinessesMask);
      this.initBusinessCardSet(_loc6_,_loc8_,false);
      _loc8_.setMask(this.view.forSaleBusinessesMask);
      this.view.footer.swapDepths(this.view.getNextHighestDepth());
   }
   function initBusinessCardSet(businesses, container, isOwned)
   {
      var _loc2_ = 0;
      var _loc7_ = businesses.length;
      while(_loc2_ < _loc7_)
      {
         var _loc5_ = container.getNextHighestDepth();
         var _loc4_ = container.attachMovie("businessCard","businessCard" + _loc5_,_loc5_);
         _loc4_._x = _loc2_ % com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.COL_WIDTH;
         _loc4_._y = Math.floor(_loc2_ / com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.ROW_HEIGHT;
         var _loc3_ = new com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessCard(_loc4_,this.view.forSaleBusinessesMask._y);
         if(isOwned)
         {
            _loc3_.initOwnedView(businesses[_loc2_],this.app.imageManager,_loc2_,0);
            this.ownedBusinessCards.push(_loc3_);
         }
         else
         {
            _loc3_.initForSaleView(businesses[_loc2_],this.app.imageManager,_loc2_,0);
            this.forSaleBusinessCards.push(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.ACCEPT:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LB:
            this.showTab(0);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.RB:
            this.showTab(1);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_UP:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_UP;
            this.scrollListFromKeyboard(-1);
            break;
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_DOWN:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_DOWN;
            this.scrollListFromKeyboard(1);
      }
   }
   function handleAcceptInput(inputID)
   {
      var _loc2_ = this.app.GET_CURRENT_SELECTION();
      var _loc3_ = this.app.getBusinessByID(_loc2_);
      if(_loc3_)
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
         this.app.selectedBusinessID = _loc2_;
         this.app.showScreen(!_loc3_.isOwned ? this.app.DETAILS_SCREEN : this.app.SUMMARY_SCREEN);
      }
      else
      {
         switch(_loc2_)
         {
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.OWNED_TAB:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.showTab(0);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FOR_SALE_TAB:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.showTab(1);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_ALL:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterAll,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_WEED | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_DOCS | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CASH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_METH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CRACK);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_WEED:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterWeed,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_WEED);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_DOCS:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterDocs,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_DOCS);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_CASH:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterCash,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CASH);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_METH:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterMeth,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_METH);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.FILTER_CRACK:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applyFilter(this.view.filterCrack,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CRACK);
               break;
            case com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.SORT_LIST:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Link");
               this.applySortOrder(this.activeSortOrder != Array.NUMERIC ? Array.NUMERIC : Array.NUMERIC | Array.DESCENDING);
               break;
            default:
               com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
         }
      }
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel, isSlowingDown)
   {
      var _loc4_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc4_ *= 2;
      }
      if(!isLeftStick)
      {
         var _loc5_ = getTimer();
         var _loc3_ = _loc5_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         var _loc6_ = com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.SCROLL_SPEED * _loc3_ / 32;
         this.scrollTimeDelta = _loc5_;
         this.scrollList((- _loc6_) * _loc4_);
         if(isMouseWheel)
         {
            if(y != 127)
            {
               y += 0.17 * (127 - y);
               if(Math.abs(y - 127) < 1)
               {
                  y = 127;
               }
               this.view.onEnterFrame = this.delegate(this,this.handleJoystickInput,isLeftStick,x,y,true);
            }
            else if(isSlowingDown)
            {
               delete this.view.onEnterFrame;
            }
         }
         else
         {
            delete this.view.onEnterFrame;
         }
      }
   }
   function handleButtonInputRelease(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_UP:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.KEY_DOWN:
            if(inputID == this.activeScrollKey)
            {
               delete this.view.onEnterFrame;
            }
      }
   }
   function scrollListFromKeyboard(direction)
   {
      var _loc3_ = getTimer();
      var _loc2_ = _loc3_ - this.scrollTimeDelta;
      _loc2_ = Math.max(16,Math.min(40,_loc2_));
      var _loc4_ = com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.SCROLL_SPEED * _loc2_ / 32;
      this.scrollTimeDelta = _loc3_;
      this.scrollList((- _loc4_) * direction);
      this.view.onEnterFrame = this.delegate(this,this.scrollListFromKeyboard,direction);
   }
   function scrollList(dy)
   {
      var _loc2_ = this.view.forSaleBusinessesMask._y;
      var _loc3_ = this.safeZoneBottom - this.view.forSaleContent._height - this.view.footer._height;
      var _loc4_ = this.view.forSaleContent._y + dy;
      if(this.view.forSaleContent._height > this.view.forSaleBusinessesMask._height)
      {
         this.view.forSaleContent._y = Math.max(Math.min(_loc2_,_loc4_),_loc3_);
      }
      this.updateButtons();
      this.updatePanelBorder(this.activeTabIndex);
      this.updateScrollbar();
   }
   function resetScroll()
   {
      this.view.forSaleContent._y = this.view.forSaleBusinessesMask._y;
      this.updateScrollbar();
   }
   function showTab(index)
   {
      this.activeTabIndex = index;
      var _loc2_ = 0;
      var _loc5_ = this.tabs.length;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = this.tabs[_loc2_].view;
         _loc3_.gotoAndStop(_loc2_ != index ? "off" : "on");
         _loc3_.gradientBG._visible = _loc3_.greyBG._visible = _loc2_ == index;
         this.tabContent[_loc2_]._visible = _loc2_ == index;
         _loc2_ = _loc2_ + 1;
      }
      this.view.sort._y = this.activeTabIndex != 1 ? -200 : this.view.sort.y0;
      this.resetScroll();
      this.updateAvailableFilters();
      this.updateBusinessCards();
      this.updateButtons();
      this.app.selectedTab = index;
   }
   function applyFilter(filterButtonView, filter)
   {
      this.activeFilterButtonView = filterButtonView;
      var _loc2_ = 0;
      var _loc3_ = this.forSaleBusinessCards.length;
      while(_loc2_ < _loc3_)
      {
         this.forSaleBusinessCards[_loc2_].filter(filter);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.ownedBusinessCards.length;
      while(_loc2_ < _loc3_)
      {
         this.ownedBusinessCards[_loc2_].filter(filter);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.filterButtons.length;
      while(_loc2_ < _loc3_)
      {
         if(this.activeFilterButtonView == this.filterButtons[_loc2_].view)
         {
            this.filterButtons[_loc2_].view.gotoAndStop("on");
         }
         else
         {
            this.filterButtons[_loc2_].view.gotoAndStop("off");
         }
         _loc2_ = _loc2_ + 1;
      }
      this.view.filterAll.gotoAndStop(this.activeFilterButtonView != this.view.filterAll ? "off" : "on");
      this.resetScroll();
      this.updateBusinessCards();
      this.updateButtons();
      this.app.selectedFilter = filter;
   }
   function applySortOrder(order)
   {
      this.activeSortOrder = order;
      this.view.sort.label.text = com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.sort.label,this.activeSortOrder != Array.NUMERIC ? "BIKEBIZ_SORT_HIGH_LOW" : "BIKEBIZ_SORT_LOW_HIGH");
      this.resetScroll();
      this.updateBusinessCards();
      this.updateButtons();
      this.app.selectedSorting = order;
   }
   function updateBusinessCards()
   {
      var _loc5_ = this.activeTabIndex != 0 ? this.forSaleBusinessCards : this.ownedBusinessCards;
      var _loc4_ = [];
      var _loc2_ = 0;
      var _loc7_ = _loc5_.length;
      while(_loc2_ < _loc7_)
      {
         _loc4_[_loc2_] = {price:_loc5_[_loc2_].price,index:_loc2_};
         _loc2_ = _loc2_ + 1;
      }
      _loc4_.sortOn("price",this.activeSortOrder);
      var _loc6_ = 0;
      _loc2_ = 0;
      _loc7_ = _loc4_.length;
      while(_loc2_ < _loc7_)
      {
         var _loc3_ = _loc5_[_loc4_[_loc2_].index];
         if(_loc3_.isVisible)
         {
            _loc3_.view._x = _loc6_ % com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.COL_WIDTH;
            _loc3_.view._y = Math.floor(_loc6_ / com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.bikerBusinesses.BusinessesScreen.ROW_HEIGHT;
            _loc6_ = _loc6_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.updatePanelBorder(this.activeTabIndex);
      this.updateScrollbar();
   }
   function updateAvailableFilters()
   {
      var _loc4_ = [0,0,0,0,0];
      var _loc3_ = this.activeTabIndex != 0 ? this.forSaleBusinessCards : this.ownedBusinessCards;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc4_[_loc3_[_loc2_].type]++;
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = this.filterButtonY0;
      _loc2_ = 0;
      while(_loc2_ < this.filterButtons.length)
      {
         if(_loc4_[_loc2_])
         {
            this.filterButtons[_loc2_].view._y = _loc5_;
            this.filterButtons[_loc2_].view._visible = true;
            _loc5_ += this.filterButtonDY;
         }
         else
         {
            this.filterButtons[_loc2_].view._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.activeFilterButtonView != undefined && !this.activeFilterButtonView._visible)
      {
         this.applyFilter(this.view.filterAll,1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_WEED | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_DOCS | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CASH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_METH | 1 << com.rockstargames.gtav.levelDesign.bikerBusinesses.Business.TYPE_CRACK);
      }
   }
   function updateButtons()
   {
      var _loc4_ = [].concat(this.controls);
      var _loc3_ = 0;
      while(_loc3_ < this.filterButtons.length)
      {
         if(this.filterButtons[_loc3_].view._visible)
         {
            _loc4_.push(this.filterButtons[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc2_ = this.activeTabIndex != 0 ? this.forSaleBusinessCards : this.ownedBusinessCards;
      _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(_loc2_[_loc3_].view._visible)
         {
            var _loc5_ = _loc2_[_loc3_].view._y + _loc2_[_loc3_].view._height + _loc2_[_loc3_].view._parent._y;
            if(_loc5_ > this.view.forSaleBusinessesMask._y)
            {
               _loc4_.push(_loc2_[_loc3_]);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc4_[_loc3_].updateBounds();
         _loc3_ = _loc3_ + 1;
      }
      this.cursor.setTargetRects(_loc4_);
   }
   function updatePanelBorder(tabIndex)
   {
      this.view.whiteBG._height = this.tabContent[tabIndex]._y + this.tabContent[tabIndex]._height - this.view.whiteBG._y + 8;
      this.view.greyBG._height = this.view.whiteBG._height + 2;
   }
   function updateScrollbar()
   {
      var _loc2_ = this.view.greyBG._y + 3;
      var _loc3_ = this.view.forSaleBusinessesMask._y + this.view.forSaleBusinessesMask._height;
      if(this.activeTabIndex == 0)
      {
         this.view.scrollbar._y = _loc2_;
         this.view.scrollbar._height = this.view.greyBG._height - 6;
      }
      else
      {
         var _loc4_ = this.safeZoneBottom - this.view.forSaleContent._height - this.view.footer._height;
         var _loc7_ = this.view.forSaleBusinessesMask._y;
         var _loc6_ = (this.view.forSaleContent._y - _loc4_) / (_loc7_ - _loc4_);
         var _loc8_ = Math.min(_loc2_ + this.view.forSaleBusinessesMask._height,this.view.forSaleContent._y + this.view.forSaleContent._height);
         var _loc9_ = Math.min(1,(_loc8_ - _loc2_) / this.view.forSaleContent._height);
         this.view.scrollbar._height = _loc9_ * (_loc3_ - _loc2_);
         var _loc5_ = _loc3_ - this.view.scrollbar._height;
         this.view.scrollbar._y = (1 - _loc6_) * (_loc5_ - _loc2_) + _loc2_;
      }
      this.view.scrollbar._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,0.75,{_alpha:0,delay:0.25});
   }
   function dispose()
   {
      delete this.view.onEnterFrame;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      var _loc3_ = 0;
      var _loc4_ = this.forSaleBusinessCards.length;
      while(_loc3_ < _loc4_)
      {
         this.forSaleBusinessCards[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      _loc4_ = this.ownedBusinessCards.length;
      while(_loc3_ < _loc4_)
      {
         this.ownedBusinessCards[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
}
