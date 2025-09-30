class com.rockstargames.gtav.pc.applications.hacking.BFColumn extends MovieClip
{
   var containerMC;
   var passwordLetter;
   var index = 0;
   var items = new Array();
   var letters = new Array();
   var itemHeight = 46;
   var itemWidth = 46;
   var letterIndex = 0;
   var letterPosY = 0;
   var letterPadding = 11;
   var wrapOffsetY = 20;
   var hitIndex = 4;
   var hitAreaY = 300;
   var hitUpper = 100;
   var hitLower = 200;
   var barHeight = 40;
   var speed = 10;
   var maxspeed = 10;
   var success = false;
   var spacingX = 12;
   var spacingY = -12;
   var rows = 8;
   var _highlighted = false;
   function BFColumn()
   {
      super();
      this.speed = (1 + Math.ceil(Math.random() * 19)) / 2;
      this.speed = Math.max(0,Math.min(this.speed,10));
   }
   function init(gridMC, columnIndex, _rows, _passwordLetter)
   {
      this.rows = _rows;
      this.index = columnIndex;
      this.passwordLetter = _passwordLetter;
      this.containerMC = gridMC.createEmptyMovieClip("dummy" + this.index,this.index);
      this.reset();
      this.letterPosY = this.gridToY(this.letterIndex);
      this.hitAreaY = this.gridToY(this.hitIndex);
      this.hitUpper = this.hitAreaY - this.spacingY - this.letterPadding - com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
      this.hitLower = this.hitAreaY - this.spacingY + this.barHeight - this.letterPadding - (this.itemHeight - 2 * this.letterPadding) + com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
      this.wrapOffsetY = this.itemHeight + this.spacingY;
      this.containerMC._x = this.index * (this.itemWidth + this.spacingX);
   }
   function setLetter(_passwordLetter)
   {
      this.passwordLetter = _passwordLetter;
      var _loc2_ = this.items[this.letterIndex];
      _loc2_.numTF.text = this.passwordLetter;
      this.letters[this.letterIndex] = this.passwordLetter;
   }
   function setColumnSpeed(columnSpeed)
   {
      var _loc2_ = columnSpeed / 10;
      _loc2_ = Math.max(0,Math.min(_loc2_,10));
      this.speed = _loc2_;
   }
   function reset()
   {
      var _loc6_ = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
      this.letterIndex = Math.floor(Math.random() * this.rows);
      this.letters = [];
      this.items = [];
      var _loc9_ = this.rows + 1;
      var _loc3_ = 0;
      var _loc2_;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      var _loc8_;
      while(_loc3_ < _loc9_)
      {
         _loc2_ = this.items[_loc3_];
         if(_loc2_ == undefined)
         {
            _loc7_ = this.index * _loc9_ + _loc3_;
            _loc2_ = this.containerMC.attachMovie("gridnum","gridnumMC" + _loc7_,_loc7_);
            _loc2_._y = _loc3_ * (_loc2_._height + this.spacingY);
         }
         _loc5_ = Math.floor(Math.random() * _loc6_.length);
         _loc4_ = _loc6_[_loc5_];
         if(_loc4_ == this.passwordLetter)
         {
            _loc8_ = _loc6_.length - 1;
            _loc5_ = Math.floor(Math.random() * _loc8_);
            if(_loc5_ > _loc6_.length - 1)
            {
               _loc5_ -= _loc6_.length;
            }
            _loc4_ = _loc6_[_loc5_];
         }
         if(this.letterIndex == _loc3_)
         {
            _loc4_ = this.passwordLetter;
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,0,0);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255);
         }
         _loc2_.numTF.text = _loc4_;
         this.letters[_loc3_] = _loc4_;
         this.items[_loc3_] = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      this.success = false;
      this.itemHeight = _loc2_._height;
      this.itemWidth = _loc2_._width;
   }
   function gridToY(i)
   {
      return i * (this.itemHeight + this.spacingY);
   }
   function update()
   {
      if(this.success == false)
      {
         this.refresh();
      }
   }
   function refresh()
   {
      this.containerMC._y += this.speed;
      this.letterPosY = this.letterIndex * this.wrapOffsetY + (this.wrapOffsetY - Math.abs(this.containerMC._y));
      var _loc5_;
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(this.containerMC._y > 0)
      {
         _loc5_ = String(this.letters.pop());
         this.letters.splice(0,0,_loc5_);
         this.letterIndex = this.letterIndex + 1;
         if(this.letterIndex > this.items.length - 1)
         {
            this.letterIndex = 0;
         }
         _loc2_ = 0;
         while(_loc2_ < this.items.length)
         {
            _loc3_ = this.items[_loc2_];
            _loc4_ = this.letters[_loc2_];
            _loc3_.numTF.text = _loc4_;
            if(this.letterIndex == _loc2_)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_,255,0,0);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_,255,255,255);
            }
            _loc2_ = _loc2_ + 1;
         }
         this.containerMC._y += - this.wrapOffsetY;
      }
   }
   function set highlighted(h)
   {
      this._highlighted = h;
   }
   function get highlighted()
   {
      return this._highlighted;
   }
   function testHit()
   {
      if(this.letterPosY >= this.hitUpper && this.letterPosY < this.hitLower)
      {
         this.success = true;
         if(this.letterIndex < this.hitIndex)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.containerMC,0.2,{_y:- this.gridToY(0)});
            com.rockstargames.ui.utils.Colour.Colourise(this.items[3],0,255,0);
         }
         else if(this.letterIndex >= this.hitIndex)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.containerMC,0.2,{_y:- this.gridToY(1)});
            com.rockstargames.ui.utils.Colour.Colourise(this.items[4],0,255,0);
         }
         return true;
      }
      return false;
   }
}
