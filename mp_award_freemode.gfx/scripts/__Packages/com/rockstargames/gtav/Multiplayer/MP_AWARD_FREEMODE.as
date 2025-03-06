class com.rockstargames.gtav.Multiplayer.MP_AWARD_FREEMODE extends com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE
{
   var FILE_NAME;
   var awardMainMC;
   var CONTENT;
   var awardTitleTF;
   var awardDescriptionTF;
   var awardDescription2TF;
   var awardIconMC;
   var TIMELINE;
   var loaderObject;
   var thisObj;
   var _texture;
   var HUD_COLOURS;
   function MP_AWARD_FREEMODE()
   {
      super();
   }
   function INITIALISE(mc, fileName)
   {
      this.FILE_NAME = fileName;
      super.INITIALISE(mc,this.FILE_NAME);
      this.awardMainMC = this.CONTENT.attachMovie("MASTER_AWARDS_DOBULE_LINE","MASTER_AWARDS_DOBULE_LINE",this.CONTENT.getNextHighestDepth());
      this.awardMainMC._visible = false;
      this.awardTitleTF = this.awardMainMC.BIG_TEXT;
      this.awardDescriptionTF = this.awardMainMC.AWARD_TITLE;
      this.awardDescription2TF = this.awardMainMC.AWARD_TEXT;
      this.awardIconMC = this.awardMainMC.awardIconMC;
      this.CONTENT._x = 640;
      this.CONTENT._y = 0;
   }
   function RESET_AWARDS_MOVIE()
   {
      if(typeof this.CONTENT == "movieclip")
      {
         this.CONTENT.removeMovieClip();
         this.INITIALISE(this.TIMELINE,this.FILE_NAME);
      }
   }
   function loadComponent(txd, texture)
   {
      var thisObj = this;
      this.loaderObject._depth = 100;
      this.loaderObject._mc = this.awardIconMC.AwardIconInnerMC;
      this.loaderObject._loader = new MovieClipLoader();
      this.loaderObject._listener = new Object();
      this.loaderObject._loader.addListener(this.loaderObject._listener);
      this.loaderObject._listener.thisObj = thisObj;
      this.loaderObject._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.loaderObject;
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      var _loc3_ = "img://" + txd + "/" + texture;
      this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
   }
   function SHOW_AWARD_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum, awDesc3)
   {
      if(txd != undefined && texture != undefined)
      {
         if(txd != "" && texture != "")
         {
            this._texture = texture;
            switch(colEnum)
            {
               case 107:
                  com.rockstargames.ui.utils.Colour.Colourise(this.awardIconMC,this.HUD_COLOURS[0][0],this.HUD_COLOURS[0][1],this.HUD_COLOURS[0][2],100);
                  break;
               case 108:
                  com.rockstargames.ui.utils.Colour.Colourise(this.awardIconMC,this.HUD_COLOURS[1][0],this.HUD_COLOURS[1][1],this.HUD_COLOURS[1][2],100);
                  break;
               case 109:
                  com.rockstargames.ui.utils.Colour.Colourise(this.awardIconMC,this.HUD_COLOURS[2][0],this.HUD_COLOURS[2][1],this.HUD_COLOURS[2][2],100);
                  break;
               case 110:
                  com.rockstargames.ui.utils.Colour.Colourise(this.awardIconMC,this.HUD_COLOURS[3][0],this.HUD_COLOURS[3][1],this.HUD_COLOURS[3][2],100);
            }
            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MP_AWARD_FREEMODE",txd);
         }
      }
      if(awDesc2 == undefined)
      {
         awDesc2 = "";
      }
      if(awDesc3 != "" && awDesc3 != undefined)
      {
         if(awDesc2 == "")
         {
            awDesc2 = awDesc3;
         }
         else
         {
            awDesc2 = awDesc2 + " " + awDesc3;
         }
      }
      this.awardTitleTF.htmlText = awTitle;
      this.awardDescriptionTF.htmlText = awDesc;
      this.awardDescription2TF.htmlText = awDesc2;
      this.awardMainMC._visible = true;
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueStr, success)
   {
      if(success)
      {
         this.loadComponent(textureDict,this._texture);
      }
   }
   function debug()
   {
      this.SHOW_AWARD_AND_MESSAGE("Award","DESCRIPTION","","","",1,"line 3");
   }
}
