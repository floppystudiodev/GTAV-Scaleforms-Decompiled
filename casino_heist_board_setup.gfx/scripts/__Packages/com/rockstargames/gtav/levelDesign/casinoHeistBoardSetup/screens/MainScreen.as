class com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen extends com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.Screen
{
   var view;
   var photoGroups;
   var todoLists;
   var accessPointButtons;
   var accessPointButtonLocations;
   var _buttons;
   var app;
   var cursor;
   static var POI_PHOTO_GROUP_INDEX = 0;
   static var TODO_LIST_INDEX = 0;
   static var OPTIONAL_LIST_INDEX = 1;
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initAsteriskTitle(this.view.accessPointsTitle,"CHB_ACCESS");
      this.initAsteriskTitle(this.view.approachTitle,"CHB_SEL_APPROACH");
      this.initAsteriskTitle(this.view.targetTitle,"CHB_TARGET");
      this.initAsteriskTitle(this.view.extrasTitle,"CHB_EXTRAS");
      this.view.blueprint._visible = false;
      this.photoGroups = [];
      this.photoGroups[com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.POI_PHOTO_GROUP_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.PhotoGroup(this.view.poiPhotos,"CHB_POI","poiPhoto",2,50,54,-24,28,2,4,5);
      this.todoLists = [];
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.TODO_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList(this.view.todoList,"CHB_TODO");
      this.todoLists[com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.screens.MainScreen.OPTIONAL_LIST_INDEX] = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList(this.view.optionalList,"CHB_OPTIONAL");
      this.view.optionalList.magnet._visible = false;
      this.accessPointButtons = [];
      this.accessPointButtonLocations = [];
      var _loc4_ = 1;
      while(_loc4_ <= 2)
      {
         buttonView = this.view["scopingButton" + _loc4_];
         buttonView.image.gotoAndStop(_loc4_);
         buttonView.label.autoSize = "left";
         buttonView.tick._visible = false;
         buttonView.padlock._visible = false;
         this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs["SCOPING_" + _loc4_],buttonView,"CHB_SCOPING_" + _loc4_,false));
         if(_loc4_ == 1)
         {
            this.centreLabel(buttonView);
         }
         else
         {
            this.centreTickboxAndLabel(buttonView);
         }
         _loc4_ = _loc4_ + 1;
      }
      var buttonView;
      _loc4_ = 1;
      while(_loc4_ <= 3)
      {
         buttonView = this.view["missionButton" + _loc4_];
         buttonView.image.gotoAndStop(_loc4_);
         buttonView.label.autoSize = "left";
         buttonView.tick._visible = false;
         buttonView.padlock._visible = false;
         buttonView.purchased.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.setLocalisedText(buttonView.purchased.label,"CHB_PURCHASED");
         buttonView.purchased._visible = false;
         this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs["MISSION_" + _loc4_],buttonView,"CHB_MISSION_" + _loc4_,false));
         if(buttonView.label._width > 110)
         {
            buttonView.label.autoSize = "none";
            buttonView.label._width = 110;
            buttonView.label.textAutoSize = "shrink";
         }
         this.centreTickboxAndLabel(buttonView);
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 1;
      while(_loc4_ <= 3)
      {
         buttonView = this.view["approachButton" + _loc4_];
         buttonView.image.gotoAndStop(_loc4_);
         buttonView.label.textAutoSize = "shrink";
         buttonView.tick._visible = false;
         buttonView.padlock._visible = false;
         buttonView.extreme._visible = false;
         com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.setLocalisedText(buttonView.description,"CHB_APPROACH_DESC_" + _loc4_);
         this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs["APPROACH_" + _loc4_],buttonView,"CHB_APPROACH_" + _loc4_,false));
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 1;
      while(_loc4_ <= 6)
      {
         buttonView = this.view["accessPointButton" + _loc4_];
         buttonView.label.textAutoSize = "shrink";
         buttonView.padlock._visible = false;
         buttonView.star._visible = false;
         buttonView.yellowMagnet._visible = false;
         buttonView.backImage._visible = false;
         this.setArrowsStyle(buttonView.arrows,false);
         var _loc3_ = 0;
         while(_loc3_ < 4)
         {
            buttonView["tick" + _loc3_]._visible = false;
            buttonView["box" + _loc3_]._visible = false;
            _loc3_ = _loc3_ + 1;
         }
         var _loc5_ = new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs["ACCESS_POINT_" + _loc4_],buttonView,"CHB_ACCESS_PT_" + _loc4_,false);
         this._buttons.push(_loc5_);
         this.accessPointButtons.push(_loc5_);
         this.accessPointButtonLocations.push(new flash.geom.Point(buttonView._x,buttonView._y));
         _loc4_ = _loc4_ + 1;
      }
      buttonView = this.view.targetButton;
      buttonView.padlock._visible = false;
      this._buttons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.TARGET,buttonView));
      var _loc6_ = this._buttons[0].view;
      var _loc8_ = (_loc6_._x + 0.5 * _loc6_._width) / this.app.displayConfig.screenWidth;
      var _loc7_ = (_loc6_._y + 0.5 * _loc6_._height) / this.app.displayConfig.screenHeight;
      this.cursor.moveTo(_loc8_,_loc7_);
   }
   function addPhotos(groupIndex, photoIDs)
   {
      this.photoGroups[groupIndex].addPhotos(photoIDs);
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
   function setExtreme(buttonID, isExtreme)
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         if(_loc3_.id == buttonID)
         {
            _loc3_.view.extreme._visible = isExtreme;
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
      if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.MISSION_1)
      {
         this.view.missionButton1.dollar._visible = !isTicked;
         this.view.missionButton1.purchased._visible = isTicked;
      }
      else if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.MISSION_2)
      {
         this.view.missionButton2.dollar._visible = !isTicked;
         this.view.missionButton2.purchased._visible = isTicked;
      }
      else if(buttonID == com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.MISSION_3)
      {
         this.view.missionButton3.dollar._visible = !isTicked;
         this.view.missionButton3.purchased._visible = isTicked;
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
   function setButtonVisible(buttonID, isVisible)
   {
      var _loc7_ = false;
      var _loc4_ = 0;
      var _loc5_ = this._buttons.length;
      while(_loc4_ < _loc5_)
      {
         var _loc2_ = this._buttons[_loc4_];
         if(_loc2_.id == buttonID)
         {
            if(_loc2_.enabled != isVisible)
            {
               _loc2_.view._visible = isVisible;
               _loc2_.enabled = isVisible;
               _loc7_ = true;
               break;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      var _loc3_ = 0;
      _loc5_ = this.accessPointButtons.length;
      while(_loc4_ < _loc5_)
      {
         _loc2_ = this.accessPointButtons[_loc4_];
         if(_loc2_.view._visible)
         {
            if(_loc2_.view._x != this.accessPointButtonLocations[_loc3_].x || _loc2_.view._y != this.accessPointButtonLocations[_loc3_].y)
            {
               _loc2_.view._x = this.accessPointButtonLocations[_loc3_].x;
               _loc2_.view._y = this.accessPointButtonLocations[_loc3_].y;
               _loc2_.updateBounds();
               _loc7_ = true;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
      if(_loc7_)
      {
         this.cursor.setTargetRects(this._buttons);
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
   function setSelectionArrowsVisible(buttonID, visibleState)
   {
      var _loc3_ = 0;
      var _loc6_ = 0;
      var _loc5_ = this.accessPointButtons.length;
      while(_loc3_ < _loc5_)
      {
         var _loc2_ = this.accessPointButtons[_loc3_];
         if(_loc2_.id == buttonID)
         {
            _loc2_.view.arrows._visible = visibleState != 2;
            if(_loc2_.view.backImage)
            {
               _loc2_.view.backImage._visible = visibleState != 2;
            }
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
   function setTargetType(targetType)
   {
      this.view.targetButton.label.text = targetType.toUpperCase();
   }
   function setApproach(title, description, image)
   {
      this.view.approachButton.label.text = title;
      this.view.approachDesc.text = description;
      this.view.approachButton.image.gotoAndStop(image);
   }
   function setAccessPointCompletion(buttonID, numAvailable, numComplete, isOptional)
   {
      var _loc19_ = 2516626;
      var _loc20_ = 0;
      var _loc9_ = new flash.geom.ColorTransform(0,0,0,1,38,102,146,0);
      var _loc8_ = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
      var _loc12_ = 18;
      var _loc16_ = -4;
      var _loc7_ = 0;
      var _loc17_ = 0;
      var _loc15_ = this.accessPointButtons.length;
      while(_loc7_ < _loc15_)
      {
         var _loc11_ = this.accessPointButtons[_loc7_];
         if(_loc11_.id == buttonID)
         {
            var _loc4_ = _loc11_.view;
            var _loc13_ = _loc4_.label._x + 0.5 * _loc4_.label._width;
            var _loc10_ = _loc13_ - 0.5 * numAvailable * _loc12_;
            var _loc2_ = 0;
            while(_loc2_ < 4)
            {
               var _loc3_ = _loc4_["tick" + _loc2_];
               var _loc5_ = _loc4_["box" + _loc2_];
               _loc3_._visible = _loc2_ < numComplete;
               _loc3_.transform.colorTransform = !isOptional ? _loc8_ : _loc9_;
               _loc3_._x = _loc10_ + _loc2_ * _loc12_ + _loc16_;
               _loc5_._visible = _loc2_ < numAvailable;
               _loc5_.transform.colorTransform = !isOptional ? _loc8_ : _loc9_;
               _loc5_._x = _loc3_._x;
               _loc2_ = _loc2_ + 1;
            }
            _loc4_.label.textColor = !isOptional ? _loc20_ : _loc19_;
            _loc4_.yellowMagnet._visible = !isOptional;
            _loc4_.blueMagnet._visible = isOptional;
            _loc4_.star._visible = !isOptional;
            break;
         }
         _loc7_ = _loc7_ + 1;
      }
   }
   function setBlueprintVisible(isVisible)
   {
      this.view.blueprint._visible = isVisible;
   }
   function setGraphicsVisible(isVisible)
   {
      this.view.graphics._visible = isVisible;
      this.view.optionalList._visible = isVisible;
      this.view.poiPhotos._visible = isVisible;
      this.view.extrasTitle._visible = isVisible;
      this.view.accessPointsTitle._visible = isVisible;
      this.view.targetTitle._visible = isVisible;
      this.view.approachTitle._visible = isVisible;
   }
   function initAsteriskTitle(title, label)
   {
      var _loc2_ = title._x + 0.5 * title._width;
      title.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.setLocalisedText(title.label,label);
      title.rightAsterisk._x = title.label._x + title.label._width;
      title._x = _loc2_ - 0.5 * title._width;
   }
   function centreTickboxAndLabel(view)
   {
      var _loc5_ = -6;
      var _loc3_ = 4;
      var _loc4_ = view.image._x + 0.5 * view.image._width;
      var _loc6_ = view.box._width + _loc3_ + view.label.textWidth;
      var _loc2_ = _loc4_ - 0.5 * _loc6_ + _loc5_;
      view.box._x = _loc2_;
      view.tick._x = _loc2_;
      view.label._x = _loc2_ + view.box._width + _loc3_;
   }
   function centreLabel(view)
   {
      var _loc2_ = view.image._x + 0.5 * view.image._width;
      view.label._x = _loc2_ - 0.5 * view.label.textWidth;
   }
}
