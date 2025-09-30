class com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen extends com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var cursorListenerID;
   var optionalButtons;
   var optionalListItems;
   var optionalListItemsY0;
   var prepButtons;
   var safeZoneBottom;
   var safeZoneLeft;
   var safeZoneRight;
   var safeZoneTop;
   var startButton;
   var taskButton;
   var todoButtons;
   var todoListItems;
   var todoListItemsY0;
   var view;
   static var STATE_INVALID = -1;
   static var STATE_INCOMPLETE = 0;
   static var STATE_COMPLETE = 1;
   static var TODO_LIST_ITEM_HEIGHT = 76;
   static var TEXTURE_DICTIONARY = "SALVAGE_PLANNING_IMG";
   function MainScreen(app, viewContainer, cursor)
   {
      super();
      this.app = app;
      this.cursor = cursor;
      var _loc7_ = viewContainer.getNextHighestDepth();
      this.view = viewContainer.attachMovie("mainScreen","mainScreen",_loc7_);
      this.cursorListenerID = cursor.addListener(com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.delegate(this,this.onTargetChange));
      this.safeZoneLeft = app.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_WIDTH;
      this.safeZoneRight = app.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_WIDTH;
      this.safeZoneTop = app.displayConfig.safeTop * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_HEIGHT;
      this.safeZoneBottom = app.displayConfig.safeBottom * com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.STAGE_HEIGHT;
      this.taskButton = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.TASK,this.view.taskHit,this.view.taskHighlight);
      var _loc4_ = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.PREP_1,this.view.prep1Hit,this.view.prep1Highlight);
      var _loc6_ = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.PREP_2,this.view.prep2Hit,this.view.prep2Highlight);
      var _loc5_ = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.PREP_3,this.view.prep3Hit,this.view.prep3Highlight);
      this.startButton = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.START,this.view.startHit,this.view.startHighlight);
      this.prepButtons = [_loc4_,_loc6_,_loc5_];
      this.buttons = [this.taskButton,this.startButton,_loc4_,_loc6_,_loc5_];
      this.todoButtons = [];
      this.todoListItems = [];
      this.todoListItemsY0 = this.view.todoList.item0._y;
      this.view.todoList.item0._visible = false;
      this.optionalButtons = [];
      this.optionalListItems = [];
      this.optionalListItemsY0 = this.view.optionalList.item0._y;
      this.view.optionalList.item0._visible = false;
      this.view.targetVehicle._visible = false;
      this.view.task._visible = false;
      this.view.map._visible = false;
      this.view.map.marker._visible = false;
      this.view.preps._visible = false;
      this.view.startButton._visible = false;
      this.view.todoList._visible = false;
      this.view.optionalList._visible = false;
      this.view.preps.content.cross._visible = false;
      this.view.preps.contentTopmost.cross._visible = false;
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.targetVehicle.heading,"SLV_PLAN_TARGET");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.targetVehicle.paymentLabel,"SLV_PLAN_PAYMENT");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.targetVehicle.salvageLabel,"SLV_PLAN_SALVAGE");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.todoList.heading,"SLV_PLAN_TASKS");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.preps.content.heading,"SLV_PLAN_PREP");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.preps.content.subheading,"SLV_PLAN_OPT");
      com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.setLocalisedText(this.view.startButton.label,"SLV_PLAN_START");
      this.view.todoList.icon._x = this.view.todoList.heading._x + this.view.todoList.heading._width / 2 - this.view.todoList.heading.textWidth / 2;
      this.view.targetVehicle.maxSellLine._width = this.view.targetVehicle.paymentLabel.textWidth;
      this.view.heading.label.textAutoSize = "shrink";
      this.view.startButton.label.textAutoSize = "shrink";
      this.view.targetVehicle.vehicleName.textAutoSize = "shrink";
      this.view.targetVehicle.paymentLabel.textAutoSize = "shrink";
      this.view.targetVehicle.paymentValue.textAutoSize = "shrink";
      this.view.targetVehicle.salvageLabel.textAutoSize = "shrink";
      this.view.targetVehicle.salvageValue.textAutoSize = "shrink";
      this.view.preps.prep1Image._visible = false;
      this.view.preps.prep2Image._visible = false;
      this.view.preps.prep3Image._visible = false;
      this.view.preps.content.prep1Strikethrough._visible = false;
      this.view.preps.content.prep2Strikethrough._visible = false;
      this.view.preps.content.prep3Strikethrough._visible = false;
      this.view.targetVehicle.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.heading.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.startButton.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.task.content.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.preps.content.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.preps.contentTopmost.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.todoList.icon.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.todoList.underline.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      this.view.todoList.heading.textColor = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT_COLOUR;
   }
   function setHeading(heading)
   {
      this.view.heading.label.text = heading;
   }
   function setTargetVehicle(name, paymentValue, salvageValue)
   {
      if(name.length == 0)
      {
         this.view.targetVehicle._visible = false;
      }
      else
      {
         this.view.targetVehicle._visible = true;
         this.view.targetVehicle.vehicleName.text = name;
         this.view.targetVehicle.paymentValue.text = com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.formatNumber(paymentValue);
         this.view.targetVehicle.salvageValue.text = com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.formatNumber(salvageValue);
      }
   }
   function setTask(heading, state, texture)
   {
      this.view.task._visible = state != com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_INVALID;
      if(heading.length == 0)
      {
         this.view.task.content.strikethrough._visible = false;
         this.cursor.removeTarget(this.taskButton);
         this.view.heading.box.gotoAndStop("off");
      }
      else
      {
         this.view.task.content.heading.text = heading;
         this.view.task.content.strikethrough1._width = this.view.task.content.heading.getLineMetrics(0).width + 20;
         this.view.task.content.strikethrough1._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE;
         this.view.task.content.strikethrough2._width = this.view.task.content.heading.getLineMetrics(1).width + 20;
         this.view.task.content.strikethrough2._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE && this.view.task.content.heading.numLines > 1;
         this.view.taskHighlight._width = this.view.task.content.heading.textWidth + 90;
         this.view.taskHighlight._height = this.view.task.content.heading.textHeight + 80;
         this.view.taskHighlight._y = this.view.task._y + this.view.task.content._y + this.view.task.content.heading._y + this.view.task.content.heading.textHeight / 2 - 20;
         if(texture == undefined || texture.length == 0)
         {
            this.view.task.image._visible = false;
         }
         else
         {
            this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.TEXTURE_DICTIONARY,texture,this.view.task.image);
            this.view.task.image._visible = true;
         }
         this.cursor.addTarget(this.taskButton);
         if(this.cursor.getTargetUnderCursor() == null)
         {
            this.cursor.snapToTarget(this.taskButton);
         }
         this.view.heading.box.gotoAndStop("on");
      }
   }
   function addTodoListItem(label, state)
   {
      var _loc5_ = this.todoListItems.length;
      var _loc2_ = this.view.todoList.attachMovie("todoListItem","item" + _loc5_,this.view.todoList.getNextHighestDepth());
      var _loc4_ = Math.random() * 30 - 15;
      _loc2_.dash._x += _loc4_;
      _loc2_.label._x += _loc4_;
      _loc2_.strikethrough1._x += _loc4_;
      _loc2_.strikethrough2._x += _loc4_;
      _loc2_.highlight._x += _loc4_;
      _loc2_._y = this.todoListItems.length != 0 ? this.todoListItems[this.todoListItems.length - 1]._y + this.todoListItems[this.todoListItems.length - 1].label._height : this.todoListItemsY0;
      _loc2_.label._rotation = _loc2_.strikethrough1._rotation = _loc2_.strikethrough2._rotation = Math.random() * 2 - 1;
      _loc2_.dash._rotation = Math.random() * 4 - 2;
      _loc2_.label.autoSize = "left";
      _loc2_.label.text = label;
      _loc2_.strikethrough1._width = _loc2_.label.getLineMetrics(0).width + 20;
      _loc2_.strikethrough1._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE;
      _loc2_.strikethrough2._width = _loc2_.label.getLineMetrics(1).width + 20;
      _loc2_.strikethrough2._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE && _loc2_.label.numLines > 1;
      _loc2_.highlight._width = _loc2_.label.textWidth + 160;
      _loc2_.highlight._height = _loc2_.label._height + 60;
      _loc2_.highlight._y = _loc2_.label._y + 0.5 * _loc2_.label._height - 10;
      if(_loc2_.strikethrough2._visible)
      {
         _loc2_.strikethrough2._y = 90;
      }
      _loc2_.dash.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.strikethrough1.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.strikethrough2.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.label.textColor = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT_COLOUR;
      this.view.todoList._visible = true;
      this.todoListItems.push(_loc2_);
      this.todoButtons.push(this.addTodoButton(_loc2_.buttonHit,_loc2_.highlight));
      this.view.optionalList._y = this.view.todoList._y + this.view.todoList._height - 50;
      var _loc3_ = 0;
      while(_loc3_ < this.optionalButtons.length)
      {
         this.optionalButtons[_loc3_].updatePosition();
         _loc3_ = _loc3_ + 1;
      }
   }
   function clearTodoList()
   {
      while(this.todoListItems.length > 0)
      {
         this.todoListItems.pop().removeMovieClip();
      }
      this.view.todoList._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < this.todoButtons.length)
      {
         this.cursor.removeTarget(this.todoButtons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.todoButtons.length = 0;
      this.buttons = [this.taskButton,this.startButton].concat(this.prepButtons,this.optionalButtons);
   }
   function addOptionalListItem(label, state)
   {
      var _loc5_ = this.optionalListItems.length;
      var _loc2_ = this.view.optionalList.attachMovie("todoListItem","item" + _loc5_,this.view.optionalList.getNextHighestDepth());
      var _loc4_ = Math.random() * 30 - 15;
      _loc2_.dash._x += _loc4_;
      _loc2_.label._x += _loc4_;
      _loc2_.strikethrough1._x += _loc4_;
      _loc2_.strikethrough2._x += _loc4_;
      _loc2_.highlight._x += _loc4_;
      _loc2_._y = this.optionalListItems.length != 0 ? this.optionalListItems[this.optionalListItems.length - 1]._y + this.optionalListItems[this.optionalListItems.length - 1].label._height : this.optionalListItemsY0;
      _loc2_.label._rotation = _loc2_.strikethrough1._rotation = _loc2_.strikethrough2._rotation = Math.random() * 2 - 1;
      _loc2_.dash._rotation = Math.random() * 4 - 2;
      _loc2_.label.autoSize = "left";
      _loc2_.label.text = label;
      _loc2_.strikethrough1._width = _loc2_.label.getLineMetrics(0).width + 20;
      _loc2_.strikethrough1._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE;
      _loc2_.strikethrough2._width = _loc2_.label.getLineMetrics(1).width + 20;
      _loc2_.strikethrough2._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE && _loc2_.label.numLines > 1;
      _loc2_.highlight._width = _loc2_.label.textWidth + 160;
      _loc2_.highlight._height = _loc2_.label._height + 60;
      _loc2_.highlight._y = _loc2_.label._y + 0.5 * _loc2_.label._height - 10;
      if(_loc2_.strikethrough2._visible)
      {
         _loc2_.strikethrough2._y = 90;
      }
      _loc2_.dash.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.strikethrough1.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.strikethrough2.transform.colorTransform = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT;
      _loc2_.label.textColor = com.rockstargames.gtav.levelDesign.salvagePlanning.screens.Screen.TINT_COLOUR;
      this.view.optionalList._visible = true;
      this.view.todoList._visible = true;
      if(this.todoListItems.length > 0)
      {
         this.view.optionalList._y = this.view.todoList._y + this.view.todoList._height - 50;
      }
      else
      {
         this.view.optionalList._y = this.view.todoList._y + this.todoListItemsY0;
      }
      this.optionalListItems.push(_loc2_);
      this.optionalButtons.push(this.addTodoButton(_loc2_.buttonHit,_loc2_.highlight));
      var _loc3_ = 0;
      while(_loc3_ < this.optionalButtons.length)
      {
         this.optionalButtons[_loc3_].updatePosition();
         _loc3_ = _loc3_ + 1;
      }
   }
   function clearOptionalList()
   {
      while(this.optionalListItems.length > 0)
      {
         this.optionalListItems.pop().removeMovieClip();
      }
      this.view.optionalList._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < this.optionalButtons.length)
      {
         this.cursor.removeTarget(this.optionalButtons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.optionalButtons.length = 0;
      this.buttons = [this.taskButton,this.startButton].concat(this.prepButtons,this.todoButtons);
   }
   function addTodoButton(hit, highlight)
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.ButtonIDs.TODO_BASE + this.todoButtons.length + this.optionalButtons.length;
      var _loc2_ = new com.rockstargames.gtav.levelDesign.salvagePlanning.navigation.Button(_loc3_,hit,highlight);
      highlight._visible = false;
      this.cursor.addTarget(_loc2_);
      this.buttons.push(_loc2_);
      return _loc2_;
   }
   function setPrep(index, heading, state, texture)
   {
      var _loc2_ = this.view.preps.content["prep" + (index + 1) + "Label"];
      var _loc7_ = this.view.preps.content["prep" + (index + 1) + "Strikethrough1"];
      var _loc5_ = this.view.preps.content["prep" + (index + 1) + "Strikethrough2"];
      var _loc4_ = this.view.preps["prep" + (index + 1) + "Image"];
      var _loc6_ = this.view["prep" + (index + 1) + "Highlight"];
      if(heading.length == 0)
      {
         _loc2_.text = "";
         _loc7_._visible = false;
         _loc5_._visible = false;
         _loc4_._visible = false;
         this.cursor.removeTarget(this.prepButtons[index]);
      }
      else
      {
         _loc2_.text = heading;
         _loc7_._width = _loc2_.getLineMetrics(0).width + 20;
         _loc7_._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE;
         _loc5_._width = _loc2_.getLineMetrics(1).width + 20;
         _loc5_._visible = state == com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE && _loc2_.numLines > 1;
         _loc4_._visible = true;
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.TEXTURE_DICTIONARY,texture,_loc4_);
         this.cursor.addTarget(this.prepButtons[index]);
         _loc6_._width = _loc2_.textWidth + 90;
         _loc6_._height = _loc2_.textHeight + 80;
         _loc6_._y = this.view.preps._y + this.view.preps.content._y + _loc2_._y + _loc2_.textHeight / 2 + 10;
      }
      this.view.preps._visible = true;
   }
   function hidePreps()
   {
      this.view.preps._visible = false;
   }
   function setStartButton(state)
   {
      this.view.startButton._visible = true;
      switch(state)
      {
         case com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_INVALID:
            this.view.startButton._alpha = 0;
            this.cursor.removeTarget(this.startButton);
            break;
         case com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_INCOMPLETE:
            this.view.startButton._alpha = 50;
            this.cursor.removeTarget(this.startButton);
            break;
         case com.rockstargames.gtav.levelDesign.salvagePlanning.screens.MainScreen.STATE_COMPLETE:
            this.view.startButton._alpha = 100;
            this.cursor.addTarget(this.startButton);
         default:
            return;
      }
   }
   function setViewVisible(isVisible)
   {
      this.view._visible = isVisible;
   }
   function setOptionalFailed(hasFailed)
   {
      this.view.preps.content.cross._visible = hasFailed;
      this.view.preps.contentTopmost.cross._visible = hasFailed;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.ACCEPT:
         case com.rockstargames.gtav.levelDesign.SALVAGE_PLANNING.CANCEL:
      }
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
      if(enabled)
      {
         this.onTargetChange(this.cursor.getTargetUnderCursor());
      }
   }
   function setButtonStates(isOn)
   {
      var _loc3_ = this.cursor.getTargetUnderCursor();
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].setState(isOn && this.buttons[_loc2_] == _loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function customCancelResponse()
   {
      return false;
   }
   function dispose()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.buttons = [];
      this.todoButtons = [];
      this.optionalButtons = [];
      this.app = null;
      this.cursor.removeListener(this.cursorListenerID);
      this.cursor = null;
      this.view.removeMovieClip();
      this.view = null;
   }
}
