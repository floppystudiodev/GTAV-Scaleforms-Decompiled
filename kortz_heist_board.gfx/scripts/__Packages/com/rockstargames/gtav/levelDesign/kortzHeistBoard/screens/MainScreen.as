class com.rockstargames.gtav.levelDesign.kortzHeistBoard.screens.MainScreen extends com.rockstargames.gtav.levelDesign.kortzHeistBoard.screens.Screen
{
   var _buttons;
   var app;
   var buttonEnabledStates;
   var cursor;
   var todoLists;
   var view;
   static var TODO_LIST_INDEX = 0;
   static var OPTIONAL_LIST_INDEX = 1;
   static var NUM_CREW_MEMBERS = 3;
   static var NUM_MISSIONS = 9;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.top.entryPointsLabel,"KHB_ENTRY_TITLE");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.top.targetLabel,"KHB_TARGET_TITLE");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.top.extrasLabel,"KHB_EXTRAS_TITLE");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.bottom.prep0Label,"KHB_PREP_0_SUBTITLE_0");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.bottom.prep1Label,"KHB_PREP_0_SUBTITLE_1");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.bottom.prep2Label,"KHB_PREP_0_SUBTITLE_2");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.bottom.prep3Label,"KHB_PREP_0_SUBTITLE_3");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.top.extras0Button.purchased.label,"KHB_PURCHASED");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.top.extras1Button.purchased.label,"KHB_PURCHASED");
      com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.bottom.startButton.selected.label,"KHB_START");
      this.initAsteriskTitle(this.view.bottom.prepTitle,"KHB_PREP_0_TITLE",false);
      this.initAsteriskTitle(this.view.bottom.additionalTitle,"KHB_PREP_1_TITLE",false);
      this.setEntryPointVisible(0,false);
      this.setEntryPointVisible(1,false);
      this.setEntryPointVisible(2,false);
      this.setEntryPointVisible(3,false);
      this.view.top.secondaryLabel._alpha = 0;
      this.view.top.targetButton.skull._visible = false;
      this.view.top.extras0Button.purchased._visible = false;
      this.view.top.extras1Button.purchased._visible = false;
      this.todoLists = [];
      this.todoLists[com.rockstargames.gtav.levelDesign.kortzHeistBoard.screens.MainScreen.TODO_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.kortzHeistBoard.TodoList(this.view.top.todoList,"KHB_TODO_TITLE");
      this.todoLists[com.rockstargames.gtav.levelDesign.kortzHeistBoard.screens.MainScreen.OPTIONAL_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.kortzHeistBoard.TodoList(this.view.top.optionalList,"KHB_OPTIONAL_TITLE");
      this.view.top.optionalList.magnet._visible = false;
      this.buttonEnabledStates = [];
      this.initButton(this.view.top.targetButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.TARGET,undefined,"");
      this.initButton(this.view.top.extras0Button,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.EXTRAS_0,undefined,"KHB_EXTRAS_0");
      this.initButton(this.view.top.extras1Button,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.EXTRAS_1,undefined,"KHB_EXTRAS_1");
      this.initButton(this.view.bottom.equipmentButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.REQUIRED_0,1,"");
      this.initButton(this.view.bottom.weaponsButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.REQUIRED_1,1,"");
      this.initButton(this.view.bottom.vehiclesButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.REQUIRED_2,1,"");
      this.initButton(this.view.bottom.vaultCodeButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.REQUIRED_3,1,"");
      this.initButton(this.view.bottom.hackingDeviceButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.REQUIRED_4,1,"");
      this.initButton(this.view.bottom.keyCardButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.ADDITIONAL_0,1,"KHB_PREP_1_0");
      this.initButton(this.view.bottom.guardPatrolButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.ADDITIONAL_1,2,"KHB_PREP_1_1");
      this.initButton(this.view.bottom.shipmentsButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.ADDITIONAL_2,3,"KHB_PREP_1_2");
      this.initButton(this.view.bottom.securityCamButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.ADDITIONAL_3,4,"KHB_PREP_1_3");
      this.initButton(this.view.bottom.drillButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.ADDITIONAL_4,5,"KHB_PREP_1_4");
      this.initButton(this.view.bottom.startButton,com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.START,1,"KHB_START");
      this.view.bottom.startButton.selected.label.textAutoSize = "shrink";
      this.view.bottom.startButton.selected.label.verticalAlign = "top";
      this.view.bottom.startButton.label.textAutoSize = "shrink";
      var _loc3_ = this.view.bottom.equipmentButton;
      var _loc5_ = (this.view.bottom._x + _loc3_._x + 0.5 * _loc3_._width) / this.app.displayConfig.screenWidth;
      var _loc4_ = (this.view.bottom._y + _loc3_._y + 0.5 * _loc3_._height) / this.app.displayConfig.screenHeight;
      this.cursor.moveTo(_loc5_,_loc4_);
   }
   function initButton(buttonView, buttonID, imageID, label)
   {
      buttonView.padlock._visible = false;
      buttonView.completion._visible = false;
      buttonView.tick._visible = false;
      if(buttonView.purchased)
      {
         buttonView.purchased.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(buttonView.purchased.label,"CHB_PURCHASED");
         buttonView.purchased._visible = false;
      }
      buttonView.star._visible = false;
      this.setArrowsStyle(buttonView.arrows,false);
      if(!isNaN(imageID))
      {
         buttonView.image.gotoAndStop(imageID);
      }
      if(label)
      {
         buttonView.label.verticalAlign = "top";
         com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(buttonView.label,label);
         if(buttonView.label.text.indexOf(" ") == -1)
         {
            buttonView.label.multiline = false;
            buttonView.label.wordWrap = false;
            buttonView.label.textAutoSize = "shrink";
         }
      }
      if(buttonView.box)
      {
         this.centreTickboxAndLabel(buttonView);
      }
      this._buttons.push(new com.rockstargames.gtav.levelDesign.kortzHeistBoard.Button(buttonID,buttonView));
      this.buttonEnabledStates.push(true);
   }
   function addTodoListItem(listIndex, itemText, isComplete)
   {
      this.todoLists[listIndex].addItem(itemText,isComplete);
   }
   function clearTodoList(listIndex)
   {
      this.todoLists[listIndex].clear();
   }
   function setPadlock(buttonID, isLocked)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.padlock)
            {
               _loc2_.view.padlock._visible = isLocked;
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setTick(buttonID, isTicked)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.tick)
            {
               _loc2_.view.tick._visible = isTicked;
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setStarVisible(buttonID, isVisible)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.star)
            {
               _loc2_.view.star._visible = isVisible;
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setPurchased(buttonID, isPurchased)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.purchased)
            {
               _loc2_.view.purchased._visible = isPurchased;
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setSelectionArrowsVisible(buttonID, visibleState)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.arrows)
            {
               _loc2_.view.arrows._visible = visibleState != 3;
               this.setArrowsStyle(_loc2_.view.arrows,_loc2_.id == buttonID && visibleState == 2);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setButtonVisible(buttonID, isVisible)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.enabled == isVisible)
            {
               return undefined;
            }
            _loc2_.view._visible = isVisible;
            _loc2_.enabled = isVisible;
            this.cursor.setTargetRects(this._buttons);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setButtonEnabled(buttonID, isEnabled)
   {
      var _loc2_ = 0;
      var _loc5_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            this.buttonEnabledStates[_loc2_] = isEnabled;
            if(_loc3_.enabled == isEnabled)
            {
               return undefined;
            }
            _loc3_.enabled = isEnabled;
            this.cursor.setTargetRects(this._buttons);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonImage(buttonID, imageID)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.view.image)
            {
               _loc2_.view.image.gotoAndStop(imageID);
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setButtonGreyedOut(buttonID, isGreyedOut)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(buttonID == com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.START)
            {
               _loc2_.isGreyedOut = isGreyedOut;
               break;
            }
            _loc2_.selectedIsGreyedOut = isGreyedOut;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setMission(buttonID, image, title)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.image.gotoAndStop(image);
            _loc2_.view.label.text = title.toUpperCase();
            this.centreTickboxAndLabel(_loc2_.view);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setSecondaryLabelVisible(isVisible)
   {
      this.view.top.secondaryLabel._alpha = !isVisible ? 0 : 100;
   }
   function setEntryPointVisible(index, isVisible)
   {
      this.view.top["entryPoint" + index]._alpha = !isVisible ? 0 : 100;
   }
   function setArrowsStyle(arrows, areVisible)
   {
      if(areVisible)
      {
         arrows.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,218,20,50,0);
      }
      else
      {
         arrows.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
      }
   }
   function setMissionCompletion(buttonID, isVisible, numerator, denominator)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.completion.label.text = numerator + "/" + denominator;
            _loc2_.view.completion._visible = isVisible;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setContentsVisible(topVisible, bottomVisible)
   {
      this.view.top._visible = topVisible;
      this.view.bottom._visible = bottomVisible;
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.EXTRAS_0 || _loc3_.id == com.rockstargames.gtav.levelDesign.kortzHeistBoard.ButtonIDs.EXTRAS_1)
         {
            _loc3_.enabled = topVisible && this.buttonEnabledStates[_loc2_];
         }
         else
         {
            _loc3_.enabled = bottomVisible && this.buttonEnabledStates[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function setVisualState(state)
   {
      if(state == 0)
      {
         this.initPreSetupState();
      }
      else if(state == 1)
      {
         this.initPrepState();
      }
      else if(state == 2)
      {
         this.initRepeatState();
      }
   }
   function initPreSetupState()
   {
      this.view.top.entryPointsLabel._visible = false;
      this.view.top.entryPoint0._visible = false;
      this.view.top.entryPoint1._visible = false;
      this.view.top.entryPoint2._visible = false;
      this.view.top.entryPoint3._visible = false;
      this.view.top.entryPointBG0._visible = false;
      this.view.top.entryPointBG1._visible = false;
      this.view.top.entryPointBG2._visible = false;
      this.view.top.entryPointBG3._visible = false;
      this.view.top.extrasBG0._visible = false;
      this.view.top.extrasBG1._visible = false;
      this.view.top.secondaryLabel.visible = false;
      this.view.top.todoStar._visible = true;
      this.view.top.todoCircle._visible = true;
      this.view.top.todoList._visible = true;
      this.view.top.optionalCircle._visible = false;
      this.view.top.optionalList._visible = false;
      this.view.top.extrasLabel._visible = false;
      this.view.top.extras0Button._visible = false;
      this.view.top.extras1Button._visible = false;
      this.view.bottom._visible = false;
      this.cursor.setTargetRects([]);
   }
   function initPrepState()
   {
      this.view.top.entryPointsLabel._visible = true;
      this.view.top.entryPoint0._visible = true;
      this.view.top.entryPoint1._visible = true;
      this.view.top.entryPoint2._visible = true;
      this.view.top.entryPoint3._visible = true;
      this.view.top.entryPointBG0._visible = true;
      this.view.top.entryPointBG1._visible = true;
      this.view.top.entryPointBG2._visible = true;
      this.view.top.entryPointBG3._visible = true;
      this.view.top.extrasBG0._visible = true;
      this.view.top.extrasBG1._visible = true;
      this.view.top.secondaryLabel.visible = true;
      this.view.top.todoStar._visible = true;
      this.view.top.todoCircle._visible = true;
      this.view.top.todoList._visible = true;
      this.view.top.optionalCircle._visible = true;
      this.view.top.optionalList._visible = true;
      this.view.top.extrasLabel._visible = true;
      this.view.top.extras0Button._visible = true;
      this.view.top.extras1Button._visible = true;
      this.view.bottom._visible = true;
      this.cursor.setTargetRects(this._buttons);
   }
   function initRepeatState()
   {
      this.view.top.entryPointsLabel._visible = true;
      this.view.top.entryPoint0._visible = true;
      this.view.top.entryPoint1._visible = true;
      this.view.top.entryPoint2._visible = true;
      this.view.top.entryPoint3._visible = true;
      this.view.top.entryPointBG0._visible = true;
      this.view.top.entryPointBG1._visible = true;
      this.view.top.entryPointBG2._visible = true;
      this.view.top.entryPointBG3._visible = true;
      this.view.top.extrasBG0._visible = true;
      this.view.top.extrasBG1._visible = true;
      this.view.top.secondaryLabel.visible = true;
      this.view.top.todoStar._visible = false;
      this.view.top.todoCircle._visible = false;
      this.view.top.todoList._visible = false;
      this.view.top.optionalCircle._visible = false;
      this.view.top.optionalList._visible = false;
      this.view.top.extrasLabel._visible = true;
      this.view.top.extras0Button._visible = true;
      this.view.top.extras1Button._visible = true;
      this.view.bottom._visible = false;
      this.cursor.setTargetRects([]);
   }
   function setTargetValue(value)
   {
      this.view.top.primaryValue.text = "$" + com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.formatNumber(value);
   }
   function setEntryPointTitle(index, title)
   {
      this.view.top["entryPoint" + index].label.text = title;
   }
   function setIsHardMode(isHardMode)
   {
      this.view.top.targetButton.skull._visible = isHardMode;
   }
   function setTargetLabel(label)
   {
      this.view.top.primaryLabel.text = label;
   }
   function setSecondaryLabel(label)
   {
      this.view.top.secondaryLabel.text = label;
   }
   function setSecondaryValue(value)
   {
      this.view.top.secondaryValue.text = "$" + com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.formatNumber(value);
   }
   function setSecondaryValueVisible(isVisible)
   {
      this.view.top.secondaryValue._visible = isVisible;
   }
   function initAsteriskTitle(title, label, isStringLiteral)
   {
      var _loc2_ = title._x + 0.5 * title._width;
      title.label.autoSize = "left";
      if(isStringLiteral)
      {
         title.label.text = label;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(title.label,label);
      }
      title.rightAsterisk._x = title.label._x + title.label._width;
      title._x = _loc2_ - 0.5 * title._width;
   }
   function centreTickboxAndLabel(view)
   {
      var _loc5_ = -4;
      var _loc4_ = 4;
      var _loc3_ = 16;
      var _loc6_ = view.image._x + 0.5 * view.image._width;
      var _loc7_ = _loc3_ + _loc4_ + view.label.textWidth;
      var _loc2_ = _loc6_ - 0.5 * _loc7_;
      view.box._x = _loc2_ + _loc5_;
      view.tick._x = _loc2_ + _loc5_;
      view.label._x = _loc2_ + _loc3_ + _loc4_;
   }
}
