class com.rockstargames.gtav.pc.applications.hacking.ConnectHostApp extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
   var AH;
   var bgMC;
   var frameMC;
   var gridMC;
   var ipMC;
   var onEnterFrame;
   var replayMC;
   var signalMC;
   var signalStrengthText;
   var timeTF;
   var winMC;
   var gridItems = new Array();
   var gridColumns = 10;
   var gridRows = 8;
   var IPList = new Array();
   var IPTarget = new Array();
   var IPIndex = 0;
   var IPMoveTimer = 100;
   var IPReplay = 1;
   var highlightIndex = 0;
   function ConnectHostApp()
   {
      super();
      _global.gfxExtensions = true;
   }
   function initApp01()
   {
      this.gridItems = [];
      var _loc5_ = 12;
      var _loc6_ = -12;
      var _loc7_ = 70;
      var _loc4_ = this.gridColumns * this.gridRows;
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.gridMC.attachMovie("gridnum","gridnumMC" + _loc3_,_loc3_);
         _loc2_._x = _loc3_ % this.gridColumns * (_loc2_._width + _loc5_);
         _loc2_._y = Math.floor(_loc3_ / this.gridColumns) * (_loc2_._height + _loc6_);
         _loc2_.numTF.text = _loc3_;
         _loc2_.numTF.textAutoSize = "shrink";
         _loc2_.numTF.verticalAlign = "center";
         this.gridItems.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      this.gridMC._x = this.frameMC._width * 0.5 - this.gridMC._width * 0.5;
      this.gridMC._y = this.frameMC._height * 0.5 - this.gridMC._height * 0.5 + _loc7_;
      this.replayMC._visible = false;
      this.winMC._visible = false;
   }
   function startApp01()
   {
      var _loc2_ = "";
      var _loc6_ = "";
      var _loc5_ = this.gridItems.length;
      this.IPList = [];
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.getRndNumber();
         this.IPList.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      this.IPIndex = Math.floor(Math.random() * _loc5_);
      this.highlightIndex = 33;
      this.IPTarget = [];
      _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < 4)
      {
         _loc2_ = this.getRndNumber();
         if(_loc3_ != 3)
         {
            _loc6_ += String(_loc2_ + ".");
         }
         else
         {
            _loc6_ += String(_loc2_);
         }
         this.IPTarget.push(_loc2_);
         _loc4_ = this.IPIndex + _loc3_;
         if(_loc4_ > _loc5_ - 1)
         {
            _loc4_ -= _loc5_;
         }
         this.IPList[_loc4_] = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      this.ipMC.ipTF.text = _loc6_;
      com.rockstargames.ui.utils.Colour.Colourise(this.ipMC,244,20,11);
      this.IPMoveTimer = 100 - this.gameSpeed;
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME;
      this.refreshGrid();
      this.highlightIP(this.highlightIndex);
      this.replayMC._visible = false;
      this.winMC._visible = false;
      this.gridMC._visible = true;
      this.onEnterFrame = this.updateApp01;
   }
   function updateApp01()
   {
      this.IPMoveTimer = this.IPMoveTimer - 1;
      if(this.IPMoveTimer < 0)
      {
         this.shiftGrid();
         this.refreshGrid();
         this.IPMoveTimer = 100 - this.gameSpeed;
      }
   }
   function stopApp01(retryStr)
   {
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
      var _loc4_ = this.gridItems.length;
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < 4)
      {
         _loc2_ = this.highlightIndex + _loc3_;
         if(_loc2_ > _loc4_ - 1)
         {
            _loc2_ -= _loc4_;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.gridItems[_loc2_],255,255,255);
         _loc3_ = _loc3_ + 1;
      }
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY;
      this.IPReplay = 1;
      this.highlightReplay(this.IPReplay);
      this.gridMC._visible = false;
      if(retryStr != undefined)
      {
         this.replayMC.replayTF.htmlText = retryStr;
      }
      this.replayMC._visible = true;
   }
   function testIP()
   {
      if(this.IPIndex == this.highlightIndex)
      {
         return com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_SUCCESS[0];
      }
      this.bgMC.gotoAndPlay("in");
      return com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_FAIL[0];
   }
   function winApp01(outcomeStr)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.ipMC,34,172,33);
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_WIN;
      this.gridMC._visible = false;
      this.winMC.winTF.htmlText = outcomeStr;
      this.winMC._visible = true;
   }
   function highlightIP(newIndex)
   {
      var _loc4_ = this.gridItems.length;
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < 4)
      {
         _loc2_ = this.highlightIndex + _loc3_;
         if(_loc2_ > _loc4_ - 1)
         {
            _loc2_ -= _loc4_;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.gridItems[_loc2_],255,255,255);
         _loc3_ = _loc3_ + 1;
      }
      this.highlightIndex = newIndex;
      _loc3_ = 0;
      while(_loc3_ < 4)
      {
         _loc2_ = this.highlightIndex + _loc3_;
         if(_loc2_ > _loc4_ - 1)
         {
            _loc2_ -= _loc4_;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.gridItems[_loc2_],255,0,0);
         _loc3_ = _loc3_ + 1;
      }
   }
   function highlightReplay(choice)
   {
   }
   function moveHighlight(vx, vy)
   {
      var _loc2_ = this.highlightIndex;
      var _loc3_ = this.gridItems.length;
      if(vx > 0)
      {
         _loc2_ = _loc2_ + 1;
      }
      else if(vx < 0)
      {
         _loc2_ = _loc2_ - 1;
      }
      else if(vy > 0)
      {
         _loc2_ += this.gridColumns;
      }
      else if(vy < 0)
      {
         _loc2_ -= this.gridColumns;
      }
      if(_loc2_ > _loc3_ - 1)
      {
         _loc2_ -= _loc3_;
      }
      if(_loc2_ < 0)
      {
         _loc2_ += _loc3_;
      }
      this.highlightIP(_loc2_);
   }
   function shiftGrid()
   {
      var _loc3_ = String(this.IPList.shift());
      this.IPList.push(_loc3_);
      var _loc2_ = this.gridItems.length;
      this.IPIndex = this.IPIndex - 1;
      if(this.IPIndex < 0)
      {
         this.IPIndex += _loc2_;
      }
   }
   function refreshGrid()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.gridItems.length)
      {
         _loc3_ = this.gridItems[_loc2_];
         _loc3_.numTF.text = this.IPList[_loc2_];
         _loc3_.numTF.textAutoSize = "shrink";
         _loc3_.numTF.verticalAlign = "center";
         _loc2_ = _loc2_ + 1;
      }
   }
   function setLives(l, t)
   {
      if(t != undefined)
      {
         this.lives = t;
      }
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 7)
      {
         _loc3_ = this.signalMC["bar" + _loc2_ + "MC"];
         _loc3_._visible = _loc2_ <= this.lives;
         _loc2_ < l + 1 ? _loc3_.gotoAndStop(1) : _loc3_.gotoAndStop(2);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = 10 * this.lives;
      this.signalMC._x = 887 - _loc5_;
      this.signalStrengthText._x = 887;
   }
   function showLives(vis)
   {
      this.signalMC._visible = vis;
      this.signalStrengthText._visible = vis;
   }
   function setSpeed(s)
   {
      this.gameSpeed = s;
   }
   function setTime(m, s, ms)
   {
      var _loc3_ = String(m);
      var _loc4_ = String(s);
      var _loc2_ = String(ms);
      if(m < 10)
      {
         _loc3_ = "0" + _loc3_;
      }
      if(s < 10)
      {
         _loc4_ = "0" + _loc4_;
      }
      if(ms < 10)
      {
         _loc2_ = "00" + _loc2_;
      }
      else if(ms < 100)
      {
         _loc2_ = "0" + _loc2_;
      }
      this.timeTF.text = _loc3_ + ":" + _loc4_ + ":" + _loc2_;
   }
   function setInputEvent(direction)
   {
      var _loc2_ = 0;
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
            {
               if(this.IPReplay == 1)
               {
                  this.startApp01();
                  _loc2_ = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_RETRY[0];
                  break;
               }
               _loc2_ = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_NORETRY[0];
               break;
            }
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               _loc2_ = this.testIP();
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               this.stopApp01();
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               this.moveHighlight(0,-1);
               break;
            }
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
            {
               this.highlightReplay(1);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               this.moveHighlight(0,1);
               break;
            }
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
            {
               this.highlightReplay(2);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               this.moveHighlight(-1,0);
               break;
            }
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
            {
               this.highlightReplay(1);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
            {
               this.moveHighlight(1,0);
               break;
            }
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
            {
               this.highlightReplay(2);
            }
      }
      return _loc2_;
   }
}
