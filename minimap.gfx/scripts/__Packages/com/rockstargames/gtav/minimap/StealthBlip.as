class com.rockstargames.gtav.minimap.StealthBlip extends MovieClip
{
   var onEnterFrame;
   function StealthBlip()
   {
      super();
      this.onEnterFrame = mx.utils.Delegate.create(this,this.mainLoop);
   }
   function mainLoop()
   {
      if(this._currentframe >= this._totalframes)
      {
         this.killSelf();
      }
   }
   function killSelf()
   {
      this.removeMovieClip();
   }
}
