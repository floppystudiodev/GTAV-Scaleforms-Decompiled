class com.rockstargames.gtav.store.StoreContentImageItem extends MovieClip
{
   var imageHeight;
   var picMC;
   var target;
   var txd;
   var txd_loader;
   var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
   function StoreContentImageItem()
   {
      super();
      this.picMC = this.picMC;
      this.txd = undefined;
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success, _imageHeight)
   {
      this.imageHeight = _imageHeight;
      if(success == true)
      {
         if(textureDict == this.txd)
         {
            this.LOADCLIP(textureDict);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,textureDict);
         }
      }
   }
   function LOADCLIP(textureDict)
   {
      this.target = this.picMC[textureDict];
      var _loc3_;
      if(this.target == undefined)
      {
         this.target = this.picMC.createEmptyMovieClip(textureDict,this.picMC.getNextHighestDepth());
         this.txd_loader = new MovieClipLoader();
         this.txd_loader.addListener(this);
         _loc3_ = "img://" + textureDict + "/" + textureDict;
         this.txd_loader.loadClip(_loc3_,this.target);
      }
   }
   function onLoadInit(target_mc)
   {
      target_mc._width = 288;
      target_mc._height = this.imageHeight;
      target_mc._visible = true;
      this.txd_loader.removeListener(this);
      this.txd_loader = null;
   }
   function REMOVE_PIC()
   {
      if(this.txd != undefined)
      {
         this.picMC[this.txd].removeMovieClip();
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.txd);
         this.txd = undefined;
      }
   }
}
