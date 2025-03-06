class com.rockstargames.gtav.pc.applications.hacking.BruteForceApp extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
   var gridMC;
   var frameMC;
   var replayMC;
   var winMC;
   var rouletteBarMC;
   var AH;
   var userBarMC;
   var topBoundMC;
   var bottomBoundMC;
   var onEnterFrame;
   var alertMC;
   var signalMC;
   var signalStrengthText;
   var timeTF;
   var rouletteColumns = 8;
   var rouletteRows = 7;
   var rouletteWords = new Array();
   var rouletteItems = new Array();
   var rouletteSpacingX = 12;
   var rouletteItemWidth = 72;
   var rouletteReplay = 1;
   var rouletteColItems = new Array();
   var rouletteColObj = new Array();
   var _rouletteIndex = 0;
   var isSpinning = true;
   function BruteForceApp()
   {
      super();
      this.rouletteWords = ["PASSWORD"];
   }
   function initApp02()
   {
      this.rouletteItems = [];
      var _loc6_ = -12;
      var _loc5_ = 70;
      this.rouletteColItems = [];
      var _loc4_ = this.rouletteWords[0].split("");
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = new com.rockstargames.gtav.pc.applications.hacking.BFColumn();
         _loc3_.init(this.gridMC,_loc2_,this.rouletteRows,_loc4_[_loc2_]);
         this.rouletteColItems.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.rouletteItemWidth = _loc3_.containerMC._width;
      this.gridMC._x = this.frameMC._width * 0.5 - this.gridMC._width * 0.5;
      this.gridMC._y = this.frameMC._height * 0.5 - this.gridMC._height * 0.5 + _loc5_;
      this.replayMC._visible = false;
      this.winMC._visible = false;
   }
   function setWord(wordStr)
   {
      this.rouletteWords = [wordStr];
      var _loc5_ = this.rouletteWords[0];
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc4_ = this.rouletteColItems[_loc2_];
         var _loc3_ = _loc5_.charAt(_loc2_);
         _loc4_.setLetter(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function startApp02()
   {
      var _loc10_ = "";
      var _loc11_ = "";
      var _loc12_ = this.rouletteItems.length;
      this.rouletteColObj = [];
      var _loc3_ = 0;
      while(_loc3_ < this.rouletteColumns)
      {
         var _loc2_ = 50 + Math.ceil(Math.random() * 50);
         this.rouletteColObj.push({speed:_loc2_,maxspeed:_loc2_,index:0,success:false});
         _loc3_ = _loc3_ + 1;
      }
      var _loc8_ = Math.floor(Math.random() * this.rouletteWords.length);
      var _loc9_ = this.rouletteWords[_loc8_].split("");
      this.rouletteBarMC._visible = true;
      this.rouletteBarMC._x = this.gridMC._x;
      this.rouletteBarMC._width = this.gridMC._width;
      this.rouletteIndex = 0;
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME;
      this.gridMC._visible = true;
      this.userBarMC._visible = true;
      this.userBarMC._x = this.gridMC._x + 5;
      this.replayMC._visible = false;
      this.winMC._visible = false;
      this.topBoundMC._y = this.rouletteBarMC._y - com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
      this.bottomBoundMC._y = this.rouletteBarMC._y + this.rouletteBarMC._height + com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
      this.onEnterFrame = this.updateApp02;
   }
   function updateApp02()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc3_ = this.rouletteColItems[_loc2_];
         _loc3_.update();
         _loc2_ = _loc2_ + 1;
      }
   }
   function refreshRowApp02(i)
   {
      var _loc7_ = this.rouletteColItems[i];
      var _loc8_ = String(_loc7_.pop());
      _loc7_.splice(0,0,_loc8_);
      this.rouletteColItems[i] = _loc7_;
      var _loc6_ = this.rouletteColObj[i].index;
      _loc6_ = _loc6_ + 1;
      if(_loc6_ > this.rouletteRows - 1)
      {
         _loc6_ = 0;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteRows)
      {
         var _loc3_ = this.rouletteItems[i][_loc2_];
         var _loc4_ = this.rouletteColItems[i][_loc2_];
         _loc3_.numTF.text = _loc4_;
         if(_loc6_ == _loc2_)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,255,0,0);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,255,255,255);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.rouletteColObj[i].index = _loc6_;
   }
   function moveHighlightColumn(vx)
   {
      var _loc2_ = this.rouletteIndex + vx;
      if(_loc2_ < 0)
      {
         _loc2_ = this.rouletteColumns - 1;
      }
      if(_loc2_ > this.rouletteColumns - 1)
      {
         _loc2_ = 0;
      }
      this.rouletteIndex = _loc2_;
      this.highlightColumn(this.rouletteIndex);
   }
   function highlightColumn(i)
   {
      this.userBarMC._x = this.gridMC._x + 5 + i * (this.rouletteItemWidth + this.rouletteSpacingX);
   }
   function testRoulette()
   {
      var _loc6_ = this.rouletteColItems[this.rouletteIndex];
      var _loc5_ = _loc6_.testHit();
      if(_loc5_)
      {
         this.jumpHighlight();
         var _loc4_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this.rouletteColItems.length)
         {
            var _loc3_ = this.rouletteColItems[_loc2_];
            if(_loc3_.success)
            {
               _loc4_ = _loc4_ + 1;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc4_ == this.rouletteColItems.length)
         {
            return com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_WIN[0];
         }
         return com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_SUCCESS[0];
      }
      this.alertMC.gotoAndPlay("in");
      return com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_FAIL[0];
   }
   function stopRoulette()
   {
      this.isSpinning = false;
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
   }
   function resetRoulette()
   {
      this.isSpinning = true;
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc3_ = this.rouletteColItems[_loc2_];
         _loc3_.reset();
         _loc2_ = _loc2_ + 1;
      }
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
      this.startApp02();
      this.alertMC.gotoAndPlay("in");
   }
   function jumpHighlight()
   {
      var _loc6_ = false;
      var _loc5_ = this.rouletteColumns - 1;
      var _loc3_ = 0;
      while(_loc3_ < this.rouletteColumns - 1)
      {
         var _loc2_ = this.rouletteIndex + _loc3_ + 1;
         if(_loc2_ > this.rouletteColumns - 1)
         {
            _loc2_ -= this.rouletteColumns;
         }
         _loc5_ = _loc5_ - 1;
         var _loc4_ = this.rouletteColItems[_loc2_];
         if(!_loc4_.success)
         {
            this.rouletteIndex = _loc2_;
            this.highlightColumn(_loc2_);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function get rouletteIndex()
   {
      return this._rouletteIndex;
   }
   function set rouletteIndex(r)
   {
      this._rouletteIndex = r;
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc3_ = this.rouletteColItems[_loc2_];
         _loc3_.highlighted = Boolean(_loc2_ == this._rouletteIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
   function winApp02(winStr)
   {
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_WIN;
      this.rouletteBarMC._visible = false;
      this.userBarMC._visible = false;
      this.gridMC._visible = false;
      this.winMC.winTF.htmlText = winStr;
      this.winMC._visible = true;
   }
   function stopApp02(retryStr)
   {
      if(this.onEnterFrame != undefined)
      {
         delete this.onEnterFrame;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc3_ = this.rouletteColItems[_loc2_];
         _loc3_.reset();
         _loc2_ = _loc2_ + 1;
      }
      this.rouletteBarMC._visible = false;
      this.userBarMC._visible = false;
      this.AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY;
      this.rouletteReplay = 1;
      this.highlightReplay(this.rouletteReplay);
      this.gridMC._visible = false;
      if(retryStr != undefined)
      {
         this.replayMC.replayTF.htmlText = retryStr;
      }
      this.replayMC._visible = true;
   }
   function highlightReplay(choice)
   {
   }
   function setColumnSpeed(gameColumnSpeedList)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.rouletteColItems.length)
      {
         var _loc4_ = this.rouletteColItems[_loc2_];
         var _loc3_ = gameColumnSpeedList[_loc2_];
         _loc4_.setColumnSpeed(_loc3_);
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
      while(_loc2_ <= 7)
      {
         var _loc3_ = this.signalMC["bar" + _loc2_ + "MC"];
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
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
               if(this.rouletteReplay == 1)
               {
                  this.startApp02();
                  _loc2_ = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_RETRY[0];
               }
               else
               {
                  _loc2_ = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_NORETRY[0];
               }
            }
            else if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
            {
               if(this.isSpinning)
               {
                  _loc2_ = this.testRoulette();
               }
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
            {
               this.stopApp02();
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
               this.highlightReplay(1);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
               this.highlightReplay(2);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
            {
               this.moveHighlightColumn(-1);
            }
            else if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
               this.highlightReplay(1);
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
            {
               this.moveHighlightColumn(1);
            }
            else if(this.AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
               this.highlightReplay(2);
            }
      }
      return _loc2_;
   }
}
