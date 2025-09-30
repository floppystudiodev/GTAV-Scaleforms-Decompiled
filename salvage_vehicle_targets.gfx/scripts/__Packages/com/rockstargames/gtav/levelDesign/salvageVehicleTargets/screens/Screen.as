class com.rockstargames.gtav.levelDesign.salvageVehicleTargets.screens.Screen
{
   var activeButtonIndex;
   var app;
   var buttons;
   var cursor;
   var cursorListenerID;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   function Screen(app, viewContainer, cursor)
   {
      this.app = app;
      this.cursor = cursor;
      var _loc5_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie("mainScreen","mainScreen",_loc5_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.STAGE_HEIGHT;
      this.buttons = [];
      this.buttons.push(new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button(com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.ButtonIDs.BUTTON_1,this.view.vehicle1));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button(com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.ButtonIDs.BUTTON_2,this.view.vehicle2));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.Button(com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.ButtonIDs.BUTTON_3,this.view.vehicle3));
      this.activeButtonIndex = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         cursor.addTarget(this.buttons[_loc2_]);
         this.buttons[_loc2_].hide();
         _loc2_ = _loc2_ + 1;
      }
      cursor.snapToTarget(this.buttons[0]);
      this.onTargetChange(cursor.getTargetUnderCursor());
   }
   function setVehicle(index, name, value, txn, txd, salvageValue, state, ownable, deactivated)
   {
      this.buttons[index].show(name,value,txn,txd,salvageValue,state,ownable,this.app.imageManager);
      if(!deactivated)
      {
         if(index == 0)
         {
            this.cursor.snapToTarget(this.buttons[0]);
         }
         this.onTargetChange(this.cursor.getTargetUnderCursor());
      }
   }
   function clearVehicle(index)
   {
      this.buttons[index].hide();
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.ACCEPT:
         case com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.CANCEL:
      }
   }
   function onTargetChange(target)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         _loc3_.setState(_loc3_ == target);
         if(_loc3_ == target)
         {
            this.activeButtonIndex = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonsEnabled(enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         if(this.buttons[_loc2_].isShowing)
         {
            this.buttons[_loc2_].enabled = enabled;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(enabled)
      {
         this.onTargetChange(this.cursor.getTargetUnderCursor());
      }
   }
   function setButtonStates(isOn)
   {
      var _loc3_ = this.cursor.getTargetUnderCursor();
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].setState(isOn && this.buttons[_loc2_] == _loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function onShowOverlay()
   {
      this.setButtonsEnabled(false);
   }
   function onHideOverlay()
   {
      var _loc2_ = this.activeButtonIndex;
      this.setButtonsEnabled(true);
      this.cursor.snapToTarget(this.buttons[_loc2_]);
      this.activeButtonIndex = _loc2_;
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function customCancelResponse()
   {
      return false;
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.buttons = [];
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
