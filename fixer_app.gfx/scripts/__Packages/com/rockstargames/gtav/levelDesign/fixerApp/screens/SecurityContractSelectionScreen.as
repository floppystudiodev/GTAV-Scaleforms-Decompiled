class com.rockstargames.gtav.levelDesign.fixerApp.screens.SecurityContractSelectionScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var view;
   var dataObject;
   var buttons;
   var cursor;
   var app;
   var updateDataObject;
   var tabsDataObject;
   static var TXD = "FIXER_APP_IMG";
   static var NORMAL = 1;
   function SecurityContractSelectionScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"securityContractSelectionScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.view.speaker._visible = false;
      this.setUpLabel(this.view.contractDatabaseText,"FAPP_CONTRACT_DATABASE");
      this.setUpLabel(this.view.securityContractsLabel,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.vipContractLabel,"FAPP_VIP_CONTRACT");
      this.setUpLabel(this.view.highlight5,"FAPP_VIP_CONTRACT");
      this.view.statsBackground.gotoAndStop("stats_2");
      this.setUpText(this.view.valuablesRecoveredLabel,"",false);
      this.setUpText(this.view.valuablesRecoveredText,"",false);
      this.setUpLabel(this.view.contractsCompleteLabel,"FAPP_CONTRACTS_COMPLETE");
      this.setUpNumber(this.view.contractsCompleteText,this.dataObject.numberCompleted,"");
      this.setUpLabel(this.view.earningsLabel,"FAPP_EARNINGS");
      this.setUpNumber(this.view.earningsText,this.dataObject.earnings,"$");
      this.setUpLabel(this.view.briefLabel,"FAPP_BRIEF");
      this.setUpLabel(this.view.detailsLabel,"FAPP_DETAILS");
      this.setUpLabel(this.view.difficultyLabel,"FAPP_DIFFICULTY");
      this.setUpLabel(this.view.paymentLabel,"FAPP_PAYMENT");
      this.setUpText(this.view.button0Text,this.dataObject.title1,true);
      this.setUpText(this.view.button1Text,this.dataObject.title2,true);
      this.setUpText(this.view.button2Text,this.dataObject.title3,true);
      this.setUpText(this.view.highlight1.buttonText,this.dataObject.title1,true);
      this.setUpText(this.view.highlight2.buttonText,this.dataObject.title2,true);
      this.setUpText(this.view.highlight3.buttonText,this.dataObject.title3,true);
      this.setUpLabel(this.view.acceptButton.buttonText,"FAPP_ACCEPT");
      this.setUpLabel(this.view.highlight4.buttonText,"FAPP_ACCEPT");
      this.setUpLabel(this.view.acceptButtonDisabled.buttonText,"FAPP_ACCEPT");
      this.view.acceptButtonDisabled._visible = false;
      this.setStartButtonLabelDots();
      if(this.dataObject.vipContractLocked)
      {
         this.view.securityMenu.gotoAndStop("locked");
         this.view.vipContractLabel.textColor = 4877462;
      }
      else
      {
         this.view.securityMenu.gotoAndStop("unlocked");
         this.view.vipContractLabel.textColor = 9418723;
      }
      this.setupButtons();
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
   function setupButtons()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_1,this.view.button0);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_2,this.view.button1);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_3,this.view.button2);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_5,this.view.button4);
      if(this.dataObject.enableStartButton)
      {
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_4,this.view.button3);
         this.view.acceptButton._visible = true;
         this.view.acceptButtonDisabled._visible = false;
      }
      else
      {
         this.view.acceptButton._visible = false;
         this.view.acceptButtonDisabled._visible = true;
      }
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function updateData()
   {
      this.updateStatLabel(this.updateDataObject.statLabel1,this.updateDataObject.statText1,this.updateDataObject.statVisible1);
   }
   function enableTabs()
   {
      this.setDifficultyText(this.tabsDataObject.difficulty);
      this.setUpText(this.view.tabText,this.tabsDataObject.title,true);
      this.setUpDescriptionText(this.tabsDataObject.description);
      this.setUpNumber(this.view.paymentText,this.tabsDataObject.payment,"$");
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.fixerApp.screens.SecurityContractSelectionScreen.TXD,this.tabsDataObject.image,this.view.image);
   }
   function updateStatLabel(theLabel, theText, isVisible)
   {
      if(isVisible)
      {
         this.view.statsBackground.gotoAndStop("stats_3");
         this.setUpText(this.view.valuablesRecoveredLabel,theLabel,false);
         this.setUpText(this.view.valuablesRecoveredText,theText,false);
      }
      else
      {
         this.view.statsBackground.gotoAndStop("stats_2");
         this.setUpText(this.view.valuablesRecoveredLabel,"",false);
         this.setUpText(this.view.valuablesRecoveredText,"",false);
      }
   }
   function updateStartButton()
   {
      if(this.dataObject.startButtonLabel)
      {
         this.setUpText(this.view.acceptButton.buttonText,this.dataObject.startButtonLabel,false);
         this.setUpText(this.view.highlight4.buttonText,this.dataObject.startButtonLabel,false);
         this.setUpText(this.view.acceptButtonDisabled.buttonText,this.dataObject.startButtonLabel,false);
         this.setStartButtonLabelDots();
      }
      this.setupButtons();
   }
   function setStartButtonLabelDots()
   {
      this.view.acceptButton.dots_left._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 - this.view.acceptButton.buttonText.textWidth * 0.5 - 20;
      this.view.acceptButton.dots_right._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 + this.view.acceptButton.buttonText.textWidth * 0.5 + 10;
      this.view.highlight4.dots_left._x = this.view.highlight4.buttonText._x + this.view.highlight4.buttonText._width * 0.5 - this.view.highlight4.buttonText.textWidth * 0.5 - 20;
      this.view.highlight4.dots_right._x = this.view.highlight4.buttonText._x + this.view.highlight4.buttonText._width * 0.5 + this.view.highlight4.buttonText.textWidth * 0.5 + 10;
   }
   function setDifficultyText(index)
   {
      switch(index)
      {
         case 1:
            this.setUpLabel(this.view.difficultyText,"FAPP_NORMAL");
            break;
         case 2:
            this.setUpLabel(this.view.difficultyText,"FAPP_HARD");
            break;
         case 3:
            this.setUpLabel(this.view.difficultyText,"FAPP_VERSUS");
      }
   }
   function onTargetChange(activeTarget)
   {
      var _loc4_ = undefined;
      var _loc2_ = 1;
      while(_loc2_ <= 4)
      {
         this.view["highlight" + _loc2_]._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs["SECURITY_CONTRACT_" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this.view.highlight5._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.SECURITY_CONTRACT_5 && !this.dataObject.vipContractLocked;
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
