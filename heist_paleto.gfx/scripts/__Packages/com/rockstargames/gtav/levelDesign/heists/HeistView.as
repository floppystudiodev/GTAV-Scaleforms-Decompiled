class com.rockstargames.gtav.levelDesign.heists.HeistView extends com.rockstargames.ui.components.GUIView
{
   var viewContainer;
   var paperMC;
   function HeistView()
   {
      super();
   }
   function displayView()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.itemList.length)
      {
         this.itemList[_loc3_].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      this.itemList = [];
      super.displayView();
   }
   function show(_show)
   {
      this.viewContainer._visible = _show;
   }
   function set params(_p)
   {
      super.params = _p;
      if(this.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo)
      {
         this.paperMC = this.viewContainer.attachMovie("paper","paper",0);
      }
      if(this.viewIndex == 1)
      {
         this.viewContainer._rotation = 1;
      }
   }
   function addItem(i, _dataArray)
   {
      switch(this.viewID)
      {
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            this.dataList[i] = com.rockstargames.gtav.constants.HeistGameplayLUT.lookUp(_dataArray[0]);
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
         default:
            this.dataList[i] = _dataArray;
      }
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc7_ = this.viewLinkageList[i] == undefined ? this.viewLinkageList[0] : this.viewLinkageList[i];
      var _loc3_ = this.viewContainer.attachMovie(_loc7_,_loc7_ + i + "MC",this.maxitems - i);
      var _loc6_ = this.columnSpacing * i;
      var _loc5_ = this.rowSpacing * i;
      switch(this.viewID)
      {
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            _loc6_ = -8;
            _loc5_ = -36 + 18 * i;
      }
      _loc3_._x = _loc6_;
      _loc3_._y = _loc5_;
      var _loc4_ = com.rockstargames.ui.components.GUIMenuItem(_loc3_);
      _loc4_.data = _dataArray;
      if(this.params.labels != undefined)
      {
         switch(this.viewID)
         {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
               _loc4_.labels = this.params.labels;
         }
      }
      this.itemList[i] = _loc4_;
   }
   function focusHighlightStyle(targetIndex)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      var _loc5_ = this.itemList.length - 1;
      var _loc4_ = _loc5_ - 1;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc3_ = this.itemList[_loc2_];
         if(_loc2_ == targetIndex)
         {
            _loc3_.swapDepths(_loc5_);
            _loc3_.highlighted = true;
         }
         else
         {
            _loc3_.highlighted = false;
            _loc3_.swapDepths(_loc4_);
            _loc4_ = _loc4_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      if(this.viewID != com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            var _loc3_ = false;
            if(_loc2_ == this.highlightedItem)
            {
               if(_h)
               {
                  _loc3_ = true;
               }
            }
            this.itemList[_loc2_].highlighted = _loc3_;
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
      {
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            var _loc4_ = this.itemList[_loc2_];
            if(_h)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,0.1,{_x:this.columnSpacing * _loc2_,_y:this.rowSpacing * _loc2_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,0.1,{_x:0,_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function clearHighlights(forceCrewReset)
   {
      if(forceCrewReset == undefined)
      {
         forceCrewReset = false;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.itemList.length)
      {
         var _loc2_ = this.itemList[_loc3_];
         switch(this.viewID)
         {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
               var _loc4_ = _loc2_.highlighted;
               _loc2_.highlighted = _loc4_;
               break;
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
               _loc2_.highlighted = true;
               break;
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
               if(forceCrewReset)
               {
                  _loc2_.highlighted = true;
               }
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
      {
         _loc3_ = 0;
         while(_loc3_ < this.itemList.length)
         {
            var _loc5_ = this.itemList[_loc3_];
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,0.1,{_x:0,_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function destroy()
   {
      if(this.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember || this.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            var _loc3_ = this.itemList[_loc2_];
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
            _loc2_ = _loc2_ + 1;
         }
      }
      this.itemList = [];
      this.dataList = [];
      this.index = 0;
      removeMovieClip(this.viewContainer);
      this.viewContainer = null;
   }
}
