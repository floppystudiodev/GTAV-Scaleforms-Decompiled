class com.rockstargames.gtav.levelDesign.ShopView extends com.rockstargames.ui.components.GUIView
{
   var __get__index;
   var _highlighted;
   var dataList;
   var direction;
   var highlightedItem;
   var itemList;
   var itemY;
   var rowSpacing;
   var viewContainer;
   var viewLinkageList;
   var selectableList = new Array();
   function ShopView()
   {
      super();
   }
   function reorderHighlightStyle(targetIndex)
   {
      var _loc5_ = this.direction(targetIndex);
      var _loc3_;
      var _loc2_;
      if(_loc5_ != 0)
      {
         _loc3_ = targetIndex;
         if(_loc3_ > this.dataList.length - this.itemList.length)
         {
            targetIndex = this.dataList.length - this.itemList.length;
         }
         _loc3_ -= targetIndex;
         _loc2_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].data = this.dataList[_loc2_ + targetIndex];
            this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = _loc3_;
      }
   }
   function addDisplayItem(i, _dataArray)
   {
      if(this.viewLinkageList[i] == undefined)
      {
         this.viewLinkageList[i] = this.viewLinkageList[i - 1];
      }
      var _loc4_ = this.viewLinkageList[i];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc5_ = com.rockstargames.ui.components.GUIMenuItem(_loc3_);
      _loc5_.data = _dataArray;
      this.itemList[i] = _loc5_;
      this.itemY += 22 + this.rowSpacing;
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].highlighted = _loc2_ == this.index;
         _loc2_ = _loc2_ + 1;
      }
   }
   function destroy()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.itemList = [];
      this.dataList = [];
   }
}
