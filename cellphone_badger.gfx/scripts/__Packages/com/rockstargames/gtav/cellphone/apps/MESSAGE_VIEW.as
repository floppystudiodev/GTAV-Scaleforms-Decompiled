class com.rockstargames.gtav.cellphone.apps.MESSAGE_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
   var CONTENT;
   var contactTXD;
   var container;
   var content;
   var contentOriginX;
   var contentOriginY;
   var dataProviderUI;
   var gfxFileName;
   var gutterHeight;
   var linkageID;
   var messageBody;
   var offsetX;
   var offsetY;
   var scrollBar;
   var scrollBarTimeout;
   var scrollerX;
   var txd_loader;
   var TXDStr = "";
   var prevTXDStr = "";
   var TXDStrToRemove = "";
   var isHeistMessage = false;
   function MESSAGE_VIEW()
   {
      super();
      this.gutterHeight = 240;
      this.isLandscape = false;
      this.scrollerX = 250;
      this.offsetY = 64;
      this.offsetX = 0;
      this.contentOriginX = 0;
      this.contentOriginY = 64;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.messageViewDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      this.linkageID = "messageViewItem";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.messageViewDataProviderUI;
      var _loc2_ = this.dataProviderUI[0][0];
      this.messageBody = this.dataProviderUI[0][1];
      var _loc3_ = this.dataProviderUI[0][2];
      this.isHeistMessage = this.dataProviderUI[0][3];
      if(this.isHeistMessage)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.content.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_H);
         this.content.background._alpha = 50;
      }
      else
      {
         this.content.background._alpha = 100;
      }
      if(_loc3_ != "" && _loc3_ != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc3_,"MessageViewContact",true);
      }
      else
      {
         this.TXD_HAS_LOADED(_loc3_,false,"MessageViewContact");
      }
      this.content.fromAddress.text = "";
      this.content.fromAddressCond.text = "";
      var _loc4_;
      var _loc6_;
      var _loc9_;
      var _loc12_;
      var _loc11_;
      var _loc10_;
      var _loc8_;
      if(_loc2_ != undefined)
      {
         _loc4_ = _loc2_.indexOf("<C>");
         _loc6_ = _loc2_.indexOf("</C>");
         _loc9_ = _loc4_ != -1 && _loc6_ != -1;
         if(_loc9_)
         {
            _loc12_ = _loc2_.substring(0,_loc4_);
            _loc11_ = _loc2_.substring(_loc4_ + 3,_loc6_);
            _loc10_ = _loc2_.substring(_loc6_ + 4);
            _loc8_ = _loc12_ + _loc11_ + _loc10_;
            this.content.fromAddressCond.textAutoSize = "shrink";
            this.content.fromAddressCond.text = _loc8_;
         }
         else if(_loc3_.substr(0,5) != "CHAR_" || _loc3_ == "CHAR_HUMANDEFAULT")
         {
            this.content.fromAddressCond.textAutoSize = "shrink";
            this.content.fromAddressCond.text = _loc2_;
         }
         else
         {
            this.content.fromAddress.autoSize = "true";
            this.content.fromAddress.text = _loc2_;
            if(this.gfxFileName != "CELLPHONE_FACADE")
            {
               if(this.content.fromAddress._height > 30)
               {
                  this.content.fromAddress._y = -2;
               }
               else
               {
                  this.content.fromAddress._y = 8;
               }
            }
            else
            {
               this.content.messageBody._y = this.content.fromAddress._y + this.content.fromAddress._height;
            }
         }
      }
      var _loc7_ = this.messageBody.split("#F0F0F0");
      this.messageBody = _loc7_.join("#000000");
      _loc7_ = this.messageBody.split("#E1E1E1");
      this.messageBody = _loc7_.join("#000000");
      var _loc5_ = this.messageBody.indexOf("<img src=\'img://");
      var _loc13_;
      if(_loc5_ != -1)
      {
         _loc13_ = this.messageBody.substr(_loc5_ + 16).indexOf("/");
         this.TXDStr = this.messageBody.substr(_loc5_ + 16,_loc13_);
      }
      if(this.TXDStr != undefined && this.TXDStr != "" && this.prevTXDStr != this.TXDStr)
      {
         this.prevTXDStr = this.TXDStr;
         com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.TXDStr);
      }
      else
      {
         this.setupMessageBody();
      }
   }
   function setupMessageBody()
   {
      this.content.messageBody.autoSize = "left";
      this.content.messageBody.html = true;
      this.content.messageBody.htmlText = this.messageBody;
      if(this.content.messageBody._y + this.content.messageBody._height > this.gutterHeight)
      {
         this.content.background._height = this.content.messageBody._y + this.content.messageBody._height;
         this.needsScrollbars = true;
      }
      var _loc2_ = this.content._height;
      var _loc4_ = _loc2_ - this.gutterHeight;
      var _loc3_ = _loc4_ / _loc2_;
      this.scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3_) * this.gutterHeight);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         if(this.TXDStr == textureDict)
         {
            this.TXDStrToRemove = this.TXDStr;
            this.setupMessageBody();
         }
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(uniqueID == "MessageViewContact")
         {
            this.contactTXD = textureDict;
            this.LOADCLIP(textureDict,this.content.thumbnail);
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
      var _loc0_;
      if((_loc0_ = this.gfxFileName) !== "CELLPHONE_FACADE")
      {
         target_mc._width = 42;
         target_mc._height = 42;
      }
      else
      {
         target_mc._width = 64;
         target_mc._height = 64;
      }
      delete this.txd_loader;
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
      this.content.thumbnail.thumbnailTF.htmlText = "";
      this.content.messageBody.htmlText = "";
      this.container.removeMovieClip();
      if(this.contactTXD != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.contactTXD);
      }
      if(this.TXDStrToRemove != "")
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.TXDStrToRemove);
      }
   }
}
