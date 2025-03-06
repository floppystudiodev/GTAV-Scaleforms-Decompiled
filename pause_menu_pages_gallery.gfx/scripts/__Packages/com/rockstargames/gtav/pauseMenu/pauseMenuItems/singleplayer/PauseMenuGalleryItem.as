class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var bookmarkMC;
   var spinnerMC;
   var corruptedMC;
   var defaultMC;
   var bgMC;
   var type;
   var imageLoaderMC;
   var ic;
   var __get__data;
   var scIconMC;
   var _alpha;
   var __get__highlighted;
   var bMC;
   var index;
   var __get__columnID;
   var highlightMC;
   var _highlighted;
   static var ITEM_STATE_EMPTY = 0;
   static var ITEM_STATE_CORRUPTED = 1;
   static var ITEM_STATE_QUEUED = 2;
   static var ITEM_STATE_LOADING = 3;
   static var ITEM_STATE_LOADED = 4;
   static var ITEM_STATE_TRANSITION = 5;
   function PauseMenuGalleryItem()
   {
      super();
      this.resetDisplay();
   }
   function setBookmark(_b)
   {
      this.bookmarkMC._visible = _b;
   }
   function set data(_d)
   {
      super.data = _d;
      this.spinnerMC.stop();
      this.spinnerMC._visible = false;
      this.corruptedMC._visible = false;
      this.defaultMC._visible = false;
      this.bgMC._visible = false;
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_CORRUPTED:
            this.corruptedMC._visible = true;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_QUEUED:
            this.defaultMC._visible = true;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADING:
            this.spinnerMC.gotoAndPlay(this.spinnerMC._currentframe == 1 ? 2 : this.spinnerMC._currentframe);
            this.spinnerMC._visible = true;
            this.defaultMC._visible = true;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADED:
            this.defaultMC._visible = true;
            if(this.imageLoaderMC == undefined)
            {
               this.imageLoaderMC = com.rockstargames.ui.media.ImageLoaderMC(this.ic.attachMovie("GenericImageLoader","il",this.ic.getNextHighestDepth(),{_x:0,_y:0}));
            }
            this.ADD_TXD_REF(this.data[2],this.data[3]);
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY:
         default:
            this.bgMC._visible = true;
      }
      this.bookmarkMC._visible = Boolean(this.data[5]);
      this.scIconMC._visible = this.data[8];
      this._alpha = 100;
   }
   function fadeOutComplete()
   {
      this.defaultMC._visible = false;
   }
   function onTXDRefAdded()
   {
      this.spinnerMC._visible = false;
      this.spinnerMC.gotoAndStop(1);
      this.imageLoaderMC._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.defaultMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:0,onComplete:this.fadeOutComplete,onCompleteScope:this});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imageLoaderMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:100});
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.imageLoaderMC.isLoaded)
      {
         this.imageLoaderMC.removeTxdRef();
      }
      this.imageLoaderMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,189,106,-23);
      var _loc3_ = 5;
      var _loc2_ = String(this.imageLoaderMC).split(".");
      var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
      this.imageLoaderMC.addTxdRef(_loc4_,this.onTXDRefAdded,this);
   }
   function ON_DESTROY()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.defaultMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imageLoaderMC);
      this.imageLoaderMC.removeTxdRef();
      this.resetDisplay();
   }
   function mouseOver(b)
   {
      if(b)
      {
         if(!this.highlighted && this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY)
         {
            this.bMC._alpha = 20;
         }
      }
      else
      {
         this.bMC._alpha = 0;
      }
   }
   function mPress()
   {
      if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY)
      {
         if(!this.highlighted)
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,false);
         }
         else
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,true);
         }
      }
   }
   function resetDisplay()
   {
      this.bookmarkMC._visible = false;
      this.highlightMC._visible = false;
      this.spinnerMC._visible = false;
      this.corruptedMC._visible = false;
      this.defaultMC._visible = false;
      this.bgMC._visible = true;
      this._alpha = 100;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.corruptedMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.defaultMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlightMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      this.highlightMC._visible = this._highlighted;
   }
}
