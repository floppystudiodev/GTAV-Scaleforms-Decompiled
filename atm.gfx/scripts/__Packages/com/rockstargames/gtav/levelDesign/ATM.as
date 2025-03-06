class com.rockstargames.gtav.levelDesign.ATM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var BACKGROUND;
   var viewContainer;
   var ref;
   var CURSOR;
   var transactionMC;
   var cashMC;
   var menuMC;
   var messageMC;
   var dataProviderUI;
   var buttonContainer;
   var cursorInterval;
   var previousKey;
   var currentKey;
   var numberOfRows;
   var playerName;
   var balance;
   var balanceString;
   var container;
   var wrapKey;
   var containerDepth = 40;
   var lineXPos = 237;
   var lineYPos = 0;
   var lineSpacing = 35;
   var analogSpeedDivisor = 15;
   var yScroll = 0;
   var pageHeight = 0;
   var playingPINanim = true;
   var counterPINanim = 0;
   var numberOfColumns = 2;
   var currentSelection = 1;
   var pinAnimStarted = false;
   var cursorState = "ARROW";
   function ATM()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "ATM";
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BACKGROUND = this.CONTENT.BACKGROUND;
      this.CONTENT.pinAnimMC.topmostLevel = true;
      this.viewContainer = this.CONTENT.viewContainer;
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.update();
      };
      this.CURSOR = this.TIMELINE.createEmptyMovieClip("CURSOR",this.TIMELINE.getNextHighestDepth());
      this.CURSOR._x = 640;
      this.CURSOR._y = 360;
      this.CURSOR._xscale = 150;
      this.CURSOR._yscale = 150;
      this.SHOW_CURSOR(false);
      this.transactionMC = this.viewContainer.transactionMC;
      this.cashMC = this.viewContainer.cashMC;
      this.menuMC = this.viewContainer.menuMC;
      this.messageMC = this.viewContainer.messageMC;
   }
   function GET_CURRENT_SELECTION()
   {
      if(this.CURSOR._visible)
      {
         this.getCurrentSelectionFromCursorPosition();
      }
      if(this.playingPINanim == false)
      {
         return this.currentSelection;
      }
      return -1;
   }
   function SET_DATA_SLOT_EMPTY()
   {
      this.dataProviderUI = new Array();
   }
   function SET_DATA_SLOT(slotID)
   {
      this.dataProviderUI[slotID] = [];
      var _loc3_ = arguments.slice(1);
      this.dataProviderUI[slotID] = _loc3_;
   }
   function SET_INPUT_EVENT(direction)
   {
      if(this.buttonContainer != undefined)
      {
         if(this.playingPINanim == false)
         {
            switch(direction)
            {
               case 1:
               case 8:
                  this.navigate("UP");
                  break;
               case 2:
               case 11:
                  this.navigate("RIGHT");
                  break;
               case 3:
               case 9:
                  this.navigate("DOWN");
                  break;
               case 4:
               case 10:
                  this.navigate("LEFT");
            }
         }
      }
   }
   function SET_INPUT_SELECT()
   {
      if(this.playingPINanim == false)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Pin_Button","ATM_SOUNDS");
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, mouseX, mouseY)
   {
      if(isLeftStick == false)
      {
         this.yScroll = mouseY / (this.analogSpeedDivisor / 2);
      }
      else if(mouseY < -0.2)
      {
         this.SET_INPUT_EVENT(8);
      }
      else if(mouseY > 0.2)
      {
         this.SET_INPUT_EVENT(9);
      }
      else if(mouseX < -0.2)
      {
         this.SET_INPUT_EVENT(10);
      }
      else if(mouseX > 0)
      {
         this.SET_INPUT_EVENT(11);
      }
   }
   function SET_BROWSER_CURSOR_SPEED_MODIFIER(newSpeed)
   {
      if(newSpeed > 0)
      {
         this.analogSpeedDivisor = newSpeed;
      }
   }
   function SET_CURSOR_STATE(cursorState)
   {
      if(cursorState != this.cursorState)
      {
         if(cursorState == "BUSY")
         {
            this.CURSOR.gotoAndPlay(cursorState);
         }
         else
         {
            this.CURSOR.gotoAndStop(cursorState);
            clearInterval(this.cursorInterval);
         }
         this.cursorState = cursorState;
      }
   }
   function GET_CURSOR_STATE()
   {
      return this.cursorState;
   }
   function SHOW_CURSOR(visible)
   {
      if(visible == undefined)
      {
         visible = true;
      }
      clearInterval(this.cursorInterval);
      if(visible)
      {
         this.SET_CURSOR_STATE("ARROW");
      }
      else
      {
         this.cursorInterval = setInterval(this,"setCursorBusy",500);
      }
      this.CURSOR._visible = visible;
   }
   function SET_MOUSE_INPUT(mouseX, mouseY)
   {
      var _loc3_ = 1280;
      var _loc2_ = 720;
      this.CURSOR._x = _loc3_ * mouseX;
      this.CURSOR._y = _loc2_ * mouseY;
      this.getCurrentSelectionFromCursorPosition();
   }
   function setCursorBusy()
   {
      this.SET_CURSOR_STATE("BUSY");
      clearInterval(this.cursorInterval);
      this.cursorInterval = setInterval(this,"setCursorInvisible",1000);
   }
   function setCursorInvisible()
   {
      clearInterval(this.cursorInterval);
      this.CURSOR._visible = false;
   }
   function getCurrentSelectionFromCursorPosition()
   {
      this.previousKey = this.currentKey;
      var _loc5_ = {x:this.CURSOR._x,y:this.CURSOR._y};
      this.buttonContainer.globalToLocal(_loc5_);
      var _loc4_ = 1;
      while(_loc4_ <= this.numberOfColumns)
      {
         var _loc3_ = 1;
         while(_loc3_ <= this.numberOfRows)
         {
            var _loc2_ = this.buttonContainer["c" + _loc4_ + "_" + _loc3_];
            if(_loc5_.x > _loc2_._x && _loc5_.x < _loc2_._x + _loc2_._width)
            {
               if(_loc5_.y > _loc2_._y && _loc5_.y < _loc2_._y + _loc2_._height)
               {
                  if(_loc2_._visible)
                  {
                     this.currentSelection = _loc4_ != 1 ? _loc3_ + this.numberOfRows : _loc3_;
                     this.setState(this.currentKey,false);
                     this.currentKey = this.buttonContainer["c" + _loc4_ + "_" + _loc3_];
                     this.setState(this.currentKey,true);
                     if(this.previousKey != this.currentKey)
                     {
                        if(this.playingPINanim == false)
                        {
                           com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Pin_Button","ATM_SOUNDS");
                        }
                     }
                     return undefined;
                  }
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function DISPLAY_BALANCE(_playerName, _balanceString, _balance)
   {
      if(_playerName != undefined)
      {
         this.playerName = _playerName;
      }
      if(_balance != undefined)
      {
         this.balance = _balance.toString();
      }
      if(_balanceString != undefined)
      {
         this.balanceString = _balanceString;
      }
      if(this.playingPINanim == false)
      {
         this.updateBalance();
      }
   }
   function DISPLAY_TRANSACTIONS()
   {
      this.setupView("transactionMC");
      if(this.container != undefined)
      {
         this.container.removeMovieClip();
      }
      this.container = this.transactionMC.transactionLayer.createEmptyMovieClip("container",this.containerDepth);
      var _loc3_ = undefined;
      var _loc7_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc11_ = undefined;
      var _loc2_ = 2;
      while(_loc2_ < this.dataProviderUI.length)
      {
         if(this.dataProviderUI[_loc2_] != undefined && this.dataProviderUI[_loc2_].length > 0)
         {
            _loc3_ = "item" + _loc2_;
            this.container.attachMovie("textLine",_loc3_,this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.lineSpacing * (_loc2_ - 2) + this.lineYPos});
            _loc7_ = this.dataProviderUI[_loc2_][2];
            var _loc6_ = this.dataProviderUI[_loc2_][1];
            if(this.dataProviderUI[_loc2_][0] == 0)
            {
               _loc4_ = "";
               _loc5_ = "-" + this.formatAmount(_loc6_) + ".00 DB";
            }
            else
            {
               _loc4_ = this.formatAmount(_loc6_) + ".00 CR";
               _loc5_ = "";
            }
            if(_loc7_ != undefined)
            {
               this.container[_loc3_].TFtext.text = _loc7_;
            }
            if(_loc4_ != undefined)
            {
               this.container[_loc3_].TFcredit.text = _loc4_;
            }
            if(_loc5_ != undefined)
            {
               this.container[_loc3_].TFdebit.text = _loc5_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.dataProviderUI[0] != undefined)
      {
         this.transactionMC.headerTF.text = this.dataProviderUI[0];
      }
      this.pageHeight = this.container._height;
      this.numberOfRows = 1;
      this.numberOfColumns = 1;
      var _loc10_ = false;
      this.buttonContainer = this.transactionMC;
      if(this.dataProviderUI[1] != undefined)
      {
         this.buttonContainer.c1_1.valueTF.text = this.dataProviderUI[1];
         _loc10_ = true;
         this.buttonContainer.c1_1._visible = true;
      }
      else
      {
         this.buttonContainer.c1_1._visible = false;
      }
      if(_loc10_ == false)
      {
         this.buttonContainer = undefined;
      }
      this.currentKey = this.transactionMC.c1_1;
      this.wrapKey = this.currentKey;
      this.currentSelection = 1;
      this.setState(this.currentKey,true);
   }
   function DISPLAY_MESSAGE()
   {
      this.setupView("messageMC");
      if(this.dataProviderUI[0] != undefined)
      {
         this.messageMC.headerTF.autoSize = "center";
         this.messageMC.headerTF.htmlText = this.dataProviderUI[0];
      }
      this.numberOfRows = 1;
      this.numberOfColumns = 2;
      var _loc2_ = false;
      this.buttonContainer = this.messageMC;
      if(this.dataProviderUI[1] != undefined && this.dataProviderUI[1].length > 0)
      {
         this.buttonContainer.c1_1.valueTF.text = this.dataProviderUI[1];
         _loc2_ = true;
         this.setState(this.buttonContainer.c1_1,false);
         this.buttonContainer.c1_1._visible = true;
      }
      else
      {
         this.buttonContainer.c1_1._visible = false;
      }
      if(this.dataProviderUI[2] != undefined && this.dataProviderUI[2].length > 0)
      {
         this.buttonContainer.c2_1.valueTF.text = this.dataProviderUI[2];
         _loc2_ = true;
         this.setState(this.buttonContainer.c2_1,false);
         this.buttonContainer.c2_1._visible = true;
      }
      else
      {
         this.buttonContainer.c2_1._visible = false;
      }
      if(_loc2_ == false)
      {
         this.buttonContainer = undefined;
      }
      this.currentKey = this.messageMC.c1_1;
      this.wrapKey = this.currentKey;
      this.currentSelection = 1;
      this.setState(this.currentKey,true);
   }
   function DISPLAY_CASH_OPTIONS()
   {
      this.setupView("cashMC");
      if(this.dataProviderUI[0] != undefined)
      {
         this.cashMC.headerTF.autoSize = "center";
         this.cashMC.headerTF.htmlText = this.dataProviderUI[0];
      }
      this.container = this.cashMC;
      this.numberOfRows = 4;
      this.numberOfColumns = 2;
      var _loc5_ = 1;
      var _loc4_ = 1;
      var _loc6_ = false;
      this.buttonContainer = this.container;
      var _loc2_ = 1;
      while(_loc2_ < this.numberOfRows * this.numberOfColumns + 1)
      {
         var _loc3_ = "c" + _loc5_ + "_" + _loc4_;
         if(this.dataProviderUI[_loc2_] != undefined && this.dataProviderUI[_loc2_].length > 0)
         {
            if(isNaN(this.dataProviderUI[_loc2_]))
            {
               this.buttonContainer[_loc3_].valueTF.text = this.dataProviderUI[_loc2_];
            }
            else
            {
               this.buttonContainer[_loc3_].valueTF.text = this.formatAmount(this.dataProviderUI[_loc2_]);
            }
            _loc6_ = true;
            this.setState(this.buttonContainer[_loc3_],false);
            this.buttonContainer[_loc3_]._visible = true;
         }
         else
         {
            this.buttonContainer[_loc3_]._visible = false;
         }
         _loc4_ = _loc4_ + 1;
         if(_loc4_ > this.numberOfRows)
         {
            _loc5_ = _loc5_ + 1;
            _loc4_ = 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ == false)
      {
         this.buttonContainer = undefined;
      }
      this.currentKey = this.container.c1_1;
      this.wrapKey = this.currentKey;
      this.currentSelection = 1;
      this.setState(this.currentKey,true);
   }
   function DISPLAY_MENU()
   {
      this.setupView("menuMC");
      if(this.dataProviderUI[0] != undefined)
      {
         this.menuMC.headerTF.autoSize = "center";
         this.menuMC.headerTF.htmlText = this.dataProviderUI[0];
      }
      this.container = this.menuMC;
      this.numberOfRows = 4;
      this.numberOfColumns = 1;
      var _loc6_ = false;
      this.buttonContainer = this.container;
      var _loc4_ = 1;
      var _loc5_ = 1;
      var _loc2_ = 1;
      while(_loc2_ < this.numberOfRows * this.numberOfColumns + 1)
      {
         var _loc3_ = "c" + _loc4_ + "_" + _loc5_;
         if(this.dataProviderUI[_loc2_] != undefined && this.dataProviderUI[_loc2_].length > 0)
         {
            this.buttonContainer[_loc3_].valueTF.text = this.dataProviderUI[_loc2_];
            this.buttonContainer[_loc3_]._visible = true;
            this.setState(this.buttonContainer[_loc3_],false);
            _loc6_ = true;
         }
         else
         {
            this.buttonContainer[_loc3_]._visible = false;
         }
         _loc4_ = _loc4_ + 1;
         if(_loc4_ > this.numberOfColumns)
         {
            _loc5_ = _loc5_ + 1;
            _loc4_ = 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ == false)
      {
         this.buttonContainer = undefined;
      }
      this.currentKey = this.container.c1_1;
      this.wrapKey = this.currentKey;
      this.currentSelection = 1;
      this.setState(this.currentKey,true);
   }
   function setupView(viewMC)
   {
      this.enterPINanim();
      if(this.viewContainer[viewMC] == undefined)
      {
         this.viewContainer.cashMC.removeMovieClip();
         this.viewContainer.menuMC.removeMovieClip();
         this.viewContainer.messageMC.removeMovieClip();
         this.viewContainer.transactionMC.removeMovieClip();
         switch(viewMC)
         {
            case "cashMC":
               this.cashMC = this.viewContainer.attachMovie("cashMC","cashMC",this.viewContainer.getNextHighestDepth(),{_x:0,_y:160});
               break;
            case "menuMC":
               this.menuMC = this.viewContainer.attachMovie("menuMC","menuMC",this.viewContainer.getNextHighestDepth(),{_x:0,_y:160});
               break;
            case "messageMC":
               this.messageMC = this.viewContainer.attachMovie("messageMC","messageMC",this.viewContainer.getNextHighestDepth(),{_x:0,_y:160});
               break;
            case "transactionMC":
               this.transactionMC = this.viewContainer.attachMovie("transactionMC","transactionMC",this.viewContainer.getNextHighestDepth(),{_x:0,_y:160});
         }
      }
   }
   function enterPINanim()
   {
      if(this.pinAnimStarted == false)
      {
         this.pinAnimStarted = true;
         this.playingPINanim == true;
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"ATM_ENTER_PIN",this.CONTENT.pinAnimMC.pinTitleTF,true);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.pinAnimMC,0.5,{onComplete:this.pinBeep,onCompleteScope:this});
      }
   }
   function pinBeep()
   {
      this.counterPINanim = this.counterPINanim + 1;
      if(this.counterPINanim > 0 && this.counterPINanim < 5)
      {
         var _loc3_ = this.CONTENT.pinAnimMC["pin" + this.counterPINanim];
         _loc3_._alpha = 100;
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Pin_Button","ATM_SOUNDS");
      }
      if(this.counterPINanim > 5)
      {
         this.playingPINanim = false;
         this.CONTENT.pinAnimMC._visible = false;
         this.updateBalance();
      }
      else
      {
         var _loc2_ = Math.floor(Math.random() * 501) + 300;
         if(this.counterPINanim == 5)
         {
            _loc2_ = 400;
         }
         _loc2_ /= 1000;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.pinAnimMC,_loc2_,{onComplete:this.pinBeep,onCompleteScope:this});
      }
   }
   function update()
   {
      if(this.playingPINanim == false && this.transactionMC._visible == true)
      {
         if(this.yScroll != 0)
         {
            this.SCROLL_PAGE(this.yScroll);
         }
      }
   }
   function formatAmount(value)
   {
      value = value.toString();
      if(value.charAt(0) == "-")
      {
         value = value.substr(1);
      }
      else if(value.charAt(0) == "$")
      {
         value = value.substr(1);
      }
      var _loc3_ = "$";
      var _loc4_ = value.length;
      var _loc5_ = ",";
      var _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         if((_loc4_ - _loc1_) % 3 == 0 && _loc1_ != 0)
         {
            _loc3_ += _loc5_;
         }
         _loc3_ += value.charAt(_loc1_);
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
   function updateBalance()
   {
      if(this.playerName != undefined)
      {
         this.CONTENT.nameTF.autoSize = "left";
         this.CONTENT.nameTF.text = this.playerName;
      }
      if(this.balance != undefined)
      {
         this.CONTENT.balanceTF.autoSize = "right";
         this.CONTENT.balanceTF.text = this.formatAmount(this.balance);
      }
      if(this.balanceString != undefined)
      {
         this.CONTENT.balanceStringTF.autoSize = true;
         this.CONTENT.balanceStringTF.text = this.balanceString;
         this.CONTENT.balanceStringTF._x = this.CONTENT.balanceTF._x - this.CONTENT.balanceStringTF._width;
      }
   }
   function SCROLL_PAGE(amount)
   {
      var _loc3_ = this.container._y;
      var _loc2_ = this.container._y + amount;
      if(_loc2_ > 0)
      {
         _loc2_ = 0;
      }
      if(_loc2_ < 350 - this.pageHeight)
      {
         _loc2_ = 350 - this.pageHeight;
      }
      this.container._y = _loc2_;
   }
   function navigate(direction)
   {
      this.setState(this.currentKey,false);
      this.previousKey = this.currentKey;
      var _loc3_ = parseInt(this.currentKey._name.substr(1,1));
      var _loc2_ = parseInt(this.currentKey._name.substr(3,1));
      var _loc5_ = _loc3_;
      var _loc4_ = _loc2_;
      switch(direction)
      {
         case "LEFT":
            this.currentKey = this.buttonContainer["c" + (_loc3_ - 1) + "_" + _loc2_];
            if(!this.currentKey)
            {
               this.currentKey = this.buttonContainer["c" + this.numberOfColumns + "_" + _loc2_];
            }
            break;
         case "RIGHT":
            this.currentKey = this.buttonContainer["c" + (_loc3_ + 1) + "_" + _loc2_];
            if(!this.currentKey)
            {
               this.currentKey = this.buttonContainer["c1_" + _loc2_];
            }
            break;
         case "UP":
            this.currentKey = this.buttonContainer["c" + _loc3_ + "_" + (_loc2_ - 1)];
            if(!this.currentKey)
            {
               this.currentKey = this.buttonContainer["c" + _loc3_ + "_" + this.numberOfRows];
            }
            break;
         case "DOWN":
            this.currentKey = this.buttonContainer["c" + _loc3_ + "_" + (_loc2_ + 1)];
            if(!this.currentKey)
            {
               this.currentKey = this.buttonContainer["c" + _loc3_ + "_1"];
            }
      }
      if(this.currentKey._visible == false)
      {
         this.navigate(direction);
      }
      else
      {
         _loc3_ = parseInt(this.currentKey._name.substr(1,1));
         _loc2_ = parseInt(this.currentKey._name.substr(3,1));
         if(_loc3_ == 1)
         {
            this.currentSelection = _loc2_;
         }
         else
         {
            this.currentSelection = _loc2_ + this.numberOfRows;
         }
         this.setState(this.currentKey,true);
         if(this.previousKey != this.currentKey)
         {
            if(this.wrapKey != this.currentKey)
            {
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Pin_Button","ATM_SOUNDS");
            }
         }
      }
      this.wrapKey = this.currentKey;
   }
   function setState(item, isActive)
   {
      if(item != undefined)
      {
         if(isActive)
         {
            item.buttonON._visible = true;
            item.buttonOFF._visible = false;
            item.valueTF.textColor = 16777215;
         }
         else
         {
            item.buttonON._visible = false;
            item.buttonOFF._visible = true;
            item.valueTF.textColor = 15790320;
         }
      }
   }
   function UPDATE_TEXT()
   {
      this.setupView("transactionMC");
      if(this.transactionMC.statementHeader == undefined)
      {
         var _loc12_ = this.transactionMC.attachMovie("statementHeader","statementHeader",this.transactionMC.getNextHighestDepth(),{_x:237,_y:25});
      }
      this.transactionMC.c1_1._visible = false;
      if(this.dataProviderUI[1][0] != undefined)
      {
         this.transactionMC.statementHeader.header.text = this.dataProviderUI[1][0];
      }
      if(this.dataProviderUI[2][0] != undefined)
      {
         this.transactionMC.statementHeader.log.text = this.dataProviderUI[2][0];
      }
      if(this.dataProviderUI[3][0] != undefined)
      {
         var _loc8_ = this.dataProviderUI[3][0];
      }
      if(this.dataProviderUI[3][1] != undefined)
      {
         var _loc10_ = this.dataProviderUI[3][1];
      }
      if(this.container != undefined)
      {
         this.container.removeMovieClip();
      }
      this.container = this.transactionMC.transactionLayer.createEmptyMovieClip("container",this.containerDepth);
      var _loc3_ = undefined;
      var _loc7_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc15_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.dataProviderUI.length - 4)
      {
         if(this.dataProviderUI[_loc2_ + 4] != undefined)
         {
            _loc3_ = "item" + _loc2_;
            this.container.attachMovie("textLine",_loc3_,this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.lineSpacing * _loc2_ + this.lineYPos});
            _loc7_ = this.dataProviderUI[_loc2_ + 4][2];
            var _loc6_ = this.dataProviderUI[_loc2_ + 4][1];
            if(this.dataProviderUI[_loc2_ + 4][0] == 0)
            {
               _loc4_ = "";
               _loc5_ = "-" + this.formatAmount(_loc6_) + ".00 DB";
            }
            else
            {
               _loc4_ = this.formatAmount(_loc6_) + ".00 CR";
               _loc5_ = "";
            }
            if(_loc7_ != undefined)
            {
               this.container[_loc3_].TFtext.text = _loc7_;
            }
            if(_loc4_ != undefined)
            {
               this.container[_loc3_].TFcredit.text = _loc4_;
            }
            if(_loc5_ != undefined)
            {
               this.container[_loc3_].TFdebit.text = _loc5_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc11_ = this.container.attachMovie("balanceLine","balanceLine",this.container.getNextHighestDepth(),{_x:this.lineXPos,_y:this.container._y + this.container._height + this.lineYPos + 36});
      if(_loc10_ != undefined)
      {
         _loc11_.TFtext.text = _loc10_;
      }
      var _loc9_ = "";
      if(_loc8_ != undefined)
      {
         if(typeof _loc8_ == "number")
         {
            if(_loc8_ < 0)
            {
               _loc9_ = "-";
            }
         }
         else if(typeof _loc8_ == "string")
         {
            if(_loc8_.charAt(0) == "-")
            {
               _loc9_ = "-";
            }
         }
         _loc11_.balanceTF.text = _loc9_ + this.formatAmount(_loc8_) + ".00";
      }
      this.pageHeight = this.container._height;
   }
}
