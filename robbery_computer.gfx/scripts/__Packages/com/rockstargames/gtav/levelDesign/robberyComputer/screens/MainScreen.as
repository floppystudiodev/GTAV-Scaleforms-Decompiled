class com.rockstargames.gtav.levelDesign.robberyComputer.screens.MainScreen extends com.rockstargames.gtav.levelDesign.robberyComputer.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var cursorInitialised;
   var showingRobberyInfo;
   var view;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(this.view.heading,"ROBBERY_CMP_HDG");
      this.showingRobberyInfo = [false,false,false,false];
      this.buttons = [];
      this.buttons.push(new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.RobberyButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.ROBBERY_1,this.view.robberyButton0));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.RobberyButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.ROBBERY_2,this.view.robberyButton1));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.RobberyButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.ROBBERY_3,this.view.robberyButton2));
      this.buttons.push(new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.RobberyButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.ROBBERY_4,this.view.robberyButton3));
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.addTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.cursorInitialised = false;
      this.updateRobberies();
   }
   function updateRobberies()
   {
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < this.app.robberies.length)
      {
         _loc3_ = this.app.robberies[_loc4_];
         _loc2_ = this.view["robberyButton" + _loc4_];
         if(_loc3_ == null)
         {
            _loc2_._visible = false;
            this.buttons[_loc4_].enabled = false;
         }
         else
         {
            _loc2_ = this.view["robberyButton" + _loc4_];
            _loc2_._visible = true;
            this.buttons[_loc4_].enabled = true;
            _loc2_.name.text = _loc3_.name.toUpperCase();
            _loc2_.info.body.html = true;
            _loc2_.info.body.htmlText = _loc3_.description;
            com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(_loc2_.info.heading,"ROBBERY_CMP_RDET");
            _loc2_.info._visible = false;
            _loc2_.special._visible = _loc3_.isFocusRobbery;
            if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.robberyComputer.data.Robbery.STATE_INCOMPLETE)
            {
               _loc2_.payment.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(_loc3_.payment);
               com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(_loc2_.reward,"ROBBERY_CMP_RWD");
               _loc2_.complete._visible = false;
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.robberyComputer.data.Robbery.STATE_COMPLETE_BASIC)
            {
               _loc2_.payment.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(_loc3_.payment);
               com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(_loc2_.reward,"ROBBERY_CMP_ERD");
               _loc2_.complete._visible = true;
               _loc2_.complete.gotoAndStop(1);
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.robberyComputer.data.Robbery.STATE_COMPLETE_ADVANCED)
            {
               _loc2_.payment.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(_loc3_.payment);
               com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(_loc2_.reward,"ROBBERY_CMP_ERD");
               _loc2_.complete._visible = true;
               _loc2_.complete.gotoAndStop(2);
            }
            else if(_loc3_.completionState == com.rockstargames.gtav.levelDesign.robberyComputer.data.Robbery.STATE_COMPLETE_PROCESSING)
            {
               _loc2_.payment.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(_loc3_.payment);
               com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(_loc2_.reward,"ROBBERY_CMP_ERD");
               _loc2_.complete._visible = true;
               _loc2_.complete.gotoAndStop(3);
            }
            else
            {
               _loc2_.payment.text = "";
               _loc2_.reward.text = "";
               _loc2_.complete._visible = false;
            }
            this.app.imageManager.addImage(_loc3_.textureDictionary,_loc3_.textureName,_loc2_.image);
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
   function toggleRobberyInfo()
   {
      var _loc4_ = this.cursor.getTargetUnderCursor();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.buttons.length)
      {
         _loc3_ = this.buttons[_loc2_];
         if(_loc3_.id == _loc4_.id)
         {
            this.showingRobberyInfo[_loc2_] = !this.showingRobberyInfo[_loc2_];
         }
         else
         {
            this.showingRobberyInfo[_loc2_] = false;
         }
         _loc3_.infoVisible = this.showingRobberyInfo[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.ACCEPT:
            this.handleAcceptButton(this.cursor.getTargetUnderCursor());
            break;
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.Y:
            this.toggleRobberyInfo();
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.CANCEL:
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
