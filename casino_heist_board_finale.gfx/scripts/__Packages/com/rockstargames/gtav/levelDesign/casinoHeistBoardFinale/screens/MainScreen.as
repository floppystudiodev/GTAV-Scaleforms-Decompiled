class com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen extends com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.Screen
{
   var _buttons;
   var app;
   var crewButtons;
   var cursor;
   var launchButton;
   var pieChart;
   var todoLists;
   var view;
   static var TODO_LIST_INDEX = 0;
   static var OPTIONAL_LIST_INDEX = 1;
   static var NUM_CREW_MEMBERS = 4;
   static var HEADSET_ACTIVE = 47;
   static var HEADSET_INACTIVE = 48;
   static var HEADSET_MUTED = 49;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.setupCostLabel.autoSize = "left";
      this.view.setupCost.autoSize = "left";
      this.view.potentialTakeLabel.autoSize = "left";
      this.view.potentialTake.autoSize = "left";
      this.view.crewCutLabel.autoSize = "left";
      this.view.crewCut.autoSize = "left";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.setupCostLabel,"CHB_SETUP_COST");
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.potentialTakeLabel,"CHB_POTENTIAL_TAKE");
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.crewCutLabel,"CHB_CREW_CUT");
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.playerTakeLabel,"CHB_PLAYER_TAKE");
      this.view.approachTitle.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.approachTitle,"CHB_APPROACH");
      this.view.targetTitle.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.targetTitle,"CHB_TARGET");
      this.todoLists = [];
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.TODO_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList(this.view.todoList,"CHB_TODO");
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.OPTIONAL_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList(this.view.optionalList,"CHB_OPTIONAL");
      this.view.star._visible = false;
      this.pieChart = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart(this.view.pieChart,5,85,95,"PIE_FILLING");
      this.pieChart.setSegmentVisible(4,false);
      this.pieChart.setLabel(4,"");
      this.view.playerTake.textAutoSize = "fit";
      this.initButton(this.view.entranceButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.ENTRANCE,1,"CHB_ENTRANCE");
      this.initButton(this.view.exitButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.EXIT,1,"CHB_EXIT");
      this.initButton(this.view.dropOffButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.DROP_OFF,1,"CHB_DROP_OFF");
      this.initButton(this.view.decoyButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.DECOY_VEHICLE,1,"CHB_DECOY");
      this.initButton(this.view.switchVehicleButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.SWITCH_VEHICLE,1,"CHB_SWITCH");
      this.initButton(this.view.outfitInButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.OUTFIT_IN,1,"CHB_OUTFIT_IN");
      this.initButton(this.view.outfitOutButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.OUTFIT_OUT,1,"CHB_OUTFIT_OUT");
      this.view.outfitInButton.label.textAutoSize = "fit";
      this.view.outfitOutButton.label.textAutoSize = "fit";
      this.view.decoyButton.purchased.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.decoyButton.purchased.label,"CHB_PURCHASED");
      this.view.decoyButton.purchased._visible = false;
      this.view.switchVehicleButton.purchased.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.switchVehicleButton.purchased.label,"CHB_PURCHASED");
      this.view.switchVehicleButton.purchased._visible = false;
      this.crewButtons = [];
      var _loc3_ = 1;
      while(_loc3_ <= com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS)
      {
         this.initCrewMember(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      this.launchButton = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.LAUNCH,this.view.launchButton);
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(this.view.launchButton.label.tf,"CHB_LAUNCH");
      this._buttons.push(this.launchButton);
      this.view.outfitOutButton.star._visible = false;
      this.view.switchVehicleButton.star._visible = false;
      this.view.decoyButton.star._visible = false;
      var _loc4_ = this._buttons[0].view;
      var _loc6_ = (_loc4_._x + 0.5 * _loc4_._width) / this.app.displayConfig.screenWidth;
      var _loc5_ = (_loc4_._y + 0.5 * _loc4_._height) / this.app.displayConfig.screenHeight;
      this.cursor.moveTo(_loc6_,_loc5_);
   }
   function initButton(buttonView, buttonID, imageID, label)
   {
      buttonView.padlock._visible = false;
      this.setArrowsStyle(buttonView.arrows.arrows,false);
      buttonView.tick._visible = false;
      buttonView.label.textAutoSize = "shrink";
      if(!isNaN(imageID))
      {
         buttonView.image.gotoAndStop(imageID);
      }
      if(label)
      {
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(buttonView.label,label);
      }
      if(buttonView.notSelected)
      {
         buttonView.notSelected.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(buttonView.notSelected.label,"CHB_NOSEL");
         buttonView.notSelected._visible = false;
      }
      this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.Button(buttonID,buttonView));
   }
   function initCrewMember(index)
   {
      var _loc2_ = this.view.crewPanel["crewButton" + index];
      _loc2_.keyLabel.text = index;
      var _loc5_ = new flash.geom.ColorTransform();
      _loc5_.rgb = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.PieChart.COLOURS[index - 1];
      _loc2_.key.transform.colorTransform = _loc5_;
      _loc2_.ready.label.textAutoSize = "shrink";
      _loc2_.ready.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(_loc2_.ready.label,"CHB_READY");
      _loc2_.ready._visible = false;
      _loc2_.notReady.label.textAutoSize = "shrink";
      _loc2_.notReady.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(_loc2_.notReady.label,"CHB_NOT_READY");
      var _loc6_ = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs["CREW_" + index];
      var _loc4_ = new com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.Button(_loc6_,_loc2_);
      this._buttons.push(_loc4_);
      this.crewButtons.push(_loc4_);
   }
   function setCrewPanelVisible(isVisible)
   {
      this.view.crewPanel._visible = isVisible;
      var _loc4_;
      if(!isVisible)
      {
         _loc4_ = this.cursor.getTargetIDUnderCursor();
         if(_loc4_ == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.CREW_1 || _loc4_ == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.CREW_2 || _loc4_ == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.CREW_3 || _loc4_ == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.CREW_4)
         {
            this.app.SET_INPUT_EVENT(com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.Cursor.UP);
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS)
      {
         this.crewButtons[_loc2_].enabled = isVisible;
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function addTodoListItem(listIndex, itemText, isComplete)
   {
      this.todoLists[listIndex].addItem(itemText,isComplete);
      if(listIndex == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.TODO_LIST_INDEX)
      {
         this.view.star._visible = true;
      }
   }
   function clearTodoList(listIndex)
   {
      this.todoLists[listIndex].clear();
      if(listIndex == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.TODO_LIST_INDEX)
      {
         this.view.star._visible = false;
      }
   }
   function setPadlock(buttonID, isLocked)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.padlock._visible = isLocked;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTick(buttonID, isTicked)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.tick._visible = isTicked;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.SWITCH_VEHICLE)
      {
         this.view.switchVehicleDollar._visible = !isTicked;
         this.view.switchVehicleButton.purchased._visible = isTicked;
      }
      else if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.DECOY_VEHICLE)
      {
         this.view.decoyDollar._visible = !isTicked;
         this.view.decoyButton.purchased._visible = isTicked;
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
            _loc2_.view._visible = isVisible;
            _loc2_.enabled = isVisible;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function setButtonEnabled(buttonID, isEnabled)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.enabled = isEnabled;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function setButtonImage(buttonID, imageID)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.image.gotoAndStop(imageID);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonGreyedOut(buttonID, isGreyedOut)
   {
      if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.ButtonIDs.LAUNCH)
      {
         this.launchButton.view.transform.colorTransform = !isGreyedOut ? new flash.geom.ColorTransform(1,1,1,1,0,0,0,0) : new flash.geom.ColorTransform(0,0,0,0.5,0,0,0,0);
         return undefined;
      }
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.selectedIsGreyedOut = isGreyedOut;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setCrewMember(buttonID, name, image)
   {
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS)
      {
         _loc4_ = this.crewButtons[_loc2_];
         if(_loc4_.id == buttonID)
         {
            _loc3_ = _loc4_.view;
            com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.truncate(_loc3_.crewName,name);
            this.app.imageManager.addImage(image,image,_loc3_.image);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setCrewMemberState(buttonID, isReady, headsetState)
   {
      var _loc3_ = 0;
      var _loc4_;
      var _loc2_;
      for(; _loc3_ < com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS; _loc3_ = _loc3_ + 1)
      {
         _loc4_ = this.crewButtons[_loc3_];
         if(_loc4_.id != buttonID)
         {
            continue;
         }
         _loc2_ = _loc4_.view;
         _loc2_.ready._visible = isReady;
         _loc2_.notReady._visible = !isReady;
         switch(headsetState)
         {
            case com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.HEADSET_ACTIVE:
               _loc2_.headset.gotoAndStop(3);
               return;
            case com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.HEADSET_INACTIVE:
               _loc2_.headset.gotoAndStop(1);
               return;
            case com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.HEADSET_MUTED:
               _loc2_.headset.gotoAndStop(2);
               return;
            default:
               return;
         }
      }
   }
   function setCrewCut(buttonID, cut)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS)
      {
         _loc3_ = this.crewButtons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.cut.text = cut + "%";
            this.pieChart.setValue(_loc2_,cut);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.pieChart.setValue(4,cut);
   }
   function setSelectionArrowsVisible(buttonID, visibleState)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.arrows._visible = visibleState != 2;
         }
         this.setArrowsStyle(_loc3_.view.arrows.arrows,_loc3_.id == buttonID && visibleState == 1);
         _loc2_ = _loc2_ + 1;
      }
      var _loc7_;
      if(visibleState == 1)
      {
         _loc7_ = false;
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.screens.MainScreen.NUM_CREW_MEMBERS)
         {
            _loc3_ = this.crewButtons[_loc2_];
            if(_loc3_.id == buttonID)
            {
               this.pieChart.highlightSegment(_loc2_);
               _loc7_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc7_)
         {
            this.pieChart.highlightSegment(-1);
         }
      }
      else
      {
         this.pieChart.highlightSegment(-1);
      }
   }
   function setArrowsStyle(arrows, areVisible)
   {
      if(areVisible)
      {
         arrows.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,218,20,50,0);
      }
      else
      {
         arrows.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,0.7,0,0,0,0);
      }
   }
   function setNotSelectedVisible(buttonID, isVisible)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.notSelected._visible = isVisible;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setStarVisible(buttonID, isVisible)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.star._visible = isVisible;
            if(isVisible)
            {
               this.view.star._visible = true;
            }
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setHeadings(approach, target, setupCost, potentialTake, supportCrewCut, entrance, exit, buyer, outfitIn, outfitOut)
   {
      this.initAsteriskTitle(this.view.approach,approach,true);
      this.initAsteriskTitle(this.view.target,target,true);
      this.view.setupCost.text = "$" + com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.formatNumber(setupCost);
      this.view.potentialTake.text = "$" + com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.formatNumber(potentialTake);
      this.view.crewCut.text = "-$" + com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.formatNumber(supportCrewCut);
      this.view.playerTake.text = "$" + com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.formatNumber(potentialTake - supportCrewCut);
      this.centreCostLabels(this.view.setupCostLabel,this.view.setupCost,this.view.setupCostDivider);
      this.centreCostLabels(this.view.potentialTakeLabel,this.view.potentialTake,this.view.crewPanelDivider);
      this.centreCostLabels(this.view.crewCutLabel,this.view.crewCut,this.view.crewPanelDivider);
      this.setPaperLabel(entrance,this.view.entranceButton);
      this.setPaperLabel(exit,this.view.exitButton);
      this.setPaperLabel(buyer,this.view.dropOffButton);
      this.setPaperLabel(outfitIn,this.view.outfitInButton);
      this.setPaperLabel(outfitOut,this.view.outfitOutButton);
   }
   function setPaperLabel(label, buttonView)
   {
      if(label == undefined || label.length == 0)
      {
         buttonView.location.text = "";
         buttonView.paper._visible = false;
      }
      else
      {
         buttonView.location.textAutoSize = "fit";
         buttonView.location.text = label;
         buttonView.paper._visible = true;
      }
   }
   function setLaunchButtonLabel(label)
   {
      this.view.launchButton.label.tf.text = label;
   }
   function setMapMarkers(visibleGroup)
   {
      this.view.markersLong._visible = visibleGroup == 3;
      this.view.markersMedium._visible = visibleGroup == 2;
      this.view.markersShort._visible = visibleGroup == 1;
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
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(title.label,label);
      }
      title.rightAsterisk._x = title.label._x + title.label._width;
      title._x = _loc2_ - 0.5 * title._width;
   }
   function centreCostLabels(label, cost, divider)
   {
      var _loc2_ = 4;
      var _loc4_ = label._width + _loc2_ + cost._width;
      var _loc3_ = 0.5 * (divider._width - _loc4_) + divider._x;
      label._x = _loc3_;
      cost._x = label._x + label._width + _loc2_;
   }
   function dispose()
   {
      this.pieChart.dispose();
      this.pieChart = null;
      this.todoLists = null;
      this.crewButtons = null;
      this.launchButton = null;
      super.dispose();
   }
}
