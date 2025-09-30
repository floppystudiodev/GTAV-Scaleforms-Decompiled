class com.rockstargames.gtav.cellphone.prologue.ContactList_Prologue extends com.rockstargames.ui.controls.ScrollingList
{
   var TextBlackHex;
   var TextWhiteHex;
   var arrayStartPoint;
   var container;
   var dataProviderUI;
   var numberOfVisibleRows;
   var offsetY;
   var row;
   var scrollBar;
   var scrollBarTimeout;
   var defaultRowHeight = 40;
   function ContactList_Prologue()
   {
      super();
      _global.gfxExtensions = true;
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
   }
   function construct(parentContainer, linkageID, params)
   {
      clearInterval(this.scrollBarTimeout);
      this.row = 1;
      super.construct(parentContainer,linkageID,params);
      var _loc4_ = 250;
      var _loc3_ = 120;
      this.scrollBar.construct(this.container,"scrubber","gutter",_loc4_,this.offsetY,_loc3_);
      this.scrollBar.scrollBarContainer.scrubber._height = _loc3_ / this.dataProviderUI.length;
      this.setScrollBarVisibility(true);
   }
   function populateContent()
   {
      this.row = 1;
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc2_ = 0;
         while(_loc2_ < this.numberOfVisibleRows)
         {
            _loc3_ = "listItem" + this.row;
            _loc4_ = _loc2_ + this.arrayStartPoint;
            this.container[_loc3_].contactNameMC.textAutoSize = "shrink";
            this.container[_loc3_].contactNameMC.text = this.dataProviderUI[_loc4_][1];
            this.row = this.row + 1;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function setScrollBarVisibility(isVisible)
   {
      if(isVisible)
      {
         this.scrollBar.scrollBarContainer._alpha = 100;
      }
      else
      {
         this.scrollBar.scrollBarContainer._alpha = 0;
      }
      this.scrollBar.scrollBarContainer._visible = isVisible;
   }
   function setState(item, isActive)
   {
      if(isActive)
      {
         item.background._alpha = 100;
         item.contactNameMC.textColor = this.TextWhiteHex;
         item.jobTitle.textColor = this.TextWhiteHex;
      }
      else
      {
         item.background._alpha = 0;
         item.contactNameMC.textColor = this.TextBlackHex;
         item.jobTitle.textColor = this.TextBlackHex;
      }
   }
}
