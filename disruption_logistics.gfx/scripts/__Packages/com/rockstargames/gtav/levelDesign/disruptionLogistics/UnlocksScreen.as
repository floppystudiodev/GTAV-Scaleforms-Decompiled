class com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var _buttons;
   var activeScrollKey;
   var app;
   var currUnlockFilter;
   var cursor;
   var hasUnlockedItems;
   var safeZoneBottom;
   var scrollTimeDelta;
   var tabButtons;
   var tooltips;
   var unlockButtonIDs;
   var unlockButtons;
   var view;
   static var FADE_IN_TIME = 0.2;
   static var FADE_OUT_TIME = 0.5;
   static var FADE_IN_ARGS = {_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   static var FADE_OUT_ARGS = {_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   static var TAB_ACTIVE = new flash.geom.ColorTransform();
   static var TAB_INACTIVE = new flash.geom.ColorTransform(0,0,0,1,26,26,26,0);
   static var SCROLL_SPEED = 20;
   static var NUM_COLS = 3;
   static var COL_WIDTH = 200;
   static var ROW_HEIGHT = 239;
   function UnlocksScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"unlocksScreen");
      this.init();
   }
   function init()
   {
      this.hasUnlockedItems = false;
      this.scrollTimeDelta = 0;
      this.view.header.login.text = this.app.orgName;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.header.loginLabel,"UA_LOGGED_IN");
      this.view.header.loginLabel._x = this.view.header.login._x + this.view.header.login._width - this.view.header.login.textWidth - this.view.header.loginLabel.textWidth - 10;
      this.tooltips = [];
      this.view.listMask._height = this.safeZoneBottom - this.view.listMask._y;
      this.view.bgPanel._height = this.view.listMask._height + (this.view.listMask._y - this.view.bgPanel._y);
      var _loc3_ = this.view.createEmptyMovieClip("list",this.view.getNextHighestDepth());
      _loc3_._x = this.view.listMask._x;
      _loc3_._y = this.view.listMask._y;
      _loc3_.setMask(this.view.listMask);
      this._buttons = [];
      this.unlockButtons = [];
      this.unlockButtonIDs = [];
      this.tabButtons = [];
      var _loc2_ = this.view.allTab._x;
      _loc2_ = this.initTab(this.view.allTab,"UA_ALL",com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL,_loc2_);
      _loc2_ = this.initTab(this.view.unlockedTab,"UA_UNLOCKED",com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED,_loc2_);
      _loc2_ = this.initTab(this.view.lockedTab,"UA_LOCKED",com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED,_loc2_);
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.update();
      if(this.hasUnlockedItems)
      {
         this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED);
      }
      else
      {
         this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL);
      }
   }
   function initTab(tabView, label, id, x)
   {
      var _loc3_ = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(id,tabView,label);
      tabView.bg._width = 2 * tabView.label._x + tabView.label._width;
      tabView._x = x;
      _loc3_.updateBounds();
      this.tabButtons.push(_loc3_);
      return x + tabView.bg._width + 2;
   }
   function update()
   {
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < this.app.researchUnlockStates.length)
      {
         if(this.app.researchUnlockStates[_loc2_] != undefined)
         {
            _loc4_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.unlockButtonIDs.length)
            {
               if(this.unlockButtonIDs[_loc3_] == _loc2_)
               {
                  _loc4_ = true;
                  this.updateUnlock(this.unlockButtons[_loc3_].view._parent,this.app.researchUnlockStates[_loc2_],this.app.researchUnlockTextures[_loc2_],this.app.researchUnlockTitles[_loc2_],this.app.researchUnlockDescriptions[_loc2_]);
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
            if(!_loc4_)
            {
               this.addUnlock(_loc2_,this.app.researchUnlockStates[_loc2_],this.app.researchUnlockTextures[_loc2_],this.app.researchUnlockTitles[_loc2_],this.app.researchUnlockDescriptions[_loc2_]);
               this.resetScroll();
            }
            this.hasUnlockedItems = this.hasUnlockedItems || this.app.researchUnlockStates[_loc2_] == 2;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.updateButtons();
   }
   function updateStats()
   {
   }
   function addUnlock(index, state, txd, title, description)
   {
      var _loc2_ = this.view.list.attachMovie("unlockCombo","unlockCombo" + index,this.view.list.getNextHighestDepth());
      _loc2_._x = index % com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.COL_WIDTH;
      _loc2_._y = Math.floor(index / com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.ROW_HEIGHT;
      _loc2_.image.padlock._visible = state == com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.DISABLED;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.UNLOCK_BASE + index,_loc2_.button,title,true);
      _loc2_.button.label.textAutoSize = "shrink";
      this.unlockButtons.push(_loc4_);
      this.unlockButtonIDs.push(index);
      this.initUnlockImage(_loc2_.image,txd,description);
      this.view.listMask._height = this.safeZoneBottom - this.view.listMask._y;
      if(this.view.listMask._height > this.view.list._height)
      {
         this.view.listMask._height = this.view.list._height;
      }
      this.view.bgPanel._height = this.view.listMask._height + (this.view.listMask._y - this.view.bgPanel._y);
   }
   function initUnlockImage(imageView, txd, label)
   {
      this.app.imageManager.addImage("UA_GENERIC",txd,imageView.image);
      imageView.tooltip.label.text = label;
      imageView.tooltip._alpha = 0;
      imageView.currImage = txd;
      this.tooltips.push(imageView.tooltip);
   }
   function updateUnlock(unlockView, state, txd, title, description)
   {
      unlockView.image.padlock._visible = state == com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.DISABLED;
      unlockView.image.tooltip.label.text = description;
      unlockView.button.label.text = title;
      if(unlockView.image.currImage != txd)
      {
         unlockView.image.currImage = txd;
         this.app.imageManager.addImage("UA_GENERIC",txd,unlockView.image.image);
      }
   }
   function onTargetChange(id)
   {
      var _loc3_ = id - com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.UNLOCK_BASE;
      var _loc2_ = 0;
      while(_loc2_ < this.unlockButtonIDs.length)
      {
         if(this.unlockButtonIDs[_loc2_] == _loc3_)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.tooltips[_loc2_],com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.FADE_IN_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.FADE_IN_ARGS);
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.tooltips[_loc2_],com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.FADE_OUT_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.FADE_OUT_ARGS);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.tooltips.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.tooltips[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      delete this.view.onEnterFrame;
      this.tooltips = null;
      this.unlockButtons = null;
      this.tabButtons = null;
      super.dispose();
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel, isSlowingDown)
   {
      var _loc4_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc4_ *= 2;
      }
      var _loc5_;
      var _loc3_;
      var _loc6_;
      if(!isLeftStick)
      {
         _loc5_ = getTimer();
         _loc3_ = _loc5_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         _loc6_ = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.SCROLL_SPEED * _loc3_ / 32;
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
   function handleButtonInput(inputID)
   {
      var _loc2_;
      if(inputID == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.ACCEPT)
      {
         _loc2_ = this.app.GET_CURRENT_SELECTION();
         switch(_loc2_)
         {
            case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL:
            case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED:
            case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED:
               this.filterUnlocks(_loc2_);
            default:
               return;
         }
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.LB)
      {
         if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED);
         }
         else if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL);
         }
         else if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED);
         }
      }
      else if(inputID == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.RB)
      {
         if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED);
         }
         else if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED);
         }
         else if(this.currUnlockFilter == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED)
         {
            this.filterUnlocks(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL);
         }
      }
   }
   function handleButtonInputRelease(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.KEY_UP:
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.KEY_DOWN:
            if(inputID == this.activeScrollKey)
            {
               delete this.view.onEnterFrame;
            }
         default:
            return;
      }
   }
   function scrollListFromKeyboard(direction)
   {
      var _loc3_ = getTimer();
      var _loc2_ = _loc3_ - this.scrollTimeDelta;
      _loc2_ = Math.max(16,Math.min(40,_loc2_));
      var _loc4_ = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.SCROLL_SPEED * _loc2_ / 32;
      this.scrollTimeDelta = _loc3_;
      this.scrollList((- _loc4_) * direction);
      this.view.onEnterFrame = this.delegate(this,this.scrollListFromKeyboard,direction);
   }
   function scrollList(dy)
   {
      var _loc2_ = this.view.listMask._y;
      var _loc3_ = this.safeZoneBottom - this.view.list._height;
      var _loc4_ = this.view.list._y + dy;
      if(this.view.list._height > this.view.listMask._height)
      {
         this.view.list._y = Math.max(Math.min(_loc2_,_loc4_),_loc3_);
      }
      this.updateButtons();
      this.updateScrollbar();
   }
   function resetScroll()
   {
      this.view.list._y = this.view.listMask._y;
      this.updateScrollbar();
   }
   function updateScrollbar()
   {
      var _loc2_ = this.view.listMask._y;
      var _loc3_ = this.view.listMask._y + this.view.listMask._height;
      var _loc4_ = this.safeZoneBottom - this.view.list._height;
      var _loc7_ = this.view.listMask._y;
      var _loc6_ = (this.view.list._y - _loc4_) / (_loc7_ - _loc4_);
      var _loc8_ = Math.min(_loc2_ + this.view.listMask._height,this.view.list._y + this.view.list._height);
      var _loc9_ = Math.min(1,(_loc8_ - _loc2_) / this.view.list._height);
      this.view.scrollbar._height = _loc9_ * (_loc3_ - _loc2_);
      var _loc5_ = _loc3_ - this.view.scrollbar._height;
      this.view.scrollbar._y = (1 - _loc6_) * (_loc5_ - _loc2_) + _loc2_;
      this.view.scrollbar._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,0.75,{_alpha:0,delay:0.25});
   }
   function updateButtons()
   {
      this._buttons = [].concat(this.tabButtons);
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      var _loc5_;
      while(_loc3_ < this.unlockButtons.length)
      {
         _loc2_ = this.unlockButtons[_loc3_];
         _loc4_ = _loc2_.view._y + _loc2_.view._parent._y + _loc2_.view._parent._parent._y;
         _loc5_ = _loc4_ + _loc2_.view._height;
         _loc2_.top = Math.max(this.view.listMask._y,_loc4_);
         _loc2_.bottom = Math.min(this.view.listMask._y + this.view.listMask._height,_loc5_);
         if(_loc2_.top > _loc2_.bottom)
         {
            _loc2_.top = _loc2_.bottom = -10;
         }
         if(_loc2_.isActive)
         {
            this._buttons.push(_loc2_);
         }
         else
         {
            _loc2_.top = _loc2_.bottom = -10;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.app.updateButtons();
   }
   function filterUnlocks(buttonId)
   {
      switch(buttonId)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL:
            this.view.allTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_ACTIVE;
            this.view.unlockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            this.view.lockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED:
            this.view.allTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            this.view.unlockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_ACTIVE;
            this.view.lockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED:
            this.view.allTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            this.view.unlockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_INACTIVE;
            this.view.lockedTab.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.TAB_ACTIVE;
      }
      var _loc5_ = 0;
      var _loc4_ = 0;
      var _loc2_;
      var _loc3_;
      while(_loc4_ < this.unlockButtons.length)
      {
         _loc2_ = this.unlockButtons[_loc4_];
         _loc3_ = this.app.researchUnlockStates[this.unlockButtonIDs[_loc4_]];
         if(buttonId == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_ALL)
         {
            _loc2_.state = _loc3_;
         }
         else if(buttonId == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_UNLOCKED)
         {
            _loc2_.state = _loc3_ != com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.ACTIVE ? com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.HIDDEN : _loc3_;
         }
         else if(buttonId == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.TAB_LOCKED)
         {
            _loc2_.state = _loc3_ != com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.DISABLED ? com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.HIDDEN : _loc3_;
         }
         _loc2_.view._parent._visible = _loc2_.view._visible;
         if(_loc2_.view._visible)
         {
            _loc2_.view._parent._x = _loc5_ % com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.NUM_COLS * com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.COL_WIDTH;
            _loc2_.view._parent._y = Math.floor(_loc5_ / com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.NUM_COLS) * com.rockstargames.gtav.levelDesign.disruptionLogistics.UnlocksScreen.ROW_HEIGHT;
            _loc5_ = _loc5_ + 1;
         }
         else
         {
            _loc2_.view._parent._x = 0;
            _loc2_.view._parent._y = 0;
         }
         _loc2_.updateBounds();
         _loc4_ = _loc4_ + 1;
      }
      this.currUnlockFilter = buttonId;
      this.resetScroll();
      this.updateButtons();
   }
}
