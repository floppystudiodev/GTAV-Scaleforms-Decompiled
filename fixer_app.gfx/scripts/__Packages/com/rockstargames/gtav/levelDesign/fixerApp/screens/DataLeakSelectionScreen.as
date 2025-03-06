class com.rockstargames.gtav.levelDesign.fixerApp.screens.DataLeakSelectionScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var view;
   var dataObject;
   var buttons;
   var cursor;
   static var TXD = "FIXER_APP_IMG";
   static var NORMAL = 1;
   function DataLeakSelectionScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"DataLeakSelectionScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setUpLabel(this.view.contractDatabaseText,"FAPP_CONTRACT_DATABASE");
      this.setUpLabel(this.view.securityContractsLabel,"FAPP_SECURITY_CONTRACTS");
      this.setUpLabel(this.view.drDreLabel,"FAPP_THE_CONTRACT_DR_DRE");
      this.setUpLabel(this.view.vipContractLabel,"FAPP_VIP_CONTRACT");
      this.setUpLabel(this.view.paymentLabel,"FAPP_PAYMENT");
      this.setUpNumber(this.view.paymentText,this.dataObject.payemnt,"$");
      this.setUpLabel(this.view.copiesRecoveredLabel,"FAPP_COPIES_RECOVERED");
      this.setUpNumber(this.view.copiesRecoveredText,this.dataObject.leaksFound,"");
      this.setUpLabel(this.view.briefLabel,"FAPP_BRIEF");
      this.setUpLabel(this.view.detailsLabel,"FAPP_DETAILS");
      this.setUpLabel(this.view.statusLabel,"FAPP_STATUS");
      this.setUpLabel(this.view.copyFoundtLabel,"FAPP_COPY_FOUND");
      this.setUpText(this.view.button0Text,this.dataObject.title1);
      this.setUpText(this.view.button1Text,this.dataObject.title2);
      this.setUpText(this.view.button2Text,this.dataObject.title3);
      this.setUpText(this.view.highlight1.highlightText,this.dataObject.title1);
      this.setUpText(this.view.highlight2.highlightText,this.dataObject.title2);
      this.setUpText(this.view.highlight3.highlightText,this.dataObject.title3);
      this.setUpLabel(this.view.acceptButton.buttonText,"FAPP_ACCEPT");
      this.view.acceptButton.dot_left._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText.width / 2 - this.view.acceptButton.buttonText.textWidth / 2 + 20;
      this.view.acceptButton.dot_right._x = this.view.acceptButton.buttonText._x + this.view.acceptButton.buttonText.width / 2 + this.view.acceptButton.buttonText.textWidth / 2 + 20;
      this.view.tabText.textAutoSize = "shrink";
      this.view.tabText.verticalAlign = "center";
      this.view.descriptionText.textAutoSize = "shrink";
      this.view.statusText.verticalAlign = "center";
      this.view.foundCheckmark._visible = false;
      this.view.checkmark1._visible = this.dataObject.leak1Complete;
      this.view.checkmark2._visible = this.dataObject.leak2Complete;
      this.view.checkmark3._visible = this.dataObject.leak3Complete;
      this.setUpLabel(this.view.archive.archiveLabel,"FAPP_ARCHIVE");
      this.setUpText(this.view.archive.button3Text,this.dataObject.introTitle);
      this.setUpText(this.view.archive.button4Text,this.dataObject.setupTitle);
      this.setUpText(this.view.highlight4.highlightText,this.dataObject.introTitle);
      this.setUpText(this.view.highlight5.highlightText,this.dataObject.setupTitle);
      var _loc2_ = 1;
      while(_loc2_ <= 5)
      {
         this.view["highlight" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_1,this.view.button0,this.dataObject.leak1Complete);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_2,this.view.button1,this.dataObject.leak2Complete);
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_3,this.view.button2,this.dataObject.leak3Complete);
      if(this.dataObject.replay)
      {
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_4,this.view.introMissionButton,false);
         this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.DATA_LEAK_5,this.view.setupMissionButton,false);
         this.view.introMissionButton._visible = true;
         this.view.setupMissionButton._visible = true;
         this.view.archive._visible = true;
      }
      else
      {
         this.view.introMissionButton._visible = false;
         this.view.setupMissionButton._visible = false;
         this.view.archive._visible = false;
      }
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function initButton(id, buttonView, complete)
   {
      if(!complete)
      {
         var _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
         this.buttons.push(_loc2_);
         this.cursor.addTarget(_loc2_);
      }
   }
   function setUpLabel(textField, label)
   {
      textField.textAutoSize = "shrink";
      textField.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(textField,label);
   }
   function setUpText(textField, label)
   {
      textField.textAutoSize = "shrink";
      textField.verticalAlign = "center";
      textField.text = label;
   }
   function setUpNumber(textField, number, prefix)
   {
      textField.textAutoSize = "shrink";
      textField.verticalAlign = "center";
      textField.text = prefix + com.rockstargames.gtav.levelDesign.FIXER_APP.formatNumber(number);
   }
   function onTargetChange(activeTarget)
   {
      var _loc3_ = undefined;
      var _loc2_ = 1;
      while(_loc2_ <= 5)
      {
         this.view["highlight" + _loc2_]._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs["DATA_LEAK_SELECTION_" + _loc2_];
         if(this.view["highlight" + _loc2_]._visible)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.updateInfo(_loc3_);
   }
   function updateInfo(index)
   {
      switch(index)
      {
         case 1:
            this.view.tabText.text = this.dataObject.title1;
            this.view.descriptionText.text = this.dataObject.description1;
            this.setUpNumber(this.view.paymentText,this.dataObject.payment1,"$");
            if(this.dataObject.leak1Complete)
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_COMPLETE");
               this.view.foundCheckmark._visible = true;
            }
            else
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_PENDING");
               this.view.foundCheckmark._visible = false;
            }
            break;
         case 2:
            this.view.tabText.text = this.dataObject.title2;
            this.view.descriptionText.text = this.dataObject.description2;
            this.setUpNumber(this.view.paymentText,this.dataObject.payment2,"$");
            if(this.dataObject.leak2Complete)
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_COMPLETE");
               this.view.foundCheckmark._visible = true;
            }
            else
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_PENDING");
               this.view.foundCheckmark._visible = false;
            }
            break;
         case 3:
            this.view.tabText.text = this.dataObject.title3;
            this.view.descriptionText.text = this.dataObject.description3;
            this.setUpNumber(this.view.paymentText,this.dataObject.payment3,"$");
            if(this.dataObject.leak3Complete)
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_COMPLETE");
               this.view.foundCheckmark._visible = true;
            }
            else
            {
               com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_PENDING");
               this.view.foundCheckmark._visible = false;
            }
            break;
         case 4:
            this.view.tabText.text = this.dataObject.introTitle;
            this.view.descriptionText.text = this.dataObject.introDescription;
            this.setUpNumber(this.view.paymentText,this.dataObject.payment3,"$");
            com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_COMPLETE");
            this.view.foundCheckmark._visible = true;
            break;
         case 5:
            this.view.tabText.text = this.dataObject.setupTitle;
            this.view.descriptionText.text = this.dataObject.setupDescription;
            this.setUpNumber(this.view.paymentText,this.dataObject.payment3,"$");
            com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(this.view.statusText,"FAPP_COMPLETE");
            this.view.foundCheckmark._visible = true;
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
