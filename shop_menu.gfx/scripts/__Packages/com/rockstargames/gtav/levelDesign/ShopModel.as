class com.rockstargames.gtav.levelDesign.ShopModel extends com.rockstargames.ui.components.GUIModel
{
   var _arrows;
   var viewIndex;
   var viewList;
   function ShopModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.ShopView();
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
      var _loc2_ = com.rockstargames.gtav.levelDesign.ShopView(this.getCurrentView());
      _loc2_.index = 0;
   }
   function setItem(_currentView, _itemIndex)
   {
      _currentView.index = _itemIndex;
      if(this.scrollBar != undefined)
      {
         if(_itemIndex < _currentView.maxitems - _currentView.visibleItems + 1)
         {
            this.scrollBar.scrollpercent = 100 * (_itemIndex / _currentView.maxitems);
         }
         else
         {
            this.scrollBar.scrollpercent = 100 * ((_currentView.maxitems - _currentView.visibleItems) / _currentView.maxitems);
         }
      }
   }
   function set arrows(a)
   {
      this._arrows = a;
   }
   function get arrows()
   {
      return this._arrows;
   }
}
