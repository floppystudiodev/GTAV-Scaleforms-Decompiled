class com.rockstargames.gtav.cellphone.apps.SETTINGS extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var CONTENT;
   var TextBlackHex;
   var TextWhiteHex;
   var arrayStartPoint;
   var container;
   var currentStyle;
   var dataProviderUI;
   var gfxFileName;
   var iconOFF;
   var linkageID;
   var numberOfVisibleRows;
   var offWhiteRGB;
   var row;
   var whiteRGB;
   function SETTINGS()
   {
      super();
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.settingsDataProviderUI;
      if(this.gfxFileName == "CELLPHONE_IFRUIT")
      {
         this.iconOFF = [0,0,0];
      }
      else
      {
         this.iconOFF = [this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2]];
      }
      this.linkageID = "simplesListItemMC";
      this.numberOfVisibleRows = 5;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.settingsDataProviderUI;
      this.row = 1;
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc4_ = 0;
         while(_loc4_ < this.numberOfVisibleRows)
         {
            _loc2_ = "listItem" + this.row;
            _loc3_ = _loc4_ + this.arrayStartPoint;
            if(this.dataProviderUI[_loc3_][0] != undefined && this.dataProviderUI[_loc3_][0] != 0)
            {
               this.setIcon(this.container[_loc2_],this.dataProviderUI[_loc3_][0]);
               this.container[_loc2_].simpleLabelTF._x = 46;
               this.container[_loc2_].simpleLabelTF._width = 216;
               this.container[_loc2_].icon._visible = true;
            }
            else
            {
               this.container[_loc2_].simpleLabelTF._x = 4;
               this.container[_loc2_].simpleLabelTF._width = 252;
               this.container[_loc2_].icon._visible = false;
            }
            if(this.dataProviderUI[_loc3_][1] != undefined)
            {
               this.container[_loc2_].simpleLabelTF.text = this.dataProviderUI[_loc3_][1];
            }
            this.row = this.row + 1;
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setIcon(target, menuIconFrameEnum)
   {
      var _loc1_ = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
      target.icon.gotoAndStop(_loc1_[1]);
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_FACADE")
         {
            if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               com.rockstargames.ui.utils.Colour.Colourise(item.iconBackground,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
               item.simpleLabelMC.textColor = this.TextWhiteHex;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,0,0,0,100);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
               com.rockstargames.ui.utils.Colour.Colourise(item.iconBackground,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               item.simpleLabelMC.textColor = this.TextWhiteHex;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[2][0],this.currentStyle[2][1],this.currentStyle[2][2],100);
            item.simpleLabelTF.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.iconOFF[0],this.iconOFF[1],this.iconOFF[2],100);
            item.simpleLabelTF.textColor = this.TextBlackHex;
         }
      }
   }
}
