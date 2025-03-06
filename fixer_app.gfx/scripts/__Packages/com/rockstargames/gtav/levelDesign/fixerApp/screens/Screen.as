class com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var app;
   var cursor;
   var dataObject;
   var view;
   var cursorListenerID;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var safeZoneBottom;
   var updateDataObject;
   var tabsDataObject;
   var buttons;
   function Screen(app, viewContainer, cursor, viewLinkage, dataObject)
   {
      this.app = app;
      this.cursor = cursor;
      this.dataObject = dataObject;
      var _loc3_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc3_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.levelDesign.FIXER_APP.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.FIXER_APP.STAGE_HEIGHT;
   }
   function handleButtonInput(inputID)
   {
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
   function setButtonsEnabled(enabled)
   {
   }
   function onTargetChange(target)
   {
   }
   function update(newData)
   {
      this.updateDataObject = newData;
      this.updateDataObject.copyFoundVisible = true;
      this.updateData();
   }
   function updateData()
   {
   }
   function updateTabs(newData)
   {
      this.tabsDataObject = newData;
      this.enableTabs();
   }
   function enableTabs()
   {
   }
   function updateTabsData(newData)
   {
      this.updateDataObject.investigationDescription = newData.investigationDescription;
      this.updateDataObject.investigationImage = newData.investigationImage;
      this.updateDataObject.copyFoundLabel = newData.copyFoundLabel;
      this.updateDataObject.copyFound = newData.copyFound;
      this.updateDataObject.investigationComplete = newData.investigationComplete;
      this.updateDataObject.copyFoundVisible = newData.copyFoundVisible;
      this.updateDataObject.statusLabel = newData.statusLabel;
      this.updateTabData();
   }
   function updateTabData()
   {
   }
   function updateMenu(newData)
   {
      this.dataObject.leak1Locked = newData.leak1Locked;
      this.dataObject.leak2Locked = newData.leak2Locked;
      this.dataObject.leak3Locked = newData.leak3Locked;
      this.setMenuLocked();
   }
   function setMenuLocked()
   {
   }
   function updateStartButtonData(newData)
   {
      this.dataObject.startButtonLabel = newData.startButtonLabel;
      this.dataObject.enableStartButton = newData.enableStartButton;
      this.updateStartButton();
   }
   function updateStartButton()
   {
   }
   function showSpeaker(isVisible)
   {
      if(this.view.speaker)
      {
         this.view.speaker._visible = isVisible;
      }
   }
   function dispose()
   {
      this.dataObject = null;
      this.updateDataObject = null;
      this.tabsDataObject = null;
      this.buttons = null;
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
