class com.rockstargames.gtav.ng.Replay.ReplayView extends com.rockstargames.ui.components.GUIView
{
   var viewContainer;
   function ReplayView(_mc)
   {
      super(_mc);
   }
   function addDisplayItem(i, _dataArray)
   {
      if(this.viewLinkageList[i] == undefined)
      {
         this.viewLinkageList[i] = this.viewLinkageList[i - 1];
      }
      var _loc5_ = this.viewLinkageList[i];
      var _loc4_ = this.viewContainer.attachMovie(_loc5_,_loc5_ + i + "MC",i);
      _loc4_._y = this.itemY;
      var _loc3_ = com.rockstargames.gtav.ng.Replay.ReplayBaseItem(_loc4_);
      _loc3_.data = _dataArray;
      this.itemList[i] = _loc3_;
      this.itemY += _loc3_.myHeight + this.rowSpacing;
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
      this.viewContainer.removeMovieClip();
   }
}
