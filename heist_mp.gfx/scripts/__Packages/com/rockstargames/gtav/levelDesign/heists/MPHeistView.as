class com.rockstargames.gtav.levelDesign.heists.MPHeistView extends com.rockstargames.ui.components.GUIView
{
   var viewContainer;
   var xPos = new Array();
   var yPos = new Array();
   function MPHeistView()
   {
      super();
      this.xPos = [194,194,194,194,194,194,194,194,470,0,102,2,586,230,0,0,0,0,0,0];
      this.yPos = [136,196,256,316,376,436,496,556,370,4,42,275,420,440,50,275,500,510,520,530];
   }
   function displayView()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.itemList = [];
      if(this.viewIndex == 0)
      {
         _loc2_ = 0;
         while(_loc2_ < this.dataList.length)
         {
            if(_loc2_ < this.visibleItems || this.itemSelectStyle == com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
            {
               this.addDisplayItem(_loc2_,this.dataList[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.addDisplayItem(9,this.dataList[9]);
         _loc2_ = 14;
         while(_loc2_ < this.dataList.length)
         {
            if(_loc2_ < this.visibleItems || this.itemSelectStyle == com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
            {
               this.addDisplayItem(_loc2_,this.dataList[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function show(_show)
   {
      this.viewContainer._visible = _show;
   }
   function set params(_p)
   {
      super.params = _p;
   }
   function addItem(i, _dataArray)
   {
      this.dataList[i] = _dataArray;
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc5_ = this.viewLinkageList[i] == undefined ? this.viewLinkageList[i - 1] : this.viewLinkageList[i];
      var _loc3_ = this.viewContainer.attachMovie(_loc5_,_loc5_ + i + "MC",this.maxitems - i);
      _loc3_._x = this.xPos[i];
      if(i >= 0 && i < 8)
      {
         _loc3_._y = this.yPos[0] + (i - 1) * 60;
      }
      else
      {
         _loc3_._y = this.yPos[i];
      }
      var _loc4_ = com.rockstargames.ui.components.GUIMenuItem(_loc3_);
      _loc4_.data = _dataArray;
      if(this.params.labels != undefined)
      {
         _loc4_.labels = this.params.labels;
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
      var _loc4_ = arguments;
      this._highlighted = _h;
      var _loc3_ = 0;
      while(_loc3_ < this.itemList.length)
      {
         this.itemList[_loc3_].highlighted = false;
         _loc3_ = _loc3_ + 1;
      }
      this.itemList[this.highlightedItem].highlighted = !_h ? false : true;
   }
   function clearHighlights()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].highlighted = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function destroy()
   {
      this.itemList = [];
      this.dataList = [];
      this.index = 0;
      removeMovieClip(this.viewContainer);
      this.viewContainer = null;
   }
}
