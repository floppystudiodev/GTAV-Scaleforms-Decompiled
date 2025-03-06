class com.rockstargames.gtav.cellphone.apps.BOSS_JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var linkageID;
   var HColour;
   var headerTextFormat;
   var gamertagTextFormat;
   var itemListStyle;
   var jobItem;
   var dataProviderUI;
   var CONTENT;
   var gfxFileName;
   var currentStyle;
   var row;
   var container;
   var TextWhiteHex;
   var offWhiteRGB;
   var TextBlackHex;
   var defaultRowHeight = 80;
   var DEFAULT_ALPHA = 99;
   function BOSS_JOB_LIST()
   {
      super();
      this.linkageID = "bossJobList";
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
      this.itemListStyle = [];
   }
   function construct()
   {
      this.jobItem = new com.rockstargames.gtav.cellphone.apps.NewJobItem();
      this.dataProviderUI = _level0.TIMELINE.bossJobListProvider;
      this.jobItem.isMP = this.dataProviderUI[0][4];
      if(this.jobItem.isMP == undefined)
      {
         this.jobItem.isMP = false;
      }
      this.linkageID = "bossJobList";
      this.numberOfVisibleRows = 3;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,0,0,0,100);
            break;
         case "CELLPHONE_IFRUIT":
            if(this.jobItem.isMP)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,0,0,0,100);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,228,223,169,100);
               com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground,136,118,104,100);
            }
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.bossJobListProvider;
      this.row = 1;
      if(this.numberOfVisibleRows > 0)
      {
         var _loc8_ = 0;
         while(_loc8_ < this.numberOfVisibleRows)
         {
            var _loc2_ = "listItem" + this.row;
            var _loc7_ = _loc8_ + this.arrayStartPoint;
            this.setupJob(_loc7_);
            this.itemListStyle[_loc7_][0] = this.container[_loc2_];
            this.itemListStyle[_loc7_][1] = this.jobItem.messageStyle;
            this.container[_loc2_]._style_id = this.jobItem.messageStyle;
            this.container[_loc2_].gotoAndStop(3);
            if(this.jobItem.isMP)
            {
               this.container[_loc2_].jobDescription.textColor = 0;
               this.setState(this.container[_loc2_],this.container[_loc2_].isActive);
            }
            if(this.jobItem.jobLabel != undefined)
            {
               var _loc12_ = this.jobItem.jobLabel.split("<FONT COLOR=\'#F0F0F0\'>").join("");
               var _loc14_ = this.parseForGamerName(this.container[_loc2_].jobLabel,_loc12_);
               if(!_loc14_)
               {
                  this.container[_loc2_].jobLabel._y = 10;
               }
               var _loc10_ = new com.rockstargames.ui.utils.Text();
               if(this.container[_loc2_].blipLayerMC)
               {
                  this.container[_loc2_].blipLayerMC.removeMovieClip();
               }
               this.container[_loc2_].createEmptyMovieClip("blipLayerMC",1000);
               var _loc13_ = this.container[_loc2_].jobDescription.textColor;
               _loc10_.setTextWithIcons(this.jobItem.jobDescription,this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,15.5,1,false);
               var _loc4_ = 15.5;
               var _loc9_ = 4;
               var _loc5_ = 1;
               var _loc3_ = this.container[_loc2_].jobDescription.getTextFormat();
               while(this.container[_loc2_].jobDescription.textHeight + _loc9_ > this.container[_loc2_].jobDescription._height && _loc4_ > _loc5_)
               {
                  _loc4_ -= _loc5_;
                  _loc3_.size = _loc4_;
                  this.container[_loc2_].jobDescription.setTextFormat(_loc3_);
                  _loc3_ = this.container[_loc2_].jobDescription.getTextFormat();
               }
               var _loc6_ = this.container[_loc2_].jobDescription.getTextFormat().size;
               if(_loc6_ == undefined)
               {
                  _loc6_ = _loc4_;
               }
               _loc10_.setTextWithIcons(this.jobItem.jobDescription,this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,_loc6_,1,false);
               this.container[_loc2_].jobDescription.setTextFormat(_loc3_);
               this.container[_loc2_].jobDescription.textColor = _loc13_;
               if(this.jobItem.blipFrameLabel != undefined)
               {
                  if(this.jobItem.blipFrameLabel > 0)
                  {
                     var _loc11_ = "BLIP_" + this.jobItem.blipFrameLabel.toString();
                     this.container[_loc2_].BLIPS.gotoAndStop(_loc11_);
                  }
               }
            }
            this.row = this.row + 1;
            _loc8_ = _loc8_ + 1;
         }
      }
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_IFRUIT")
         {
            if(this.jobItem.isMP)
            {
               var _loc3_ = undefined;
               _loc3_ = item._style_id;
               if(_loc3_ == undefined)
               {
                  _loc3_ = 1;
               }
               com.rockstargames.ui.utils.Debug.log("colour ***********************************************" + _loc3_);
               if(isActive)
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(item.background,_loc3_);
               }
               else
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(item.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
               }
               com.rockstargames.ui.utils.Colour.ApplyHudColour(item.highlight_bg,_loc3_);
               item.highlight_bg._alpha = 50;
               item.background._alpha = !isActive ? 25 : 50;
               if(item._currentframe == 4 || item._currentframe == 5)
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
      if(_loc8_)
      {
         var _loc10_ = 16;
         var _loc4_ = str.substring(0,_loc5_);
         var _loc2_ = str.substring(_loc5_ + 3,_loc7_);
         var _loc9_ = str.substring(_loc7_ + 4);
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
