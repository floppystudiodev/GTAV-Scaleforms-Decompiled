class com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem extends MovieClip
{
   var progressBarMC;
   var nameTF;
   var iconMC;
   var valTF;
   var imgMC;
   static var TEXTURE_LENGTH = 32;
   static var PROGRESS_BAR_W = 210;
   static var PROGRESS_BAR_H = 10;
   function TransitionNewsProgressItem()
   {
      super();
      _global.gfxExtensions = true;
      this.progressBarMC = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.attachMovie("GenericColourBar","progressBarMC",this.getNextHighestDepth(),{_x:this.nameTF._x + 1,_y:this.nameTF._y + this.nameTF._height + 2}));
      this.progressBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem.PROGRESS_BAR_W,com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem.PROGRESS_BAR_H);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      this.nameTF.textAutoSize = "shrink";
      this.valTF.textAutoSize = "shrink";
   }
   function setData()
   {
      if(typeof arguments[1] == "string")
      {
         this.iconMC._visible = false;
         if(!this.imgMC)
         {
            this.imgMC = com.rockstargames.ui.media.ImageLoaderMC(this.attachMovie("GenericImageLoader","imageMC",this.getNextHighestDepth(),{_x:this.iconMC._x,_y:this.iconMC._y}));
         }
         this.imgMC.init("GTAV_ONLINE",arguments[1],arguments[1],com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem.TEXTURE_LENGTH,com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem.TEXTURE_LENGTH);
         this.imgMC.requestTxdRefWithPath(String(this.imgMC),5);
      }
      else
      {
         this.iconMC._visible = true;
         this.iconMC.gotoAndStop(2 + arguments[1]);
      }
      this.nameTF.text = arguments[2];
      this.valTF.text = arguments[3];
      this.progressBarMC.percentDecimal(arguments[4]);
   }
   function onCleanup()
   {
      if(this.imgMC.isLoaded)
      {
         this.imgMC.removeTxdRef();
      }
   }
}
