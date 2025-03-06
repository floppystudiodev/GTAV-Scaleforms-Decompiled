class com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.IdleScreen extends com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.Screen
{
   var buttons;
   var view;
   var cursor;
   var buttonWidth = 355;
   function IdleScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"idleScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs.IDLE_0,this.view.button_0);
      this.view.button_0._visible = true;
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
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
      super.dispose();
   }
}
