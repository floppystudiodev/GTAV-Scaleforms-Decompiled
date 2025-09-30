class com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLine
{
   var height;
   var preDelay;
   var screenHeight;
   var speed;
   var view;
   var y;
   function ScanLine(container, screenHeight)
   {
      this.screenHeight = screenHeight;
      var _loc2_ = container.getNextHighestDepth();
      this.view = container.attachMovie("scanLine","scanLine" + _loc2_,_loc2_);
      this.reset();
      this.preDelay = 0;
      this.y = 0.75 * Math.random() * screenHeight;
      this.view._y = this.y;
      this.view._height = Math.min(this.height,screenHeight - this.y);
   }
   function update()
   {
      if(--this.preDelay > 0)
      {
         return undefined;
      }
      this.y += this.speed;
      if(this.y < 0)
      {
         this.view._height = Math.max(1,this.height + this.y);
      }
      else
      {
         this.view._y = this.y;
         if(this.screenHeight - this.y < this.height)
         {
            this.view._height = Math.max(1,this.screenHeight - this.y);
         }
         else
         {
            this.view._height = this.height;
         }
      }
      if(this.y >= this.screenHeight)
      {
         this.reset();
      }
   }
   function reset()
   {
      this.height = Math.random() * 35 + 7;
      this.y = - this.height;
      this.preDelay = Math.floor(Math.random() * 600);
      var _loc2_ = Math.random() * 360 + 240;
      var _loc3_ = this.screenHeight + this.view._height;
      this.speed = _loc3_ / _loc2_;
      this.view._height = 1;
      this.view._y = 0;
   }
}
