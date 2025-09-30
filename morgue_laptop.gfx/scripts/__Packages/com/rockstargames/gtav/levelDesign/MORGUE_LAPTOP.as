class com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var displayConfig;
   var state;
   static var WIDTH = 1280;
   static var HEIGHT = 720;
   static var STATE_NULL = -1;
   static var STATE_PROGRESS = 0;
   static var STATE_END = 1;
   function MORGUE_LAPTOP()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "MORGUE_LAPTOP";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.CONTENT.icons._x = this.displayConfig.safeLeft * com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.WIDTH;
      this.CONTENT.speaker._x = this.displayConfig.safeRight * com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.WIDTH;
      this.state = com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.STATE_NULL;
   }
   function SET_PROGRESS_PERCENT(percent)
   {
      percent = int(percent);
      if(percent >= 100)
      {
         if(this.state != com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.STATE_END)
         {
            this.CONTENT.progress.gotoAndPlay("end");
         }
         this.CONTENT.progress.panel.bar.gotoAndStop(101);
         this.state = com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.STATE_END;
      }
      else
      {
         if(this.state != com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.STATE_PROGRESS)
         {
            this.CONTENT.progress.gotoAndPlay("begin");
         }
         this.CONTENT.progress.panel.bar.gotoAndStop(percent + 1);
         this.state = com.rockstargames.gtav.levelDesign.MORGUE_LAPTOP.STATE_PROGRESS;
      }
      this.CONTENT.progress.panel.label.text = percent + "% complete";
   }
}
