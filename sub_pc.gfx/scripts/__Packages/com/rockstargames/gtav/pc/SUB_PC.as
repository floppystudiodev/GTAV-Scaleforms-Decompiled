class com.rockstargames.gtav.pc.SUB_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
   var desktopIconsList;
   var buttonsList;
   var popupData;
   var CONTENT;
   var mouse;
   var ref;
   var subApp;
   var popupApp;
   var buttonUnderCursor;
   var rows = 6;
   var columns = 6;
   var rowspace = 168;
   var colspace = 200;
   var bottomMargin = 56;
   var sideMargin = 104;
   var mouseSpeed = 15;
   var mouseSnapSpeed = 500;
   var mx = 640;
   var my = 320;
   var lastPopupID = -1;
   var isNeeded = 1;
   var isSnapping = false;
   var isCentering = false;
   var autoMode = true;
   function SUB_PC()
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
   }
   function debug()
   {
      var _loc2_ = 0.15;
      this.SET_DISPLAY_CONFIG(1280,720,_loc2_,_loc2_,_loc2_,_loc2_,true,true);
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.getKeys();
      };
      this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_SUB[0]);
      this.SET_LABELS("Sluice Gate Feed","Technical Specification","Security Layout","Access Switches");
      this.SET_SECTION("section - 5A","Live feed 1","Open Sluice Gates","Release Submarine");
      this.SET_TIME(9,47);
      this.SET_DATE(1,3,90);
   }
   function getKeys()
   {
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
   }
   function initScreenLayout()
   {
      this.positionToScreenLayout(this.CONTENT.bgMC.logoMC,"LT");
      this.CONTENT.bgMC.optimiseMC.edgeMC._x = this.screenWidthPixels;
      this.CONTENT.bgMC.optimiseMC.crestMC.gotoAndStop(!this.isWideScreen ? 2 : 1);
      if(this.subApp != undefined)
      {
         this.subApp.screenWidthPixels = this.screenWidthPixels;
         this.subApp.screenHeightPixels = this.screenHeightPixels;
         this.subApp.safeTop = this.safeTop;
         this.subApp.safeBottom = this.safeBottom;
         this.subApp.safeLeft = this.safeLeft;
         this.subApp.safeRight = this.safeRight;
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
            _loc2_ = this.CURSOR_CLICK();
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
   function SET_INPUT_EVENT_SELECT()
   {
      var _loc2_ = this.CURSOR_CLICK();
   }
   function ADD_PROGRAM(i, enum, lbl)
   {
      if(enum != undefined)
      {
         var _loc6_ = this.sideMargin + this.colspace * ((i - 1) % this.columns);
         var _loc5_ = this.bottomMargin + this.rowspace * Math.floor((i - 1) / this.rows);
         var _loc2_ = this.CONTENT.desktopMC.getNextHighestDepth();
         var _loc7_ = this.CONTENT.desktopMC.attachMovie("desktopicon","desktopicon" + _loc2_,_loc2_,{_x:_loc6_,_y:_loc5_});
         var _loc3_ = new com.rockstargames.gtav.pc.DesktopIcon();
         _loc3_.init(_loc7_,enum,{depth:i},i,lbl);
         this.desktopIconsList.push(_loc3_);
      }
   }
   function RUN_PROGRAM(id)
   {
      this.openApp(id);
   }
   function OPEN_POPUP(i)
   {
      this.popupApp.openPopup(i);
   }
   function SET_DATA_SLOT(i, id, x, y, t)
   {
      this.popupData[i] = [id,x,y,t];
   }
   function SET_PC_NEEDED(i)
   {
      this.isNeeded = i;
   }
   function IS_PC_NEEDED()
   {
      return this.isNeeded;
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
      for(var _loc4_ in this.buttonsList)
      {
         var _loc2_ = this.buttonsList[_loc4_];
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
   function MOVE_CURSOR(vx, vy)
   {
      if(!this.isCentering)
      {
         this.mx = Math.max(this.safeLeft,Math.min(this.mx + vx,this.safeRight));
         this.my = Math.max(this.safeTop,Math.min(this.my + vy,this.safeBottom));
         this.mouse.moveCursor(this.mx,this.my);
         this.CheckUnderCursor();
      }
   }
   function CheckUnderCursor()
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
      var _loc6_ = undefined;
      var _loc3_ = -1;
      for(var _loc7_ in list)
      {
         var _loc2_ = list[_loc7_];
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
   function CURSOR_CLICK()
   {
      var _loc2_ = this.buttonUnderCursor.type != undefined ? this.buttonUnderCursor.type : 0;
      this.lastPopupID = -1;
      return _loc2_;
   }
   function LAST_POPUP_CLOSED()
   {
      return this.lastPopupID;
   }
   function openApp(i)
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc0_ = null;
      if((_loc0_ = i) === com.rockstargames.gtav.constants.PCAppLUT.PC_SUB[0])
      {
         if(this.popupApp == undefined)
         {
            _loc3_ = "sub";
            _loc2_ = this.CONTENT.appsMC.getNextHighestDepth();
            this.subApp = this.CONTENT.appsMC.attachMovie(_loc3_,_loc3_ + _loc2_,_loc2_);
            this.subApp._subRef = this;
            this.subApp.screenWidthPixels = this.screenWidthPixels;
            this.subApp.screenHeightPixels = this.screenHeightPixels;
            this.subApp.safeTop = this.safeTop;
            this.subApp.safeBottom = this.safeBottom;
            this.subApp.safeLeft = this.safeLeft;
            this.subApp.safeRight = this.safeRight;
            this.subApp.ready();
         }
      }
   }
   function closeApp(id)
   {
   }
   function SET_LABELS(sluiceLbl, techLbl, securityLbl, accessLbl)
   {
      if(this.subApp != undefined)
      {
         this.subApp.setLabels(sluiceLbl,techLbl,securityLbl,accessLbl);
      }
   }
   function SET_DATE(days, months, years)
   {
      if(this.subApp != undefined)
      {
         this.subApp.setDate(days,months,years);
      }
   }
   function SET_TIME(hours, mins)
   {
      if(this.subApp != undefined)
      {
         this.subApp.setTime(hours,mins);
      }
   }
   function SET_SECTION(section, cam, action1Lbl, action2Lbl)
   {
      if(this.subApp != undefined)
      {
         this.subApp.setSection(section,cam,action1Lbl,action2Lbl);
      }
   }
   function TRIGGER_CAM_FLASH()
   {
      if(this.subApp != undefined)
      {
         this.subApp.triggerFlash();
      }
   }
   function TRIGGER_WARNING(num)
   {
      if(this.subApp != undefined)
      {
         this.subApp.triggerWarning(num);
      }
   }
   function SET_BUTTON_ACTIVE(buttonEnum, isActive)
   {
      if(this.subApp != undefined)
      {
         this.subApp.setButtonActive(buttonEnum,isActive);
      }
   }
}
