class com.rockstargames.gtav.levelDesign.fixerApp.screens.DataRecoveryScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var view;
   var dataObject;
   var app;
   var buttons;
   var cursor;
   static var TXD = "FIXER_APP_IMG";
   function DataRecoveryScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"DataRecoveryScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.view.speaker._visible = false;
      this.setUpLabel(this.view.contractDatabaseText,"FAPP_CONTRACT_DATABASE");
      this.setUpLabel(this.view.securityContractsLabel,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.highlight1,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.vipContractLabel,"FAPP_VIP_CONTRACT");
      this.setUpLabel(this.view.drDreLabel,"FAPP_THE_CONTRACT_DR_DRE");
      this.setUpLabel(this.view.briefLabel,"FAPP_BRIEF");
      this.setUpLabel(this.view.detailsLabel,"FAPP_DETAILS");
      this.setUpLabel(this.view.statusLabel,"FAPP_STATUS");
      this.setUpText(this.view.button1Text,this.dataObject.leakTitle,true);
      this.setUpText(this.view.tabText,this.dataObject.leakTitle,true);
      this.setUpText(this.view.highlight2.highlightText,this.dataObject.leakTitle,true);
      this.setUpText(this.view.acceptButton.buttonText,this.dataObject.startButtonLabel,false);
      this.setUpText(this.view.highlight3.buttonText,this.dataObject.startButtonLabel,false);
      this.setUpText(this.view.copyFoundLabel,this.dataObject.investigatedLabel,false);
      this.setStartButtonLabelDots();
      this.setUpDescriptionText(this.dataObject.leakDescription);
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.fixerApp.screens.DataRecoveryScreen.TXD,this.dataObject.leakImage,this.view.image);
      this.view.foundCheckmark._visible = this.dataObject.leakComplete;
      if(this.dataObject.investigatedLabel == "")
      {
         this.view.foundCheckmarkBackground._visible = false;
      }
      if(this.dataObject.leakComplete)
      {
         this.setUpLabel(this.view.statusText,"FAPP_COMPLETE");
      }
      else
      {
         this.setUpLabel(this.view.statusText,"FAPP_PENDING");
      }
      this.setupButtons();
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function setupButtons()
   {
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_RECOVERY_1,this.view.button0);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_RECOVERY_2,this.view.button1);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_RECOVERY_3,this.view.button2);
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function setStartButtonLabelDots()
   {
      this.view.acceptButton.dots_left._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 - this.view.acceptButton.buttonText.textWidth * 0.5 - 20;
      this.view.acceptButton.dots_right._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 + this.view.acceptButton.buttonText.textWidth * 0.5 + 10;
      this.view.highlight3.dots_left._x = this.view.highlight3.buttonText._x + this.view.highlight3.buttonText._width * 0.5 - this.view.highlight3.buttonText.textWidth * 0.5 - 20;
      this.view.highlight3.dots_right._x = this.view.highlight3.buttonText._x + this.view.highlight3.buttonText._width * 0.5 + this.view.highlight3.buttonText.textWidth * 0.5 + 10;
   }
   function setUpLabel(textField, label)
   {
      textField.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(textField,label);
      com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(textField,textField.text,"left",1);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(textField);
      }
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
   function setUpDescriptionText(label)
   {
      this.view.descriptionText.text = label;
      var _loc2_ = this.view.descriptionText.getTextFormat();
      _loc2_.letterSpacing = 1;
      this.view.descriptionText.setTextFormat(_loc2_);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(this.view.descriptionText);
      }
   }
   function setUpNumber(textField, number, prefix)
   {
      var _loc3_ = textField.getTextFormat();
      _loc3_.letterSpacing = 1;
      textField.setTextFormat(_loc3_);
      textField.verticalAlign = "center";
      textField.text = prefix + com.rockstargames.gtav.levelDesign.FIXER_APP.formatNumber(number);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(textField);
      }
   }
   function onTargetChange(activeTarget)
   {
      var _loc3_ = undefined;
      var _loc2_ = 1;
      while(_loc2_ <= 3)
      {
         this.view["highlight" + _loc2_]._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs["DATA_RECOVERY_" + _loc2_];
         if(this.view["highlight" + _loc2_]._visible)
         {
            _loc3_ = _loc2_;
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
