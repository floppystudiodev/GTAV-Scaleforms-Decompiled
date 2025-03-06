class com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var HUD_COLOURS;
   var loaderObject;
   var FILE_NAME;
   var awardMainMC;
   var CONTENT;
   var awardTitleTF;
   var awardDescriptionTF;
   var awardDescription2TF;
   var awardIconMC;
   var thisObj;
   var whichGang;
   var _texture;
   var MESSAGE_POSITION_TOP_Y = 90;
   function MP_AWARD_BASE()
   {
      super();
      var _loc4_ = [180,130,97];
      var _loc6_ = [160,160,160];
      var _loc3_ = [245,183,81];
      var _loc5_ = [166,221,190];
      this.HUD_COLOURS = [_loc4_,_loc6_,_loc3_,_loc5_];
      this.loaderObject = new Object();
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
   {
      super.SET_DISPLAY_CONFIG(_screenWidthPixels,_screenHeightPixels,_safeTopPercent,_safeBottomPercent,_safeLeftPercent,_safeRightPercent,_isWideScreen,_isHiDef);
      this.MESSAGE_POSITION_TOP_Y = this.safeTop;
   }
   function INITIALISE(mc, fileName)
   {
      this.FILE_NAME = fileName;
      super.INITIALISE(mc);
      this.awardMainMC = this.CONTENT.awardMainMC;
      this.awardMainMC.stop();
      this.awardMainMC.awardIconMC.stop();
      this.awardTitleTF = this.awardMainMC.awardTitleMC.awardTitleTF;
      this.awardDescriptionTF = this.awardMainMC.awardDescriptionMC.awardDescriptionTF;
      this.awardDescription2TF = this.awardMainMC.awardDescriptionMC.awardDescription2TF;
      this.awardIconMC = this.awardMainMC.awardIconMC;
      this.CONTENT._x = 640;
      this.CONTENT._y = this.MESSAGE_POSITION_TOP_Y;
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
         this.thisObj.awardMainMC.gotoAndPlay(1);
         this.thisObj.awardMainMC.awardIconMC.gotoAndPlay(1);
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      var _loc3_ = "img://" + txd + "/" + texture;
      this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
   }
   function SHOW_AWARD_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
   {
      trace(this.whichGang);
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
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.FILE_NAME,txd);
      }
      this.awardTitleTF.htmlText = awTitle;
      this.awardDescriptionTF.htmlText = awDesc;
      if(awDesc2 != undefined)
      {
         this.awardDescription2TF.htmlText = awDesc2;
      }
   }
   function SHOW_UNLOCK_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
   {
      trace(this.whichGang);
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
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.FILE_NAME,txd);
      }
      this.awardTitleTF.htmlText = awTitle;
      if(awDesc2 != undefined)
      {
         this.awardDescription2TF.htmlText = awDesc2;
      }
      this.awardDescriptionTF.htmlText = awDesc;
   }
   function ADD_TXD_REF_RESPONSE(textureDict, success)
   {
      if(success)
      {
         this.loadComponent(textureDict,this._texture);
      }
   }
   function OVERRIDE_Y_POSITION(newYPosition)
   {
      this.CONTENT._y = newYPosition * this.screenHeightPixels;
   }
   function debug()
   {
      this.SHOW_AWARD_AND_MESSAGE("Award","DESCRIPTION","","");
      this.awardMainMC.play();
   }
}
