class com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var scrollTimeDelta;
   var cursor;
   var view;
   var overlay;
   var backButton;
   var app;
   var safeZoneBottom;
   var activeScrollKey;
   var currTargetID;
   static var BACK = 6001;
   static var OVERLAY_ACCEPT = 6002;
   static var OVERLAY_CANCEL = 6003;
   static var SCROLL_SPEED = 20;
   function SpecialVehiclesScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"specialVehiclesScreen");
      this.init();
   }
   function init()
   {
      this.scrollTimeDelta = 0;
      this.initOverlay();
      this.initBackButton();
      this.initTitle();
      this.initMap();
      this.initList();
      this.updateButtons();
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      this.view._visible = true;
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.securoserv.PurchaseOutcomeOverlay(this.view.overlay,com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.OVERLAY_ACCEPT,com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.OVERLAY_CANCEL);
      this.overlay.hide();
   }
   function initBackButton()
   {
      this.backButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.BACK,this.view.backButton,"SECUROSERV_BACK");
   }
   function initTitle()
   {
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.title,"SECUROSERV_SPECIAL_VEHICLES");
      this.view.titleBG._width = 2 * (this.view.title._x - this.view.titleBG._x) + this.view.title.textWidth;
   }
   function initMap()
   {
      this.view.map._x = this.app.mapStartX;
      this.view.map._y = this.app.mapStartY;
      if(this.app.mapStartMatrix)
      {
         this.view.map.transform.matrix = this.app.mapStartMatrix;
      }
      else
      {
         var _loc2_ = this.view.map.transform.matrix;
         var _loc3_ = this.app.mapStartScale / _loc2_.a;
         _loc2_.translate(- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,- com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         _loc2_.scale(_loc3_,_loc3_);
         _loc2_.translate(com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_X,com.rockstargames.gtav.levelDesign.securoserv.Screen.STAGE_CENTRE_Y);
         this.view.map.transform.matrix = _loc2_;
      }
   }
   function initList()
   {
      this.view.listMask._height = this.safeZoneBottom - this.view.listMask._y;
      var _loc5_ = this.view.createEmptyMovieClip("list",this.view.getNextHighestDepth());
      _loc5_._x = this.view.listMask._x;
      _loc5_._y = this.view.listMask._y;
      _loc5_.setMask(this.view.listMask);
      this.view.overlay.swapDepths(_loc5_);
      var _loc6_ = 3;
      var _loc7_ = 281;
      var _loc8_ = 246;
      var _loc2_ = 0;
      while(_loc2_ < this.app.specialVehicles.length)
      {
         var _loc4_ = this.app.specialVehicles[_loc2_];
         var _loc3_ = _loc5_.attachMovie("specialVehicle","specialVehicle" + _loc4_.id,_loc5_.getNextHighestDepth());
         _loc3_._x = _loc2_ % _loc6_ * _loc7_;
         _loc3_._y = Math.floor(_loc2_ / _loc6_) * _loc8_;
         this.initListItem(_loc3_,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      if(this.view.listMask._height > _loc5_._height)
      {
         this.view.listMask._height = _loc5_._height;
         var _loc9_ = _loc5_._y + _loc5_._height + 16;
         this.view.panelBG._height = _loc9_ - this.view.panelBG._y;
      }
   }
   function initListItem(view, specialVehicle)
   {
      view.title.text = specialVehicle.vehicleName;
      view.description.label.text = specialVehicle.description;
      view.description._visible = false;
      if(specialVehicle.lockNum > 0)
      {
         view.lockNum.text = specialVehicle.lockNum.toString();
         view.padlock._visible = true;
      }
      else
      {
         view.lockNum.text = "";
         view.padlock._visible = false;
      }
      if(specialVehicle.cashBonus > 0)
      {
         view.cashIcon.multiplier.text = view.cashIcon.shadow.text = specialVehicle.cashBonus + "x";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(view.cashIcon.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      }
      else
      {
         view.cashIcon._visible = false;
      }
      if(specialVehicle.rpBonus > 0)
      {
         view.rpIcon.multiplier.text = view.rpIcon.shadow.text = specialVehicle.rpBonus + "x";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(view.rpIcon.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
         if(!view.cashIcon._visible)
         {
            view.rpIcon._y = view.cashIcon._y;
         }
      }
      else
      {
         view.rpIcon._visible = false;
      }
      this.app.imageManager.addImage(specialVehicle.txd,specialVehicle.txd,view.image);
      view.launchButton.gotoAndStop(!specialVehicle.enabled ? "disabled" : "enabled");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setSpacedTextField(view.launchButton.label,"SECUROSERV_LAUNCH_MISSION");
      specialVehicle.view = view;
      specialVehicle.button = new com.rockstargames.gtav.levelDesign.securoserv.Button(specialVehicle.id,view);
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.SECUROSERV.ACCEPT:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE:
            if(this.app.GET_CURRENT_SELECTION() == com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.BACK)
            {
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
               this.app.showScreen(this.app.BRANCH_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.CANCEL:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.RIGHT_MOUSE:
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Navigate");
            this.app.showScreen(this.app.BRANCH_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_UP:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_UP;
            this.scrollListFromKeyboard(-1);
            break;
         case com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_DOWN:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_DOWN;
            this.scrollListFromKeyboard(1);
      }
   }
   function onTargetChange(targetID)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.app.specialVehicles.length)
      {
         this.app.specialVehicles[_loc2_].view.description._visible = this.app.specialVehicles[_loc2_].id == targetID;
         if(this.app.specialVehicles[_loc2_].id == targetID && this.currTargetID != targetID)
         {
            com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Generic_Mouseover");
         }
         _loc2_ = _loc2_ + 1;
      }
      this.currTargetID = targetID;
   }
   function showOverlay(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
      this.cursor.setTargetRects(this.overlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.updateButtons();
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      super.dispose();
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
         var _loc6_ = com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.SCROLL_SPEED * _loc3_ / 32;
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
         case com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_UP:
         case com.rockstargames.gtav.levelDesign.SECUROSERV.KEY_DOWN:
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
      var _loc4_ = com.rockstargames.gtav.levelDesign.securoserv.SpecialVehiclesScreen.SCROLL_SPEED * _loc2_ / 32;
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
      if(this.overlay.isShowing)
      {
         return undefined;
      }
      var _loc5_ = [this.backButton];
      var _loc4_ = 0;
      while(_loc4_ < this.app.specialVehicles.length)
      {
         var _loc2_ = this.app.specialVehicles[_loc4_].view;
         var _loc3_ = this.app.specialVehicles[_loc4_].button;
         _loc3_.top = Math.max(this.view.listMask._y,_loc2_._y + _loc2_._parent._y);
         _loc3_.bottom = Math.min(this.view.listMask._y + this.view.listMask._height,_loc2_._y + _loc2_._height + _loc2_._parent._y);
         if(_loc3_.bottom - _loc3_.top > 0)
         {
            _loc5_.push(_loc3_);
         }
         _loc4_ = _loc4_ + 1;
      }
      this.cursor.setTargetRects(_loc5_);
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
}
