class com.rockstargames.gtav.levelDesign.heists.HeistControllerBase extends com.rockstargames.ui.components.GUIController
{
   var model;
   var dbgOn = false;
   function HeistControllerBase()
   {
      super();
   }
   function dbg(str)
   {
      com.rockstargames.ui.utils.Debug.log(str);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments.slice(2);
      this.model.addDataToView(_viewIndex,_slotIndex,_loc3_);
   }
   function UPDATE_DATA_SLOT(viewIndex, itemIndex)
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.heists.HeistView(this.model.getCurrentView(viewIndex));
      if(_loc3_.params.id != com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
      {
         super.UPDATE_DATA_SLOT(viewIndex,itemIndex);
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
   }
   function FOCUS_VIEW(viewIndex, clearOtherViews)
   {
      super.FOCUS_VIEW(viewIndex,clearOtherViews);
   }
   function SHOW_DEBUG(b)
   {
      this.dbgOn = b;
   }
}
