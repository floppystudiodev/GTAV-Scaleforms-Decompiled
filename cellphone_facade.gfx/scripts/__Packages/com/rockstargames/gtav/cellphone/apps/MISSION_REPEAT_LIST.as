class com.rockstargames.gtav.cellphone.apps.MISSION_REPEAT_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var dataProviderUI;
   var linkageID;
   var CONTENT;
   var row;
   var container;
   var gfxFileName;
   var currentStyle;
   var TextWhiteHex;
   var offWhiteRGB;
   var TextBlackHex;
   function MISSION_REPEAT_LIST()
   {
      super();
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.missionRepeatDataProviderUI;
      this.linkageID = "simplesListItemMC";
      this.numberOfVisibleRows = 5;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.missionRepeatDataProviderUI;
      this.CONTENT.messageTF.autoSize = "center";
      this.CONTENT.messageTF.text = "";
      this.row = 1;
      if(this.numberOfVisibleRows > 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.numberOfVisibleRows)
         {
            var _loc2_ = "listItem" + this.row;
            var _loc5_ = _loc3_ + this.arrayStartPoint;
            var _loc4_ = this.dataProviderUI[_loc5_][1];
            this.container[_loc2_].icon._visible = false;
            this.container[_loc2_].iconBackground._visible = false;
            this.container[_loc2_].simpleLabelTF._x = 4;
            this.container[_loc2_].simpleLabelTF._width = 246;
            if(_loc4_ != undefined)
            {
               this.container[_loc2_].simpleLabelTF.multiline = true;
               this.container[_loc2_].simpleLabelTF.autoSize = "left";
               this.container[_loc2_].simpleLabelTF._height = 28.25;
               this.container[_loc2_].simpleLabelTF.text = _loc4_;
               if(this.container[_loc2_].simpleLabelTF._height > 29)
               {
                  this.container[_loc2_].simpleLabelTF._y = -1;
               }
               else
               {
                  this.container[_loc2_].simpleLabelTF._y = 9.5;
               }
            }
            this.row = this.row + 1;
            _loc3_ = _loc3_ + 1;
         }
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
         if(this.gfxFileName == "CELLPHONE_FACADE")
         {
            if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               item.simpleLabelTF.textColor = this.TextWhiteHex;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,0,0,0,100);
               item.simpleLabelTF.textColor = this.TextWhiteHex;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            item.simpleLabelTF.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.simpleLabelTF.textColor = this.TextBlackHex;
         }
      }
   }
}
