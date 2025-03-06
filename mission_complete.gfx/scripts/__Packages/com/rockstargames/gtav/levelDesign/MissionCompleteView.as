class com.rockstargames.gtav.levelDesign.MissionCompleteView extends com.rockstargames.ui.components.GUIView
{
   var viewContainer;
   var selectableList = new Array();
   function MissionCompleteView()
   {
      super();
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
      this.itemY += _loc3_.bgMC._height + this.rowSpacing;
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
