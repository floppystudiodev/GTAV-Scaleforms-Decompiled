class com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.Screen
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
   var operationDataObject;
   var buttons;
   static var TXD = "AVENGER_OPERATIONS_IMG";
   function Screen(app, viewContainer, cursor, viewLinkage, dataObject)
   {
      this.app = app;
      this.cursor = cursor;
      this.dataObject = dataObject;
      var _loc3_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc3_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.STAGE_HEIGHT;
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
   function UPDATE_OPERATION_DATA(newData)
   {
      this.operationDataObject = newData;
      this.UPDATE_OPERATION();
   }
   function UPDATE_OPERATION()
   {
   }
   function setUpLabel(textField, label, uppercase, verticalAlignment, horizontalAlignment)
   {
      com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.setLocalisedText(textField,label);
      if(uppercase)
      {
         label = label.toUpperCase();
      }
      textField.verticalAlign = verticalAlignment;
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.resizeAsianText(textField);
      }
      com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.truncate(textField,textField.text,horizontalAlignment,1);
      textField.autoSize = horizontalAlignment;
   }
   function setUpText(textField, label, uppercase, verticalAlignment, horizontalAlignment)
   {
      if(uppercase)
      {
         label = label.toUpperCase();
      }
      textField.verticalAlign = verticalAlignment;
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.resizeAsianText(textField);
      }
      com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.truncate(textField,label,horizontalAlignment,1);
      textField.autoSize = horizontalAlignment;
   }
   function setUpNumber(textField, number, prefix)
   {
      textField.textAutoSize = "shrink";
      textField.verticalAlign = "center";
      textField.text = prefix + com.rockstargames.gtav.levelDesign.AVENGER_OPERATIONS_TERMINAL.formatNumber(number);
   }
   function dispose()
   {
      this.dataObject = null;
      this.operationDataObject = null;
      this.buttons = null;
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
