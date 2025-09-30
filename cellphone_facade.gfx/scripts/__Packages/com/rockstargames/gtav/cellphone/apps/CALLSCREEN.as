class com.rockstargames.gtav.cellphone.apps.CALLSCREEN extends MovieClip
{
   var CONTENT;
   var _callState;
   var callscreen;
   var contactMC;
   var contactTXD;
   var currentID;
   var currentStyle;
   var dataProviderUI;
   var gamertagTextFormat;
   var gfxFileName;
   var headerTextFormat;
   var txd_loader;
   var currentSelection = -1;
   var isEngaged = false;
   var offStateAlpha = 60;
   var previousContactTXD = "blank";
   var TxdhasBeenRequested = false;
   function CALLSCREEN()
   {
      super();
      _global.gfxExtensions = true;
      this.CONTENT = this;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.callscreenDataProviderUI;
      _level0.TIMELINE.SET_HEADER();
      this.callscreen = this;
      this.renderContainers();
   }
   function renderContainers()
   {
      if(this.contactMC == undefined)
      {
         this.contactMC = this.callscreen.thumbnail.createEmptyMovieClip("contact",this.callscreen.thumbnail.getNextHighestDepth());
      }
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.callscreen.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
      }
      this.populateContent();
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.callscreenDataProviderUI;
      this._callState = this.currentID;
      var _loc3_ = this.dataProviderUI[0][1];
      var _loc2_ = this.dataProviderUI[0][2];
      var _loc4_ = this.dataProviderUI[0][3];
      if(this.contactTXD != this.previousContactTXD)
      {
         if(_loc2_ != "" && _loc2_ != undefined)
         {
            if(this.contactTXD != _loc2_)
            {
               if(this.TxdhasBeenRequested == false)
               {
                  if(_loc2_.substr(0,5) == "CHAR_")
                  {
                     com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc2_,"callscreen_thumbnail",true);
                  }
                  else
                  {
                     com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc2_,"callscreen_thumbnail");
                  }
                  this.TxdhasBeenRequested = true;
                  this.previousContactTXD = this.contactTXD;
               }
            }
         }
      }
      this.callscreen.fromAddress.text = "";
      if(_loc3_)
      {
         if(_loc2_.substr(0,5) != "CHAR_" || _loc2_ == "CHAR_HUMANDEFAULT" || _loc2_ == "CHAR_DEFAULT")
         {
            this.callscreen.fromAddressCond.textAutoSize = "shrink";
            this.callscreen.fromAddressCond.text = _loc3_;
            this.callscreen.fromAddress.text = "";
         }
         else
         {
            this.callscreen.fromAddress.textAutoSize = "shrink";
            this.callscreen.fromAddress.text = _loc3_;
            this.callscreen.fromAddressCond.text = "";
         }
      }
      this.callscreen.jobTitle.text = "";
      if(_loc4_)
      {
         this.callscreen.jobTitle.text = _loc4_;
         this.callscreen.jobTitle.textAutoSize = "shrink";
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(uniqueID == "callscreen_thumbnail")
         {
            this.contactTXD = textureDict;
            this.LOADCLIP(this.contactTXD,this.contactMC);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,textureDict);
         }
      }
      else
      {
         this.contactTXD = undefined;
      }
      this.TxdhasBeenRequested = false;
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         this.contactTXD = textureDict;
         this.LOADCLIP(this.contactTXD,this.contactMC);
      }
      else
      {
         this.contactTXD = undefined;
      }
      this.TxdhasBeenRequested = false;
   }
   function get callState()
   {
      return this._callState;
   }
   function set callState(newCallState)
   {
      this._callState = newCallState;
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
      target_mc._width = 64;
      target_mc._height = 64;
      delete this.txd_loader;
   }
   function CLOSE_APP()
   {
      this.dataProviderUI = [];
      this.contactMC.removeMovieClip();
      if(this.contactTXD != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.contactTXD);
         this.contactTXD = undefined;
      }
   }
   function parseForGamerName(TF, str)
   {
      var _loc5_ = str.indexOf("<C>");
      var _loc7_ = str.indexOf("</C>");
      var _loc2_;
      var _loc4_;
      var _loc9_;
      var _loc8_;
      var _loc10_;
      if(_loc5_ != -1 && _loc7_ != -1)
      {
         _loc2_ = str.substring(0,_loc5_);
         _loc4_ = str.substring(_loc5_ + 3,_loc7_);
         _loc9_ = str.substring(_loc7_ + 4);
         TF.text = _loc2_ + _loc4_ + _loc9_;
         _loc8_ = this.headerTextFormat;
         _loc10_ = this.gamertagTextFormat;
         TF.setTextFormat(0,_loc2_.length,_loc8_);
         TF.setTextFormat(_loc2_.length,_loc2_.length + _loc4_.length,_loc10_);
         TF.setTextFormat(_loc2_.length + _loc4_.length,_loc2_.length + _loc4_.length + _loc9_.length,_loc8_);
      }
      else
      {
         TF.text = str;
      }
   }
}
