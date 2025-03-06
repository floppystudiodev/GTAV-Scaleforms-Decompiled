class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var _sidecarColumn;
   var highlightedItem;
   var viewLinkageList;
   var viewContainer;
   var itemY;
   var itemList;
   var rowSpacing;
   var direction;
   var topEdge;
   var visibleItems;
   var dataList;
   var titleHeight = 25;
   function PauseMenuCrewListView()
   {
      super();
   }
   function get sidecarColumn()
   {
      return this._sidecarColumn;
   }
   function set sidecarColumn(newSidecar)
   {
      this._sidecarColumn = newSidecar;
      if(this._sidecarColumn != undefined)
      {
         this._sidecarColumn.index = this.highlightedItem;
      }
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem(_loc3_);
      _loc2_.data = _dataArray;
      this.itemList[i] = _loc2_;
      this.itemY += _loc2_.bgMC._height + this.rowSpacing;
   }
   function set params(_p)
   {
      super.params = _p;
      if(_p.titleHeight != undefined)
      {
         this.titleHeight = _p.titleHeight;
      }
   }
   function scrollHighlightStyle(targetIndex)
   {
      var _loc6_ = this.direction(targetIndex);
      if(_loc6_ != 0)
      {
         var _loc3_ = targetIndex;
         var _loc2_ = 0;
         var _loc4_ = 0;
         if(_loc6_ > 0)
         {
            if(_loc3_ >= this.topEdge + this.visibleItems)
            {
               this.topEdge = this.topEdge + 1;
               _loc4_ = this.topEdge;
            }
            else
            {
               _loc4_ = this.topEdge;
               if(_loc4_ == this.dataList.length - this.visibleItems && _loc3_ == 0)
               {
                  _loc4_ = 0;
                  this.topEdge = 0;
               }
            }
            _loc3_ -= this.topEdge;
         }
         else
         {
            if(_loc3_ < this.topEdge)
            {
               this.topEdge = this.topEdge - 1;
               _loc4_ = this.topEdge;
            }
            else
            {
               _loc4_ = this.topEdge;
               if(_loc4_ == 0 && _loc3_ == this.dataList.length - 1)
               {
                  _loc4_ = _loc3_ - this.visibleItems + 1;
                  this.topEdge = _loc3_ - this.visibleItems + 1;
               }
            }
            _loc3_ -= this.topEdge;
         }
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].data = this.dataList[_loc4_ + _loc2_];
            this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = _loc3_;
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].highlighted = targetIndex == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = targetIndex;
      }
      if(this._sidecarColumn != undefined)
      {
         this._sidecarColumn.index = this.highlightedItem;
      }
   }
}
