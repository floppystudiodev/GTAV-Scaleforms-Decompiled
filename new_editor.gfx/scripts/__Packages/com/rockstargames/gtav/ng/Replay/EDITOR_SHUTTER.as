class com.rockstargames.gtav.ng.Replay.EDITOR_SHUTTER extends MovieClip
{
   var blade0;
   var blade1;
   function EDITOR_SHUTTER()
   {
      super();
      this.goTo("openState");
   }
   function OPEN_SHUTTER()
   {
      this.goTo("openShutter");
   }
   function CLOSE_SHUTTER()
   {
      this.goTo("closeShutter");
   }
   function CLOSE_THEN_OPEN_SHUTTER()
   {
      this.goTo("close_then_open");
   }
   function goTo(whichFrame)
   {
      if(this.blade0 != undefined)
      {
         this.blade0.gotoAndPlay(whichFrame);
      }
      if(this.blade1 != undefined)
      {
         this.blade1.gotoAndPlay(whichFrame);
      }
   }
}
