class com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor
{
   var view;
   var bounds;
   var targets;
   var listeners;
   var activeTarget;
   var tweenArgs;
   var joystickTimestamp;
   var x;
   var y;
   var debugView;
   var debugColour;
   static var DOWN = 187;
   static var UP = 188;
   static var LEFT = 189;
   static var RIGHT = 190;
   static var ANIMATION_SPEED = 1;
   static var JOYSTICK_SPEED = 0.48;
   static var TWEEN_UPDATE_INTERVAL = 0.03333333333333333;
   static var MAX_JOYSTICK_CALL_INTERVAL = 60;
   function Cursor(view)
   {
      this.view = view;
      this.bounds = new flash.geom.Rectangle(0,0,Stage.width,Stage.height);
      this.targets = [];
      this.listeners = [];
      this.activeTarget = null;
      this.tweenArgs = {onCompleteScope:this,onComplete:this.updateTween};
      this.joystickTimestamp = getTimer();
      this.x = 0;
      this.y = 0;
   }
   function setBounds(left, right, top, bottom, addViewCompensation)
   {
      if(addViewCompensation)
      {
         var _loc4_ = this.view.getBounds(this.view);
         left -= _loc4_.xMin;
         right -= _loc4_.xMax;
         top -= _loc4_.yMin;
         bottom -= _loc4_.yMax;
      }
      this.bounds.left = left;
      this.bounds.right = right;
      this.bounds.top = top;
      this.bounds.bottom = bottom;
      this.x = this.clamp(this.x,this.bounds.left,this.bounds.right);
      this.y = this.clamp(this.y,this.bounds.top,this.bounds.bottom);
      var _loc2_ = 0;
      var _loc3_ = this.targets.length;
      while(_loc2_ < _loc3_)
      {
         this.targets[_loc2_].applyBounds(this.bounds);
         _loc2_ = _loc2_ + 1;
      }
      this.update();
   }
   function addTarget(target)
   {
      target.applyBounds(this.bounds);
      this.targets.push(target);
      this.update();
   }
   function setTargets(newTargets)
   {
      this.targets = new Array();
      var _loc4_ = newTargets.length;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = newTargets[_loc2_];
         _loc3_.applyBounds(this.bounds);
         this.targets.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.update();
   }
   function removeTarget(target)
   {
      var _loc2_ = 0;
      var _loc3_ = this.targets.length;
      while(_loc2_ < _loc3_)
      {
         if(this.targets[_loc2_] == target)
         {
            this.targets.splice(_loc2_,1);
            this.update();
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getTargetUnderCursor()
   {
      var _loc3_ = 0;
      var _loc4_ = this.targets.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.targets[_loc3_];
         if(_loc2_.enabled && this.x > _loc2_.l && this.x < _loc2_.r && this.y > _loc2_.t && this.y < _loc2_.b)
         {
            return _loc2_;
         }
         _loc3_ = _loc3_ + 1;
      }
      return null;
   }
   function snapToTargetId(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.targets.length)
      {
         if(this.targets[_loc2_].id == id)
         {
            this.snapToTarget(this.targets[_loc2_]);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function addListener(listener)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.listeners.length)
      {
         if(this.listeners[_loc2_] == null)
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.listeners[_loc2_] = listener;
      return _loc2_;
   }
   function removeListener(id)
   {
      this.listeners[id] = null;
   }
   function reset()
   {
      this.stopTween();
      this.listeners.length = 0;
      this.targets.length = 0;
      this.activeTarget = null;
      this.update();
   }
   function addDebugView(debugView, debugColour)
   {
      this.debugView = debugView;
      this.debugColour = debugColour;
      this.debugDraw();
   }
   function dispose()
   {
      this.stopTween();
      this.view = null;
      this.debugView = null;
      this.bounds = null;
      this.targets = null;
      this.listeners = null;
      this.activeTarget = null;
   }
   function moveTo(px, py)
   {
      var _loc3_ = this.clamp(px,this.bounds.left,this.bounds.right);
      var _loc2_ = this.clamp(py,this.bounds.top,this.bounds.bottom);
      this.tweenTo(_loc3_,_loc2_);
   }
   function moveToNormalised(nx, ny)
   {
      var _loc3_ = this.clamp(nx * this.bounds.width + this.bounds.left,this.bounds.left,this.bounds.right);
      var _loc2_ = this.clamp(ny * this.bounds.height + this.bounds.top,this.bounds.top,this.bounds.bottom);
      this.tweenTo(_loc3_,_loc2_);
   }
   function moveToTarget(target)
   {
      var _loc3_ = target.cx;
      var _loc2_ = target.cy;
      this.tweenTo(_loc3_,_loc2_);
   }
   function moveInDirection(direction)
   {
      var _loc2_ = this.findTargetInDirection(direction);
      if(_loc2_)
      {
         var _loc4_ = _loc2_.cx;
         var _loc3_ = _loc2_.cy;
         this.tweenTo(_loc4_,_loc3_);
      }
   }
   function joystick(dx, dy)
   {
      dx = (dx - 127) / 127;
      dy = (dy - 127) / 127;
      var _loc2_ = getTimer();
      var _loc6_ = this.clamp(_loc2_ - this.joystickTimestamp,0,com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.MAX_JOYSTICK_CALL_INTERVAL);
      var _loc3_ = com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.JOYSTICK_SPEED * _loc6_;
      this.x = this.clamp(_loc3_ * dx + this.x,this.bounds.left,this.bounds.right);
      this.y = this.clamp(_loc3_ * dy + this.y,this.bounds.top,this.bounds.bottom);
      this.joystickTimestamp = _loc2_;
      this.stopTween();
      this.update();
   }
   function snapBy(dx, dy)
   {
      this.x = this.clamp(this.x + dx,this.bounds.left,this.bounds.right);
      this.y = this.clamp(this.y + dy,this.bounds.top,this.bounds.bottom);
      this.stopTween();
      this.update();
   }
   function snapTo(px, py)
   {
      this.x = this.clamp(px,this.bounds.left,this.bounds.right);
      this.y = this.clamp(py,this.bounds.top,this.bounds.bottom);
      this.stopTween();
      this.update();
   }
   function snapToNormalised(nx, ny)
   {
      this.x = this.clamp(nx * this.bounds.width + this.bounds.left,this.bounds.left,this.bounds.right);
      this.y = this.clamp(ny * this.bounds.height + this.bounds.top,this.bounds.top,this.bounds.bottom);
      this.stopTween();
      this.update();
   }
   function snapToTarget(target)
   {
      this.x = target.cx;
      this.y = target.cy;
      this.stopTween();
      this.update();
   }
   function snapInDirection(direction)
   {
      var _loc2_ = this.findTargetInDirection(direction);
      if(_loc2_)
      {
         if(direction == com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.LEFT || direction == com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.RIGHT)
         {
            com.rockstargames.gtav.levelDesign.FIXER_APP.playSound("Nav_Left_Right");
         }
         else
         {
            com.rockstargames.gtav.levelDesign.FIXER_APP.playSound("Nav_Up_Down");
         }
         this.x = _loc2_.cx;
         this.y = _loc2_.cy;
         this.update();
      }
      else
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.playSound("Nav_Blocked");
      }
   }
   function update()
   {
      this.updateActiveTarget();
      this.updateViewPosition();
      this.debugDraw();
   }
   function updateActiveTarget()
   {
      var _loc2_ = this.getTargetUnderCursor();
      if(this.activeTarget != _loc2_)
      {
         this.activeTarget = _loc2_;
         this.notifyListeners();
      }
      this.view.gotoAndStop(!this.activeTarget ? "arrow" : "hand");
   }
   function notifyListeners()
   {
      var _loc2_ = 0;
      var _loc3_ = this.listeners.length;
      while(_loc2_ < _loc3_)
      {
         if(this.listeners[_loc2_] instanceof Function)
         {
            this.listeners[_loc2_](this.activeTarget);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateViewPosition()
   {
      this.view._x = this.x;
      this.view._y = this.y;
   }
   function tweenTo(goalX, goalY)
   {
      var _loc3_ = goalX - this.x;
      var _loc2_ = goalY - this.y;
      var _loc6_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc4_ = _loc6_ / com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.ANIMATION_SPEED;
      var _loc5_ = getTimer();
      this.updateTween(this.x,this.y,_loc3_,_loc2_,_loc4_,_loc5_);
   }
   function updateTween(startX, startY, dx, dy, duration, startTime)
   {
      var _loc3_ = this.clamp((getTimer() - startTime) / duration,0,1);
      var _loc4_ = Math.sin(_loc3_ * 3.141592653589793 * 0.5);
      this.x = dx * _loc4_ + startX;
      this.y = dy * _loc4_ + startY;
      this.update();
      if(_loc3_ < 1)
      {
         this.tweenArgs.onCompleteArgs = arguments;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.TWEEN_UPDATE_INTERVAL,this.tweenArgs);
      }
      else
      {
         this.stopTween();
      }
   }
   function stopTween()
   {
      this.tweenArgs.onCompleteArgs = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function findTargetInDirection(direction)
   {
      var _loc13_ = direction == com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.LEFT || direction == com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.RIGHT;
      var _loc6_ = undefined;
      var _loc9_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc8_ = 1.7976931348623157e+308;
      var _loc11_ = null;
      var _loc7_ = 0;
      var _loc10_ = this.targets.length;
      while(_loc7_ < _loc10_)
      {
         var _loc2_ = this.targets[_loc7_];
         if(!(!_loc2_.enabled || _loc2_ == this.activeTarget))
         {
            if(_loc13_)
            {
               _loc6_ = direction != com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.LEFT ? _loc2_.cx - this.x : this.x - _loc2_.cx;
               _loc3_ = _loc2_.t - this.y;
               _loc4_ = _loc2_.b - this.y;
            }
            else
            {
               _loc6_ = direction != com.rockstargames.gtav.levelDesign.fixerApp.ui.Cursor.UP ? _loc2_.cy - this.y : this.y - _loc2_.cy;
               _loc3_ = _loc2_.l - this.x;
               _loc4_ = _loc2_.r - this.x;
            }
            if(_loc6_ > 0)
            {
               if((Math.floor(_loc3_) ^ Math.floor(_loc4_)) < 0)
               {
                  _loc5_ = 0;
               }
               else if(_loc3_ < 0)
               {
                  _loc5_ = _loc3_ <= _loc4_ ? - _loc4_ : - _loc3_;
               }
               else
               {
                  _loc5_ = _loc3_ <= _loc4_ ? _loc3_ : _loc4_;
               }
               if(_loc5_ < _loc8_)
               {
                  _loc8_ = _loc5_;
                  _loc11_ = _loc2_;
                  _loc9_ = _loc6_;
               }
               else if(_loc5_ == _loc8_ && _loc6_ < _loc9_)
               {
                  _loc11_ = _loc2_;
                  _loc9_ = _loc6_;
               }
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc11_;
   }
   function debugDraw()
   {
      if(this.debugView)
      {
         for(var _loc8_ in this.debugView)
         {
            this.debugView[_loc8_].removeTextField();
         }
         this.debugView.clear();
         this.debugView.lineStyle(1,this.debugColour,80);
         var _loc5_ = 0;
         var _loc7_ = this.targets.length;
         while(_loc5_ < _loc7_)
         {
            var _loc2_ = this.targets[_loc5_];
            var _loc6_ = this.debugView.getNextHighestDepth();
            var _loc4_ = this.debugView.createTextField("t" + _loc6_,_loc6_,_loc2_.l,_loc2_.t,_loc2_.r - _loc2_.l,_loc2_.b - _loc2_.t);
            var _loc3_ = new TextFormat();
            _loc3_.font = "$Font2";
            _loc3_.size = 12;
            _loc3_.color = this.debugColour;
            _loc4_.setNewTextFormat(_loc3_);
            _loc4_.text = _loc2_.id.toString();
            if(_loc2_.enabled)
            {
               this.debugView.beginFill(this.debugColour,30);
            }
            else
            {
               _loc4_.text += " DISABLED";
            }
            this.debugView.moveTo(_loc2_.l,_loc2_.t);
            this.debugView.lineTo(_loc2_.r,_loc2_.t);
            this.debugView.lineTo(_loc2_.r,_loc2_.b);
            this.debugView.lineTo(_loc2_.l,_loc2_.b);
            this.debugView.lineTo(_loc2_.l,_loc2_.t);
            this.debugView.endFill();
            _loc5_ = _loc5_ + 1;
         }
         this.debugView.lineStyle(0,this.debugColour);
         this.debugView.moveTo(this.x,this.bounds.top);
         this.debugView.lineTo(this.x,this.bounds.bottom);
         this.debugView.moveTo(this.bounds.left,this.y);
         this.debugView.lineTo(this.bounds.right,this.y);
         this.debugView.lineStyle();
         this.debugView.beginFill(this.debugColour,10);
         this.debugView.moveTo(this.bounds.left,this.bounds.top);
         this.debugView.lineTo(this.bounds.right,this.bounds.top);
         this.debugView.lineTo(this.bounds.right,this.bounds.bottom);
         this.debugView.lineTo(this.bounds.left,this.bounds.bottom);
         this.debugView.lineTo(this.bounds.left,this.bounds.top);
         this.debugView.lineTo(this.bounds.left + 10,this.bounds.top + 10);
         this.debugView.lineTo(this.bounds.right - 10,this.bounds.top + 10);
         this.debugView.lineTo(this.bounds.right - 10,this.bounds.bottom - 10);
         this.debugView.lineTo(this.bounds.left + 10,this.bounds.bottom - 10);
         this.debugView.lineTo(this.bounds.left + 10,this.bounds.top + 10);
         this.debugView.endFill();
      }
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
}
