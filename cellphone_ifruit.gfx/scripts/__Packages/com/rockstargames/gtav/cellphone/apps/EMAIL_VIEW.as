class com.rockstargames.gtav.cellphone.apps.EMAIL_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
   var CONTENT;
   var advertTXD;
   var advertTop;
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
   var fromY = 1;
   var subjectY = 25;
   var bodyY = 60;
   function EMAIL_VIEW()
   {
      super();
      this.isLandscape = true;
      this.gutterHeight = 190;
      this.offsetX = -256;
      this.offsetY = -230;
      this.scrollerX = 82;
      this.contentOriginX = -256;
      this.contentOriginY = -230;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.emailViewDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      this.linkageID = "emailViewItem";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
      this.container._rotation = 90;
      _level0.TIMELINE.SET_HEADER();
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.emailViewDataProviderUI;
      var _loc16_ = "";
      var _loc3_ = "";
      var _loc5_ = "<font color=\'#2f5c73\'>";
      var _loc12_ = "<br/><img src=\'divider_line\' height=\'8\' width=\'330\'/>";
      var _loc10_ = "";
      var _loc11_;
      var _loc8_;
      var _loc9_;
      var _loc4_;
      this.content.fromAddress._y = this.fromY;
      this.content.subjectTitle._y = this.subjectY;
      this.content.messageBody._y = this.bodyY;
      _loc8_ = this.dataProviderUI[0][1];
      _loc9_ = this.dataProviderUI[0][2];
      if(_loc8_ != undefined)
      {
         this.content.fromAddress.htmlText = com.rockstargames.ui.utils.FitToTextfield.capText(this.content.fromAddress,_loc8_);
      }
      if(_loc9_ != undefined)
      {
         this.content.subjectTitle.autoSize = "left";
         this.content.subjectTitle.htmlText = _loc9_;
         this.content.messageBody._y = this.content.subjectTitle._y + this.content.subjectTitle._height + 6;
         this.bodyY = this.content.messageBody._y;
      }
      var _loc2_;
      var _loc14_;
      var _loc7_;
      var _loc6_;
      if(this.dataProviderUI.length > 0)
      {
         if(this.dataProviderUI[0][7] == true)
         {
            this.messageBody = this.dataProviderUI[0][3];
            _loc4_ = this.dataProviderUI[0][4];
            _loc3_ = this.messageBody + "<br/>";
            _loc2_ = 1;
            while(_loc2_ < this.dataProviderUI.length)
            {
               _loc3_ += this.dataProviderUI[_loc2_][0] + "<br/>";
               _loc2_ = _loc2_ + 1;
            }
            _loc3_ += "<br/>" + _loc4_ + "<br/>";
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < this.dataProviderUI.length)
            {
               _loc11_ = this.dataProviderUI[_loc2_][0];
               _loc8_ = this.dataProviderUI[_loc2_][1];
               _loc9_ = this.dataProviderUI[_loc2_][2];
               this.messageBody = this.dataProviderUI[_loc2_][3];
               _loc4_ = this.dataProviderUI[_loc2_][4];
               if(_loc2_ > 0)
               {
                  _loc3_ += _loc10_ + "<br/><br/>" + _loc5_ + _loc11_ + "<br/>" + _loc8_ + "<br/>" + _loc9_ + "<br/>";
                  _loc14_ = this.messageBody.indexOf("<FONT COLOR=");
                  if(_loc14_ != -1)
                  {
                     _loc7_ = this.messageBody.substr(_loc14_ + 1).indexOf(">");
                     _loc6_ = this.messageBody.substr(_loc14_,_loc7_ + 2);
                     this.messageBody = this.messageBody.split(_loc6_).join(_loc5_);
                  }
                  _loc4_ = _loc5_ + _loc4_;
               }
               _loc3_ += this.messageBody + "<br/>";
               _loc3_ += "<br/>" + _loc4_ + "<br/>";
               _loc10_ += _loc12_;
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      _loc3_ += "</font>";
      this.messageBody = _loc3_;
      this.messageBody = this.messageBody.split("#F0F0F0").join("#000000");
      this.messageBody = this.messageBody.split("#E1E1E1").join("#000000");
      _loc14_ = this.messageBody.indexOf("<img src=\'img://");
      var _loc15_;
      if(_loc14_ != -1)
      {
         _loc15_ = this.messageBody.substr(_loc14_ + 16).indexOf("/");
         this.TXDStr = this.messageBody.substr(_loc14_ + 16,_loc15_);
         if(this.TXDStr != "" && this.prevTXDStr != this.TXDStr)
         {
            this.prevTXDStr = this.TXDStr;
            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.TXDStr);
         }
      }
      else
      {
         this.setupMessageBody();
      }
      var _loc13_ = this.dataProviderUI[0][5];
      this.advertTop = this.dataProviderUI[0][6];
      if(_loc13_ != "" && _loc13_ != undefined)
      {
         if(this.advertTop == true || this.advertTop == undefined)
         {
            this.content.fromAddress._y = this.fromY + 86;
            this.content.subjectTitle._y = this.subjectY + 86;
            this.content.messageBody._y = this.bodyY + 86;
            this.content.background._height = this.content.messageBody._y + this.content.messageBody._height;
         }
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc13_,"EmailView",true);
      }
      else
      {
         this.TXD_HAS_LOADED(_loc13_,false,"EmailView");
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
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(success == true || success == undefined)
      {
         if(this.TXDStr == textureDict)
         {
            this.TXDStrToRemove = this.TXDStr;
            this.setupMessageBody();
            if(this.content.messageBody._y + this.content.messageBody._height > this.gutterHeight)
            {
               this.content.background._height = this.content.messageBody._y + this.content.messageBody._height;
            }
            _loc2_ = this.content._height;
            _loc4_ = _loc2_ - this.gutterHeight;
            _loc3_ = _loc4_ / _loc2_;
            this.scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3_) * this.gutterHeight);
         }
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         this.advertTXD = textureDict;
         this.LOADCLIP(textureDict,this.content.emailAdvert);
      }
      else
      {
         this.advertTXD = undefined;
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
      target_mc._width = 344;
      target_mc._height = 86;
      if(this.advertTop == true || this.advertTop == undefined)
      {
         target_mc._y = 0;
      }
      else
      {
         target_mc._y = this.content.messageBody._y + this.content.messageBody._height;
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
      if(this.advertTXD != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.advertTXD);
      }
   }
}
