class com.rockstargames.gtav.levelDesign.fixerApp.screens.DataLeakScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var dataObject;
   var tabsDataObject;
   var updateDataObject;
   var view;
   static var TXD = "FIXER_APP_IMG";
   static var NORMAL = 1;
   function DataLeakScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"DataLeakScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.view.speaker._visible = false;
      this.setUpLabel(this.view.contractDatabaseText,"FAPP_CONTRACT_DATABASE");
      this.setUpLabel(this.view.securityContractsLabel,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.highlight10,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.drDreLabel,"FAPP_THE_CONTRACT_DR_DRE");
      this.setUpLabel(this.view.vipContractLabel,"FAPP_VIP_CONTRACT");
      this.setUpLabel(this.view.paymentLabel,"FAPP_PAYMENT");
      this.setUpLabel(this.view.copiesRecoveredLabel,"FAPP_COPIES_RECOVERED");
      this.setUpLabel(this.view.briefLabel,"FAPP_BRIEF");
      this.setUpLabel(this.view.detailsLabel,"FAPP_DETAILS");
      this.setUpLabel(this.view.statusLabel,"FAPP_STATUS");
      this.setUpText(this.view.button0Text,this.dataObject.leak1Title,true);
      this.setUpText(this.view.button1Text,this.dataObject.leak2Title,true);
      this.setUpText(this.view.button2Text,this.dataObject.leak3Title,true);
      this.setUpText(this.view.highlight1.highlightText,this.dataObject.leak1Title,true);
      this.setUpText(this.view.highlight2.highlightText,this.dataObject.leak2Title,true);
      this.setUpText(this.view.highlight3.highlightText,this.dataObject.leak3Title,true);
      this.setUpLabel(this.view.acceptButton.buttonText,"FAPP_ACCEPT");
      this.setUpLabel(this.view.highlight9.buttonText,"FAPP_ACCEPT");
      this.setUpLabel(this.view.acceptButtonDisabled.buttonText,"FAPP_ACCEPT");
      this.view.acceptButtonDisabled._visible = false;
      this.setStartButtonLabelDots();
      this.view.foundCheckmark._visible = false;
      this.view.foundCheckmarkBackground._visible = false;
      this.view.checkmark1._visible = this.dataObject.leak1Complete;
      this.view.checkmark2._visible = this.dataObject.leak2Complete;
      this.view.checkmark3._visible = this.dataObject.leak3Complete;
      this.view.tabs.checkmark4._visible = false;
      this.view.tabs.checkmark5._visible = false;
      this.view.tabs.checkmark6._visible = false;
      this.view.lock1._visible = this.dataObject.leak1Locked;
      this.setTextFieldColor(this.view.button0Text,this.dataObject.leak1Locked);
      this.view.lock2._visible = this.dataObject.leak2Locked;
      this.setTextFieldColor(this.view.button1Text,this.dataObject.leak2Locked);
      this.view.lock3._visible = this.dataObject.leak3Locked;
      this.setTextFieldColor(this.view.button2Text,this.dataObject.leak3Locked);
      this.setUpLabel(this.view.archive.archiveLabel,"FAPP_ARCHIVE");
      this.setUpText(this.view.archive.button3Text,this.dataObject.introTitle,true);
      this.setUpText(this.view.archive.button4Text,this.dataObject.setupTitle,true);
      this.setUpText(this.view.highlight4.highlightText,this.dataObject.introTitle,true);
      this.setUpText(this.view.highlight5.highlightText,this.dataObject.setupTitle,true);
      this.view.tabs.tabArrow1._visible = false;
      this.view.tabs.tabArrow2._visible = false;
      this.view.tabs.tabArrow3._visible = false;
      this.view.highlight6.tabArrow._visible = false;
      this.view.highlight7.tabArrow._visible = false;
      this.view.highlight8.tabArrow._visible = false;
      this.view.lockedOverlay._visible = false;
      this.setUpLabel(this.view.lockedOverlay.lockText,"FAPP_CONTRACT_LOCKED");
      this.view.lockedOverlay.lock._x = this.view.lockedOverlay.lockText._x + this.view.lockedOverlay.lockText._width * 0.5 - this.view.lockedOverlay.lockText.textWidth * 0.5 - 20;
      this.setupButtons();
      if(this.dataObject.replay)
      {
         this.view.archive._visible = true;
      }
      else
      {
         this.view.archive._visible = false;
      }
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
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
      if(this.tabsDataObject.enabled)
      {
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_6,this.view.button5,this.updateDataObject.investigation1Locked);
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_7,this.view.button6,this.updateDataObject.investigation2Locked);
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_8,this.view.button7,this.updateDataObject.investigation3Locked);
      }
      if(this.dataObject.enableStartButton)
      {
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_9,this.view.button8,false);
         this.view.acceptButton._visible = true;
         this.view.acceptButtonDisabled._visible = false;
      }
      else
      {
         this.view.acceptButton._visible = false;
         this.view.acceptButtonDisabled._visible = true;
      }
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_1,this.view.button0,false);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_2,this.view.button1,false);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_3,this.view.button2,false);
      if(this.dataObject.replay)
      {
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_4,this.view.button3,false);
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_5,this.view.button4,false);
         this.view.introMissionButton._visible = true;
         this.view.setupMissionButton._visible = true;
      }
      else
      {
         this.view.introMissionButton._visible = false;
         this.view.setupMissionButton._visible = false;
      }
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_10,this.view.button9,false);
   }
   function updateTabData()
   {
      if(this.updateDataObject.investigationLocked)
      {
         this.view.lockedOverlay._visible = true;
         this.view.descriptionText.text = "";
         this.view.image._visible = false;
      }
      else
      {
         this.view.lockedOverlay._visible = false;
         this.setUpDescriptionText(this.updateDataObject.investigationDescription);
         this.view.image._visible = true;
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.fixerApp.screens.DataLeakScreen.TXD,this.updateDataObject.investigationImage,this.view.image);
      }
      this.updateStatusLabel(this.updateDataObject.investigationComplete);
      if(this.updateDataObject.copyFoundVisible)
      {
         this.setUpText(this.view.copyFoundLabel,this.updateDataObject.copyFoundLabel,false);
         this.view.copyFoundLabel._visible = true;
         this.view.foundCheckmark._visible = this.updateDataObject.copyFound;
         this.view.foundCheckmarkBackground._visible = this.view.copyFoundLabel.length > 0;
      }
      else
      {
         this.view.copyFoundLabel._visible = false;
         this.view.foundCheckmark._visible = false;
         this.view.foundCheckmarkBackground._visible = false;
      }
      var _loc2_ = this.formatLeaksFoundString();
      this.setUpNumber(this.view.paymentText,this.updateDataObject.payment,"$");
      this.setUpText(this.view.copiesRecoveredText,_loc2_,false);
      if(this.updateDataObject.statusLabel.length > 0)
      {
         this.setUpText(this.view.statusLabel,this.updateDataObject.statusLabel,false);
      }
   }
   function updateData()
   {
      this.view.tabs.checkmark4._visible = this.updateDataObject.investigation1Complete;
      this.view.tabs.checkmark5._visible = this.updateDataObject.investigation2Complete;
      this.view.tabs.checkmark6._visible = this.updateDataObject.investigation3Complete;
      this.view.highlight6.checkmark._visible = this.updateDataObject.investigation1Complete;
      this.view.highlight7.checkmark._visible = this.updateDataObject.investigation2Complete;
      this.view.highlight8.checkmark._visible = this.updateDataObject.investigation3Complete;
      this.setUpTab(1,this.updateDataObject.investigation1Title,this.updateDataObject.investigation1Locked,this.updateDataObject.investigation1Complete);
      this.setUpTab(2,this.updateDataObject.investigation2Title,this.updateDataObject.investigation2Locked,this.updateDataObject.investigation2Complete);
      this.setUpTab(3,this.updateDataObject.investigation3Title,this.updateDataObject.investigation3Locked,this.updateDataObject.investigation3Complete);
      this.setupButtons();
      this.updateTabArrows();
   }
   function updateStatusLabel(isComplete)
   {
      if(isComplete)
      {
         this.setUpLabel(this.view.statusText,"FAPP_COMPLETE");
      }
      else
      {
         this.setUpLabel(this.view.statusText,"FAPP_PENDING");
      }
   }
   function updateStartButton()
   {
      if(this.dataObject.startButtonLabel)
      {
         this.setUpText(this.view.acceptButton.buttonText,this.dataObject.startButtonLabel,false);
         this.setUpText(this.view.highlight9.buttonText,this.dataObject.startButtonLabel,false);
         this.setUpText(this.view.acceptButtonDisabled.buttonText,this.dataObject.startButtonLabel,false);
         this.setStartButtonLabelDots();
      }
      this.setupButtons();
   }
   function setStartButtonLabelDots()
   {
      this.view.acceptButton.dots_left._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 - this.view.acceptButton.buttonText.textWidth * 0.5 - 20;
      this.view.acceptButton.dots_right._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText._width * 0.5 + this.view.acceptButton.buttonText.textWidth * 0.5 + 10;
      this.view.highlight9.dots_left._x = this.view.highlight9.buttonText._x + this.view.highlight9.buttonText._width * 0.5 - this.view.highlight9.buttonText.textWidth * 0.5 - 20;
      this.view.highlight9.dots_right._x = this.view.highlight9.buttonText._x + this.view.highlight9.buttonText._width * 0.5 + this.view.highlight9.buttonText.textWidth * 0.5 + 10;
   }
   function setMenuLocked()
   {
      this.view.lock1._visible = this.dataObject.leak1Locked;
      this.setTextFieldColor(this.view.button0Text,this.dataObject.leak1Locked);
      this.view.lock2._visible = this.dataObject.leak2Locked;
      this.setTextFieldColor(this.view.button1Text,this.dataObject.leak2Locked);
      this.view.lock3._visible = this.dataObject.leak3Locked;
      this.setTextFieldColor(this.view.button2Text,this.dataObject.leak3Locked);
      this.setupButtons();
   }
   function updateTabArrows()
   {
      this.view.tabs.tabArrow1._visible = !this.updateDataObject.investigation1Locked;
      this.view.tabs.tabArrow2._visible = !this.updateDataObject.investigation2Locked;
      this.view.tabs.tabArrow3._visible = !this.updateDataObject.investigation3Locked;
      this.view.highlight6.tabArrow._visible = !this.updateDataObject.investigation1Locked;
      this.view.highlight7.tabArrow._visible = !this.updateDataObject.investigation2Locked;
      this.view.highlight8.tabArrow._visible = !this.updateDataObject.investigation3Locked;
   }
   function initButton(id, buttonView, complete)
   {
      var _loc2_;
      if(!complete)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
         this.buttons.push(_loc2_);
         this.cursor.addTarget(_loc2_);
      }
   }
   function setUpTab(index, title, locked, conplete)
   {
      if(locked)
      {
         this.view.tabs["tabLock" + index]._visible = true;
         this.view.tabs["tab" + index + "Text"].text = "";
         this.view["highlight" + (index + 5)].lock._visible = true;
         this.view["highlight" + (index + 5)].tabText.text = "";
      }
      else
      {
         this.view.tabs["tabLock" + index]._visible = false;
         com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(this.view.tabs["tab" + index + "Text"],title,"left",1);
         if(this.app.displayConfig.isAsian)
         {
            com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(this.view.tabs["tab" + index + "Text"]);
         }
         this.view["highlight" + (index + 5)].lock._visible = false;
         com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(this.view["highlight" + (index + 5)].tabText,title,"left",1);
         if(this.app.displayConfig.isAsian)
         {
            com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(this.view["highlight" + (index + 5)].tabText);
         }
         if(conplete)
         {
            this.view.tabs["tab" + index + "Text"].textColor = 9418723;
         }
         else
         {
            this.view.tabs["tab" + index + "Text"].textColor = 16777215;
         }
      }
   }
   function setTextFieldColor(textField, locked)
   {
      if(locked)
      {
         textField.textColor = 4877462;
      }
      else
      {
         textField.textColor = 9418723;
      }
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
   function onTargetChange(activeTarget)
   {
      var _loc3_;
      var _loc2_ = 1;
      while(_loc2_ <= 10)
      {
         this.view["highlight" + _loc2_]._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs["DATA_LEAK_" + _loc2_];
         if(this.view["highlight" + _loc2_]._visible)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.updateInfo(_loc3_);
   }
   function formatLeaksFoundString()
   {
      var _loc2_;
      if(this.updateDataObject.leaksFound == undefined)
      {
         _loc2_ = "";
      }
      else
      {
         _loc2_ = this.updateDataObject.leaksFound + "/3";
      }
      return _loc2_;
   }
   function updateInfo(index)
   {
      var _loc2_ = this.formatLeaksFoundString();
      switch(index)
      {
         case 1:
            this.setUpDescriptionText(this.dataObject.leak1Description);
            this.setUpNumber(this.view.paymentText,this.updateDataObject.payment,"$");
            this.setUpText(this.view.copiesRecoveredText,_loc2_,false);
            this.showStats(true);
            this.showTabs(true);
            break;
         case 2:
            this.setUpDescriptionText(this.dataObject.leak2Description);
            this.setUpNumber(this.view.paymentText,this.updateDataObject.payment,"$");
            this.setUpText(this.view.copiesRecoveredText,_loc2_,false);
            this.showStats(true);
            this.showTabs(true);
            break;
         case 3:
            this.setUpDescriptionText(this.dataObject.leak3Description);
            this.setUpNumber(this.view.paymentText,this.updateDataObject.payment,"$");
            this.setUpText(this.view.copiesRecoveredText,_loc2_,false);
            this.showStats(true);
            this.showTabs(true);
            break;
         case 4:
            this.setUpDescriptionText(this.dataObject.introDescription);
            this.showStats(false);
            this.showTabs(false);
            this.updateStatusLabel(true);
            break;
         case 5:
            this.setUpDescriptionText(this.dataObject.setupDescription);
            this.showStats(false);
            this.showTabs(false);
            this.updateStatusLabel(true);
         default:
            return;
      }
   }
   function showStats(visible)
   {
      this.view.paymentLabel._visible = visible;
      this.view.paymentText._visible = visible;
      this.view.copiesRecoveredLabel._visible = visible;
      this.view.copiesRecoveredText._visible = visible;
      this.view.statsBackground._visible = visible;
   }
   function showTabs(visible)
   {
      this.view.tabs._visible = visible;
      this.enableButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_6,visible);
      this.enableButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_7,visible);
      this.enableButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_8,visible);
   }
   function enableButton(buttonId, enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         if(this.buttons[_loc2_].id == buttonId)
         {
            this.buttons[_loc2_].enabled = enabled;
            break;
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
   function enableTabs()
   {
      this.setupButtons();
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
