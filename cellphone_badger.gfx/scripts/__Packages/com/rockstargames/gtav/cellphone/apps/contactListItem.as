class com.rockstargames.gtav.cellphone.apps.contactListItem extends MovieClip
{
   var txd;
   var thisName;
   var thumbnail;
   var gfxFileName;
   var txd_loader;
   function contactListItem()
   {
      super();
      this.txd = undefined;
   }
   function DISPLAY_CONTACT(textureDict, slotName)
   {
      this.thisName = slotName;
      if(textureDict != this.txd)
      {
         if(textureDict != "" && textureDict != undefined)
         {
            if(this.thumbnail == undefined)
            {
               this.thumbnail = this.createEmptyMovieClip("thumbnail",this.getDepth() + 1,{_alpha:0,_x:3,_y:7});
            }
            if(textureDict.substr(0,5) == "CHAR_")
            {
               com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,textureDict,this.thisName,true);
            }
            else
            {
               com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,textureDict,this.thisName);
            }
         }
      }
   }
   function REMOVE_CONTACT()
   {
      delete this.thumbnail;
      this.thumbnail.removeMovieClip();
      if(this.txd != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.txd);
         this.txd = undefined;
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success)
      {
         this.txd = textureDict;
         this.LOADCLIP(textureDict,this.thumbnail);
      }
      else
      {
         this.txd = undefined;
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success)
      {
         this.txd = textureDict;
         this.LOADCLIP(textureDict,this.thumbnail);
      }
      else
      {
         this.txd = undefined;
      }
   }
   function LOADCLIP(textureDict, targetMC)
   {
      this.txd_loader = new MovieClipLoader();
      this.txd_loader.addListener(this);
      var _loc2_ = "img://" + textureDict + "/" + textureDict;
      this.txd_loader.loadClip(_loc2_,targetMC);
   }
   function onLoadInit(target_mc)
   {
      this.txd_loader.removeListener(this);
      this.txd_loader = null;
      target_mc._x = 3;
      target_mc._y = 7;
      target_mc._width = 34;
      target_mc._height = 34;
   }
}
