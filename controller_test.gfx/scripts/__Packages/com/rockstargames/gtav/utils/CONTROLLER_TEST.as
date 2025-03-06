class com.rockstargames.gtav.utils.CONTROLLER_TEST
{
   var TIMELINE;
   var CONTENT;
   var _mouseCursor;
   var _coordinatesTextfield;
   var _relativeCoordinatesTextfield;
   var _mouseButtonStatesTextfield;
   var _mouseGraph;
   var _mouseGraphUpdateCounter;
   var _mouseWheelQueue;
   var _leftTriggerMeter;
   var _rightTriggerMeter;
   var leftAnalogStickLines;
   var leftAnalogStickDots;
   var rightAnalogStickLines;
   var rightAnalogStickDots;
   var leftStickPointer;
   var rightStickPointer;
   static var INPUT_FRONTEND_DOWN = 184;
   static var INPUT_FRONTEND_UP = 185;
   static var INPUT_FRONTEND_LEFT = 186;
   static var INPUT_FRONTEND_RIGHT = 187;
   static var INPUT_FRONTEND_RDOWN = 188;
   static var INPUT_FRONTEND_RUP = 189;
   static var INPUT_FRONTEND_RLEFT = 190;
   static var INPUT_FRONTEND_RRIGHT = 191;
   static var INPUT_FRONTEND_AXIS_X = 192;
   static var INPUT_FRONTEND_AXIS_Y = 193;
   static var INPUT_FRONTEND_RIGHT_AXIS_X = 194;
   static var INPUT_FRONTEND_RIGHT_AXIS_Y = 195;
   static var INPUT_FRONTEND_PAUSE = 196;
   static var INPUT_FRONTEND_ACCEPT = 197;
   static var INPUT_FRONTEND_CANCEL = 198;
   static var INPUT_FRONTEND_X = 199;
   static var INPUT_FRONTEND_Y = 200;
   static var INPUT_FRONTEND_LB = 201;
   static var INPUT_FRONTEND_RB = 202;
   static var INPUT_FRONTEND_LT = 203;
   static var INPUT_FRONTEND_RT = 204;
   static var INPUT_FRONTEND_LS = 205;
   static var INPUT_FRONTEND_RS = 206;
   static var INPUT_FRONTEND_SELECT = 207;
   static var UNDEFINED_INPUT = -1;
   static var SCALE_MODIFIER = -5;
   static var MOUSE_WHEEL_SAMPLE_SIZE = 222;
   static var ANALOG_STICK_HISTORY_SIZE = 20;
   var MASTER_DELAY = 0.01;
   function CONTROLLER_TEST()
   {
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this._mouseCursor = this.CONTENT.MOUSECURSORBOX.CROSSHAIR;
      this._coordinatesTextfield = this.CONTENT.MOUSECURSORBOX.COORDINATES;
      this._coordinatesTextfield.outline = 5;
      this._relativeCoordinatesTextfield = this.CONTENT.MOUSECURSORBOX.REL_FOOT_COORDINATES;
      this._relativeCoordinatesTextfield.outline = 5;
      this._mouseButtonStatesTextfield = this.CONTENT.MOUSECURSORBOX.MOUSE_BUTTON_STATES;
      this._mouseButtonStatesTextfield.outline = 5;
      this._mouseGraph = this.CONTENT.MOUSECURSORBOX.GRAPH;
      this._mouseGraphUpdateCounter = 0;
      this._mouseWheelQueue = new Array(com.rockstargames.gtav.utils.CONTROLLER_TEST.MOUSE_WHEEL_SAMPLE_SIZE);
      this.SET_MOUSEBOX_VISIBLE(false);
      this._leftTriggerMeter = this.CONTENT.leftAnalogMeter;
      this._leftTriggerMeter.bar._height = this._leftTriggerMeter._height;
      this._leftTriggerMeter._visible = false;
      this._rightTriggerMeter = this.CONTENT.rightAnalogMeter;
      this._rightTriggerMeter.bar._height = this._rightTriggerMeter._height;
      this._rightTriggerMeter._visible = false;
      this.leftAnalogStickLines = [];
      this.leftAnalogStickDots = [];
      this.rightAnalogStickLines = [];
      this.rightAnalogStickDots = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE)
      {
         this.leftAnalogStickLines.push(this.CONTENT.LSTICK.historyLine.createEmptyMovieClip("l" + _loc2_,_loc2_));
         this.leftAnalogStickDots.push(this.CONTENT.LSTICK.history.attachMovie("analogStickDot","d" + _loc2_,_loc2_));
         this.rightAnalogStickLines.push(this.CONTENT.RSTICK.historyLine.createEmptyMovieClip("l" + _loc2_,_loc2_));
         this.rightAnalogStickDots.push(this.CONTENT.RSTICK.history.attachMovie("analogStickDot","d" + _loc2_,_loc2_));
         _loc2_ = _loc2_ + 1;
      }
      this.leftStickPointer = 0;
      this.rightStickPointer = 0;
   }
   function resetIcon(mc)
   {
      mc._alpha = 30;
      mc.gotoAndStop(1);
   }
   function growIcon(mc)
   {
      mc._alpha = 100;
      mc.gotoAndStop("ON");
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc,this.MASTER_DELAY,{onComplete:this.resetIcon,onCompleteScope:this,onCompleteArgs:[mc]});
   }
   function resetDpad(mc)
   {
      mc.gotoAndStop("UP");
   }
   function playDpad(mc)
   {
      mc.gotoAndStop("DOWN");
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc,this.MASTER_DELAY,{onComplete:this.resetDpad,onCompleteScope:this,onCompleteArgs:[mc]});
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER1:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_LB:
            this.growIcon(this.CONTENT.LEFTSHOULDER1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER2:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_LT:
            this.growIcon(this.CONTENT.LEFTSHOULDER2);
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER1:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_RB:
            this.growIcon(this.CONTENT.RIGHTSHOULDER1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER2:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_RT:
            this.growIcon(this.CONTENT.RIGHTSHOULDER2);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_UP:
            this.playDpad(this.CONTENT.DPAD.UP);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_DOWN:
            this.playDpad(this.CONTENT.DPAD.DOWN);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_LEFT:
            this.playDpad(this.CONTENT.DPAD.LEFT);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_RIGHT:
            this.playDpad(this.CONTENT.DPAD.RIGHT);
            break;
         case com.rockstargames.ui.game.GamePadConstants.START:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_PAUSE:
            this.growIcon(this.CONTENT.START);
            break;
         case com.rockstargames.ui.game.GamePadConstants.SELECT:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_SELECT:
            this.growIcon(this.CONTENT.SELECT);
            break;
         case com.rockstargames.ui.game.GamePadConstants.SQUARE:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_X:
            this.growIcon(this.CONTENT.SQUARE);
            break;
         case com.rockstargames.ui.game.GamePadConstants.TRIANGLE:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_Y:
            this.growIcon(this.CONTENT.TRIANGLE);
            break;
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_ACCEPT:
            this.growIcon(this.CONTENT.CROSS);
            break;
         case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_CANCEL:
            this.growIcon(this.CONTENT.CIRCLE);
            break;
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOCK:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_LS:
            this.growIcon(this.CONTENT.LEFTSTICK);
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOCK:
         case com.rockstargames.gtav.utils.CONTROLLER_TEST.INPUT_FRONTEND_RS:
            this.growIcon(this.CONTENT.RIGHTSTICK);
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, mouseX, mouseY)
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = undefined;
      var _loc7_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc10_ = undefined;
      var _loc11_ = undefined;
      if(isLeftStick)
      {
         _loc2_ = this.CONTENT.LSTICK;
         this.CONTENT.LeftXvalue.text = mouseX.toString();
         this.CONTENT.LeftYvalue.text = mouseY.toString();
         _loc5_ = mouseX / 255 * this.CONTENT.LSTICK._width * 0.9;
         _loc4_ = mouseY / 255 * this.CONTENT.LSTICK._height * 0.9;
         _loc3_ = this.leftAnalogStickLines[this.leftStickPointer];
         _loc6_ = this.leftAnalogStickDots[this.leftStickPointer];
         _loc7_ = this.leftAnalogStickDots[(this.leftStickPointer + com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE - 1) % com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE];
         this.leftStickPointer = ++this.leftStickPointer % com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE;
      }
      else
      {
         _loc2_ = this.CONTENT.RSTICK;
         this.CONTENT.RightXvalue.text = mouseX.toString();
         this.CONTENT.RightYvalue.text = mouseY.toString();
         _loc5_ = mouseX / 255 * _loc2_._width * 0.9;
         _loc4_ = mouseY / 255 * _loc2_._height * 0.9;
         _loc3_ = this.rightAnalogStickLines[this.rightStickPointer];
         _loc6_ = this.rightAnalogStickDots[this.rightStickPointer];
         _loc7_ = this.rightAnalogStickDots[(this.rightStickPointer + com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE - 1) % com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE];
         this.rightStickPointer = ++this.rightStickPointer % com.rockstargames.gtav.utils.CONTROLLER_TEST.ANALOG_STICK_HISTORY_SIZE;
      }
      _loc10_ = _loc7_._x - _loc5_;
      _loc11_ = _loc7_._y - _loc4_;
      if(_loc10_ != 0 || _loc11_ != 0)
      {
         _loc6_.gotoAndPlay("on");
         _loc6_._x = _loc5_;
         _loc6_._y = _loc4_;
         _loc3_.clear();
         _loc3_.lineStyle(0.5,11665407,50,true);
         _loc3_.moveTo(_loc2_.dot._x,_loc2_.dot._y);
         _loc3_.lineTo(_loc5_,_loc4_);
         _loc3_._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,1,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
         _loc2_.dot._x = _loc5_;
         _loc2_.dot._y = _loc4_;
      }
   }
   function SET_MOUSE_INPUT(mouseX, mouseY)
   {
      if(mouseX != 0.5 && mouseY != 0.5)
      {
         var _loc2_ = com.rockstargames.ui.utils.MathStar.toFixedRound(mouseX,4);
         var _loc3_ = com.rockstargames.ui.utils.MathStar.toFixedRound(mouseY,4);
         _loc2_ = this.clamp(_loc2_,0.0001,0.9999);
         _loc3_ = this.clamp(_loc3_,0.0001,0.9999);
         this._coordinatesTextfield.text = _loc2_ + " / " + _loc3_;
         this._mouseCursor._x = 223 * mouseX;
         this._mouseCursor._y = 115 * mouseY;
      }
   }
   function SET_RELATIVE_INPUT(scaledRelMouseX, scaledRelMouseY)
   {
      var _loc2_ = com.rockstargames.ui.utils.MathStar.toFixedRound(scaledRelMouseX,1);
      var _loc3_ = com.rockstargames.ui.utils.MathStar.toFixedRound(scaledRelMouseY,1);
      this._relativeCoordinatesTextfield.text = _loc2_ + "/" + _loc3_;
   }
   function SET_MOUSE_BUTTON_STATES(pressedButtons)
   {
      this._mouseButtonStatesTextfield.text = pressedButtons;
   }
   function SET_MOUSE_WHEEL(mouseWheel)
   {
      var _loc2_ = this._mouseGraphUpdateCounter % com.rockstargames.gtav.utils.CONTROLLER_TEST.MOUSE_WHEEL_SAMPLE_SIZE;
      this._mouseWheelQueue[_loc2_] = mouseWheel * com.rockstargames.gtav.utils.CONTROLLER_TEST.SCALE_MODIFIER;
      this._mouseGraphUpdateCounter = this._mouseGraphUpdateCounter + 1;
      this.drawMouseWheel();
   }
   function SET_MOUSEBOX_VISIBLE(value)
   {
      this.CONTENT.MOUSECURSORBOX._visible = value;
   }
   function SET_ANALOG_TRIGGER_INPUT_VISIBLE(value)
   {
      this._leftTriggerMeter._visible = value;
      this._rightTriggerMeter._visible = value;
   }
   function SET_ANALOG_TRIGGER_INPUT(isLeftTrigger, normalizedInputValue)
   {
      this.growIcon(!isLeftTrigger ? this.CONTENT.RIGHTSHOULDER2 : this.CONTENT.LEFTSHOULDER2);
      if(isLeftTrigger)
      {
         this._leftTriggerMeter.bar._height = this._leftTriggerMeter._height * normalizedInputValue;
      }
      else
      {
         this._rightTriggerMeter.bar._height = this._rightTriggerMeter._height * normalizedInputValue;
      }
   }
   function drawMouseWheel()
   {
      this._mouseGraph.clear();
      this._mouseGraph.lineStyle(1,16711680,50,false,"none","none","bevel");
      this._mouseGraph.moveTo(com.rockstargames.gtav.utils.CONTROLLER_TEST.MOUSE_WHEEL_SAMPLE_SIZE,0);
      var _loc2_ = com.rockstargames.gtav.utils.CONTROLLER_TEST.MOUSE_WHEEL_SAMPLE_SIZE;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         var _loc3_ = (_loc2_ + this._mouseGraphUpdateCounter) % com.rockstargames.gtav.utils.CONTROLLER_TEST.MOUSE_WHEEL_SAMPLE_SIZE;
         this._mouseGraph.lineTo(_loc2_,this._mouseWheelQueue[_loc3_]);
      }
   }
   function clamp(value, min, max)
   {
      return value <= max ? (value >= min ? value : min) : max;
   }
}
