class com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.screens.MainScreen extends com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.screens.Screen
{
   var view;
   var todoLists;
   var approachGroup;
   var _buttons;
   var app;
   var cursor;
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
      this.view.approachTitle.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.approachTitle,"CHB_APPROACH");
      this.view.targetTitle.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.targetTitle,"CHB_TARGET");
      this.view.weaponsTitle.autoSize = "center";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.weaponsTitle,"CHB_WEAP");
      this.view.vehiclesTitle.autoSize = "center";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.vehiclesTitle,"CHB_VEH");
      this.view.hackingTitle.autoSize = "center";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.hackingTitle,"CHB_HACK");
      this.initAsteriskTitle(this.view.crewTitle,"CHB_CREW",false);
      this.initAsteriskTitle(this.view.missionsTitle,"CHB_MISSIONS",false);
      this.initAsteriskTitle(this.view.insideManTitle,"CHB_INSIDE_MAN",false);
      this.initAsteriskTitle(this.view.approachSpecTitle,"CHB_APPROACH_SPEC",false);
      this.todoLists = [];
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.screens.MainScreen.TODO_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.TodoList(this.view.todoList,"CHB_TODO");
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.screens.MainScreen.OPTIONAL_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.TodoList(this.view.optionalList,"CHB_OPTIONAL");
      this.view.optionalList.magnet._visible = false;
      var _loc5_ = this.view.createEmptyMovieClip("approaches",this.view.getNextHighestDepth());
      _loc5_._x = this.view.approachGroupTopLine._x;
      _loc5_._y = this.view.approachGroupTopLine._y;
      this.approachGroup = new com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup(_loc5_,"approach",2,129,128,6,22,3,3,0);
      var _loc4_ = [1,2,3,4];
      this.initCrewButton(this.view.crewButton1,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.CREW_1,"CHB_GUNMAN",_loc4_);
      this.initCrewButton(this.view.crewButton2,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.CREW_2,"CHB_DRIVER",_loc4_);
      this.initCrewButton(this.view.crewButton3,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.CREW_3,"CHB_HACKER",_loc4_);
      this.initButton(this.view.insideManButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.INSIDE_MAN,1);
      this.initButton(this.view.securityCamButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.SECURITY_CAM,1,"CHB_SEC_CAM");
      this.initButton(this.view.guardPatrolButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.GUARD_PATROL,2,"CHB_GUARD");
      this.initButton(this.view.shipmentsButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.SHIPMENTS,3,"CHB_SHIPMENTS");
      this.initButton(this.view.keyCardButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.KEY_CARD,4,"CHB_KEYCARD");
      this.initButton(this.view.drillButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.DRILL,5,"CHB_DRILLS");
      this.initButton(this.view.weaponsButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.WEAPONS,1,"");
      this.view.weaponsButton.tick._visible = false;
      this.initButton(this.view.vehiclesButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.VEHICLES,1,"");
      this.view.vehiclesButton.tick._visible = false;
      this.initButton(this.view.hackingButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.HACKING,1,"");
      this.view.hackingButton.tick._visible = false;
      this.initButton(this.view.masksButton,com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.MASKS,undefined,"CHB_MASKS");
      this.view.weaponsButton.star._visible = true;
      this.view.vehiclesButton.star._visible = true;
      this.view.hackingButton.star._visible = true;
      this.view.keyCardButton.star._visible = true;
      var _loc3_ = this._buttons[0].view;
      var _loc7_ = (_loc3_._x + 0.5 * _loc3_._width) / this.app.displayConfig.screenWidth;
      var _loc6_ = (_loc3_._y + 0.5 * _loc3_._height) / this.app.displayConfig.screenHeight;
      this.cursor.moveTo(_loc7_,_loc6_);
   }
   function initButton(buttonView, buttonID, imageID, label)
   {
      buttonView.padlock._visible = false;
      buttonView.completion._visible = false;
      if(buttonView.purchased)
      {
         buttonView.purchased.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(buttonView.purchased.label,"CHB_PURCHASED");
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
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(buttonView.label,label);
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
      this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button(buttonID,buttonView));
   }
   function initCrewButton(buttonView, buttonID, label, headingFrames)
   {
      this.initButton(buttonView,buttonID);
      var _loc3_ = Math.floor(Math.random() * headingFrames.length);
      buttonView.heading.gotoAndStop(headingFrames[_loc3_]);
      buttonView.hiredStamp._visible = false;
      buttonView.star._visible = false;
      headingFrames.splice(_loc3_,1);
      buttonView.heading.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(buttonView.heading.label,label);
      buttonView.skillLabel.autoSize = "left";
      buttonView.skillLabel.background = true;
      buttonView.skillLabel.backgroundColor = 0;
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(buttonView.skillLabel,"CHB_SKILL");
      buttonView.cutLabel.autoSize = "left";
      buttonView.cutLabel.background = true;
      buttonView.cutLabel.backgroundColor = 0;
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(buttonView.cutLabel,"CHB_CUT");
   }
   function addTodoListItem(listIndex, itemText, isComplete)
   {
      this.todoLists[listIndex].addItem(itemText,isComplete);
   }
   function clearTodoList(listIndex)
   {
      this.todoLists[listIndex].clear();
   }
   function addApproach(buttonID, imageID, title, isComplete, isRequired, tapeLabel)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            this.approachGroup.updateItem(_loc3_.view,imageID,title,isComplete,isRequired,tapeLabel);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc11_ = this.approachGroup.addItem(imageID,title,isComplete,isRequired,tapeLabel);
      _loc11_.purchased.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(_loc11_.purchased.label,"CHB_PURCHASED");
      _loc11_.purchased._visible = false;
      this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button(buttonID,_loc11_));
      _loc2_ = 0;
      _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         this._buttons[_loc2_].updateBounds();
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function removeApproach(buttonID)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            this.approachGroup.removeItem(_loc3_.view);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         this._buttons[_loc2_].updateBounds();
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
   }
   function setPadlock(buttonID, isLocked)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
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
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.tick._visible = isTicked;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setStarVisible(buttonID, isVisible)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.star._visible = isVisible;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPurchased(buttonID, isPurchased)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.purchased._visible = isPurchased;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonVisible(buttonID, isVisible)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._buttons[_loc3_];
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
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.enabled == isEnabled)
            {
               return undefined;
            }
            _loc2_.enabled = isEnabled;
            this.cursor.setTargetRects(this._buttons);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setButtonImage(buttonID, imageID)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
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
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.selectedIsGreyedOut = isGreyedOut;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setCrewMember(buttonID, crewName, skill, image, cut, weapon)
   {
      var _loc3_ = 0;
      var _loc5_ = this._buttons.length;
      while(_loc3_ < _loc5_)
      {
         var _loc4_ = this._buttons[_loc3_];
         if(_loc4_.id == buttonID)
         {
            var _loc2_ = _loc4_.view;
            _loc2_.crewName.text = crewName;
            _loc2_.skill.text = skill;
            _loc2_.cut.text = cut != undefined ? cut + "%" : "0%";
            _loc2_.image.gotoAndStop(image);
            if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.CREW_1)
            {
               this.view.weapons.gotoAndStop(weapon);
            }
            else if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ButtonIDs.CREW_2)
            {
               this.view.vehicles.gotoAndStop(image);
            }
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setCrewMemberHired(buttonID, isHired)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.hiredStamp._visible = isHired;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setMission(buttonID, image, title)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._buttons[_loc3_];
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
   function setInsideMan(name, image)
   {
      this.view.insideManButton.title.text = name;
      this.view.insideManButton.image.gotoAndStop(image);
   }
   function setSelectionArrowsVisible(buttonID, visibleState)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.arrows._visible = visibleState != 2;
         }
         this.setArrowsStyle(_loc2_.view.arrows,_loc2_.id == buttonID && visibleState == 1);
         _loc3_ = _loc3_ + 1;
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
   function setHeadings(approach, target)
   {
      this.initAsteriskTitle(this.view.approach,approach,true);
      this.initAsteriskTitle(this.view.target,target,true);
   }
   function setSecurityPassVisible(level)
   {
      this.view.securityPass.level1._visible = level == 1;
      this.view.securityPass.level2._visible = level == 2;
      this.view.securityPass._visible = level > 0;
   }
   function setPosterVisible(buttonID, isVisible, numTicks, totalTickboxes)
   {
      if(numTicks == undefined)
      {
         numTicks = 0;
      }
      if(totalTickboxes == undefined)
      {
         totalTickboxes = 0;
      }
      var _loc4_ = 0;
      var _loc5_ = this._buttons.length;
      while(_loc4_ < _loc5_)
      {
         var _loc2_ = this._buttons[_loc4_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.poster._visible = isVisible;
            _loc2_.view.image._visible = !isVisible;
            _loc2_.view.bg._visible = !isVisible;
            _loc2_.view.label._visible = !isVisible;
            _loc2_.view.box._visible = !isVisible;
            _loc2_.view.tick._visible = !isVisible;
            _loc2_.view.poster.tick1._visible = numTicks >= 1;
            _loc2_.view.poster.tick2._visible = numTicks >= 2;
            _loc2_.view.poster.box1._visible = totalTickboxes >= 1;
            _loc2_.view.poster.box2._visible = totalTickboxes >= 2;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function setMissionCompletion(buttonID, isVisible, numerator, denominator)
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._buttons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.completion.label.text = numerator + "/" + denominator;
            _loc2_.view.completion._visible = isVisible;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
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
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(title.label,label);
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
