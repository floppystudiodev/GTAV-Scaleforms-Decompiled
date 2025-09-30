class com.rockstargames.gtav.levelDesign.trustAndSafety.screens.MainScreen extends com.rockstargames.gtav.levelDesign.trustAndSafety.screens.Screen
{
   var app;
   var buttons;
   var contentScroller;
   var cursor;
   var items;
   var listContainer;
   var listItemLinkage;
   var listScrollDownTimestamp;
   var listScrollStep;
   var listScrollUpTimestamp;
   var listScroller;
   var view;
   var SCROLL_COOLDOWN = 100;
   function MainScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"mainScreen");
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.items = [];
      this.listScrollStep = 0;
      this.listScrollUpTimestamp = 0;
      this.listScrollDownTimestamp = 0;
      com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.setLocalisedText(this.view.heading,"PM_SAFEALERT");
      this.view.heading.text = this.view.heading.text.toUpperCase();
      if(this.app.displayConfig.isWideScreen)
      {
         this.listItemLinkage = "listItem";
      }
      else
      {
         this.listItemLinkage = "listItemNarrow";
         this.view.heading._x = 180;
         this.view.divider._x = 180;
         this.view.divider._width = 920;
         this.view.logo._x = this.view.divider._x + this.view.divider._width - this.view.logo._width;
         this.view.listScrollMask._x = 188;
         this.view.listScrollMask._width = 408;
         this.view.listScrollbar._x = this.view.listScrollMask._x + this.view.listScrollMask._width + 8;
         this.view.contentScrollMask._width = 460;
         this.view.contentPanel.heading._width = 460;
         this.view.contentPanel.body._width = 460;
         this.view.topFade.body._width = 460;
         this.view.bottomFade.body._width = 460;
         this.view.contentScrollbar._x = this.view.contentScrollMask._x + this.view.contentScrollMask._width + 4;
      }
      this.listContainer = this.view.createEmptyMovieClip("listContainer",this.view.getNextHighestDepth());
      this.listContainer._x = this.view.listScrollMask._x;
      this.listContainer._y = this.view.listScrollMask._y;
      this.listContainer.setMask(this.view.listScrollMask);
      this.listScroller = new com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller(this.listContainer,this.view.listScrollMask,this.view.listScrollbar.handle,this.view.listScrollbar.track);
      this.contentScroller = new com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Scroller(this.view.contentPanel,this.view.contentScrollMask,this.view.contentScrollbar.handle,this.view.contentScrollbar.track,this.view.topFade,this.view.bottomFade);
      this.view.contentPanel.heading.autoSize = "left";
      this.view.contentPanel.body.autoSize = "left";
   }
   function addItem(item)
   {
      var _loc3_ = this.items.length;
      var _loc2_ = this.listContainer.attachMovie(this.listItemLinkage,"item" + _loc3_,_loc3_);
      item.setView(_loc2_);
      _loc2_._y = _loc2_._height * _loc3_;
      this.items.push(item);
      this.listScrollStep = _loc2_._height;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Button(_loc3_,_loc2_);
      this.buttons.push(_loc4_);
      this.cursor.addTarget(_loc4_);
      this.onTargetChange(this.cursor.getTargetUnderCursor());
      if(_loc3_ == 0)
      {
         this.cursor.snapToTarget(_loc4_);
         this.showItem(item);
      }
      this.listScroller.update();
      _loc4_.enabled = this.listScroller.itemIsVisible(_loc2_);
   }
   function handleButtonInput(inputID)
   {
      var _loc2_;
      var _loc3_;
      if(inputID == com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.DPAD_UP)
      {
         _loc2_ = this.cursor.getTargetUnderCursor();
         if(_loc2_)
         {
            _loc3_ = this.items[_loc2_.id];
            if(this.listScroller.itemIsAtTop(_loc3_.view))
            {
               this.listScroller.stepBy(this.listScrollStep,false);
               this.updateListButtons();
            }
         }
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.DPAD_DOWN)
      {
         _loc2_ = this.cursor.getTargetUnderCursor();
         if(_loc2_)
         {
            _loc3_ = this.items[_loc2_.id];
            if(this.listScroller.itemIsAtBottom(_loc3_.view))
            {
               this.listScroller.stepBy(- this.listScrollStep,false);
               this.updateListButtons();
            }
         }
      }
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      var _loc2_;
      var _loc4_;
      if(isLeftStick)
      {
         if(!isMouseWheel)
         {
            _loc2_ = getTimer();
            if(y > 127 && _loc2_ - this.listScrollUpTimestamp > this.SCROLL_COOLDOWN)
            {
               this.listScrollUpTimestamp = _loc2_;
               this.cursor.snapInDirection(com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.DOWN);
               this.handleButtonInput(com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.DPAD_DOWN);
            }
            else if(y < 127 && _loc2_ - this.listScrollDownTimestamp > this.SCROLL_COOLDOWN)
            {
               this.listScrollDownTimestamp = _loc2_;
               this.cursor.snapInDirection(com.rockstargames.gtav.levelDesign.trustAndSafety.navigation.Cursor.UP);
               this.handleButtonInput(com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.DPAD_UP);
            }
         }
      }
      else if(isMouseWheel)
      {
         _loc4_ = this.cursor.getTargetUnderCursor();
         if(_loc4_ != null)
         {
            if(y > 127)
            {
               this.listScroller.stepBy(- this.listScrollStep,false);
               this.updateListButtons();
            }
            else if(y < 127)
            {
               this.listScroller.stepBy(this.listScrollStep,false);
               this.updateListButtons();
            }
         }
         else
         {
            this.contentScroller.scrollBy(y,true);
         }
      }
      else
      {
         this.contentScroller.scrollBy(y,false);
      }
   }
   function showItem(item)
   {
      this.view.contentPanel.heading.text = item.heading.toUpperCase();
      this.view.contentPanel.body._y = this.view.contentPanel.heading._height + 8;
      this.view.contentPanel.body.htmlText = item.body;
      this.contentScroller.reset();
      this.contentScroller.update();
   }
   function updateListButtons()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         _loc3_.updatePosition();
         _loc3_.enabled = this.listScroller.itemIsVisible(_loc3_.view);
         _loc2_ = _loc2_ + 1;
      }
      this.onTargetChange(this.cursor.getTargetUnderCursor());
   }
   function onTargetChange(target)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         _loc3_.setState(_loc3_ == target);
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = this.cursor.getTargetUnderCursor();
      var _loc5_;
      if(target)
      {
         _loc5_ = this.items[target.id];
         this.showItem(_loc5_);
      }
   }
   function setButtonsEnabled(enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].enabled = enabled;
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.buttons = [];
      this.items = null;
      this.listContainer = null;
      this.listScroller.dispose();
      this.listScroller = null;
      this.contentScroller.dispose();
      this.contentScroller = null;
      super.dispose();
   }
}
