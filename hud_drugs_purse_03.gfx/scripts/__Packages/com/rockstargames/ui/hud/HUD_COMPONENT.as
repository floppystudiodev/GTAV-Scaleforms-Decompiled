class com.rockstargames.ui.hud.HUD_COMPONENT extends MovieClip
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _enumID;
   var IS_PAUSED = false;
   var FADE_DURATION = 800;
   var ON_SCREEN_DURATION = 5000;
   var firstRunFlag = true;
   var MP_IS_ACTIVE = false;
   function HUD_COMPONENT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
   }
   function READY(id)
   {
      this._enumID = id;
   }
}
