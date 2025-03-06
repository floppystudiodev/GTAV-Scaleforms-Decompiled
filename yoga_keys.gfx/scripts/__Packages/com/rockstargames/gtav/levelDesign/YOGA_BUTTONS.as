class com.rockstargames.gtav.levelDesign.YOGA_BUTTONS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var BOUNDING_BOX;
   var CONTENT;
   var myColour;
   var container;
   var buttonWidth = 64;
   var buttonSpacing = 360;
   var maxButtons = 8;
   var buttonList = new Array();
   var analogList = new Array();
   var angleList = new Array();
   var containerFlag = false;
   var keysIndex = -1;
   var fadeSpeed = 0.4;
   var scaleMid = 100;
   var scaleMin = 10;
   var scaleMax = 120;
   var colGrey = [55,53,53];
   var colBlue = [88,169,199];
   var colRed = [201,86,86];
   var colYellow = [247,228,137];
   var keyrepeatDelay = 4;
   var percent = 0;
   var percent2 = 0;
   var _shouldUseFill = false;
   function YOGA_BUTTONS()
   {
      super();
      this.buttonList = new Array();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.buttonList = [];
      this.analogList = [];
      this.angleList = [null,null];
      var _loc4_ = this.buttonSpacing / 16;
      var _loc9_ = this.buttonWidth / 2;
      var _loc3_ = this.BOUNDING_BOX._height / 2 - 32 + 2;
      var _loc6_ = this.CONTENT.attachMovie("stickL","stick0MC",this.CONTENT.getNextHighestDepth(),{_x:this.BOUNDING_BOX._width / 2 - this.buttonWidth - _loc4_,_y:_loc3_});
      var _loc5_ = this.CONTENT.attachMovie("stickR","stick1MC",this.CONTENT.getNextHighestDepth(),{_x:this.BOUNDING_BOX._width / 2 + _loc4_,_y:_loc3_});
      this.analogList = [_loc6_,_loc5_];
      this.myColour = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YOGA,this.myColour);
   }
   function REPLACE_STICK_WITH_KEYS(buttonID)
   {
      if(this.keysIndex != -1)
      {
         return undefined;
      }
      var _loc3_ = "stick" + buttonID + "MC";
      var _loc4_ = this.buttonSpacing / 16;
      var _loc6_ = buttonID != 0 ? _loc4_ : - this.buttonWidth - _loc4_;
      var _loc5_ = this.BOUNDING_BOX._height / 2 - 32 + 2;
      this.CONTENT[_loc3_].removeMovieClip();
      this.analogList[buttonID] = this.CONTENT.attachMovie("stickButtons",_loc3_,this.CONTENT.getNextHighestDepth(),{_x:this.BOUNDING_BOX._width / 2 + _loc6_,_y:_loc5_});
      this.keysIndex = buttonID;
      if(this.angleList[buttonID] != null)
      {
         this.SET_STICK_ANGLE(buttonID,this.angleList[buttonID]);
      }
   }
   function REPLACE_KEYS_WITH_STICK(buttonID)
   {
      if(this.keysIndex != buttonID)
      {
         return undefined;
      }
      var _loc5_ = buttonID != 0 ? "stickR" : "stickL";
      var _loc3_ = "stick" + buttonID + "MC";
      var _loc4_ = this.buttonSpacing / 16;
      var _loc7_ = buttonID != 0 ? _loc4_ : - this.buttonWidth - _loc4_;
      var _loc6_ = this.BOUNDING_BOX._height / 2 - 32 + 2;
      this.CONTENT[_loc3_].removeMovieClip();
      this.analogList[buttonID] = this.CONTENT.attachMovie(_loc5_,_loc3_,this.CONTENT.getNextHighestDepth(),{_x:this.BOUNDING_BOX._width / 2 + _loc7_,_y:_loc6_});
      this.keysIndex = -1;
      if(this.angleList[buttonID] != null)
      {
         this.SET_STICK_ANGLE(buttonID,this.angleList[buttonID]);
      }
   }
   function ADD_BUTTON_TO_LIST(buttonID)
   {
      this.buttonList.push(buttonID);
   }
   function DRAW_BUTTONS()
   {
      if(this.containerFlag)
      {
         this.REMOVE_BUTTONS();
      }
      this.container = this.CONTENT.createEmptyMovieClip("container",this.CONTENT.getNextHighestDepth());
      this.containerFlag = true;
      var _loc3_ = 0;
      while(_loc3_ < this.buttonList.length)
      {
         var _loc4_ = "BUTTON_" + this.buttonList[_loc3_];
         var _loc2_ = this.container.attachMovie(_loc4_,_loc4_,this.container.getNextHighestDepth(),{_x:this.buttonSpacing * _loc3_});
         _loc2_.targetMC.target1._alpha = 0;
         _loc2_.targetMC.target2._alpha = 0;
         _loc2_.stateMC._xscale = _loc2_.stateMC._yscale = this.scaleMin;
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.stateMC,this.colGrey[0],this.colGrey[1],this.colGrey[2]);
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.instructionMC,this.colYellow[0],this.colYellow[1],this.colYellow[2]);
         this.buttonList[_loc3_] = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      var _loc6_ = (this.buttonList.length - 1) * this.buttonSpacing + this.buttonWidth;
      this.container._x = this.BOUNDING_BOX._width / 2 - _loc6_ / 2;
      this.container._y = this.BOUNDING_BOX._height / 2 - 32 + 2;
   }
   function REMOVE_BUTTONS(buttonID)
   {
      this.container.removeMovieClip();
      this.container = null;
      this.containerFlag = false;
      this.buttonList = new Array();
   }
   function SET_BUTTON_TARGET(buttonID, targetScale, whichTarget, r, g, b, a)
   {
      var _loc3_ = this.container["BUTTON_" + buttonID];
      var _loc2_ = _loc3_.targetMC["target" + whichTarget];
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_,r,g,b,a);
      _loc2_._xscale = targetScale;
      _loc2_._yscale = targetScale;
   }
   function SET_HOLD_TIMER(timePercent)
   {
      var _loc3_ = Math.max(0,Math.min(timePercent,100));
      if(this.buttonList.length > 0)
      {
         var _loc4_ = 0;
         var _loc2_ = undefined;
         for(_loc4_ in this.buttonList)
         {
            _loc2_ = this.buttonList[_loc4_];
            _loc2_.playerInputMC.percentMC._visible = this._shouldUseFill;
            _loc2_.playerInputMC.percentMC.gotoAndStop(_loc3_ + 1);
            _loc2_.playerInputMC.percentMCOutline.gotoAndStop(_loc3_ + 1);
         }
      }
   }
   function SET_PLAYER_INPUT_COLOUR(buttonID, r, g, b, a)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_.playerInputMC,r,g,b,a);
   }
   function SET_OUT_RING_TIMER_COLOUR(buttonID, r, g, b, a)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_.timeBar,r,g,b,a);
   }
   function SET_OUT_RING_TIMER(buttonID, percent)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      _loc2_.timeBar.gotoAndStop(percent);
   }
   function SET_INFO_TIMER(timePercent)
   {
   }
   function SET_STICK_POINTER_ANGLE(buttonID, arAngle)
   {
      var _loc2_ = this.analogList[buttonID];
      _loc2_.arrowMC._rotation = arAngle;
      if(_loc2_.arrowMC._alpha == 0)
      {
         _loc2_.arrowMC._alpha = 100;
      }
   }
   function SET_STICK_POINTER_RGB(buttonID, r, g, b)
   {
      var _loc2_ = this.analogList[buttonID];
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_.arrowMC,r,g,b);
   }
   function SET_STICK_ANGLE(buttonID, arAngle)
   {
      var _loc5_ = buttonID != this.keysIndex;
      var _loc2_ = this.analogList[buttonID];
      this.angleList[buttonID] = arAngle;
      if(_loc5_)
      {
         arAngle -= 90;
         var _loc4_ = 8;
         var _loc8_ = Math.cos(arAngle * 3.141592653589793 / 180) * _loc4_;
         var _loc7_ = Math.sin(arAngle * 3.141592653589793 / 180) * _loc4_;
         _loc2_.stickMC.innerMC._x = _loc8_;
         _loc2_.stickMC.innerMC._y = _loc7_;
      }
      else
      {
         _loc2_.stickMC.keyW.gotoAndStop(!this.angleIsCloseTo(arAngle,0,45) ? 1 : 2);
         _loc2_.stickMC.keyA.gotoAndStop(!this.angleIsCloseTo(arAngle,270,45) ? 1 : 2);
         _loc2_.stickMC.keyS.gotoAndStop(!this.angleIsCloseTo(arAngle,180,45) ? 1 : 2);
         _loc2_.stickMC.keyD.gotoAndStop(!this.angleIsCloseTo(arAngle,90,45) ? 1 : 2);
      }
   }
   function angleIsCloseTo(angleA, angleB, maxDelta)
   {
      var _loc1_ = ((angleB - angleA) % 360 + 360) % 360;
      if(_loc1_ > 180)
      {
         _loc1_ = 360 - _loc1_;
      }
      return _loc1_ <= maxDelta;
   }
   function BUTTON_PRESSED(buttonID, buttonPercent)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      _loc2_.playerInputMC.percentMC._visible = this._shouldUseFill;
      _loc2_.playerInputMC.percentMC.gotoAndStop(1);
      _loc2_.playerInputMC.percentMCOutline.gotoAndStop(1);
      _loc2_.instructionMC.percentMC._visible = this._shouldUseFill;
      _loc2_.instructionMC.percentMC.gotoAndStop(1);
      _loc2_.instructionMC.percentMCOutline.gotoAndStop(1);
      _loc2_.stateMC._xscale = _loc2_.stateMC._yscale = this.scaleMin;
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_.stateMC,this.colGrey[0],this.colGrey[1],this.colGrey[2]);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.stateMC,this.fadeSpeed,{_xscale:this.scaleMid,_yscale:this.scaleMid,_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT});
      _loc2_.buttonMC.gotoAndStop(2);
   }
   function BUTTON_DEPRESSED(buttonID)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      _loc2_.stateMC._xscale = _loc2_.stateMC._yscale = this.scaleMin;
      _loc2_.stateMC._alpha = 0;
      _loc2_.buttonMC.gotoAndStop(1);
   }
   function BUTTON_STATE(buttonID, buttonState)
   {
      var _loc2_ = this.container["BUTTON_" + buttonID];
      switch(buttonState)
      {
         case 0:
            this.ButtonReset(_loc2_);
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_.playerInputMC,255,255,255);
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_.stateMC,this.colGrey[0],this.colGrey[1],this.colGrey[2]);
            break;
         case 1:
            this.ButtonReset(_loc2_);
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_.stateMC,this.colRed[0],this.colRed[1],this.colRed[2]);
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.stateMC,this.fadeSpeed,{delay:1,_xscale:this.scaleMin,_yscale:this.scaleMin,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
            break;
         case 2:
            this.ButtonReset(_loc2_);
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_.stateMC,this.colBlue[0],this.colBlue[1],this.colBlue[2]);
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.stateMC,this.fadeSpeed,{delay:1,_xscale:this.scaleMax,_yscale:this.scaleMax,_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      }
   }
   function ButtonReset(button)
   {
      button.stateMC._xscale = button.stateMC._yscale = this.scaleMid;
      button.playerInputMC._xscale = button.playerInputMC._yscale = this.scaleMid;
      button.stateMC._alpha = 100;
      button.playerInputMC._alpha = 100;
      button.instructionMC._alpha = 100;
      button.playerInputMC.percentMC._visible = this._shouldUseFill;
      button.playerInputMC.percentMC.gotoAndStop(1);
      button.instructionMC.percentMC._visible = this._shouldUseFill;
      button.instructionMC.percentMC.gotoAndStop(1);
      button.instructionMC.percentMCOutline.gotoAndStop(1);
   }
   function TOGGLE_INPUT_FILL(shouldUseFill)
   {
      this._shouldUseFill = shouldUseFill;
   }
   function SET_STICK_POINTER_HIGHLIGHT_ANGLE(buttonID, arAngle)
   {
      this.SET_STICK_ANGLE(buttonID,arAngle);
   }
   function HIDE_STICK_POINTER(buttonID)
   {
      var _loc2_ = this.analogList[buttonID];
      var _loc3_ = buttonID != this.keysIndex;
      if(_loc3_)
      {
         _loc2_.stickMC.innerMC._x = 0;
         _loc2_.stickMC.innerMC._y = 0;
      }
      else
      {
         _loc2_.stickMC.keyW.gotoAndStop(1);
         _loc2_.stickMC.keyA.gotoAndStop(1);
         _loc2_.stickMC.keyS.gotoAndStop(1);
         _loc2_.stickMC.keyD.gotoAndStop(1);
      }
   }
}
