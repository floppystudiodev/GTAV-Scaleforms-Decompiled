class com.rockstargames.gtav.cellphone.apps.EMAIL_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var CONTENT;
   var TextBlackHex;
   var TextWhiteHex;
   var additionalIcon;
   var arrayStartPoint;
   var container;
   var currentStyle;
   var dataProviderUI;
   var defaultRowHeight;
   var getRowAsPercentage;
   var gfxFileName;
   var gutterHeight;
   var isLandscape;
   var linkageID;
   var numberOfVisibleRows;
   var offWhiteRGB;
   var offsetX;
   var offsetY;
   var readIcon;
   var replyIcon;
   var row;
   var scrollBar;
   var scrollerX;
   var unreadIcon;
   var whiteRGB;
   function EMAIL_LIST()
   {
      super();
      this.unreadIcon = com.rockstargames.gtav.cellphone.IconLabels.UNREAD_EMAIL[1];
      this.readIcon = com.rockstargames.gtav.cellphone.IconLabels.READ_EMAIL[1];
      this.replyIcon = com.rockstargames.gtav.cellphone.IconLabels.REPLY_EMAIL[1];
      this.additionalIcon = com.rockstargames.gtav.cellphone.IconLabels.ATTACHMENT[1];
      this.CONTENT = this;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.emailListDataProviderUI;
      this.numberOfVisibleRows = 3;
      this.linkageID = "inboxListItem";
      this.numberOfVisibleRows = 3;
      this.isLandscape = true;
      this.defaultRowHeight = 50;
      this.gutterHeight = 150;
      this.offsetX = -256;
      this.offsetY = -192;
      this.scrollerX = 82;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
      this.container._rotation = 90;
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.emailListDataProviderUI;
      this.container._y = 256;
      this.CONTENT.messageTF.autoSize = "center";
      this.CONTENT.messageTF.text = "";
      this.row = 1;
      var _loc4_ = 0;
      var _loc9_ = 0;
      var _loc11_ = "";
      var _loc5_;
      var _loc2_;
      var _loc7_;
      var _loc6_;
      var _loc8_;
      var _loc3_;
      var _loc10_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc5_ = 0;
         while(_loc5_ < this.numberOfVisibleRows)
         {
            _loc2_ = "listItem" + this.row;
            if(_loc5_ + this.arrayStartPoint >= this.dataProviderUI.length)
            {
               _loc4_ = _loc9_;
               _loc9_ = _loc9_ + 1;
            }
            else
            {
               _loc4_ = _loc5_ + this.arrayStartPoint;
            }
            _loc7_ = this.dataProviderUI[_loc4_][0];
            _loc6_ = this.dataProviderUI[_loc4_][1];
            _loc8_ = this.dataProviderUI[_loc4_][2];
            _loc3_ = this.dataProviderUI[_loc4_][3];
            if(_loc6_ == true)
            {
               this.container[_loc2_].attachmentIcon._visible = true;
            }
            else
            {
               this.container[_loc2_].attachmentIcon._visible = false;
            }
            this.container[_loc2_].icon.gotoAndStop(_loc7_ + 1);
            _loc3_.split("<BR>").join(" ");
            _loc3_.split("</BR>").join(" ");
            _loc3_.split("<BR/>").join(" ");
            _loc3_.split("<br>").join(" ");
            _loc3_.split("</br>").join(" ");
            _loc3_.split("<br/>").join(" ");
            this.container[_loc2_].fromAddress.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc2_].fromAddress,_loc8_);
            this.container[_loc2_].subjectTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc2_].subjectTitle,_loc3_);
            this.row = this.row + 1;
            _loc5_ = _loc5_ + 1;
         }
         _loc10_ = this.getRowAsPercentage(this.arrayStartPoint + 1);
         this.scrollBar.scrollToPercentage(_loc10_);
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_230",this.CONTENT.messageTF);
      }
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_BADGER")
         {
            if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
               com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
               item.fromAddress.textColor = this.TextWhiteHex;
               item.subjectTitle.textColor = this.TextWhiteHex;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2]);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
               com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
               item.fromAddress.textColor = this.TextBlackHex;
               item.subjectTitle.textColor = 6316128;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
            com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
            item.fromAddress.textColor = this.TextWhiteHex;
            item.subjectTitle.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2]);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2]);
            item.fromAddress.textColor = this.TextBlackHex;
            item.subjectTitle.textColor = 6316128;
         }
      }
   }
}
