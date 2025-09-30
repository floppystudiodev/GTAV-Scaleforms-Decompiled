class com.rockstargames.gtav.levelDesign.heists.selectors.MPStrandBoard extends com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard
{
   var _data;
   var blueRGB;
   var numItems;
   var planningImage;
   var planningItemTitle;
   var dataLeftLinkage = "strandData_left";
   var titleLinkage = "strandItemTitle";
   function MPStrandBoard()
   {
      super();
   }
   function set data(_d)
   {
      super.data = _d;
      var _loc4_ = 0;
      var _loc3_;
      while(_loc4_ < this.numItems)
      {
         _loc3_ = this["item" + _loc4_];
         _loc3_._x = 115;
         _loc3_.postItNote._visible = false;
         _loc3_.completedTickMC._visible = false;
         _loc4_ = _loc4_ + 1;
      }
      this.planningItemTitle.numberTF._visible = false;
      var _loc5_ = this._data[13];
      if(this._data[13] != undefined)
      {
         com.rockstargames.ui.utils.FitToTextfield.scaleText(this.planningItemTitle.costTF,this._data[13],536,"right",true);
      }
      else
      {
         this.planningItemTitle.costTF.text = "";
      }
      this.planningItemTitle.costTF.textColor = this.blueRGB;
   }
   function setHighlightHeight()
   {
      super.setHighlightHeight();
      this.planningImage.completedTickMC._alpha = 0;
   }
   function subHighlight(_subItemIndex, leftArrowVis, rightArrowVis)
   {
      super.subHighlight(_subItemIndex,leftArrowVis,rightArrowVis);
      var _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < this.numItems)
      {
         _loc4_ = this["item" + _loc3_];
         _loc4_.postItNote._visible = false;
         _loc4_.completedTickMC._visible = false;
         _loc3_ = _loc3_ + 1;
      }
   }
   function getAvailableWidth(image)
   {
      return 520;
   }
}
