class com.rockstargames.gtav.cellphone.apps.MESSAGE_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var CONTENT;
   var TextBlackHex;
   var TextWhiteHex;
   var container;
   var currentStyle;
   var darkGreyRGB;
   var dataProviderUI;
   var gamertagTextFormat;
   var gfxFileName;
   var headerTextFormat;
   var linkageID;
   var offWhiteRGB;
   var row;
   var scrollBar;
   var whiteRGB;
   function MESSAGE_LIST()
   {
      super();
      this.headerTextFormat = new TextFormat();
      this.headerTextFormat.font = "$Font2";
      this.headerTextFormat.size = 25;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      this.headerTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
      this.gamertagTextFormat = new TextFormat();
      this.gamertagTextFormat.font = "$Font2_cond";
      this.gamertagTextFormat.size = 26;
      this.gamertagTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.messageListDataProviderUI;
      this.linkageID = "messageListItem";
      this.numberOfVisibleRows = 5;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.messageListDataProviderUI;
      this.CONTENT.messageTF.autoSize = "center";
      this.CONTENT.messageTF.text = "";
      this.row = 1;
      var _loc4_ = 0;
      var _loc14_ = 0;
      var _loc6_;
      var _loc3_;
      var _loc8_;
      var _loc7_;
      var _loc13_;
      var _loc10_;
      var _loc2_;
      var _loc12_;
      var _loc5_;
      var _loc11_;
      var _loc9_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc6_ = 0;
         while(_loc6_ < this.numberOfVisibleRows)
         {
            _loc3_ = "listItem" + this.row;
            if(_loc6_ + this.arrayStartPoint >= this.dataProviderUI.length)
            {
               _loc4_ = _loc14_;
               _loc14_ = _loc14_ + 1;
            }
            else
            {
               _loc4_ = _loc6_ + this.arrayStartPoint;
            }
            _loc8_ = String(this.dataProviderUI[_loc4_][0]);
            _loc7_ = String(this.dataProviderUI[_loc4_][1]);
            _loc12_ = false;
            if(typeof this.dataProviderUI[_loc4_][2] == "number")
            {
               _loc13_ = this.dataProviderUI[_loc4_][2];
               _loc10_ = this.dataProviderUI[_loc4_][3];
               _loc2_ = this.dataProviderUI[_loc4_][4];
            }
            else
            {
               _loc13_ = 0;
               _loc10_ = this.dataProviderUI[_loc4_][2];
               _loc2_ = this.dataProviderUI[_loc4_][3];
            }
            if(_loc8_.length == 1)
            {
               _loc8_ = "0" + _loc8_;
            }
            if(_loc7_.length == 1)
            {
               _loc7_ = "0" + _loc7_;
            }
            switch(_loc13_)
            {
               case 33:
                  this.container[_loc3_].icon.gotoAndStop("UNREAD_SMS");
                  break;
               case 34:
                  this.container[_loc3_].icon.gotoAndStop("READ_SMS");
                  break;
               default:
                  this.container[_loc3_].icon._visible = false;
            }
            _loc5_ = _loc2_.indexOf("<FONT COLOR=");
            if(_loc5_ != -1)
            {
               _loc11_ = _loc2_.indexOf(">",_loc5_);
               _loc9_ = _loc2_.substr(0,_loc5_) + _loc2_.substr(_loc11_ + 1);
               _loc2_ = _loc9_;
            }
            _loc5_ = _loc2_.indexOf("<img src=\'");
            if(_loc5_ != -1)
            {
               _loc11_ = _loc2_.indexOf(">",_loc5_);
               _loc9_ = _loc2_.substr(0,_loc5_) + _loc2_.substr(_loc11_ + 1);
               _loc2_ = _loc9_;
               _loc12_ = true;
            }
            _loc2_ = _loc2_.split("<BR>").join(" ");
            _loc2_ = _loc2_.split("</BR>").join(" ");
            _loc2_ = _loc2_.split("<BR/>").join(" ");
            _loc2_ = _loc2_.split("<br>").join(" ");
            _loc2_ = _loc2_.split("</br>").join(" ");
            _loc2_ = _loc2_.split("<br/>").join(" ");
            if(!this.parseForGamerName(this.container[_loc3_].fromAddress,_loc10_))
            {
               com.rockstargames.ui.utils.Debug.log("Stuff goes in here");
               com.rockstargames.ui.utils.Debug.log("************contactName " + _loc10_);
               this.container[_loc3_].fromAddress.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc3_].fromAddress,this.container[_loc3_].fromAddress.text);
            }
            com.rockstargames.ui.utils.Debug.log("************i " + _loc6_);
            com.rockstargames.ui.utils.Debug.log("************container[newName].fromAddress.textColor " + this.container[_loc3_].fromAddress.textColor);
            this.container[_loc3_].fromAddress.textColor = this.container[_loc3_].fromAddress.textColor;
            this.container[_loc3_].subjectTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc3_].subjectTitle,_loc2_);
            this.container[_loc3_].timeDisplay.textAutoSize = "shrink";
            this.container[_loc3_].timeDisplay.text = _loc8_ + ":" + _loc7_;
            this.container[_loc3_].attachmentIcon._visible = _loc12_;
            this.row = this.row + 1;
            _loc6_ = _loc6_ + 1;
         }
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_230",this.CONTENT.messageTF);
      }
   }
   function setState(item, isActive)
   {
      com.rockstargames.ui.utils.Debug.log("************setState " + item + "  " + isActive);
      if(this.numberOfVisibleRows > 0)
      {
         if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
            item.subjectTitle.textColor = this.TextWhiteHex;
            item.fromAddress.textColor = this.TextWhiteHex;
            item.timeDisplay.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            if(this.gfxFileName == "CELLPHONE_BADGER" || this.gfxFileName == "CELLPHONE_POLICE")
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            }
            if(this.gfxFileName == "CELLPHONE_FACADE")
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            }
            item.subjectTitle.textColor = this.darkGreyRGB;
            item.fromAddress.textColor = this.TextBlackHex;
            item.timeDisplay.textColor = this.darkGreyRGB;
         }
      }
   }
   function parseForGamerName(TF, str)
   {
      com.rockstargames.ui.utils.Debug.log("************parseForGamerName ");
      com.rockstargames.ui.utils.Debug.log("************str " + str);
      var _loc5_ = false;
      var _loc11_ = 21;
      var _loc6_ = str.indexOf("<C>");
      var _loc8_ = str.indexOf("</C>");
      var _loc3_;
      var _loc4_;
      var _loc10_;
      var _loc9_;
      var _loc12_;
      if(_loc6_ != -1 && _loc8_ != -1)
      {
         if(str.length > _loc11_)
         {
            str = "<C>" + str.substring(3,_loc11_) + "...";
         }
         _loc3_ = str.substring(0,_loc6_);
         _loc4_ = str.substring(_loc6_ + 3,_loc8_);
         _loc10_ = str.substring(_loc8_ + 4);
         TF.text = _loc3_ + _loc4_ + _loc10_;
         _loc9_ = this.headerTextFormat;
         _loc12_ = this.gamertagTextFormat;
         TF.setTextFormat(0,_loc3_.length,_loc9_);
         TF.setTextFormat(_loc3_.length,_loc3_.length + _loc4_.length,_loc12_);
         TF.setTextFormat(_loc3_.length + _loc4_.length,_loc3_.length + _loc4_.length + _loc10_.length,_loc9_);
         _loc5_ = true;
      }
      else
      {
         TF.text = str;
      }
      com.rockstargames.ui.utils.Debug.log("************ret " + _loc5_);
      return _loc5_;
   }
}
