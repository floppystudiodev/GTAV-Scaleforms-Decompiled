class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor
{
   var _x;
   var _y;
   var activeRect;
   var changeListener;
   var debugView;
   var leftReturnRect;
   var rectPool;
   var rects;
   var view;
   var xMax;
   var xMin;
   var yMax;
   var yMin;
   static var DOWN = 187;
   static var UP = 188;
   static var LEFT = 189;
   static var RIGHT = 190;
   static var STAGE_WIDTH = 2048;
   static var STAGE_HEIGHT = 1152;
   function Cursor(view, debugView)
   {
      this.view = view;
      this.debugView = debugView;
      this.xMin = 0;
      this.xMax = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_WIDTH;
      this.yMin = 0;
      this.yMax = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT;
      view._x = this._x = 0.5 * com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_WIDTH;
      view._y = this._y = 0.5 * com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT;
      this.leftReturnRect = null;
   }
   function get x()
   {
      return this._x;
   }
   function get y()
   {
      return this._y;
   }
   function setChangeListener(changeListener)
   {
      this.changeListener = changeListener;
   }
   function moveTo(x, y, absolute)
   {
      if(!absolute)
      {
         x *= com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_WIDTH;
         y *= com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT;
      }
      this.view._x = this._x = Math.min(this.xMax,Math.max(this.xMin,x));
      this.view._y = this._y = Math.min(this.yMax,Math.max(this.yMin,y));
      this.getRectUnderPoint(this._x,this._y);
   }
   function moveToRect(buttonID)
   {
      var _loc2_ = this.rects;
      while(_loc2_)
      {
         if(_loc2_.id == buttonID)
         {
            this.moveTo(_loc2_.cx,_loc2_.cy,true);
            break;
         }
         _loc2_ = _loc2_.next;
      }
   }
   function setTargetRects(rects, activeButtonIndex)
   {
      this.resetRects();
      var _loc3_ = 0;
      var _loc4_ = rects.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = rects[_loc3_];
         this.addRect(_loc2_.left,_loc2_.right,_loc2_.top,_loc2_.bottom,_loc2_.depth,_loc2_.id,_loc2_.enabled);
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = activeButtonIndex != undefined ? rects[activeButtonIndex] : rects[0];
      this.moveTo(0.5 * (_loc2_.left + _loc2_.right),0.5 * (_loc2_.top + _loc2_.bottom),true);
   }
   function getTargetIDUnderCursor()
   {
      var _loc2_ = this.getRectUnderPoint(this._x,this._y);
      return !_loc2_ ? -1 : _loc2_.id;
   }
   function setRectEnabled(id, isEnabled)
   {
      var _loc2_ = this.rects;
      while(_loc2_.id != id)
      {
         _loc2_ = _loc2_.next;
         if(!_loc2_)
         {
            return;
         }
      }
      _loc2_.enabled = isEnabled;
   }
   function dispose()
   {
      this.changeListener = null;
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
      var _loc12_ = direction == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.LEFT || direction == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.RIGHT;
      var _loc5_;
      var _loc9_;
      var _loc3_;
      var _loc6_;
      var _loc4_;
      var _loc7_ = 1.7976931348623157e+308;
      var _loc10_;
      var _loc2_ = this.rects;
      var _loc8_;
      if(direction == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.LEFT && this.leftReturnRect != null)
      {
         this.moveTo(this.leftReturnRect.cx,this.leftReturnRect.cy,true);
         this.leftReturnRect = null;
         return true;
      }
      while(_loc2_)
      {
         if(this.activeRect && this.activeRect.depth == _loc2_.depth || !_loc2_.enabled)
         {
            _loc2_ = _loc2_.next;
         }
         else
         {
            if(_loc12_)
            {
               _loc5_ = direction != com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.LEFT ? _loc2_.cx - this._x : this._x - _loc2_.cx;
               _loc3_ = _loc2_.top - this._y;
               _loc6_ = _loc2_.bottom - this._y;
               _loc8_ = 1;
            }
            else
            {
               _loc5_ = direction != com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.UP ? (_loc2_.cy - this._y + com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT) % com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT : (this._y - _loc2_.cy + com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT) % com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT;
               _loc3_ = _loc2_.left - this._x;
               _loc6_ = _loc2_.right - this._x;
               _loc8_ = 0.1;
            }
            if(_loc5_ > 0)
            {
               if((Math.floor(_loc3_) ^ Math.floor(_loc6_)) < 0)
               {
                  _loc4_ = 0;
               }
               else if(_loc3_ < 0)
               {
                  _loc4_ = _loc3_ <= _loc6_ ? - _loc6_ : - _loc3_;
               }
               else
               {
                  _loc4_ = _loc3_ <= _loc6_ ? _loc3_ : _loc6_;
               }
               if(_loc4_ / _loc5_ < _loc8_)
               {
                  if(_loc4_ < _loc7_)
                  {
                     _loc7_ = _loc4_;
                     _loc10_ = _loc2_;
                     _loc9_ = _loc5_;
                  }
                  else if(_loc4_ == _loc7_ && _loc5_ < _loc9_)
                  {
                     _loc10_ = _loc2_;
                     _loc9_ = _loc5_;
                  }
               }
            }
            _loc2_ = _loc2_.next;
         }
      }
      if(_loc10_)
      {
         if(direction == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.RIGHT)
         {
            this.leftReturnRect = this.activeRect;
         }
         this.moveTo(_loc10_.cx,_loc10_.cy,true);
         return true;
      }
      return false;
   }
   function addRect(left, right, top, bottom, depth, id, enabled)
   {
      var _loc2_ = this.rectPool || new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Rect();
      this.rectPool = _loc2_.next;
      _loc2_.left = left;
      _loc2_.right = right;
      _loc2_.top = top;
      _loc2_.bottom = bottom;
      _loc2_.cx = (left + right) / 2;
      _loc2_.cy = (top + bottom) / 2;
      _loc2_.depth = depth;
      _loc2_.id = id;
      _loc2_.enabled = enabled;
      if(this.rects)
      {
         this.rects.prev = _loc2_;
      }
      _loc2_.next = this.rects;
      this.rects = _loc2_;
   }
   function resetRects()
   {
      var _loc2_;
      if(this.rectPool)
      {
         _loc2_ = this.rectPool;
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
      this.leftReturnRect = null;
      this.activeRect = null;
   }
   function debugDraw()
   {
      for(var _loc6_ in this.debugView)
      {
         this.debugView[_loc6_].removeTextField();
      }
      this.debugView.clear();
      this.debugView.lineStyle(0,65280,80);
      var _loc2_ = this.rects;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      while(_loc2_)
      {
         _loc5_ = this.debugView.getNextHighestDepth();
         _loc4_ = this.debugView.createTextField("t" + _loc5_,_loc5_,_loc2_.left,_loc2_.top,_loc2_.right - _loc2_.left,_loc2_.bottom - _loc2_.top);
         _loc3_ = new TextFormat();
         _loc3_.font = "$Font2";
         _loc3_.size = 12;
         _loc3_.color = 65280;
         _loc4_.setNewTextFormat(_loc3_);
         _loc4_.text = _loc2_.id.toString();
         if(!_loc2_.enabled)
         {
            _loc4_.text += " DISABLED";
         }
         this.debugView.beginFill(65280,30);
         this.debugView.moveTo(_loc2_.left,_loc2_.top);
         this.debugView.lineTo(_loc2_.right,_loc2_.top);
         this.debugView.lineTo(_loc2_.right,_loc2_.bottom);
         this.debugView.lineTo(_loc2_.left,_loc2_.bottom);
         this.debugView.lineTo(_loc2_.left,_loc2_.top);
         this.debugView.endFill();
         _loc2_ = _loc2_.next;
      }
      this.view.clear();
      this.view.lineStyle(0,65280);
      this.view.moveTo(0,- com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT);
      this.view.lineTo(0,com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_HEIGHT);
      this.view.moveTo(- com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_WIDTH,0);
      this.view.lineTo(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Cursor.STAGE_WIDTH,0);
   }
}
