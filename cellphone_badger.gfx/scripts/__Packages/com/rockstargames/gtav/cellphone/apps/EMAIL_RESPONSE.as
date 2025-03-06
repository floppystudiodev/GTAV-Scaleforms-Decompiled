class com.rockstargames.gtav.cellphone.apps.EMAIL_RESPONSE extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var isLandscape;
   var scrollerY;
   var dataProviderUI;
   var linkageID;
   var CONTENT;
   var gfxFileName;
   var scrollBar;
   var container;
   var row;
   var currentStyle;
   var TextWhiteHex;
   var offWhiteRGB;
   var TextBlackHex;
   function EMAIL_RESPONSE()
   {
      super();
      this.numberOfVisibleRows = 3;
      this.isLandscape = true;
      this.defaultRowHeight = 50;
      this.gutterHeight = 150;
      this.offsetX = -256;
      this.offsetY = -192;
      this.scrollerX = 337;
      this.scrollerY = -207;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.emailResponseDataProviderUI;
      this.numberOfVisibleRows = 3;
      this.linkageID = "inboxListItem";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
      this.container._rotation = 90;
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.emailResponseDataProviderUI;
      this.container._y = 256;
      this.row = 1;
      var _loc5_ = 0;
      var _loc6_ = 0;
      if(this.numberOfVisibleRows > 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.numberOfVisibleRows)
         {
            var _loc2_ = "listItem" + this.row;
            if(_loc3_ + this.arrayStartPoint >= this.dataProviderUI.length)
            {
               _loc5_ = _loc6_;
               _loc6_ = _loc6_ + 1;
            }
            else
            {
               _loc5_ = _loc3_ + this.arrayStartPoint;
            }
            this.container[_loc2_].attachmentIcon._visible = false;
            this.container[_loc2_].icon._visible = false;
            var _loc4_ = this.dataProviderUI[_loc5_][0];
            if(_loc4_ != undefined)
            {
               this.container[_loc2_].responseText.multiline = true;
               this.container[_loc2_].responseText.autoSize = "left";
               this.container[_loc2_].responseText._height = 27;
               this.container[_loc2_].responseText.text = _loc4_;
               if(this.container[_loc2_].responseText._height > 27)
               {
                  this.container[_loc2_].responseText._y = 2;
               }
               else
               {
                  this.container[_loc2_].responseText._y = 11;
               }
               this.container[_loc2_].responseText.text = _loc4_;
            }
            this.row = this.row + 1;
            _loc3_ = _loc3_ + 1;
         }
         var _loc7_ = this.getRowAsPercentage(this.arrayStartPoint + 1);
         this.currentSelection = this.arrayStartPoint;
         this.scrollBar.scrollToPercentage(_loc7_);
      }
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            item.responseText.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.responseText.textColor = this.TextBlackHex;
         }
      }
   }
}
