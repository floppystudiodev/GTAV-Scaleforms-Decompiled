class com.rockstargames.gtav.pc.applications.App_Hacking extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
   var app01MC;
   var app02MC;
   var attachMovie;
   var computerBtn;
   var downloadBtn;
   var errorContainerMC;
   var hackingApp1;
   var hackingApp2;
   var hackingBtn;
   var hackingMC;
   var hackingRef;
   var mainPopupMC;
   var mouse;
   var networkBtn;
   var oldbtnManagerIndex = 0;
   var btnManagerIndex = 0;
   var btnManagerList = new Array();
   var btnManagerStateList = new Array();
   var errorAnimating = false;
   var state = 0;
   static var POPUPS = 0;
   static var MYCOMP = 1;
   static var HACKMENU = 2;
   static var APP01_GAME = 3;
   static var APP01_REPLAY = 4;
   static var APP01_WIN = 5;
   static var APP02_GAME = 6;
   static var APP02_REPLAY = 7;
   static var APP02_WIN = 8;
   static var hitBuffer = 20;
   var gameSpeed = 5;
   var downloadOpen = false;
   function App_Hacking()
   {
      super();
      this.mainPopupMC._visible = false;
      this.errorContainerMC._visible = false;
      this.hackingMC._visible = false;
      this.app01MC = com.rockstargames.gtav.pc.applications.hacking.ConnectHostApp(this.attachMovie("appHacking01","app01MC",10,{_x:170,_y:52}));
      this.app02MC = com.rockstargames.gtav.pc.applications.hacking.BruteForceApp(this.attachMovie("appHacking02","app02MC",20,{_x:170,_y:52}));
      this.app01MC.AH = this;
      this.app02MC.AH = this;
      this.app01MC._visible = false;
      this.app02MC._visible = false;
   }
   function ready(labels)
   {
      this.setupIcon(this.mainPopupMC.computerMC,"PC_HARDDRIVE",labels[0]);
      this.setupIcon(this.mainPopupMC.networkMC,"PC_NETWORK",labels[1]);
      this.setupIcon(this.mainPopupMC.hackingMC,"PC_HACKING_DEVICE",labels[2]);
      this.setupIcon(this.hackingMC.hacking1MC,"PC_HACKING_APP01",labels[3]);
      this.setupIcon(this.hackingMC.hacking2MC,"PC_HACKING_APP02",labels[4]);
      this.setupIcon(this.hackingMC.downloadMC,"PC_HACKING_DOWNLOAD",labels[5]);
      this.computerBtn = this.setupButton(this.mainPopupMC.computerMC,com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0],100);
      this.networkBtn = this.setupButton(this.mainPopupMC.networkMC,com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0],101);
      this.hackingBtn = this.setupButton(this.mainPopupMC.hackingMC,com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0],102);
      this.hackingApp1 = this.setupButton(this.hackingMC.hacking1MC,com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0],105);
      this.hackingApp2 = this.setupButton(this.hackingMC.hacking2MC,com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0],106);
      this.downloadBtn = this.setupButton(this.hackingMC.downloadMC,com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD[0],107);
      this.downloadBtn.active = false;
      this.btnManagerIndex = 0;
      this.btnManagerList = [this.computerBtn,this.networkBtn,this.hackingBtn,this.hackingApp1,this.hackingApp2];
      this.btnManagerStateList = [[false,false,false,false,false],[true,true,true,false,false],[false,false,false,true,true],[false,false,false,false,false]];
      this.app01MC.initApp01();
      this.app02MC.initApp02();
      this.openMyComputer(true);
   }
   function backButtonState()
   {
      if(this.btnManagerIndex >= 1)
      {
         if(this.btnManagerIndex == com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP)
         {
            this.openMyComputer(false);
         }
         else if(this.btnManagerIndex == com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU)
         {
            this.openHackingMenu(false);
         }
      }
   }
   function buttonsState(index)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.btnManagerList.length)
      {
         _loc3_ = this.btnManagerList[_loc2_];
         _loc3_.active = this.btnManagerStateList[index][_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function openMyComputer(b)
   {
      if(b)
      {
         this.btnManagerIndex = 1;
         this.buttonsState(this.btnManagerIndex);
         this.mainPopupMC._visible = true;
         this.state = com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP;
      }
      else
      {
         this.btnManagerIndex = 0;
         this.buttonsState(this.btnManagerIndex);
         this.mainPopupMC._visible = false;
         this.state = com.rockstargames.gtav.pc.applications.App_Hacking.POPUPS;
      }
      this.hackingRef.checkUnderCursor();
   }
   function openDownload(b)
   {
      if(b)
      {
         this.hackingMC.gotoAndStop(2);
         this.hackingMC.downloadMC._visible = true;
         this.hackingRef.ACTIVATE_BUTTONS(this.downloadBtn,true);
         this.downloadOpen = true;
      }
      else
      {
         this.hackingMC.gotoAndStop(1);
         this.hackingMC.downloadMC._visible = false;
         this.hackingRef.ACTIVATE_BUTTONS(this.downloadBtn,false);
         this.downloadOpen = false;
      }
   }
   function openHackingMenu(b)
   {
      if(b)
      {
         this.btnManagerIndex = 2;
         this.buttonsState(this.btnManagerIndex);
         this.hackingMC._visible = true;
         if(this.downloadOpen)
         {
            this.hackingRef.ACTIVATE_BUTTONS(this.downloadBtn,true);
         }
         this.state = com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP;
      }
      else
      {
         this.btnManagerIndex = 1;
         this.buttonsState(this.btnManagerIndex);
         this.hackingRef.ACTIVATE_BUTTONS(this.downloadBtn,false);
         this.hackingMC._visible = false;
      }
      this.hackingRef.checkUnderCursor();
   }
   function openErrorPopup(b, msg)
   {
      if(b)
      {
         if(!this.errorAnimating)
         {
            if(this.state <= com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU)
            {
               this.oldbtnManagerIndex = this.btnManagerIndex;
               this.btnManagerIndex = 0;
               this.buttonsState(this.btnManagerIndex);
               if(msg != undefined)
               {
                  this.errorContainerMC.errorPopupMC.warningTF.htmlText = msg;
               }
               this.errorContainerMC.errorPopupMC.warningMC.gotoAndPlay("loop");
               this.errorContainerMC._visible = true;
               this.errorAnimating = true;
            }
         }
      }
      else
      {
         this.btnManagerIndex = this.oldbtnManagerIndex;
         this.buttonsState(this.btnManagerIndex);
         this.errorAnimating = false;
         this.errorContainerMC._visible = false;
      }
      this.hackingRef.checkUnderCursor();
   }
   function openApp01(b)
   {
      if(b)
      {
         this.btnManagerIndex = 3;
         this.buttonsState(this.btnManagerIndex);
         this.app01MC._visible = true;
         this.app01MC.startApp01();
         this.mouse.mc._visible = false;
      }
      else
      {
         this.btnManagerIndex = 2;
         this.buttonsState(this.btnManagerIndex);
         this.app01MC._visible = false;
         this.app01MC.stopApp01();
         this.state = com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU;
         this.mouse.mc._visible = true;
      }
      this.hackingRef.checkUnderCursor();
   }
   function openApp02(b)
   {
      if(b)
      {
         this.btnManagerIndex = 3;
         this.buttonsState(this.btnManagerIndex);
         this.app02MC._visible = true;
         this.app02MC.startApp02();
         this.mouse.mc._visible = false;
      }
      else
      {
         this.btnManagerIndex = 2;
         this.buttonsState(this.btnManagerIndex);
         this.app02MC._visible = false;
         this.app02MC.stopApp02();
         this.state = com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU;
         this.mouse.mc._visible = true;
      }
      this.hackingRef.checkUnderCursor();
   }
   function openApp(id)
   {
      switch(id)
      {
         case 0:
            this.openApp01(true);
            break;
         case 1:
            this.openApp02(true);
         default:
            return;
      }
   }
   function closeAllApps()
   {
      var _loc2_ = this.isApp1();
      if(_loc2_ != undefined)
      {
         !_loc2_ ? this.openApp02(false) : this.openApp01(false);
      }
   }
   function isApp1()
   {
      if(this.state >= com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME && this.state <= com.rockstargames.gtav.pc.applications.App_Hacking.APP01_WIN)
      {
         return true;
      }
      if(this.state >= com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME && this.state <= com.rockstargames.gtav.pc.applications.App_Hacking.APP02_WIN)
      {
         return false;
      }
   }
   function setRouletteOutcome(success, outcomeStr)
   {
      if(success)
      {
         this.app02MC.winApp02(outcomeStr);
      }
      else
      {
         this.app02MC.stopApp02(outcomeStr);
      }
   }
   function setIPOutcome(success, outcomeStr)
   {
      if(success)
      {
         this.app01MC.winApp01(outcomeStr);
      }
      else
      {
         this.app01MC.stopApp01(outcomeStr);
      }
   }
   function setSpeed(s)
   {
      this.app01MC.setSpeed(s);
      this.app02MC.setSpeed(s);
   }
   function setColumnSpeed(gameColumnSpeedList)
   {
      this.app02MC.setColumnSpeed(gameColumnSpeedList);
   }
   function setTime(m, s, ms)
   {
      var _loc2_ = this.isApp1();
      if(_loc2_ != undefined)
      {
         !_loc2_ ? this.app02MC.setTime(m,s,ms) : this.app01MC.setTime(m,s,ms);
      }
   }
   function stopRoulette()
   {
      if(this.app02MC != undefined)
      {
         this.app02MC.stopRoulette();
      }
   }
   function resetRoulette()
   {
      if(this.app02MC != undefined)
      {
         this.app02MC.resetRoulette();
      }
   }
   function setRouletteWord(wordStr)
   {
      if(this.app02MC != undefined)
      {
         this.app02MC.setWord(wordStr);
      }
   }
   function setLives(l, t)
   {
      this.app01MC.setLives(l,t);
      this.app02MC.setLives(l,t);
   }
   function showLives(vis)
   {
      this.app01MC.showLives(vis);
      this.app02MC.showLives(vis);
   }
   function setInputEvent(direction)
   {
      var _loc2_ = 0;
      if(direction == 17)
      {
         this.backButtonState();
      }
      var _loc3_ = this.isApp1();
      if(_loc3_ != undefined)
      {
         !_loc3_ ? (_loc2_ = this.app02MC.setInputEvent(direction)) : (_loc2_ = this.app01MC.setInputEvent(direction));
      }
      return _loc2_;
   }
}
