class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var bgMC;
   var dataList;
   var highlightedItem;
   var itemList;
   var itemY;
   var rowSpacing;
   var topEdge;
   var viewContainer;
   var viewLinkageList;
   var visibleItems;
   function PauseMenuConfigurationView()
   {
      super();
   }
   function set params(_p)
   {
      super.params = _p;
      var _loc3_;
      if(this.bgMC == undefined)
      {
         this.bgMC = this.viewContainer.attachMovie("settingsBg","settingsBgMC",-1);
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
         this.bgMC._visible = false;
      }
   }
   function displayView()
   {
      super.displayView();
      this.bgMC._height = this.itemY - this.rowSpacing;
      this.bgMC._visible = true;
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationItem(_loc2_);
      _loc3_.isLastItem = i + 1 == this.visibleItems;
      _loc3_.data = _dataArray;
      this.itemList[i] = _loc3_;
      this.itemY += _loc2_.bgMC._height + this.rowSpacing;
   }
   function scrollHighlightStyle(targetIndex)
   {
      targetIndex = Math.max(0,Math.min(targetIndex,this.dataList.length - 1));
      var _loc2_ = 0;
      var _loc4_ = 0;
      if(targetIndex > this.topEdge + this.visibleItems - 1)
      {
         _loc4_ += targetIndex - (this.visibleItems - 1);
         this.topEdge = _loc4_;
         targetIndex = this.visibleItems - 1;
      }
      else if(targetIndex < this.topEdge)
      {
         _loc4_ = targetIndex;
         this.topEdge = _loc4_;
         targetIndex = 0;
      }
      else
      {
         _loc4_ = this.topEdge;
         targetIndex -= this.topEdge;
      }
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].data = this.dataList[_loc4_ + _loc2_];
         this.itemList[_loc2_].highlighted = targetIndex == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
}
