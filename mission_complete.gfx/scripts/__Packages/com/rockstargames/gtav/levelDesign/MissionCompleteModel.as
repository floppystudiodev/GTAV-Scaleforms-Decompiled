class com.rockstargames.gtav.levelDesign.MissionCompleteModel extends com.rockstargames.ui.components.GUIModel
{
   var getCurrentView;
   var viewIndex;
   var viewList;
   function MissionCompleteModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.MissionCompleteView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.params = _params;
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc3_ = this.viewList[_viewIndex];
      _loc3_.destroy();
      this.viewIndex = 0;
      var _loc2_ = com.rockstargames.gtav.levelDesign.MissionCompleteView(this.getCurrentView());
      _loc2_.index = 0;
   }
}
