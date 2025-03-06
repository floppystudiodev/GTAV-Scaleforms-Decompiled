class com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker extends MovieClip
{
   var ticks;
   var container;
   var mask;
   var onEnterFrame;
   var bg;
   var tickCount = 0;
   var speedDefault = 3;
   var speedCur = com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker.prototype.speedDefault;
   function SocialClubTicker()
   {
      super();
      this.ticks = [];
      this.container = this.createEmptyMovieClip("container",this.getNextHighestDepth());
      this.container.beginFill(16711935);
      this.container.lineTo(0,this.mask._height);
      this.container.setMask(this.mask);
   }
   function ADD_TICKER_TEXT(enum, str)
   {
      if(this.ticks.length == 0)
      {
         this.container._x = this.mask._width;
      }
      var _loc3_ = com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick(this.container.attachMovie("Tick","t" + this.tickCount++,this.container.getNextHighestDepth(),{_x:this.mask._width - this.container._x}));
      _loc3_.setLabel.apply(_loc3_,arguments);
      this.ticks.push(_loc3_);
      if(this.onEnterFrame != this.updateDisplay)
      {
         this.onEnterFrame = this.updateDisplay;
      }
   }
   function SET_TICKER_SPEED(speed)
   {
      this.speedCur = speed;
   }
   function SET_DEFAULT_SPEED()
   {
      this.speedCur = this.speedDefault;
   }
   function updateWidth(value)
   {
      var _loc2_ = this.mask._width - value;
      this.mask._width = this.bg._width = value;
      this.container._x -= _loc2_;
   }
   function updateDisplay()
   {
      this.container._x = Math.round(this.container._x - this.speedCur);
      var _loc2_ = undefined;
      if(this.ticks.length == 0)
      {
         this.container._x = this.mask._width;
         this.onEnterFrame = undefined;
         return undefined;
      }
      if(this.container._x < - this.ticks[0]._x - this.ticks[0]._width)
      {
         _loc2_ = com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick(this.ticks.shift());
         _loc2_.removeMovieClip();
         if(this.ticks.length == 0)
         {
            this.container._x = this.mask._width;
            return undefined;
         }
         var _loc5_ = this.ticks[0]._x;
         this.container._x += _loc5_;
         var _loc4_ = 0;
         while(_loc4_ < this.ticks.length)
         {
            _loc2_ = this.ticks[_loc4_];
            _loc2_._x -= _loc5_;
            _loc4_ = _loc4_ + 1;
         }
      }
      var _loc3_ = 0;
      _loc4_ = 0;
      while(_loc4_ < this.ticks.length)
      {
         _loc2_ = this.ticks[_loc4_];
         if(_loc2_._x != _loc3_)
         {
            if(_loc2_._x < _loc3_ + 1)
            {
               _loc2_._x = _loc3_;
            }
            else if(_loc2_._x - _loc3_ < this.mask._width / 3)
            {
               _loc2_._x -= (_loc2_._x - _loc3_) / 10;
            }
         }
         _loc3_ = _loc2_._x + _loc2_.tickWidth;
         _loc4_ = _loc4_ + 1;
      }
   }
}
