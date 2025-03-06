class com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var textIndicatorList;
   var MOUSE_EVT;
   var _leadingSize;
   var lineYPosition;
   var spaceBetweenInstructions;
   var maxLines;
   var itemList;
   var thisButtonArray;
   var DispConf;
   var buttonList;
   var backgrounds;
   var backgroundMCS;
   var instructionalTextFormat;
   var gamertagTextFormat;
   var _debugSquare;
   var CONTENT;
   var container;
   var respawn_spinnerMC;
   var savingIconID;
   var background;
   var _inputID;
   var backgroundColours;
   var _backgroundMouseCatcher;
   var TIMELINE;
   var PADDING = 6;
   var respawn_spinner_frame = 1;
   var numberOfItems = 0;
   var iconSize = 24;
   var fullWidth = 0;
   var _maxWidth = 1;
   var numberOfLines = 1;
   var iActualWidth = 1280;
   var is_saving = false;
   var savingText = "";
   var stackType = 0;
   var TEXT_BOX_PADDING = 1;
   var OVERRIDE_BUTTON_SWAP = false;
   var seperator = "%";
   var keyID = 999;
   var multiCharKeyID = 997;
   var wideKeyID = 996;
   var ICON_INVALID = 9999;
   var CLICKABLE = false;
   var myBtnType = 0;
   var SF_BASE_CLASS_MOUSE = 10;
   var ROLL_OVER_OUT_ID = -999;
   var BACKGROUND_PADDING = 1;
   var _isOverBackground = false;
   var _allBackgroundRectangles = [];
   var debugDrawHitArea = false;
   function INSTRUCTIONAL_BUTTONS()
   {
      super();
      _global.gfxExtensions = true;
      this.CONSTRUCTION_INNARDS();
   }
   function CONSTRUCTION_INNARDS()
   {
      this.textIndicatorList = ["t","T","w"];
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_INSTRUCTIONAL_BUTTONS;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this._leadingSize = 2;
      this.lineYPosition = 0;
      this.spaceBetweenInstructions = 12;
      this.maxLines = 20;
      this.itemList = [];
      this.thisButtonArray = [];
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
   }
   function getDisplayConfig(shouldSet)
   {
      if(shouldSet == undefined)
      {
         shouldSet = true;
      }
      var _loc2_ = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_);
      if(shouldSet)
      {
         this.SET_DISPLAY_CONFIG(_loc2_.screenWidth,_loc2_.screenHeight,_loc2_.safeTop,_loc2_.safeBottom,_loc2_.safeLeft,_loc2_.safeRight,_loc2_.isWideScreen,_loc2_.isCircleAccept,_loc2_.isAsian,_loc2_.actualWidth,_loc2_.actualHeight);
      }
      return _loc2_;
   }
   function INITIALISE(mc)
   {
      this.SET_MAX_WIDTH(1);
      super.INITIALISE(mc);
      this.buttonList = [];
      this.backgrounds = [];
      this.backgroundMCS = [];
      this.instructionalTextFormat = new TextFormat();
      this.instructionalTextFormat.font = "$Font2";
      this.instructionalTextFormat.size = 12;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      this.instructionalTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
      this.gamertagTextFormat = new TextFormat();
      this.gamertagTextFormat.font = "$Font2_cond";
      this.gamertagTextFormat.size = 14;
      this.gamertagTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG,_loc4_);
      this.SET_BACKGROUND_COLOUR(_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      this._allBackgroundRectangles = [];
      if(this.debugDrawHitArea)
      {
         this._debugSquare = this.CONTENT.createEmptyMovieClip("SomeStuff",this.CONTENT.getNextHighestDepth());
         this._debugSquare.beginFill(16711935,50);
         this._debugSquare.moveTo(0,0);
         this._debugSquare.lineTo(250,0);
         this._debugSquare.lineTo(250,250);
         this._debugSquare.lineTo(0,250);
         this._debugSquare.lineTo(0,0);
         this._debugSquare.endFill();
         this._debugSquare._visible = false;
         this._debugSquare._x = 0;
         this._debugSquare._y = 0;
      }
   }
   function initScreenLayout()
   {
      this.container._x = this.FOUR_THREE_PADDING + this.DispConf.safeRight * this.DispConf.screenWidth;
      this.container._y = this.DispConf.safeBottom * this.DispConf.screenHeight;
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.backgroundMCS.length)
      {
         _loc4_ = this.backgrounds[_loc2_];
         if(_loc2_ < 1)
         {
            _loc4_ += this.PADDING * 2;
         }
         _loc6_ = this.FOUR_THREE_PADDING + (this.DispConf.safeRight * this.DispConf.screenWidth - _loc4_);
         _loc5_ = this.DispConf.safeBottom * this.DispConf.screenHeight - (this.iconSize + this._leadingSize) * _loc2_ - this.iconSize;
         if(this.backgroundMCS[_loc2_] != undefined)
         {
            _loc3_ = this.backgroundMCS[_loc2_];
            _loc3_._x = _loc6_;
            _loc3_._y = _loc5_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian, _actualWidth, _actualHeight)
   {
      this.DispConf.isCircleAccept = _isCircleAccept;
      this.DispConf.isWideScreen = _isWideScreen;
      this.DispConf.safeBottom = _safeBottomPercent;
      this.DispConf.safeLeft = _safeLeftPercent;
      this.DispConf.safeRight = _safeRightPercent;
      this.DispConf.safeTop = _safeTopPercent;
      this.DispConf.screenHeight = _screenHeightPixels;
      this.DispConf.screenWidth = _screenWidthPixels;
      if(_actualWidth != undefined)
      {
         if(_actualHeight != undefined)
         {
            if(_actualWidth / _actualHeight > 1.5)
            {
               this.iActualWidth = 1280;
            }
            else
            {
               this.iActualWidth = 890;
            }
         }
         else
         {
            this.iActualWidth = 1280;
         }
      }
      this.initScreenLayout();
   }
   function TOGGLE_MOUSE_BUTTONS(hasButtons)
   {
      this.CLICKABLE = hasButtons;
   }
   function saveSpinerFrame()
   {
      if(typeof this.respawn_spinnerMC == "movieclip")
      {
         var _loc2_ = this.respawn_spinnerMC.spinner;
         if(_loc2_ != undefined)
         {
            this.respawn_spinner_frame = _loc2_._currentframe;
         }
      }
   }
   function SET_SAVING_TEXT(iconEnum, saveStr)
   {
      this.savingText = saveStr;
      this.savingIconID = iconEnum;
      var _loc9_ = 0;
      var _loc5_ = 1;
      var _loc8_ = 2;
      var _loc10_ = 3;
      var _loc7_ = 4;
      var _loc6_ = 5;
      if(saveStr == undefined)
      {
         saveStr = "";
      }
      var _loc2_ = 48;
      if(iconEnum == _loc5_)
      {
         _loc2_ = 48;
      }
      if(iconEnum == _loc7_)
      {
         _loc2_ = 49;
      }
      if(iconEnum == _loc6_)
      {
         _loc2_ = 50;
      }
      if(this.is_saving)
      {
         this.REMOVE_SAVING();
      }
      if(this.CLICKABLE)
      {
         this.itemList.unshift([_loc2_,saveStr,false,-1]);
      }
      else
      {
         this.itemList.unshift([_loc2_,saveStr]);
      }
      this.CLEAR_RENDER();
      this.DRAW_INSTRUCTIONAL_BUTTONS(this.stackType);
      this.is_saving = true;
   }
   function REMOVE_SAVING()
   {
      if(this.is_saving)
      {
         this.itemList.shift();
         this.CLEAR_RENDER();
         this.DRAW_INSTRUCTIONAL_BUTTONS(this.stackType);
      }
      this.is_saving = false;
   }
   function CLEAR_ALL()
   {
      this.saveSpinerFrame();
      this.buttonList = [];
      this.backgrounds = [];
      this.CREATE_CONTAINER();
      this.itemList = new Array();
      this.CLEAR_BACKGROUNDS();
      if(this.is_saving)
      {
         this.SET_SAVING_TEXT(this.savingIconID,this.savingText);
      }
   }
   function CLEAR_RENDER()
   {
      this.saveSpinerFrame();
      this.buttonList = [];
      this.backgrounds = [];
      this.CLEAR_BACKGROUNDS();
      this.CREATE_CONTAINER();
   }
   function OVERRIDE_POSITION(newX, newY, alignBottomRight)
   {
      if(alignBottomRight == undefined)
      {
         alignBottomRight = false;
      }
      this.container._x = - this.screenWidthPixels + (this.screenWidthPixels - this.background._x);
      this.container._y = - this.screenHeightPixels + (this.screenHeightPixels - this.background._y);
      this.container._x += newX;
      this.container._y += newY;
      if(alignBottomRight)
      {
         this.container._x -= this.container._width;
         this.container._y -= this.container._height;
      }
   }
   function SET_CLEAR_SPACE(clearSpace)
   {
      this.SET_MAX_WIDTH((this.DispConf.screenWidth - clearSpace) / this.DispConf.screenWidth);
   }
   function SET_LEADING(newLeading)
   {
   }
   function SET_DATA_SLOT()
   {
      var _loc6_ = arguments[0];
      if(_loc6_ != this.ICON_INVALID)
      {
         if(this.is_saving)
         {
            _loc6_ = _loc6_ + 1;
         }
         this.thisButtonArray = [];
         var _loc4_ = arguments.slice(1);
         var _loc5_ = undefined;
         if(this.CLICKABLE)
         {
            _loc5_ = _loc4_.length - 3;
         }
         else
         {
            _loc5_ = _loc4_.length - 1;
         }
         var _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            this.parse(_loc4_[_loc3_]);
            _loc3_ = _loc3_ + 1;
         }
         if(this.CLICKABLE)
         {
            this.thisButtonArray.push(_loc4_[_loc4_.length - 3]);
            this.thisButtonArray.push(_loc4_[_loc4_.length - 2]);
            this.thisButtonArray.push(_loc4_[_loc4_.length - 1]);
         }
         else
         {
            this.thisButtonArray.push(_loc4_[_loc4_.length - 1]);
         }
         this.itemList[_loc6_] = this.thisButtonArray;
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      this.CLEAR_ALL();
   }
   function CREATE_CONTAINER()
   {
      if(this.container)
      {
         this.container.removeMovieClip();
      }
      this.container = this.CONTENT.createEmptyMovieClip("container",100,{_x:0,_y:0});
   }
   function CLEAR_BACKGROUNDS()
   {
      this._isOverBackground = false;
      this.MOUSE_EVT.triggerEvent([this.ROLL_OVER_OUT_ID,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT]);
      var _loc2_ = 0;
      while(_loc2_ < this.backgroundMCS.length)
      {
         this.backgroundMCS[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.backgroundMCS = [];
      _loc2_ = 0;
      while(_loc2_ < this._allBackgroundRectangles.length)
      {
         var _loc3_ = this.CONTENT["backgroundRectangle" + _loc2_];
         delete _loc3_.onRollOver;
         delete _loc3_.onRollOut;
         delete _loc3_.onReleaseOutside;
         this._allBackgroundRectangles[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this._allBackgroundRectangles = [];
   }
   function DRAW_INSTRUCTIONAL_BUTTONS(layoutType)
   {
      this.numberOfItems = 0;
      this.fullWidth = 0;
      if(layoutType == 1)
      {
         this.SET_MAX_WIDTH(0);
      }
      if(layoutType == -1)
      {
         this.SET_MAX_WIDTH(1);
         this.OVERRIDE_BUTTON_SWAP = true;
      }
      else
      {
         this.OVERRIDE_BUTTON_SWAP = false;
      }
      if(layoutType == undefined)
      {
         this.SET_MAX_WIDTH(1);
         layoutType = 0;
      }
      this.stackType = layoutType;
      if(this.itemList.length > 0)
      {
         this.lineYPosition = 1;
         this.CREATE_CONTAINER();
         this.buttonList = [];
         this.backgrounds = [];
         this.backgroundMCS = [];
         this.createLineOfButtons(0,0);
      }
      this.SET_BACKGROUND();
      return 1;
   }
   function GET_NUMBER_OF_ROWS()
   {
      return this.backgrounds.length;
   }
   function createLineOfButtons(Xpos, startIndex)
   {
      var _loc11_ = undefined;
      var _loc3_ = startIndex;
      var _loc6_ = 0;
      var _loc9_ = 0;
      var _loc10_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc12_ = undefined;
      var _loc5_ = undefined;
      _loc3_ = startIndex;
      while(_loc3_ < this.itemList.length)
      {
         _loc2_ = this.createItem(this.itemList[_loc3_]);
         this.buttonList.push(_loc2_);
         if(_loc3_ > 0)
         {
            _loc4_ = this.buttonList[_loc3_ - 1];
            _loc2_._x = _loc4_._x - (_loc2_._width + this.spaceBetweenInstructions);
            _loc2_._y = _loc4_._y;
            _loc5_ = _loc2_._width + this.spaceBetweenInstructions;
            if(_loc5_ + this.fullWidth > this._maxWidth)
            {
               this.backgrounds.push(this.fullWidth);
               this.fullWidth = 0;
               this.numberOfLines = this.numberOfLines + 1;
               _loc2_._y = _loc4_._y - this._leadingSize - this.iconSize;
               _loc2_._x = Xpos - _loc2_._width;
               this.fullWidth += _loc2_._width + this.spaceBetweenInstructions;
               this.createLineOfButtons(0,_loc3_ + 1);
               return 0;
            }
            this.fullWidth += _loc2_._width + this.spaceBetweenInstructions;
         }
         else
         {
            _loc2_._x = - (_loc2_._width + this.PADDING);
            this.fullWidth += _loc2_._width;
         }
         if(_loc6_ > this.maxLines)
         {
            return 0;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.backgrounds.push(this.fullWidth);
   }
   function createItem(item)
   {
      item.reverse();
      var _loc10_ = false;
      var _loc9_ = -1;
      if(this.CLICKABLE)
      {
         _loc9_ = Number(item.shift());
         _loc10_ = Boolean(item.shift());
      }
      var _loc4_ = [];
      var _loc5_ = [];
      var _loc8_ = this.container.createEmptyMovieClip("item" + this.numberOfItems,this.container.getNextHighestDepth());
      this.numberOfItems = this.numberOfItems + 1;
      _loc8_._y = - this.iconSize;
      var _loc7_ = undefined;
      var _loc6_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < item.length)
      {
         _loc7_ = 0;
         _loc6_ = _loc2_;
         if(typeof item[_loc2_] == "string")
         {
            _loc5_.push(true);
            _loc4_.push(this.generateTextField("TF_" + _loc2_,item[_loc2_],_loc8_));
         }
         if(typeof item[_loc2_] == "number")
         {
            _loc5_.push(false);
            _loc4_.push(this.createButtonIcon(item[_loc2_],_loc8_));
         }
         if(typeof item[_loc2_] == "object")
         {
            _loc5_.push(false);
            _loc4_.push(this.createButtonIcon(item[_loc2_].buttonID,_loc8_,item[_loc2_].buttonChar));
         }
         if(_loc2_ > 0)
         {
            _loc6_ = _loc2_ - 1;
            _loc7_ = this.getWidth(_loc4_[_loc6_],_loc5_[_loc2_ - 1]);
            _loc4_[_loc2_]._x = _loc4_[_loc6_]._x + _loc7_ + 6;
         }
         else
         {
            _loc7_ = this.getWidth(_loc4_[_loc6_],_loc5_[_loc2_ - 1]);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc8_._x = - _loc7_;
      if(this.CLICKABLE)
      {
         item.unshift(_loc10_);
         item.unshift(_loc9_);
      }
      item.reverse();
      if(_loc10_)
      {
         if(_loc9_ != -1)
         {
            this.drawButton(_loc8_,_loc9_);
         }
      }
      return _loc8_;
   }
   function drawButton(mc, inputID)
   {
      var _loc4_ = mc._width;
      var _loc5_ = mc._height;
      var _loc3_ = mc.createEmptyMovieClip("clickable",mc.getNextHighestDepth());
      _loc3_._inputID = inputID;
      _loc3_.beginFill(16711935,50);
      _loc3_.moveTo(0,0);
      _loc3_.lineTo(_loc4_ + 2,0);
      _loc3_.lineTo(_loc4_ + 2,_loc5_ + 4);
      _loc3_.lineTo(0,_loc5_ + 4);
      _loc3_.lineTo(0,0);
      _loc3_.endFill();
      _loc3_._alpha = !this.debugDrawHitArea ? 0 : 50;
      var rollover = mc.createEmptyMovieClip("rollover",-1);
      rollover.beginFill(16777215,40);
      rollover.moveTo(-2,0);
      rollover.lineTo(_loc4_ + 2,0);
      rollover.lineTo(_loc4_ + 2,_loc5_ + 4);
      rollover.lineTo(-2,_loc5_ + 4);
      rollover.lineTo(-2,0);
      rollover.endFill();
      rollover._visible = false;
      var thisObj = this;
      _loc3_.thisObj = thisObj;
      _loc3_.onRelease = function()
      {
         var _loc2_ = -1;
         for(var _loc3_ in this._parent)
         {
            if(typeof this._parent[_loc3_] == "movieclip")
            {
               if(this._parent[_loc3_]._name != "clickable" && this._parent[_loc3_]._name != "rollover")
               {
                  _loc2_ = Number(this._parent._name.slice(4));
                  if(thisObj.is_saving)
                  {
                     _loc2_ -= 1;
                  }
               }
            }
         }
         if(_loc2_ != -1)
         {
            thisObj.mouseEventProxy(this._inputID);
         }
      };
      _loc3_.onRollOver = function()
      {
         if(this.debugDrawHitArea)
         {
            thisObj._debugSquare._visible = true;
         }
         rollover._visible = true;
         thisObj.processRollOver();
      };
      _loc3_.onRollOut = function()
      {
         if(this.debugDrawHitArea)
         {
            thisObj._debugSquare._visible = false;
         }
         rollover._visible = false;
         thisObj.processRollOut();
      };
      _loc3_.onReleaseOutside = _loc3_.onRollOut;
   }
   function mouseEventProxy(_inputID)
   {
      this.MOUSE_EVT.triggerEvent([_inputID,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE]);
   }
   function getWidth(obj, isString)
   {
      if(isString)
      {
         return obj.textWidth;
      }
      return obj._width;
   }
   function createButtonIcon(buttonID, buttonParent, key)
   {
      if(!this.OVERRIDE_BUTTON_SWAP)
      {
         if(this.DispConf.isCircleAccept)
         {
            if(buttonID == 30)
            {
               buttonID = 31;
            }
            else if(buttonID == 31)
            {
               buttonID = 30;
            }
         }
      }
      var _loc3_ = undefined;
      if(buttonID == 30 || buttonID == 31 || buttonID == 32 || buttonID == 33)
      {
         _loc3_ = buttonParent.attachMovie("face_button_" + buttonID,"button_" + buttonID,buttonID,{_height:20});
      }
      else if(buttonID == 999)
      {
         _loc3_ = buttonParent.attachMovie("button_" + buttonID,"button_" + buttonParent.getNextHighestDepth(),buttonParent.getNextHighestDepth(),{_height:20});
      }
      else
      {
         _loc3_ = buttonParent.attachMovie("button_" + buttonID,"button_" + buttonID,buttonID,{_height:20});
      }
      _loc3_._xscale = _loc3_._yscale;
      _loc3_._x = 2;
      _loc3_._y = 2;
      if(buttonID == 44)
      {
         this.respawn_spinnerMC = _loc3_;
         this.respawn_spinnerMC.spinner.gotoAndPlay(this.respawn_spinner_frame);
      }
      if(key != undefined)
      {
         _loc3_.Char.autoTextSize = "shrink";
         _loc3_.Char.text = key;
         _loc3_.Char.autoTextSize = "shrink";
      }
      return _loc3_;
   }
   function SET_BACKGROUND()
   {
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.backgrounds.length)
      {
         _loc3_ = this.backgrounds[_loc2_];
         if(_loc2_ < 1)
         {
            _loc3_ += this.PADDING * 2;
         }
         _loc5_ = this.FOUR_THREE_PADDING + (this.DispConf.safeRight * this.DispConf.screenWidth - _loc3_);
         _loc4_ = this.DispConf.safeBottom * this.DispConf.screenHeight - (this.iconSize + this._leadingSize) * _loc2_ - this.iconSize;
         _loc6_ = this.CONTENT.attachMovie("backgroundShape","background" + _loc2_,10 + _loc2_,{_width:_loc3_,_x:_loc5_,_y:_loc4_,_height:this.iconSize});
         this.backgroundMCS.push(_loc6_);
         com.rockstargames.ui.utils.Colour.Colourise(_loc6_,this.backgroundColours[0],this.backgroundColours[1],this.backgroundColours[2],this.backgroundColours[3]);
         if(this.CLICKABLE)
         {
            var _loc8_ = new flash.geom.Rectangle(_loc5_ - this.BACKGROUND_PADDING,_loc4_ - this.BACKGROUND_PADDING,_loc3_ + this.BACKGROUND_PADDING,this.iconSize + this.BACKGROUND_PADDING);
            this._allBackgroundRectangles[_loc2_] = _loc8_;
            this._backgroundMouseCatcher = this.CONTENT.createEmptyMovieClip("backgroundRectangle" + _loc2_,11 + _loc2_);
            this._backgroundMouseCatcher.beginFill(65280,100);
            this._backgroundMouseCatcher.moveTo(0,0);
            this._backgroundMouseCatcher.lineTo(_loc3_ + this.BACKGROUND_PADDING * 2,0);
            this._backgroundMouseCatcher.lineTo(_loc3_ + this.BACKGROUND_PADDING * 2,this.iconSize + this.BACKGROUND_PADDING);
            this._backgroundMouseCatcher.lineTo(0,this.iconSize + this.BACKGROUND_PADDING);
            this._backgroundMouseCatcher.lineTo(0,0);
            this._backgroundMouseCatcher.endFill();
            this._backgroundMouseCatcher._alpha = !this.debugDrawHitArea ? 0 : 50;
            this._backgroundMouseCatcher._x = _loc5_ - this.BACKGROUND_PADDING;
            this._backgroundMouseCatcher._y = _loc4_ - this.BACKGROUND_PADDING;
            this._backgroundMouseCatcher.onRollOver = mx.utils.Delegate.create(this,this.processRollOver);
            var _loc0_ = null;
            var _loc7_ = this._backgroundMouseCatcher.onRollOut = mx.utils.Delegate.create(this,this.processRollOut);
            _loc7_.backgroundIndex = _loc2_;
            this._backgroundMouseCatcher.onReleaseOutside = this._backgroundMouseCatcher.onRollOut;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_._visible = this.requiresBackground();
      this.initScreenLayout();
   }
   function processRollOver()
   {
      if(!this._isOverBackground)
      {
         this._isOverBackground = true;
         this.MOUSE_EVT.triggerEvent([this.ROLL_OVER_OUT_ID,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER]);
      }
   }
   function processRollOut()
   {
      var _loc3_ = arguments.caller.backgroundIndex;
      var _loc4_ = this._allBackgroundRectangles[_loc3_];
      if(!_loc4_.contains(this.TIMELINE._xmouse,this.TIMELINE._ymouse) && this._isOverBackground)
      {
         this._isOverBackground = false;
         this.MOUSE_EVT.triggerEvent([this.ROLL_OVER_OUT_ID,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT]);
      }
   }
   function generateTextField(textFieldName, textString, parentMovieClip)
   {
      var _loc2_ = parentMovieClip[textFieldName];
      if(_loc2_ == undefined)
      {
         _loc2_ = parentMovieClip.createTextField(textFieldName,parentMovieClip.getNextHighestDepth(),0,0,10,10);
      }
      _loc2_.embedFonts = true;
      _loc2_.autoSize = true;
      _loc2_.antiAliasType = "advanced";
      _loc2_.selectable = false;
      if(textString != undefined)
      {
         textString = this.parseForPSStore(textString);
         this.parseForGamerName(_loc2_,textString);
      }
      _loc2_._y += _loc2_.textHeight / 5;
      return _loc2_;
   }
   function parseForPSStore(textString)
   {
      var _loc4_ = String.fromCharCode(174);
      if(textString.indexOf("(TM)") > 0)
      {
         _loc4_ = String.fromCharCode(8482);
      }
      var _loc3_ = textString.split("PlayStation");
      if(_loc3_.length > 1)
      {
         var _loc1_ = textString.split("Store");
         if(_loc1_.length > 1)
         {
            textString = "";
            if(_loc3_[0] != "PlayStation")
            {
               textString += _loc3_[0];
            }
            textString += "PlayStation" + _loc4_ + "Store";
            if(_loc1_[_loc1_.length - 1] != "Store" && _loc1_[_loc1_.length - 1] != undefined)
            {
               textString += _loc1_[_loc1_.length - 1];
            }
         }
      }
      return textString;
   }
   function SET_PADDING(top, right, bottom, left)
   {
      this.PADDING = top;
   }
   function SET_BACKGROUND_COLOUR(r, g, b, a)
   {
      this.backgroundColours = [r,g,b,a];
      if(this.background)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.background,r,g,b,a);
      }
   }
   function OVERRIDE_RESPAWN_TEXT(id, txt)
   {
      if(this.is_saving)
      {
         id = id + 1;
      }
      this.parseForGamerName(this.buttonList[id].TF_0,txt);
   }
   function FLASH_BUTTON_BY_ID(buttonID, alpha, duration)
   {
      if(this.is_saving)
      {
         buttonID = buttonID + 1;
      }
      if(duration == undefined)
      {
         duration = 0.2;
      }
      if(alpha == undefined)
      {
         alpha = 100;
      }
      var _loc4_ = undefined;
      var _loc2_ = this.buttonList[buttonID];
      var _loc3_ = undefined;
      for(var _loc5_ in _loc2_)
      {
         if(typeof _loc2_[_loc5_] == "movieclip")
         {
            _loc3_ = _loc2_[_loc5_];
         }
      }
      var _loc6_ = _loc3_._name + "clone";
      _loc4_ = _loc3_[_loc6_];
      if(typeof _loc4_ == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc4_);
         _loc4_.removeMovieClip();
      }
      _loc4_ = _loc3_.attachMovie(_loc3_._name,_loc6_,_loc3_.getNextHighestDepth());
      var _loc8_ = new flash.geom.ColorTransform(1,1,1,1,255,255,255,0);
      _loc4_.transform.colorTransform = _loc8_;
      _loc4_._alpha = alpha;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc4_,duration,{onComplete:this.removeButton,onCompleteScope:this,onCompleteArgs:[_loc4_]});
   }
   function removeButton(mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      mc.removeMovieClip();
   }
   function SET_MAX_WIDTH(maxWidth)
   {
      this._maxWidth = maxWidth * this.iActualWidth;
   }
   function getFourThreeSafeZoneOffset(screenWidthPixels)
   {
      var _loc2_ = 0;
      if(this.FILE_WIDTH >= screenWidthPixels)
      {
         _loc2_ = (this.FILE_WIDTH - screenWidthPixels) / 2 / 2;
      }
      return _loc2_;
   }
   function requiresBackground()
   {
      if(this.itemList.length <= 1)
      {
         if(this.itemList[0][1] == "")
         {
            if(this.itemList[0][0] == 44 || this.itemList[0][0] == 48 || this.itemList[0][0] == 49 || this.itemList[0][0] == 50)
            {
               return false;
            }
         }
      }
      return true;
   }
   function parse(incomingStr)
   {
      if(typeof incomingStr == "number")
      {
         this.addButton(incomingStr);
      }
      else
      {
         var _loc3_ = incomingStr.split(this.seperator);
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(this.isKey(_loc3_[_loc2_]))
            {
               this.addKey(_loc3_[_loc2_]);
            }
            else
            {
               this.addButton(_loc3_[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function addKey(instructions)
   {
      var _loc2_ = new Object();
      var _loc3_ = instructions.substr(0,1);
      switch(_loc3_)
      {
         case "T":
            _loc2_.buttonID = this.multiCharKeyID;
            break;
         case "t":
            _loc2_.buttonID = this.keyID;
            break;
         case "w":
            _loc2_.buttonID = this.wideKeyID;
            break;
         default:
            _loc2_.buttonID = this.keyID;
      }
      _loc2_.buttonChar = instructions.substr(2,instructions.length);
      this.thisButtonArray.push(_loc2_);
   }
   function addButton(instructions)
   {
      if(typeof instructions == "number")
      {
         this.thisButtonArray.push(instructions);
      }
      else
      {
         this.thisButtonArray.push(Number(instructions.substr(2,instructions.length)));
      }
   }
   function isKey(str)
   {
      var _loc3_ = false;
      var _loc4_ = str.substr(0,1);
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.textIndicatorList.length)
      {
         if(_loc4_.toUpperCase() == this.textIndicatorList[_loc2_].toUpperCase())
         {
            _loc3_ = true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function parseForGamerName(TF, str)
   {
      var _loc6_ = str.indexOf("<C>");
      var _loc7_ = str.indexOf("</C>");
      if(_loc6_ != -1 && _loc7_ != -1)
      {
         var _loc2_ = str.substring(0,_loc6_);
         var _loc5_ = str.substring(_loc6_ + 3,_loc7_);
         var _loc9_ = str.substring(_loc7_ + 4);
         TF.text = _loc2_ + _loc5_ + _loc9_;
         var _loc8_ = this.instructionalTextFormat;
         var _loc10_ = this.gamertagTextFormat;
         TF.setTextFormat(0,_loc2_.length,_loc8_);
         TF.setTextFormat(_loc2_.length,_loc2_.length + _loc5_.length,_loc10_);
         TF.setTextFormat(_loc2_.length + _loc5_.length,_loc2_.length + _loc5_.length + _loc9_.length,_loc8_);
      }
      else
      {
         TF.text = str;
         TF.setTextFormat(this.instructionalTextFormat);
      }
   }
   function SET_HIT_AREA_VISIBLE(isVisible)
   {
      this.debugDrawHitArea = isVisible;
   }
   function debug()
   {
      this.SET_DISPLAY_CONFIG(1280,720,0.05,0.95,0.05,0.95,true,false,false,1365.33,768);
      this.SET_MAX_WIDTH(1);
      this.SET_DATA_SLOT(0,"b_100","Wide");
      this.DRAW_INSTRUCTIONAL_BUTTONS(0);
      this.backgroundMCS[0]._alpha = 20;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.container,2,{onComplete:this.FLASH_BUTTON_BY_ID,onCompleteScope:this,onCompleteArgs:[2,30,0.2]});
      this.FLASH_BUTTON_BY_ID(2,30,0.2);
   }
}
