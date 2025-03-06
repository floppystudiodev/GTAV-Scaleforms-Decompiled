class com.rockstargames.gtav.levelDesign.nightclub.Cursor
{
   var view;
   var debugView;
   var xMin;
   var xMax;
   var yMin;
   var yMax;
   var _x;
   var goalX;
   var _y;
   var goalY;
   var moveByTimestamp;
   var state;
   var speed;
   var changeListener;
   var tweenDuration;
   var tweenStartTimetamp;
   var tweenX0;
   var tweenY0;
   var rects;
   var activeRect;
   var rectPool;
   static var DOWN = 187;
   static var UP = 188;
   static var LEFT = 189;
   static var RIGHT = 190;
   static var STATE_ARROW = "arrow";
   static var STATE_HAND = "hand";
   static var STATE_IBEAM = "ibeam";
   static var STATE_BUSY = "busy";
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var BASE_SPEED = 16;
   static var FRAME_DURATION = 33.333333333333336;
   static var MAX_FRAME_DURATION = 2 * com.rockstargames.gtav.levelDesign.nightclub.Cursor.FRAME_DURATION;
   static var LEFT_MARGIN = 9;
   static var RIGHT_MARGIN = 12;
   static var TOP_MARGIN = 2;
   static var BOTTOM_MARGIN = 20;
   function Cursor(view, debugView, displayConfig)
   {
      this.view = view;
      this.debugView = debugView;
      this.xMin = com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_WIDTH * displayConfig.safeLeft;
      this.xMax = com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_WIDTH * displayConfig.safeRight;
      this.yMin = com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_HEIGHT * displayConfig.safeTop;
      this.yMax = com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_HEIGHT * displayConfig.safeBottom;
      if(displayConfig.safeLeft == 0)
      {
         this.xMin += com.rockstargames.gtav.levelDesign.nightclub.Cursor.LEFT_MARGIN;
      }
      if(displayConfig.safeRight == 1)
      {
         this.xMax -= com.rockstargames.gtav.levelDesign.nightclub.Cursor.RIGHT_MARGIN;
      }
      if(displayConfig.safeTop == 0)
      {
         this.yMin += com.rockstargames.gtav.levelDesign.nightclub.Cursor.TOP_MARGIN;
      }
      if(displayConfig.safeBottom == 1)
      {
         this.yMax -= com.rockstargames.gtav.levelDesign.nightclub.Cursor.BOTTOM_MARGIN;
      }
      view._x = this._x = this.goalX = 0.5 * com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_WIDTH;
      view._y = this._y = this.goalY = 0.5 * com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_HEIGHT;
      this.moveByTimestamp = 0;
      this.setSpeed(com.rockstargames.gtav.levelDesign.nightclub.Cursor.BASE_SPEED);
   }
   function get x()
   {
      return this._x;
   }
   function get y()
   {
      return this._y;
   }
   function setState(state)
   {
      if(this.state != state)
      {
         this.view.gotoAndPlay(state);
         this.state = state;
         if(state == com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_HAND)
         {
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Hover","DLC_Biker_Computer_Sounds");
         }
      }
   }
   function setSpeed(speed)
   {
      this.speed = speed;
   }
   function setChangeListener(changeListener)
   {
      this.changeListener = changeListener;
   }
   function moveTo(x, y, instant, absolute)
   {
      if(!absolute)
      {
         x *= com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_WIDTH;
         y *= com.rockstargames.gtav.levelDesign.nightclub.Cursor.STAGE_HEIGHT;
      }
      this.goalX = Math.min(this.xMax,Math.max(this.xMin,x));
      this.goalY = Math.min(this.yMax,Math.max(this.yMin,y));
      if(instant !== false)
      {
         this.view._x = this._x = this.goalX;
         this.view._y = this._y = this.goalY;
         this.updateState();
      }
      else
      {
         var _loc3_ = this.goalX - this._x;
         var _loc2_ = this.goalY - this._y;
         var _loc4_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
         this.tweenDuration = 15 * _loc4_ / this.speed;
         this.tweenStartTimetamp = getTimer();
         this.tweenX0 = this._x;
         this.tweenY0 = this._y;
         var _loc9_ = this;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,{onCompleteScope:this,onComplete:this.updatePosition});
      }
   }
   function moveBy(dx, dy)
   {
      dx = (dx - 128) / 128;
      dy = (dy - 128) / 128;
      var _loc2_ = getTimer();
      var _loc7_ = Math.min(com.rockstargames.gtav.levelDesign.nightclub.Cursor.MAX_FRAME_DURATION,_loc2_ - this.moveByTimestamp);
      var _loc3_ = this.speed * _loc7_ / com.rockstargames.gtav.levelDesign.nightclub.Cursor.FRAME_DURATION;
      this.moveByTimestamp = _loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      var _loc6_ = this._x + _loc3_ * dx;
      var _loc8_ = this._y + _loc3_ * dy;
      this._x = Math.min(this.xMax,Math.max(this.xMin,_loc6_));
      this._y = Math.min(this.yMax,Math.max(this.yMin,_loc8_));
      this.view._x = this.goalX = this._x;
      this.view._y = this.goalY = this._y;
      this.updateState();
   }
   function setTargetRects(rects)
   {
      this.resetRects();
      rects.sortOn("depth",Array.NUMERIC);
      var _loc3_ = 0;
      var _loc4_ = rects.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = rects[_loc3_];
         if(_loc2_.enabled)
         {
            this.addRect(_loc2_.left,_loc2_.right,_loc2_.top,_loc2_.bottom,_loc2_.depth,_loc2_.id);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.decomposeRects();
      this.updateState();
   }
   function getTargetIDUnderCursor()
   {
      var _loc2_ = this.getRectUnderPoint(this._x,this._y);
      return !_loc2_ ? -1 : _loc2_.id;
   }
   function dispose()
   {
      this.changeListener = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function updatePosition()
   {
      var _loc2_ = getTimer() - this.tweenStartTimetamp;
      if(_loc2_ < this.tweenDuration)
      {
         var _loc3_ = Math.sin(_loc2_ / this.tweenDuration * 3.141592653589793 * 0.5);
         this._x = (this.goalX - this.tweenX0) * _loc3_ + this.tweenX0;
         this._y = (this.goalY - this.tweenY0) * _loc3_ + this.tweenY0;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,{onCompleteScope:this,onComplete:this.updatePosition});
      }
      else
      {
         this._x = this.goalX;
         this._y = this.goalY;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      this.view._x = this._x;
      this.view._y = this._y;
      this.updateState();
   }
   function updateState()
   {
      if(this.state != com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_BUSY)
      {
         var _loc2_ = this.getRectUnderPoint(this._x,this._y);
         this.setState(!_loc2_ ? com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_ARROW : com.rockstargames.gtav.levelDesign.nightclub.Cursor.STATE_HAND);
      }
   }
   function getRectUnderPoint(x, y)
   {
      var _loc2_ = this.rects;
      var _loc3_ = this.activeRect;
      this.activeRect = null;
      while(_loc2_)
      {
         if(_loc2_.left < this._x && _loc2_.right > this._x && _loc2_.top < this._y && _loc2_.bottom > this._y)
         {
            if(this.activeRect)
            {
               if(this.activeRect.depth < _loc2_.depth)
               {
                  this.activeRect = _loc2_;
               }
            }
            else
            {
               this.activeRect = _loc2_;
            }
         }
         _loc2_ = _loc2_.next;
      }
      if(this.activeRect != _loc3_)
      {
         this.changeListener(!this.activeRect ? -1 : this.activeRect.id);
      }
      return this.activeRect;
   }
   function setTarget(direction)
   {
      var _loc11_ = direction == com.rockstargames.gtav.levelDesign.nightclub.Cursor.LEFT || direction == com.rockstargames.gtav.levelDesign.nightclub.Cursor.RIGHT;
      var _loc6_ = undefined;
      var _loc8_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc7_ = 1.7976931348623157e+308;
      var _loc9_ = undefined;
      var _loc2_ = this.rects;
      while(_loc2_)
      {
         if(this.activeRect && this.activeRect.depth == _loc2_.depth)
         {
            _loc2_ = _loc2_.next;
         }
         else
         {
            if(_loc11_)
            {
               _loc6_ = direction != com.rockstargames.gtav.levelDesign.nightclub.Cursor.LEFT ? _loc2_.cx - this._x : this._x - _loc2_.cx;
               _loc3_ = _loc2_.top - this._y;
               _loc4_ = _loc2_.bottom - this._y;
            }
            else
            {
               _loc6_ = direction != com.rockstargames.gtav.levelDesign.nightclub.Cursor.UP ? _loc2_.cy - this._y : this._y - _loc2_.cy;
               _loc3_ = _loc2_.left - this._x;
               _loc4_ = _loc2_.right - this._x;
            }
            if(_loc6_ > 0)
            {
               if((_loc3_ ^ _loc4_) < 0)
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
               if(_loc5_ < _loc7_)
               {
                  _loc7_ = _loc5_;
                  _loc9_ = _loc2_;
                  _loc8_ = _loc6_;
               }
               else if(_loc5_ == _loc7_ && _loc6_ < _loc8_)
               {
                  _loc9_ = _loc2_;
                  _loc8_ = _loc6_;
               }
            }
            _loc2_ = _loc2_.next;
         }
      }
      if(_loc9_)
      {
         this.moveTo(_loc9_.cx,_loc9_.cy,false,true);
         return true;
      }
      return false;
   }
   function decomposeRects()
   {
      var _loc2_ = this.rects;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      while(_loc2_)
      {
         _loc3_ = _loc2_.next;
         while(_loc3_)
         {
            _loc4_ = _loc3_.next;
            if(_loc2_.left < _loc3_.right && _loc2_.right > _loc3_.left && _loc2_.top < _loc3_.bottom && _loc2_.bottom > _loc3_.top)
            {
               this.decomposePair(_loc2_,_loc3_);
               this.removeRect(_loc3_);
            }
            _loc3_ = _loc4_;
         }
         _loc2_.cx = _loc2_.right + _loc2_.left >>> 1;
         _loc2_.cy = _loc2_.bottom + _loc2_.top >>> 1;
         _loc2_ = _loc2_.next;
      }
   }
   function decomposePair(rA, rB)
   {
      if(rA.left > rB.left)
      {
         this.insertRectAfter(rB,rB.left,rA.left,rB.top,rB.bottom);
      }
      if(rA.right < rB.right)
      {
         this.insertRectAfter(rB,rA.right,rB.right,rB.top,rB.bottom);
      }
      if(rA.top > rB.top)
      {
         this.insertRectAfter(rB,rB.left,rB.right,rB.top,rA.top);
      }
      if(rA.bottom < rB.bottom)
      {
         this.insertRectAfter(rB,rB.left,rB.right,rA.bottom,rB.bottom);
      }
   }
   function insertRectAfter(rect, left, right, top, bottom)
   {
      var _loc2_ = undefined;
      _loc2_ = this.rects;
      while(_loc2_)
      {
         if(_loc2_.depth == rect.depth && _loc2_.left <= left && _loc2_.right >= right && _loc2_.top <= top && _loc2_.bottom >= bottom && _loc2_ != rect)
         {
            return undefined;
         }
         _loc2_ = _loc2_.next;
      }
      _loc2_ = this.rectPool || new com.rockstargames.gtav.levelDesign.nightclub.Rect();
      this.rectPool = _loc2_.next;
      _loc2_.left = left;
      _loc2_.right = right;
      _loc2_.top = top;
      _loc2_.bottom = bottom;
      _loc2_.depth = rect.depth;
      _loc2_.id = rect.id;
      _loc2_.prev = rect;
      _loc2_.next = rect.next;
      if(rect.next)
      {
         rect.next.prev = _loc2_;
      }
      rect.next = _loc2_;
   }
   function addRect(left, right, top, bottom, depth, id)
   {
      var _loc2_ = this.rectPool || new com.rockstargames.gtav.levelDesign.nightclub.Rect();
      this.rectPool = _loc2_.next;
      _loc2_.left = left;
      _loc2_.right = right;
      _loc2_.top = top;
      _loc2_.bottom = bottom;
      _loc2_.depth = depth;
      _loc2_.id = id;
      if(this.rects)
      {
         this.rects.prev = _loc2_;
      }
      _loc2_.next = this.rects;
      this.rects = _loc2_;
   }
   function removeRect(r)
   {
      if(r.prev)
      {
         r.prev.next = r.next;
      }
      if(r.next)
      {
         r.next.prev = r.prev;
      }
      r.prev = null;
      r.next = this.rectPool;
      this.rectPool = r;
   }
   function resetRects()
   {
      if(this.rectPool)
      {
         var _loc2_ = this.rectPool;
         while(_loc2_)
         {
            if(!_loc2_.next)
            {
               _loc2_.next = this.rects;
               break;
            }
            _loc2_ = _loc2_.next;
         }
      }
      else
      {
         this.rectPool = this.rects;
      }
      this.rects = null;
   }
}
