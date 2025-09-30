class com.rockstargames.gtav.pc.HACKING_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var backgroundImage;
   var buttonUnderCursor;
   var buttonsList;
   var desktopIconsList;
   var hackingApp;
   var hackingLoading;
   var mouse;
   var wallpaper_loader;
   var mouseSpeed = 15;
   var mouseSnapSpeed = 500;
   var mx = 640;
   var my = 320;
   var hackingPercentShow = true;
   var isSnapping = false;
   var isCentering = false;
   var autoMode = true;
   var debugMode = false;
   var livesTotal = 7;
   var livesDisplay = 7;
   var gameSpeed = 1;
   var gameColumnSpeedList = [1,1,1,1,1,1,1,1];
   var gamePassword = "PASSWORD";
   var keyRepeatDelay = 0;
   var maxKeyRepeatDelay = 3;
   var labelList = new Array();
   var gfxFileName = "HACKING_PC";
   var ratioGutter = 0;
   function HACKING_PC()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.desktopIconsList = [];
      this.buttonsList = [];
      var _loc3_ = this.CONTENT.attachMovie("mousecursor","mousecursorMC",this.CONTENT.getNextHighestDepth(),{_x:this.mx,_y:this.my});
      this.mouse = new com.rockstargames.gtav.pc.MousePointer(_loc3_);
      this.hackingLoading = this.CONTENT.appsMC.attachMovie("loadingHacking","loadingHackingMC",1,{_x:186,_y:52});
      this.hackingLoading._visible = false;
   }
   function SET_LABELS()
   {
      this.labelList = [];
      this.labelList = arguments;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      super.SET_DISPLAY_CONFIG(_screenWidthPixels,_screenHeightPixels,_safeTopPercent,_safeBottomPercent,_safeLeftPercent,_safeRightPercent,_isWideScreen,_isHiDef,_isAsian);
      var _loc7_ = 1.7777777777777777;
      var _loc6_ = 1.3333333333333333;
      var _loc3_ = 1280;
      var _loc8_ = 720;
      var _loc4_ = 0;
      var _loc5_ = 0;
      if(!_isWideScreen)
      {
         _loc4_ = (_loc3_ - Math.round(_loc3_ / _loc7_ * _loc6_)) / 2;
         _loc5_ = 0;
      }
      this.ratioGutter = _loc4_;
   }
   function initScreenLayout()
   {
      this.CONTENT.bgMC._x = this.screenWidthPixels / 2 - this.CONTENT.bgMC._width / 2;
      if(this.hackingApp != undefined)
      {
         this.hackingApp.screenWidthPixels = this.screenWidthPixels;
         this.hackingApp.screenHeightPixels = this.screenHeightPixels;
         this.hackingApp.safeTop = this.safeTop;
         this.hackingApp.safeBottom = this.safeBottom;
         this.hackingApp.safeLeft = this.safeLeft;
         this.hackingApp.safeRight = this.safeRight;
      }
   }
   function SHOW_MAP()
   {
      if(!this.CONTENT.sum2_map)
      {
         this.CONTENT.attachMovie("sum2_map","sum2_map",this.CONTENT.getNextHighestDepth());
         this.CONTENT.sum2_map._x = this.screenWidthPixels / 2 - this.CONTENT.sum2_map._width / 2;
         this.CONTENT.sum2_map._y = this.screenHeightPixels / 2 - this.CONTENT.sum2_map._height / 2;
      }
   }
   function HIDE_MAP()
   {
      this.CONTENT.sum2_map.removeMovieClip();
   }
   function SET_BACKGROUND(bgEnum)
   {
      this.removeBackground();
      if(bgEnum != undefined)
      {
         if(bgEnum < 0 || bgEnum > 10)
         {
            bgEnum = 0;
         }
      }
      this.backgroundImage = "HACKING_PC_desktop_" + bgEnum;
      var _loc3_ = this.CONTENT.bgMC.createEmptyMovieClip("background",this.CONTENT.bgMC.getNextHighestDepth());
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.backgroundImage,"wallpaper",true);
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc3_ = 0;
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
            _loc3_ = this.SET_INPUT_EVENT_SELECT();
            break;
         case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            this.SET_INPUT_EVENT_BACK();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.setInputEvent(direction);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.setInputEvent(direction);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.setInputEvent(direction);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.setInputEvent(direction);
            }
      }
      return _loc3_;
   }
   function SET_INPUT_EVENT_SELECT()
   {
      return this.CURSOR_CLICK(16);
   }
   function SET_INPUT_EVENT_BACK()
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setInputEvent(17);
         if(this.hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.POPUPS)
         {
            this.setDesktopIconsActive(true);
            this.checkUnderCursor();
         }
      }
   }
   function ADD_PROGRAM(i, enum, lbl)
   {
      var _loc5_;
      var _loc11_;
      var _loc9_;
      var _loc6_;
      var _loc10_;
      var _loc13_;
      var _loc8_;
      var _loc7_;
      var _loc2_;
      var _loc12_;
      var _loc3_;
      if(enum != undefined)
      {
         _loc5_ = 6;
         _loc11_ = 6;
         _loc9_ = 168;
         _loc6_ = 200;
         _loc10_ = 56;
         _loc13_ = 104;
         _loc8_ = _loc13_ + _loc6_ * ((i - 1) % _loc11_);
         _loc7_ = _loc10_ + _loc9_ * Math.floor((i - 1) / _loc5_);
         _loc2_ = this.CONTENT.desktopMC.getNextHighestDepth();
         _loc12_ = this.CONTENT.desktopMC.attachMovie("desktopicon","desktopicon" + _loc2_,_loc2_,{_x:_loc8_,_y:_loc7_});
         _loc3_ = new com.rockstargames.gtav.pc.DesktopIcon();
         _loc3_.init(_loc12_,enum,{depth:i},i,lbl);
         this.desktopIconsList.push(_loc3_);
      }
   }
   function RUN_PROGRAM(id)
   {
      this.openApp(id);
   }
   function ADD_BUTTONS(m)
   {
      this.buttonsList.push(m);
   }
   function ACTIVATE_BUTTONS(m, b)
   {
      m.active = b;
   }
   function REMOVE_BUTTONS(m)
   {
      var _loc2_;
      for(var _loc4_ in this.buttonsList)
      {
         _loc2_ = this.buttonsList[_loc4_];
         if(m == _loc2_)
         {
            this.buttonsList.splice(_loc4_,1);
            break;
         }
      }
   }
   function SET_SNAP_SPEED(s)
   {
      this.mouseSnapSpeed = s;
   }
   function SET_CURSOR(vx, vy)
   {
      var _loc3_;
      var _loc2_;
      if(!this.isCentering)
      {
         _loc3_ = this.ratioGutter + this.screenWidthPixels * vx;
         _loc2_ = 720 * vy;
         this.mx = Math.max(this.ratioGutter,Math.min(_loc3_,this.ratioGutter + this.screenWidthPixels));
         this.my = Math.max(0,Math.min(_loc2_,720));
         this.mouse.moveCursor(this.mx,this.my);
         this.checkUnderCursor();
      }
   }
   function MOVE_CURSOR(vx, vy)
   {
      var _loc4_ = true;
      if(this.hackingApp != undefined)
      {
         if(this.hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME || this.hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY || this.hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME || this.hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
         {
            _loc4_ = false;
            this.keyRepeatDelay = this.keyRepeatDelay - 1;
            if(this.keyRepeatDelay <= 0)
            {
               if(vx > 0)
               {
                  this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
               }
               else if(vx < 0)
               {
                  this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
               }
               else if(vy > 0)
               {
                  this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
               }
               else if(vy < 0)
               {
                  this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
               }
               this.keyRepeatDelay = this.maxKeyRepeatDelay;
            }
            if(vx == 0 && vy == 0)
            {
               this.keyRepeatDelay = 0;
            }
         }
      }
      if(!this.isCentering && _loc4_ == true)
      {
         this.mx = Math.max(this.safeLeft,Math.min(this.mx + vx,this.safeRight));
         this.my = Math.max(this.safeTop,Math.min(this.my + vy,this.safeBottom));
         this.mouse.moveCursor(this.mx,this.my);
         this.checkUnderCursor();
      }
   }
   function SET_CURSOR_VISIBILITY(isVisible)
   {
      this.mouse._visible = isVisible;
   }
   function checkUnderCursor()
   {
      var _loc2_ = this.testList(this.buttonsList);
      if(_loc2_)
      {
         return undefined;
      }
      this.testList(this.desktopIconsList);
   }
   function snapToButton()
   {
      var _loc3_ = this.mouseSnapSpeed / 1000;
      var _loc2_ = {x:this.buttonUnderCursor.mc._x,y:this.buttonUnderCursor.mc._y};
      this.buttonUnderCursor.mc._parent.localToGlobal(_loc2_);
      this.mx = _loc2_.x + this.buttonUnderCursor.mc._width / 2;
      this.my = _loc2_.y + this.buttonUnderCursor.mc._height / 2;
      this.isCentering = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.mouse.mc,_loc3_,{_x:this.mx,_y:this.my,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onComplete:this.snapToButtonComplete,onCompleteScope:this});
   }
   function snapToButtonComplete()
   {
      this.isCentering = false;
   }
   function testList(list)
   {
      var _loc5_ = false;
      var _loc6_;
      var _loc3_ = -1;
      var _loc2_;
      for(var _loc7_ in list)
      {
         _loc2_ = list[_loc7_];
         if(_loc2_.active)
         {
            if(this.mouse.mc.hitMC.hitTest(_loc2_.mc))
            {
               if(_loc2_.args.depth > _loc3_)
               {
                  _loc3_ = _loc2_.args.depth;
                  _loc6_ = _loc2_;
               }
               _loc5_ = true;
            }
         }
      }
      if(_loc5_)
      {
         this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
         this.buttonUnderCursor.highlight = false;
         this.buttonUnderCursor = _loc6_;
         this.buttonUnderCursor.highlight = true;
         if(this.buttonUnderCursor.type == com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0])
         {
            if(!this.isSnapping)
            {
               this.isSnapping = true;
               this.snapToButton();
            }
         }
         else
         {
            this.isSnapping = false;
         }
      }
      else
      {
         this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
         this.buttonUnderCursor.highlight = false;
         this.buttonUnderCursor = null;
         this.isSnapping = false;
      }
      return _loc5_;
   }
   function RESET_UNDER_CURSOR()
   {
      this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
      this.buttonUnderCursor = null;
   }
   function CURSOR_CLICK(direction)
   {
      var _loc2_ = this.buttonUnderCursor.type != undefined ? this.buttonUnderCursor.type : 0;
      switch(_loc2_)
      {
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0]:
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0]:
            this.openApp(this.buttonUnderCursor.type);
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0]:
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0]:
            if(this.debugMode)
            {
               this.openApp(this.buttonUnderCursor.type);
            }
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_EMPTY[0]:
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD[0]:
      }
      if(_loc2_ == 0)
      {
         if(this.hackingApp != undefined)
         {
            _loc2_ = this.hackingApp.setInputEvent(direction);
         }
      }
      return _loc2_;
   }
   function openApp(i)
   {
      var _loc2_;
      var _loc3_;
      switch(i)
      {
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0]:
            if(this.hackingApp == undefined)
            {
               _loc3_ = "hacking";
               _loc2_ = 0;
               this.hackingApp = this.CONTENT.appsMC.attachMovie(_loc3_,_loc3_ + _loc2_,_loc2_);
               this.hackingApp.mouse = this.mouse;
               this.hackingApp.hackingRef = this;
               this.hackingApp.ready(this.labelList);
               this.hackingApp.setLives(this.livesDisplay,this.livesTotal);
               this.hackingApp.setSpeed(this.gameSpeed);
               this.hackingApp.setRouletteWord(this.gamePassword);
               this.hackingApp.setColumnSpeed(this.gameColumnSpeedList);
               this.hackingApp.openDownload(false);
            }
            else
            {
               this.hackingApp.ready(this.labelList);
            }
            this.setDesktopIconsActive(false);
            this.checkUnderCursor();
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0]:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.openErrorPopup(true);
            }
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0]:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.openHackingMenu(true);
            }
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0]:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.openApp01(true);
            }
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0]:
            if(this.hackingApp != undefined)
            {
               this.hackingApp.openApp02(true);
            }
         default:
            return;
      }
   }
   function closeApp(id)
   {
   }
   function setDesktopIconsActive(a)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.desktopIconsList.length)
      {
         _loc3_ = this.desktopIconsList[_loc2_];
         if(_loc3_.type == com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0])
         {
            _loc3_.active = a;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function OPEN_APP(id)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.openApp(id);
      }
   }
   function CLOSE_APP()
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.closeAllApps();
      }
   }
   function OPEN_LOADING_PROGRESS(bool)
   {
      this.hackingLoading._visible = Boolean(bool);
   }
   function SET_LOADING_PROGRESS(percent, showPercent)
   {
      var _loc3_;
      var _loc2_;
      if(showPercent != undefined)
      {
         this.hackingPercentShow = Boolean(showPercent);
         if(this.hackingPercentShow)
         {
            _loc3_ = this.hackingLoading.innerMC.percentTF;
            _loc2_ = _loc3_.getTextFormat();
            _loc3_.text = String(percent) + "%";
            _loc3_.setTextFormat(_loc2_);
         }
         else
         {
            _loc3_ = this.hackingLoading.innerMC.percentTF;
            _loc3_.text = "";
         }
      }
      this.hackingLoading.innerMC.loadbarMC.barMC._xscale = percent;
   }
   function SET_LOADING_TIME(secs, label)
   {
      var _loc2_ = secs % 60;
      var _loc3_ = Math.floor(secs / 60);
      var _loc5_ = _loc2_ >= 10 ? String(_loc2_) : String("0" + _loc2_);
      var _loc4_ = _loc3_ >= 10 ? String(_loc3_) : String("0" + _loc3_);
      this.hackingLoading.innerMC.loadbarMC.secsTF.text = _loc5_;
      this.hackingLoading.innerMC.loadbarMC.minsTF.text = _loc4_;
      if(secs > 0)
      {
         if(label != undefined)
         {
            this.hackingLoading.innerMC.loadbarMC.remainingTF.text = label;
         }
      }
      else
      {
         this.hackingLoading.frameMC.play();
         this.hackingLoading.innerMC.loadbarMC.remainingTF.textAutoSize = "shrink";
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HACKING_COMPLETE",this.hackingLoading.innerMC.loadbarMC.remainingTF);
      }
   }
   function SET_LOADING_MESSAGE(msg, size)
   {
      var _loc2_ = this.hackingLoading.innerMC.msgTF;
      var _loc4_ = this.hackingLoading.innerMC.percentTF;
      var _loc6_ = _loc2_.getTextFormat();
      var _loc5_ = 72;
      var _loc3_ = 30;
      switch(size)
      {
         case 1:
            _loc5_ = 36;
            _loc3_ = 16;
            break;
         case 2:
            _loc5_ = 48;
            _loc3_ = 24;
            break;
         case 3:
            _loc5_ = 72;
            _loc3_ = 36;
            break;
         case 4:
            _loc5_ = 96;
            _loc3_ = 48;
      }
      _loc6_.size = _loc5_;
      _loc2_.htmlText = msg;
      _loc2_.autoSize = true;
      _loc2_.setTextFormat(_loc6_);
      _loc4_.autoSize = true;
      _loc4_.setTextFormat(_loc6_);
      _loc4_._y = _loc2_._height + _loc3_;
      if(this.hackingPercentShow)
      {
         this.hackingLoading.innerMC.loadbarMC._y = _loc4_._y + _loc4_._height + _loc3_;
      }
      else
      {
         this.hackingLoading.innerMC.loadbarMC._y = _loc2_._y + _loc2_._height + _loc3_;
      }
      this.hackingLoading.innerMC._y = 310 - this.hackingLoading.innerMC._height / 2;
   }
   function OPEN_DOWNLOAD(bool)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.openDownload(bool);
      }
   }
   function OPEN_ERROR_POPUP(bool, msg)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.openErrorPopup(Boolean(bool),msg);
      }
   }
   function SET_IP_OUTCOME(success, winStr)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setIPOutcome(Boolean(success),winStr);
      }
   }
   function SET_ROULETTE_OUTCOME(success, outcomeStr)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setRouletteOutcome(Boolean(success),outcomeStr);
      }
   }
   function SET_ROULETTE_WORD(wordStr)
   {
      this.gamePassword = wordStr;
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setRouletteWord(this.gamePassword);
      }
   }
   function STOP_ROULETTE()
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.stopRoulette();
      }
   }
   function RESET_ROULETTE()
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.resetRoulette();
      }
   }
   function SET_COUNTDOWN(m, s, ms)
   {
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setTime(m,s,ms);
      }
   }
   function SET_SPEED(speed)
   {
      this.gameSpeed = speed;
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setSpeed(this.gameSpeed);
      }
   }
   function SET_KEY_REPEAT_DELAY(kDelay)
   {
      this.maxKeyRepeatDelay = kDelay;
   }
   function SET_COLUMN_SPEED(columnIndex, speed)
   {
      this.gameColumnSpeedList[columnIndex] = speed;
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setColumnSpeed(this.gameColumnSpeedList);
      }
   }
   function SET_LIVES(lives, total)
   {
      this.livesDisplay = lives;
      this.livesTotal = total;
      if(this.hackingApp != undefined)
      {
         this.hackingApp.setLives(this.livesDisplay,this.livesTotal);
      }
   }
   function SHOW_LIVES(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      if(this.hackingApp != undefined)
      {
         this.hackingApp.showLives(vis);
      }
   }
   function RESTART_MOVIE()
   {
      this.removeBackground();
      if(typeof this.mouse.mc == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.mouse.mc);
      }
      com.rockstargames.ui.game.GameCom.REQUEST_RESTART_MOVIE("HACKING_PC");
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         this.loadBackground(textureDict);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.loadBackground(textureDict);
   }
   function removeBackground()
   {
      if(this.backgroundImage != undefined)
      {
         if(this.CONTENT.bgMC.background != undefined)
         {
            this.CONTENT.bgMC.background.removeMovieClip();
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.backgroundImage);
            this.backgroundImage = undefined;
         }
      }
   }
   function loadBackground(textureDict)
   {
      this.wallpaper_loader = new MovieClipLoader();
      this.wallpaper_loader.addListener(this);
      var _loc2_ = "img://" + textureDict + "/" + textureDict;
      this.wallpaper_loader.loadClip(_loc2_,this.CONTENT.bgMC.background);
   }
   function onLoadInit(target_mc)
   {
      this.CONTENT.bgMC.background._x = 0;
      this.CONTENT.bgMC.background._y = 0;
      this.CONTENT.bgMC.background._width = 1280;
      this.CONTENT.bgMC.background._height = 720;
      this.CONTENT.bgMC._visible = true;
      delete this.wallpaper_loader;
   }
   function SHUTDOWN_MOVIE()
   {
      this.removeBackground();
      if(typeof this.mouse.mc == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.mouse.mc);
      }
   }
}
