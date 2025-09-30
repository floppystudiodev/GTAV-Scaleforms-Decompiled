class com.rockstargames.gtav.pc.DESKTOP_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var antivirusApp;
   var buttonUnderCursor;
   var buttonsList;
   var desktopIconsList;
   var mouse;
   var popupApp;
   var popupData;
   var ref;
   var rows = 6;
   var columns = 6;
   var rowspace = 168;
   var colspace = 200;
   var bottomMargin = 56;
   var sideMargin = 104;
   var mouseSpeed = 15;
   var mouseSnapSpeed = 500;
   var canSnap = true;
   var mx = 640;
   var my = 320;
   var lastPopupID = -1;
   var isNeeded = 1;
   var isSnapping = false;
   var isCentering = false;
   var autoMode = true;
   var scanpercent = 0;
   var ratioGutter = 0;
   function DESKTOP_PC()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.desktopIconsList = [];
      this.buttonsList = [];
      this.popupData = [];
      var _loc3_ = this.CONTENT.attachMovie("mousecursor","mousecursorMC",this.CONTENT.getNextHighestDepth(),{_x:this.mx,_y:this.my});
      this.mouse = new com.rockstargames.gtav.pc.MousePointer(_loc3_);
      this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]);
   }
   function debug()
   {
      var _loc2_ = 0.05;
      this.SET_DISPLAY_CONFIG(1280,720,_loc2_,1 - _loc2_,_loc2_,1 - _loc2_,true,true);
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.getKeys();
      };
      this.ADD_PROGRAM(1,1,"MyComputer");
      this.ADD_PROGRAM(2,com.rockstargames.gtav.constants.PCAppLUT.PC_USB[0],"*usb");
      this.ADD_PROGRAM(3,com.rockstargames.gtav.constants.PCAppLUT.PC_FOLDER[0],"*folder");
      this.ADD_PROGRAM(4,com.rockstargames.gtav.constants.PCAppLUT.PC_PRINT[0],"*print");
      this.ADD_PROGRAM(5,com.rockstargames.gtav.constants.PCAppLUT.PC_TRASH[0],"*trash");
      this.ADD_PROGRAM(7,com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0],"Antivirus");
      this.SET_DATA_SLOT(0,1,0,0);
      this.SET_DATA_SLOT(1,2,0.25,0.25);
      this.SET_DATA_SLOT(2,3,0.5,0.5);
      this.SET_DATA_SLOT(3,4,0.5,0.5);
      this.SET_DATA_SLOT(4,5,0.75,0.75);
      this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0]);
   }
   function getKeys()
   {
      var _loc2_;
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(39))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
      else if(Key.isDown(37))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
      }
      else if(Key.isDown(32))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.CROSS);
      }
      else if(Key.isDown(45))
      {
         this.SET_SCAN_BAR(this.scanpercent++);
      }
      else if(Key.isDown(97))
      {
         _loc2_ = Math.floor(Math.random() * 8);
         this.CLOSE_POPUP(_loc2_);
      }
      else if(Key.isDown(98))
      {
         this.PLAY_SCAN_ANIM(1);
      }
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
   {
      var _loc9_ = 1.7777777777777777;
      var _loc8_ = 1.3333333333333333;
      var _loc6_ = 1280;
      var _loc7_ = 720;
      var _loc2_ = 0;
      var _loc3_ = 0;
      this.ratioGutter = _loc2_;
      this.safeLeft = _loc2_ + _safeLeftPercent * _screenWidthPixels;
      this.safeRight = _loc2_ + _safeRightPercent * _screenWidthPixels;
      this.safeTop = _loc3_ + _safeTopPercent * _screenHeightPixels;
      this.safeBottom = _loc3_ + _safeBottomPercent * _screenHeightPixels;
      this.screenWidthPixels = _screenWidthPixels;
      this.screenHeightPixels = _screenHeightPixels;
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.CONTENT.bgMC._x = 640 - this.CONTENT.bgMC._width / 2;
      if(this.popupApp != undefined)
      {
         this.popupApp.repositionPopups(this.screenWidthPixels,this.screenHeightPixels,this.safeTop,this.safeBottom,this.safeLeft,this.safeRight);
      }
   }
   function ADD_PROGRAM(i, enum, lbl)
   {
      var _loc6_;
      var _loc5_;
      var _loc2_;
      var _loc7_;
      var _loc3_;
      if(enum != undefined)
      {
         _loc6_ = this.sideMargin + this.colspace * ((i - 1) % this.columns);
         _loc5_ = this.bottomMargin + this.rowspace * Math.floor((i - 1) / this.rows);
         _loc2_ = this.CONTENT.desktopMC.getNextHighestDepth();
         _loc7_ = this.CONTENT.desktopMC.attachMovie("desktopicon","desktopicon" + _loc2_,_loc2_,{_x:_loc6_,_y:_loc5_});
         _loc3_ = new com.rockstargames.gtav.pc.DesktopIcon();
         _loc3_.init(_loc7_,enum,{depth:i},i,lbl);
         this.desktopIconsList.push(_loc3_);
      }
   }
   function RUN_PROGRAM(id)
   {
      this.openApp(id);
   }
   function SET_DATA_SLOT(i, id, x, y, t)
   {
      this.popupData[i] = [id,x,y,t];
   }
   function OPEN_POPUP(i)
   {
      this.popupApp.openPopup(i);
   }
   function CLOSE_POPUP(i)
   {
      this.popupApp.closePopup(i);
   }
   function OPEN_ANTIVIRUS(i, promptText)
   {
      if(i == 1)
      {
         this.antivirusApp.ready(promptText);
      }
      else
      {
         this.antivirusApp.notReady(promptText);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
            _loc2_ = this.cursorClick();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.MOVE_CURSOR(0,- this.mouseSpeed);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.MOVE_CURSOR(0,this.mouseSpeed);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            this.MOVE_CURSOR(- this.mouseSpeed,0);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            this.MOVE_CURSOR(this.mouseSpeed,0);
      }
      return _loc2_;
   }
   function IS_PC_NEEDED()
   {
      return this.isNeeded;
   }
   function SET_SCAN_BAR(percent)
   {
      var _loc2_;
      if(this.antivirusApp != undefined)
      {
         _loc2_ = Math.ceil(percent);
         this.antivirusApp.setScanBar(_loc2_);
         if(_loc2_ == 100)
         {
            this.antivirusApp.scanComplete();
         }
      }
   }
   function PLAY_SCAN_ANIM(bool)
   {
      if(this.antivirusApp != undefined)
      {
         this.antivirusApp.playScanAnim(bool);
      }
   }
   function addButtons(m, addOnce)
   {
      var _loc3_ = false;
      var _loc2_;
      if(addOnce)
      {
         for(var _loc5_ in this.buttonsList)
         {
            _loc2_ = this.buttonsList[_loc5_];
            if(_loc2_.id == m.id)
            {
               _loc3_ = true;
            }
         }
      }
      if(!_loc3_)
      {
         this.buttonsList.push(m);
      }
   }
   function activateButtons(m, b)
   {
      m.active = b;
   }
   function removeButtons(m)
   {
      var _loc2_;
      for(var _loc4_ in this.buttonsList)
      {
         _loc2_ = this.buttonsList[_loc4_];
         if(m.id == _loc2_.id)
         {
            this.buttonsList.splice(_loc4_,1);
            break;
         }
      }
   }
   function SET_SNAP_SPEED(s)
   {
      this.mouseSnapSpeed = s;
      if(s == 0)
      {
         this.canSnap = false;
      }
      else
      {
         this.canSnap = true;
      }
   }
   function SET_CURSOR(vx, vy)
   {
      var _loc3_;
      var _loc2_;
      if(!this.isCentering)
      {
         _loc3_ = this.screenWidthPixels * vx;
         _loc2_ = 720 * vy;
         this.mx = Math.max(0,Math.min(_loc3_,this.screenWidthPixels));
         this.my = Math.max(0,Math.min(_loc2_,720));
         this.mouse.moveCursor(this.mx,this.my);
         this.checkUnderCursor();
      }
   }
   function MOVE_CURSOR(vx, vy)
   {
      if(!this.isCentering)
      {
         this.mx = Math.max(0,Math.min(this.mx + vx,1280));
         this.my = Math.max(0,Math.min(this.my + vy,720));
         this.mouse.moveCursor(this.mx,this.my);
         this.checkUnderCursor();
      }
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
         switch(_loc6_.type)
         {
            case undefined:
               this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
               break;
            case com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0]:
               this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
               break;
            default:
               this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
         }
         this.buttonUnderCursor.highlight = false;
         this.buttonUnderCursor = _loc6_;
         this.buttonUnderCursor.highlight = true;
         if(this.buttonUnderCursor.type == com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0])
         {
            this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
            if(this.canSnap)
            {
               if(!this.isSnapping)
               {
                  this.isSnapping = true;
                  this.snapToButton();
               }
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
   function resetUnderCursor()
   {
      this.mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
      this.buttonUnderCursor = null;
   }
   function cursorClick()
   {
      var _loc2_ = this.buttonUnderCursor.type != undefined ? this.buttonUnderCursor.type : 0;
      this.lastPopupID = -1;
      switch(this.buttonUnderCursor.type)
      {
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START[0]:
            this.antivirusApp.scanAntiVirus(5);
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN[0]:
            this.antivirusApp.closeButtons();
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLOSE[0]:
            this.antivirusApp.closeButtons();
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0]:
            this.lastPopupID = this.buttonUnderCursor.args.index;
            this.buttonUnderCursor.highlight = false;
            this.popupApp.closePopup(this.lastPopupID);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.mouse.mc);
            this.snapToButtonComplete();
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]:
      }
      return _loc2_;
   }
   function LAST_POPUP_CLOSED()
   {
      return this.lastPopupID;
   }
   function openApp(i)
   {
      var _loc2_;
      var _loc3_;
      switch(i)
      {
         case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]:
            if(this.antivirusApp == undefined)
            {
               _loc3_ = "antivirus";
               _loc2_ = 1;
               this.antivirusApp = this.CONTENT.appsMC.attachMovie(_loc3_,_loc3_ + _loc2_,_loc2_);
               this.antivirusApp._x = this.screenWidthPixels / 2 - this.antivirusApp._width / 2;
               this.antivirusApp._y = this.screenHeightPixels / 2 - this.antivirusApp._height / 2;
               this.antivirusApp.desktopRef = this;
            }
            break;
         case com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0]:
            if(this.popupApp == undefined)
            {
               _loc3_ = "popups";
               _loc2_ = 0;
               this.popupApp = this.CONTENT.appsMC.attachMovie(_loc3_,_loc3_ + _loc2_,_loc2_);
               this.popupApp.desktopRef = this;
               this.popupApp.screenWidthPixels = this.screenWidthPixels;
               this.popupApp.screenHeightPixels = this.screenHeightPixels;
               this.popupApp.safeTop = this.safeTop;
               this.popupApp.safeBottom = this.safeBottom;
               this.popupApp.safeLeft = this.safeLeft;
               this.popupApp.safeRight = this.safeRight;
               this.popupApp.data = this.popupData;
               this.popupApp.ready();
            }
         default:
            return;
      }
   }
   function closeApp(id)
   {
      var _loc0_;
      if((_loc0_ = id) !== com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0])
      {
      }
   }
   function RESTART_MOVIE()
   {
      if(typeof this.mouse.mc == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeAllTweens(this.mouse.mc);
      }
      com.rockstargames.ui.game.GameCom.REQUEST_RESTART_MOVIE("DESKTOP_PC");
   }
}
