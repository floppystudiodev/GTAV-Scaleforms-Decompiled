class com.rockstargames.gtav.cellphone.apps.BOSS_JOB_LIST_VIEW extends com.rockstargames.gtav.cellphone.apps.MESSAGE_VIEW
{
   var dataProviderUI;
   var scrollBarTimeout;
   var linkageID;
   var CONTENT;
   var messageBody;
   var content;
   var gfxFileName;
   function BOSS_JOB_LIST_VIEW()
   {
      super();
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.bossJobViewProvider;
      clearInterval(this.scrollBarTimeout);
      this.linkageID = "bossMessageViewItem";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.bossJobViewProvider;
      var _loc2_ = this.dataProviderUI[0][0];
      this.messageBody = this.dataProviderUI[0][1];
      var _loc3_ = this.dataProviderUI[0][2];
      this.messageStyle = this.dataProviderUI[0][3];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.content.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      if(_loc3_ != "" && _loc3_ != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc3_,"MessageViewContact",true);
      }
      else
      {
         this.TXD_HAS_LOADED(_loc3_,false,"MessageViewContact");
      }
      this.content.fromAddress.htmlText = "";
      this.content.fromAddressCond.htmlText = "";
      if(_loc2_ != undefined)
      {
         var _loc4_ = _loc2_.indexOf("<C>");
         var _loc6_ = _loc2_.indexOf("</C>");
         var _loc8_ = _loc4_ != -1 && _loc6_ != -1;
         if(_loc8_)
         {
            var _loc11_ = _loc2_.substring(0,_loc4_);
            var _loc10_ = _loc2_.substring(_loc4_ + 3,_loc6_);
            var _loc9_ = _loc2_.substring(_loc6_ + 4);
            var _loc7_ = _loc11_ + _loc10_ + _loc9_;
            this.content.fromAddressCond.textAutoSize = "shrink";
            this.content.fromAddressCond.htmlText = _loc7_;
         }
         else if(_loc3_.substr(0,5) != "CHAR_" || _loc3_ == "CHAR_HUMANDEFAULT")
         {
            this.content.fromAddressCond.textAutoSize = "shrink";
            this.content.fromAddressCond.htmlText = _loc2_;
         }
         else
         {
            this.content.fromAddress.autoSize = "true";
            this.content.fromAddress.htmlText = _loc2_;
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
      var _loc5_ = this.messageBody.indexOf("<img src=\'img://");
      if(_loc5_ != -1)
      {
         var _loc12_ = this.messageBody.substr(_loc5_ + 16).indexOf("/");
         this.TXDStr = this.messageBody.substr(_loc5_ + 16,_loc12_);
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
      super.setupMessageBody();
   }
}
