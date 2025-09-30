class com.rockstargames.gtav.levelDesign.fixerApp.screens.HomeScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var dataObject;
   var view;
   static var TXD = "FIXER_APP_IMG";
   static var STATE_LOCKED = 0;
   static var STATE_AVAILABLE = 1;
   static var NUM_STYLES = 3;
   static var FULL_OPACITY = 100;
   static var DIM_OPACITY = 60;
   function HomeScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"homeScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.view.speaker._visible = false;
      this.setUpLabel(this.view.contractDatabaseText,"FAPP_CONTRACT_DATABASE");
      this.setUpText(this.view.button0Text,this.dataObject.securityContractTitle,false);
      this.setUpText(this.view.highlight1.text1,this.dataObject.securityContractTitle,false);
      this.setUpText(this.view.highlight1.text2,this.dataObject.securityContractTitle,false);
      this.view.highlight1.text2._x = this.view.highlight1.logo._x + this.view.highlight1.logo._width * 0.5 - this.view.highlight1.text2.textWidth * 0.5 + this.view.highlight1.icon._width * 0.5 + 5;
      this.view.highlight1.icon._x = this.view.highlight1.text2._x - this.view.highlight1.icon._width - 10;
      this.setUpText(this.view.button1Text,this.dataObject.vipContractTitle,false);
      this.setUpText(this.view.highlight2.text1,this.dataObject.vipContractTitle,false);
      this.setUpText(this.view.highlight2.text2,this.dataObject.vipContractTitle,false);
      this.view.highlight2.text2._x = this.view.highlight2.logo._x + this.view.highlight2.logo._width * 0.5 - this.view.highlight2.text2.textWidth * 0.5 + this.view.highlight2.icon._width * 0.5 + 3;
      this.view.highlight2.icon._x = this.view.highlight2.text2._x - this.view.highlight2.icon._width - 6;
      this.view.highlight1._alpha = 100;
      this.view.highlight2._alpha = 100;
      if(this.dataObject.vipContractLocked)
      {
         this.view.homeMenu.gotoAndStop("locked");
         this.view.button1Text.textColor = 4877462;
      }
      else
      {
         this.view.homeMenu.gotoAndStop("unlocked");
         this.view.button1Text.textColor = 9418723;
      }
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.HOME_1,this.view.button0);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.HOME_2,this.view.button1);
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function setUpLabel(textField, label)
   {
      textField.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(textField,label);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(textField);
      }
      com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(textField,textField.text,"left",1);
   }
   function setUpText(textField, label, uppercase)
   {
      if(uppercase)
      {
         label = label.toUpperCase();
      }
      textField.verticalAlign = "center";
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(textField);
      }
      com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(textField,label,"left",1);
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function onTargetChange(activeTarget)
   {
      this.view.highlight1._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.HOME_1;
      this.view.highlight2._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.HOME_2 && !this.dataObject.vipContractLocked;
      var _loc2_;
      if(activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.HOME_2 && this.dataObject.lockedMessage != undefined)
      {
         this.view.lockedMessage.verticalAlign = "bottom";
         this.view.lockedMessage.text = this.dataObject.lockedMessage;
         _loc2_ = this.view.lockedMessage.getTextFormat();
         _loc2_.letterSpacing = 2;
         this.view.lockedMessage.setTextFormat(_loc2_);
      }
      else
      {
         this.view.lockedMessage.text = "";
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
