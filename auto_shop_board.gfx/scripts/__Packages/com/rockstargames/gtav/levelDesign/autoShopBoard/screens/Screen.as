class com.rockstargames.gtav.levelDesign.autoShopBoard.screens.Screen
{
   var app;
   var cursor;
   var cursorListenerID;
   var dataObject;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var view;
   function Screen(app, viewContainer, cursor, viewLinkage, dataObject)
   {
      this.app = app;
      this.cursor = cursor;
      this.dataObject = dataObject;
      var _loc3_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie(viewLinkage,viewLinkage,_loc3_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.STAGE_HEIGHT;
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
   function dispose()
   {
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
