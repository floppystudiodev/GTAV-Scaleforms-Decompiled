class com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_NEWGAME extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var GTAV_LOGO;
   var PROGRESS_INFO;
   var object;
   function LOADINGSCREEN_NEWGAME()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.initProgressBar();
      this.initLogo();
   }
   function SET_PROGRESS_BAR(percentage)
   {
      if(this.PROGRESS_INFO._visible == false)
      {
         this.PROGRESS_INFO._visible = true;
      }
      this.PROGRESS_INFO.progress_bar._xscale = percentage;
   }
   function SET_PROGRESS_TEXT(progressText)
   {
      if(this.PROGRESS_INFO._visible == false)
      {
         this.PROGRESS_INFO._visible = true;
      }
      this.PROGRESS_INFO.progressText.text = progressText;
   }
   function initProgressBar()
   {
      this.PROGRESS_INFO = this.CONTENT.attachMovie("PROGRESS_INFO","PROGRESS_INFO",this.CONTENT.getNextHighestDepth());
      this.PROGRESS_INFO._x = 96;
      this.PROGRESS_INFO._y = 636;
      this.SET_PROGRESS_BAR(0);
      this.PROGRESS_INFO._visible = false;
   }
   function initLogo()
   {
      this.GTAV_LOGO = this.CONTENT.attachMovie("GTAV_LOGO","GTAV_LOGO",this.CONTENT.getNextHighestDepth());
      this.GTAV_LOGO._x = 68;
      this.GTAV_LOGO._y = 522;
   }
   function debug()
   {
      this.CONTENT.object = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.object.getKeys();
      };
   }
   function getKeys()
   {
      if(!Key.isDown(38))
      {
         if(!Key.isDown(40))
         {
            if(!Key.isDown(32))
            {
            }
         }
      }
   }
}
