class com.rockstargames.gtav.cellphone.apps.JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var CONTENT;
   var HColour;
   var TextBlackHex;
   var TextWhiteHex;
   var container;
   var currentStyle;
   var dataProviderUI;
   var gamertagTextFormat;
   var gfxFileName;
   var headerTextFormat;
   var jobItem;
   var linkageID;
   var offWhiteRGB;
   var row;
   var defaultRowHeight = 80;
   var DEFAULT_ALPHA = 99;
   var messageStyle = 0;
   var MESSAGE_TYPE_HEIST = 1;
   var MESSAGE_TYPE_ADVERSARY = 2;
   var LOW_FLOW = 3;
   function JOB_LIST()
   {
      super();
      this.HColour = new com.rockstargames.ui.utils.HudColour();
      this.headerTextFormat = new TextFormat();
      this.headerTextFormat.font = "$Font2";
      this.headerTextFormat.size = 18;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
      this.headerTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
      this.gamertagTextFormat = new TextFormat();
      this.gamertagTextFormat.font = "$Font2_cond";
      this.gamertagTextFormat.size = 24;
      this.gamertagTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc3_.r,_loc3_.g,_loc3_.b);
   }
   function construct()
   {
      this.jobItem = new com.rockstargames.gtav.cellphone.apps.NewJobItem();
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      this.jobItem.isMP = this.dataProviderUI[0][4];
      if(this.jobItem.isMP == undefined)
      {
         this.jobItem.isMP = false;
      }
      this.linkageID = "jobList";
      this.numberOfVisibleRows = 3;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,0,0,0,100);
            return;
         case "CELLPHONE_IFRUIT":
            if(this.jobItem.isMP)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,255,255,255,100);
               return;
            }
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,228,223,169,100);
            com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground,136,118,104,100);
            return;
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
            return;
      }
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      this.row = 1;
      var _loc6_;
      var _loc2_;
      var _loc11_;
      var _loc10_;
      var _loc13_;
      var _loc8_;
      var _loc12_;
      var _loc4_;
      var _loc7_;
      var _loc5_;
      var _loc3_;
      var _loc9_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc6_ = 0;
         while(_loc6_ < this.numberOfVisibleRows)
         {
            _loc2_ = "listItem" + this.row;
            _loc11_ = _loc6_ + this.arrayStartPoint;
            this.setupJob(_loc11_);
            if(this.jobItem.isMP)
            {
               this.container[_loc2_].gotoAndStop(2);
               switch(this.jobItem.messageStyle)
               {
                  case com.rockstargames.gtav.cellphone.MessageType.MESSAGE_TYPE_HEIST:
                     this.container[_loc2_].gotoAndStop(3);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.MESSAGE_TYPE_ADVERSARY:
                     this.container[_loc2_].gotoAndStop(4);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.LOW_FLOW:
                     this.container[_loc2_].gotoAndStop(5);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G1:
                     this.container[_loc2_].gotoAndStop(6);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G2:
                     this.container[_loc2_].gotoAndStop(7);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G3:
                     this.container[_loc2_].gotoAndStop(8);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G4:
                     this.container[_loc2_].gotoAndStop(9);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G5:
                     this.container[_loc2_].gotoAndStop(10);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G6:
                     this.container[_loc2_].gotoAndStop(11);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G7:
                     this.container[_loc2_].gotoAndStop(12);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G8:
                     this.container[_loc2_].gotoAndStop(13);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G9:
                     this.container[_loc2_].gotoAndStop(14);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G10:
                     this.container[_loc2_].gotoAndStop(15);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G11:
                     this.container[_loc2_].gotoAndStop(16);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G12:
                     this.container[_loc2_].gotoAndStop(17);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G13:
                     this.container[_loc2_].gotoAndStop(18);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G14:
                     this.container[_loc2_].gotoAndStop(19);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G15:
                     this.container[_loc2_].gotoAndStop(20);
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_TECH_GREEN:
                     this.container[_loc2_].gotoAndStop(21);
               }
               this.container[_loc2_].jobDescription.textColor = 0;
               this.setState(this.container[_loc2_],this.container[_loc2_].isActive);
            }
            if(this.jobItem.jobLabel != undefined)
            {
               _loc10_ = this.jobItem.jobLabel.split("<FONT COLOR=\'#F0F0F0\'>").join("");
               _loc13_ = this.parseForGamerName(this.container[_loc2_].jobLabel,_loc10_);
               if(!_loc13_)
               {
                  this.container[_loc2_].jobLabel._y = 10;
               }
               _loc8_ = new com.rockstargames.ui.utils.Text();
               if(this.container[_loc2_].blipLayerMC)
               {
                  this.container[_loc2_].blipLayerMC.removeMovieClip();
               }
               this.container[_loc2_].createEmptyMovieClip("blipLayerMC",1000);
               _loc12_ = this.container[_loc2_].jobDescription.textColor;
               _loc8_.setTextWithIcons(this.jobItem.jobDescription,this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,15.5,1,false);
               _loc4_ = 15.5;
               _loc7_ = 4;
               _loc5_ = 1;
               _loc3_ = this.container[_loc2_].jobDescription.getTextFormat();
               while(this.container[_loc2_].jobDescription.textHeight + _loc7_ > this.container[_loc2_].jobDescription._height && _loc4_ > _loc5_)
               {
                  _loc4_ -= _loc5_;
                  _loc3_.size = _loc4_;
                  this.container[_loc2_].jobDescription.setTextFormat(_loc3_);
                  _loc3_ = this.container[_loc2_].jobDescription.getTextFormat();
               }
               _loc8_.setTextWithIcons(this.jobItem.jobDescription,this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,this.container[_loc2_].jobDescription.getTextFormat().size,1,false);
               this.container[_loc2_].jobDescription.setTextFormat(_loc3_);
               this.container[_loc2_].jobDescription.textColor = _loc12_;
               if(this.jobItem.blipFrameLabel != undefined)
               {
                  if(this.jobItem.blipFrameLabel > 0)
                  {
                     _loc9_ = "BLIP_" + this.jobItem.blipFrameLabel.toString();
                     this.container[_loc2_].BLIPS.gotoAndStop(_loc9_);
                  }
               }
            }
            this.row = this.row + 1;
            _loc6_ = _loc6_ + 1;
         }
      }
   }
   function setState(item, isActive)
   {
      var _loc4_ = 2;
      var _loc3_;
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_IFRUIT")
         {
            if(this.jobItem.isMP)
            {
               switch(item._currentframe)
               {
                  case com.rockstargames.gtav.cellphone.MessageType.MESSAGE_TYPE_HEIST + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_H;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.MESSAGE_TYPE_ADVERSARY + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ADVERSARY;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.LOW_FLOW + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_LOW_FLOW;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G1 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G1;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G2 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G2;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G3 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G3;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G4 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G4;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G5 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G5;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G6 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G6;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G7 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G7;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G8 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G8;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G9 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G9;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G10 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G10;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G11 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G11;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G12 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G12;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G13 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G13;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G14 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G14;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_G15 + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_G15;
                     break;
                  case com.rockstargames.gtav.cellphone.MessageType.STYLE_TECH_GREEN + _loc4_:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TECH_GREEN;
                     break;
                  default:
                     _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
               }
               if(isActive)
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(item.background,_loc3_);
               }
               else
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(item.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREYDARK);
               }
               com.rockstargames.ui.utils.Colour.ApplyHudColour(item.highlight_bg,_loc3_);
               item.highlight_bg._alpha = 50;
               item.background._alpha = !isActive ? 25 : 50;
               if(item._currentframe > 3)
               {
                  item.background._alpha = !isActive ? 25 : 75;
                  item.highlight_bg._alpha = 75;
               }
               item.BLIPS._alpha = 100;
               item.isActive = isActive;
            }
            else if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,136,118,104,100);
               item.jobLabel.textColor = this.TextWhiteHex;
               item.jobDescription.textColor = this.TextWhiteHex;
               item.BLIPS._alpha = 100;
               item.background._width = 256;
               item.background._x = 0;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,238,233,176,100);
               item.background._width = 240;
               item.background._x = 8;
               item.jobLabel.textColor = 5457729;
               item.jobDescription.textColor = 5457729;
               item.BLIPS._alpha = 100;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            item.jobLabel.textColor = this.TextWhiteHex;
            item.jobDescription.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.jobLabel.textColor = this.TextBlackHex;
            item.jobDescription.textColor = this.TextBlackHex;
         }
      }
   }
   function setupJob(selected)
   {
      this.jobItem.jobLabel = this.dataProviderUI[selected][0];
      this.jobItem.jobDescription = this.dataProviderUI[selected][1];
      this.jobItem.blipFrameLabel = this.dataProviderUI[selected][2];
      this.jobItem.messageStyle = this.dataProviderUI[selected][3];
      if(this.jobItem.messageStyle == undefined)
      {
         this.jobItem.messageStyle = 0;
      }
   }
   function parseForGamerName(TF, str)
   {
      var _loc5_ = str.indexOf("<C>");
      var _loc7_ = str.indexOf("</C>");
      var _loc8_ = _loc5_ != -1 && _loc7_ != -1;
      var _loc10_;
      var _loc4_;
      var _loc2_;
      var _loc9_;
      if(_loc8_)
      {
         _loc10_ = 16;
         _loc4_ = str.substring(0,_loc5_);
         _loc2_ = str.substring(_loc5_ + 3,_loc7_);
         _loc9_ = str.substring(_loc7_ + 4);
         if(_loc2_.length > _loc10_)
         {
            _loc2_ = _loc2_.substring(0,_loc10_) + "...";
         }
         str = _loc4_ + _loc2_ + _loc9_;
         TF.text = str;
         TF.setTextFormat(0,_loc4_.length,this.headerTextFormat);
         TF.setTextFormat(_loc4_.length,_loc4_.length + _loc2_.length,this.gamertagTextFormat);
         TF.setTextFormat(_loc4_.length + _loc2_.length,_loc4_.length + _loc2_.length + _loc9_.length,this.headerTextFormat);
      }
      else
      {
         TF.text = str;
      }
      return _loc8_;
   }
}
