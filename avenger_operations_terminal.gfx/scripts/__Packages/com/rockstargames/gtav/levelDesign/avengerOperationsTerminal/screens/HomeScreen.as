class com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.HomeScreen extends com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.Screen
{
   var buttons;
   var cursor;
   var view;
   var buttonWidth = 398;
   function HomeScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"homeScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs.HOME_0,this.view.button_0);
      this.initButton(com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs.HOME_1,this.view.button_1);
      this.view.button_0._visible = true;
      this.view.button_1._visible = true;
      this.setUpButtonLabel(this.view.button_0.title,this.view.button_0.bar,"AOT_AVENGER_OPERATIONS");
      this.view.button_0.title.textColor = 0;
      this.setUpButtonLabel(this.view.button_1.title,this.view.button_1.bar,"AOT_SMUGGLING_OPERATIONS");
      this.view.button_0.image.gotoAndStop(1);
      this.view.button_1.image.gotoAndStop(2);
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function setUpButtonLabel(textfield, bar, theText)
   {
      this.setUpLabel(textfield,theText,true,"center","left");
      bar._width = textfield.textWidth + 20;
      bar._x = this.buttonWidth / 2 - bar._width / 2;
      textfield._x = this.buttonWidth / 2 - textfield.textWidth / 2;
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function onTargetChange(activeTarget)
   {
      var _loc2_ = 0;
      while(_loc2_ <= this.buttons.length)
      {
         if(activeTarget.id == com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs["HOME_" + _loc2_])
         {
            this.view["button_" + _loc2_].background.gotoAndStop(2);
            this.view["button_" + _loc2_].title.textColor = 0;
            this.view["button_" + _loc2_].bar.gotoAndStop(2);
         }
         else
         {
            this.view["button_" + _loc2_].background.gotoAndStop(1);
            this.view["button_" + _loc2_].title.textColor = 8315228;
            this.view["button_" + _loc2_].bar.gotoAndStop(1);
         }
         _loc2_ = _loc2_ + 1;
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
      super.dispose();
   }
}
