class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextView extends com.rockstargames.ui.components.GUIView
{
   var viewLinkageList;
   var viewContainer;
   var itemY;
   var itemList;
   var rowSpacing;
   var direction;
   var viewMaskHeight;
   var highlightedItem;
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   function PauseMenuTextView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc3_,_loc3_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem(_loc2_);
      _loc4_.data = _dataArray;
      this.itemList[i] = _loc4_;
      this.itemY += _loc2_.bgMC._height + this.rowSpacing;
   }
   function set params(_p)
   {
      super.params = _p;
      if(_p.titleHeight != undefined)
      {
         this.titleHeight = _p.titleHeight;
      }
      this.scrollJumpVal = this.titleHeight;
   }
   function scrollAllHighlightStyle(targetIndex)
   {
      var _loc3_ = this.direction(targetIndex);
      var _loc2_ = 0;
      if(this.viewContainer._height > this.viewMaskHeight)
      {
         if(_loc3_ != 0)
         {
            if(_loc3_ > 0)
            {
               this.scrollYPos -= this.scrollJumpVal;
               _loc2_ = - (this.viewContainer._height - this.viewMaskHeight - 7);
               if(this.scrollYPos < _loc2_)
               {
                  this.scrollYPos = _loc2_;
               }
               this.viewContainer._y = this.scrollYPos;
            }
            else
            {
               this.scrollYPos += this.scrollJumpVal;
               if(this.scrollYPos > _loc2_)
               {
                  this.scrollYPos = _loc2_;
               }
               this.viewContainer._y = this.scrollYPos;
            }
            this.highlightedItem = targetIndex;
         }
      }
   }
}
