class com.rockstargames.gtav.levelDesign.importExportWarehouse.Scrollbar
{
   var _contentContainer;
   var _contentMask;
   var _parentOfAll;
   var _safeZoneBottom;
   var _scrollTimeDelta;
   var _updateControlsCallback;
   var _view;
   static var SCROLL_SPEED = 20;
   function Scrollbar(view, contentContainer, contentMask, updateControlsCallback, safeZoneBottom)
   {
      this._view = view;
      this._parentOfAll = this._view._parent;
      this._contentContainer = contentContainer;
      this._contentMask = contentMask;
      this._updateControlsCallback = updateControlsCallback;
      this._safeZoneBottom = safeZoneBottom;
      this._scrollTimeDelta = 0;
   }
   function scrollListFromKeyboard(direction)
   {
      var _loc3_ = getTimer();
      var _loc2_ = _loc3_ - this._scrollTimeDelta;
      _loc2_ = Math.max(16,Math.min(40,_loc2_));
      var _loc4_ = com.rockstargames.gtav.levelDesign.importExportWarehouse.Scrollbar.SCROLL_SPEED * _loc2_ / 32;
      this._scrollTimeDelta = _loc3_;
      this.scrollList((- _loc4_) * direction);
      this._view.onEnterFrame = this.delegate(this,this.scrollListFromKeyboard,direction);
   }
   function resetScroll()
   {
      this._contentContainer._y = this._contentMask._y;
      this.updateScrollbar();
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel, isSlowingDown)
   {
      var _loc4_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc4_ *= 2;
      }
      var _loc5_;
      var _loc3_;
      var _loc6_;
      if(!isLeftStick)
      {
         _loc5_ = getTimer();
         _loc3_ = _loc5_ - this._scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         _loc6_ = com.rockstargames.gtav.levelDesign.importExportWarehouse.Scrollbar.SCROLL_SPEED * _loc3_ / 32;
         this._scrollTimeDelta = _loc5_;
         this.scrollList((- _loc6_) * _loc4_);
         if(isMouseWheel)
         {
            if(y != 127)
            {
               y += 0.17 * (127 - y);
               if(Math.abs(y - 127) < 1)
               {
                  y = 127;
               }
               this._view.onEnterFrame = this.delegate(this,this.handleJoystickInput,isLeftStick,x,y,true);
            }
            else if(isSlowingDown)
            {
               delete this._view.onEnterFrame;
            }
         }
         else
         {
            delete this._view.onEnterFrame;
         }
      }
   }
   function dispose()
   {
      delete this._view.onEnterFrame;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._view);
   }
   function updateScrollbar()
   {
      var _loc2_ = this._contentMask._y + 2;
      var _loc3_ = this._contentMask._y + this._contentMask._height - 2;
      var _loc5_ = {x:0,y:this._safeZoneBottom};
      MovieClip(this._parentOfAll).globalToLocal(_loc5_);
      var _loc4_ = _loc5_.y - this._contentContainer._height;
      var _loc8_ = this._contentMask._y;
      var _loc7_ = (this._contentContainer._y - _loc4_) / (_loc8_ - _loc4_);
      var _loc9_ = Math.min(_loc2_ + this._contentMask._height,this._contentContainer._y + this._contentContainer._height);
      var _loc10_ = Math.min(1,(_loc9_ - _loc2_) / this._contentContainer._height);
      this._view._height = _loc10_ * (_loc3_ - _loc2_);
      var _loc6_ = _loc3_ - this._view._height;
      this._view._y = (1 - _loc7_) * (_loc6_ - _loc2_) + _loc2_;
      this._view._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._view,0.75,{_alpha:0,delay:0.25});
   }
   function restart()
   {
   }
   function pause(value)
   {
      if(value)
      {
         this.restart();
      }
      else
      {
         this.dispose();
      }
   }
   function scrollList(dy)
   {
      var _loc3_ = this._contentMask._y;
      var _loc2_ = {x:0,y:this._safeZoneBottom};
      MovieClip(this._parentOfAll).globalToLocal(_loc2_);
      var _loc4_ = _loc2_.y - this._contentContainer._height;
      var _loc5_ = this._contentContainer._y + dy;
      if(this._contentContainer._height > this._contentMask._height)
      {
         this._contentContainer._y = Math.max(Math.min(_loc3_,_loc5_),_loc4_);
      }
      this.updateScrollbar();
      this._updateControlsCallback();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
}
