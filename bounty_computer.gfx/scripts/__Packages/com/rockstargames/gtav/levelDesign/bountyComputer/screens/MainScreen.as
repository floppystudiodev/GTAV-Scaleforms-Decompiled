class com.rockstargames.gtav.levelDesign.bountyComputer.screens.MainScreen extends com.rockstargames.gtav.levelDesign.bountyComputer.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var cursorInitialised;
   var view;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.buttons.push(new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.BountyButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.TARGET_1,this.view.targetButton0));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.BountyButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.TARGET_2,this.view.targetButton1));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.BountyButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.TARGET_3,this.view.targetButton2));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.BountyButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.TARGET_4,this.view.targetButton3));
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.addTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.cursorInitialised = false;
      this.updateBountyTargets();
   }
   function updateBountyTargets()
   {
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < this.app.bountyTargets.length)
      {
         _loc3_ = this.app.bountyTargets[_loc4_];
         _loc2_ = this.view["targetButton" + _loc4_];
         _loc2_.name.verticalAlign = "center";
         _loc2_.bondIDLabel.verticalAlign = "center";
         _loc2_.bondID.verticalAlign = "center";
         _loc2_.rewardLabel.verticalAlign = "center";
         _loc2_.reward.verticalAlign = "center";
         _loc2_.status.verticalAlign = "center";
         if(_loc3_.isHighValue)
         {
            _loc2_.reward.textColor = 14155776;
            _loc2_.status.textColor = 14155776;
         }
         else
         {
            _loc2_.reward.textColor = 2572167;
            _loc2_.status.textColor = 2572167;
         }
         if(_loc3_ == null)
         {
            _loc2_._visible = false;
            this.buttons[_loc4_].enabled = false;
         }
         else
         {
            _loc2_ = this.view["targetButton" + _loc4_];
            _loc2_._visible = true;
            this.buttons[_loc4_].enabled = true;
            _loc2_.name.text = _loc3_.name;
            com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(_loc2_.bondIDLabel,"BNTY_COM_BOND");
            _loc2_.bondID.text = "B_ID/" + Math.floor(Math.random() * 999999) + Math.floor(Math.random() * 99999);
            _loc2_.regular._visible = !_loc3_.isHighValue;
            _loc2_.highValue._visible = _loc3_.isHighValue;
            if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.bountyComputer.data.BountyTarget.STATE_INCOMPLETE)
            {
               _loc2_.infoPanel.gotoAndStop(!_loc3_.isHighValue ? 2 : 1);
               _loc2_.status.text = "";
               com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(_loc2_.rewardLabel,"BNTY_COM_REWARD");
               _loc2_.reward.text = "$" + com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.formatNumber(_loc3_.reward);
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.bountyComputer.data.BountyTarget.STATE_COMPLETE_BASIC)
            {
               _loc2_.infoPanel.gotoAndStop(!_loc3_.isHighValue ? 4 : 3);
               com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(_loc2_.status,!_loc3_.isMale ? "BNTY_COM_ARRESTED_FEM" : "BNTY_COM_ARRESTED");
               _loc2_.rewardLabel.text = "";
               _loc2_.reward.text = "";
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.bountyComputer.data.BountyTarget.STATE_COMPLETE_ADVANCED)
            {
               _loc2_.infoPanel.gotoAndStop(!_loc3_.isHighValue ? 4 : 3);
               com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(_loc2_.status,!_loc3_.isMale ? "BNTY_COM_KILLED_FEM" : "BNTY_COM_KILLED");
               _loc2_.rewardLabel.text = "";
               _loc2_.reward.text = "";
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.bountyComputer.data.BountyTarget.STATE_COMPLETE_PROCESSING)
            {
               _loc2_.infoPanel.gotoAndStop(!_loc3_.isHighValue ? 4 : 3);
               com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(_loc2_.status,!_loc3_.isMale ? "BNTY_COM_PROC_FEM" : "BNTY_COM_PROC");
               _loc2_.rewardLabel.text = "";
               _loc2_.reward.text = "";
            }
            else
            {
               _loc2_.infoPanel.gotoAndStop(!_loc3_.isHighValue ? 4 : 3);
               _loc2_.status.text = "";
               _loc2_.rewardLabel.text = "";
               _loc2_.reward.text = "";
            }
            if(_loc3_.textureChanged)
            {
               this.app.imageManager.addImage(_loc3_.textureDictionary,_loc3_.textureName,_loc2_.image);
               _loc3_.textureChanged = false;
            }
            if(!this.cursorInitialised)
            {
               this.cursor.snapToTarget(this.buttons[_loc4_]);
               this.onTargetChange(this.cursor.getTargetUnderCursor());
               this.cursorInitialised = true;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.ACCEPT:
            this.handleAcceptButton(this.cursor.getTargetUnderCursor());
         case com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.CANCEL:
         default:
            return;
      }
   }
   function handleAcceptButton(target)
   {
   }
   function onTargetChange(target)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         _loc3_.setState(_loc3_ == target);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonsEnabled(enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].enabled = enabled && this.view["targetButton" + _loc2_]._visible;
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
