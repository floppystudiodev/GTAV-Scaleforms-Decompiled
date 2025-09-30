class com.rockstargames.gtav.FrontendGen9.progressHub.screens.Screen
{
   var _carousel;
   var app;
   var buttons;
   var carouselButtons;
   var cursor;
   var cursorListenerID;
   var dataObject;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var screenDataArray;
   var screenDataObject;
   var view;
   function Screen(app, viewContainer, cursor, viewLinkage, dataObject)
   {
      this.app = app;
      this.cursor = cursor;
      this.dataObject = dataObject;
      var _loc3_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc3_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.STAGE_HEIGHT;
      this.screenDataArray = new Array();
      this.carouselButtons = [];
   }
   function setupCarousel()
   {
      this._carousel = com.rockstargames.gtav.FrontendGen9.progressHub.ui.Carousel(this.view.attachMovie("carousel","carousel",this.app.TIMELINE.getNextHighestDepth(),{_x:64,_y:519}));
      var s = this;
      this._carousel.onMove = function()
      {
         s.onCarouselMove();
      };
   }
   function ADD_CAROUSEL_ITEM(itemDataObject)
   {
      var _loc5_ = this._carousel.ADD_CAROUSEL_ITEM(itemDataObject.title,itemDataObject.itemImage,itemDataObject.status,itemDataObject.itemTXD,itemDataObject.meterValue,this.app);
      this.screenDataArray.push(itemDataObject);
      var _loc2_ = this.screenDataArray.length - 1;
      this.view._carousel.ANIMATE_IN(_loc2_);
      if(this.dataObject.startingIndex == _loc2_)
      {
         this._carousel.SET_CAROUSEL_ITEM_STATE(this.dataObject.startingIndex,1,true);
      }
      else if(_loc2_ == 0)
      {
         this._carousel.SET_CAROUSEL_ITEM_STATE(0,1,true);
      }
      var _loc3_ = new com.rockstargames.gtav.FrontendGen9.progressHub.ui.Button(_loc2_,_loc5_.buttonImage);
      this.buttons.push(_loc3_);
      this.carouselButtons.push(_loc3_);
      this.cursor.addTarget(_loc3_);
      if(this.carouselButtons.length == 1)
      {
         this.cursor.snapToTarget(_loc3_);
      }
   }
   function handleButtonInput(inputID)
   {
      var _loc2_ = this.cursor.getTargetUnderCursor();
      if(_loc2_)
      {
         if(_loc2_.id >= 0 && _loc2_.id < this.carouselButtons.length)
         {
            this._carousel.SET_CAROUSEL_ITEM_STATE(_loc2_.id,1);
            this.updateScreen(this._carousel.GET_INDEX());
         }
      }
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      var _loc6_;
      var _loc5_;
      var _loc3_;
      var _loc2_;
      if(isMouseWheel && y != 127)
      {
         if(this._carousel.bounds.containsPoint(this.cursor.getPosition()))
         {
            y += 0.17 * (127 - y);
            if(Math.abs(y - 127) > 1)
            {
               _loc6_ = (y - 127) / 127;
               _loc5_ = this._carousel.GET_INDEX();
               if(_loc6_ < -0.5)
               {
                  this._carousel.NAV_LEFT();
                  _loc3_ = this._carousel.GET_INDEX();
                  if(_loc3_ != _loc5_)
                  {
                     this.updateScreen(_loc3_);
                  }
               }
               else if(_loc6_ > 0.5)
               {
                  this._carousel.NAV_RIGHT();
                  _loc3_ = this._carousel.GET_INDEX();
                  if(_loc3_ != _loc5_)
                  {
                     this.updateScreen(_loc3_);
                  }
               }
            }
            _loc2_ = 0;
            while(_loc2_ < this.carouselButtons.length)
            {
               if(this.carouselButtons[_loc2_].id == _loc3_)
               {
                  this.cursor.snapToTarget(this.carouselButtons[_loc2_]);
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
   }
   function handleMouseInput(x, y)
   {
   }
   function customCancelResponse()
   {
      return false;
   }
   function setButtonsEnabled(enabled)
   {
   }
   function onTargetChange(target)
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.carouselButtons.length)
      {
         _loc2_ = this.carouselButtons[_loc3_];
         if(_loc2_ == target)
         {
            this.updateScreen(_loc2_.id);
            this._carousel.SET_CAROUSEL_ITEM_STATE(_loc2_.id,1);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateScreen(index)
   {
   }
   function addInformation(newDataObject)
   {
   }
   function clearInformation(index)
   {
   }
   function addTag(newDataObject)
   {
   }
   function dispose()
   {
      this.dataObject = null;
      this.screenDataObject = null;
      this.screenDataArray = [];
      this.buttons = null;
      this.carouselButtons = null;
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor.reset();
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
      this._carousel.dispose();
      this._carousel = null;
   }
   function setUpLabel(textField, label, uppercase, verticalAlignment, letterSpacing)
   {
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.setLocalisedText(textField,label);
      if(letterSpacing == undefined)
      {
         letterSpacing = 1;
      }
      if(uppercase)
      {
         label = label.toUpperCase();
      }
      textField.verticalAlign = verticalAlignment;
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.resizeAsianText(textField);
      }
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.truncate(textField,textField.text,"left",letterSpacing);
   }
   function setUpText(textField, label, uppercase, verticalAlignment, letterSpacing)
   {
      if(letterSpacing == undefined)
      {
         letterSpacing = 1;
      }
      if(uppercase)
      {
         label = label.toUpperCase();
      }
      textField.verticalAlign = verticalAlignment;
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.resizeAsianText(textField);
      }
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.truncate(textField,label,"left",letterSpacing);
   }
   function setupTabs(leftTab, rightTab, rightPrompt)
   {
      leftTab.background._width = leftTab.textField._width + 16;
      rightTab.background._width = rightTab.textField._width + 16;
      rightTab._x = leftTab._x + leftTab._width;
      rightPrompt._x = rightTab._x + rightTab._width + 12;
   }
   function setUpNumber(textField, number, prefix)
   {
      textField.textAutoSize = "shrink";
      textField.verticalAlign = "center";
      textField.text = prefix + com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.formatNumber(number);
   }
   function GET_CURRENT_SELECTION(isMouseClick)
   {
      var _loc2_;
      if(isMouseClick)
      {
         _loc2_ = this.cursor.getTargetUnderCursor();
         return !_loc2_ ? -1 : _loc2_.id;
      }
      return this._carousel.GET_INDEX();
   }
   function NAV_UP()
   {
   }
   function NAV_DOWN()
   {
   }
   function NAV_RIGHT()
   {
      this._carousel.NAV_RIGHT();
   }
   function NAV_LEFT()
   {
      this._carousel.NAV_LEFT();
   }
   function onCarouselMove()
   {
      var _loc3_ = this._carousel.GET_INDEX();
      var _loc2_ = 0;
      while(_loc2_ < this.carouselButtons.length)
      {
         this.carouselButtons[_loc2_].updatePosition();
         this.carouselButtons[_loc2_].applyBounds(this._carousel.bounds);
         if(this.carouselButtons[_loc2_].id == _loc3_)
         {
            this.cursor.snapToTarget(this.carouselButtons[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
