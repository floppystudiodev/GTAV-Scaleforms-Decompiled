class com.rockstargames.gtav.web.vehicleSites.DropDown
{
   var _isOpen;
   var container;
   var itemContainer;
   var itemContainerMask;
   var itemLinkage;
   var itemSpacing;
   var numItems;
   var numVisibleItems;
   var offTextColour;
   var onTextColour;
   var yClosed;
   var yOpen;
   static var OPEN_DURATION = 0.25;
   function DropDown(container, itemLinkage, defaultLabel, itemSpacing, headerOffset, onTextColour, offTextColour)
   {
      this.container = container;
      this.itemLinkage = itemLinkage;
      this.itemSpacing = itemSpacing;
      this.onTextColour = onTextColour;
      this.offTextColour = offTextColour;
      this.init(headerOffset,defaultLabel);
   }
   function addItem(label)
   {
      var _loc2_ = this.itemContainer.attachMovie(this.itemLinkage,this.itemLinkage + "_" + label,this.numItems);
      this.yClosed = - this.itemContainer._height;
      _loc2_._y = this.numVisibleItems * this.itemSpacing;
      _loc2_.disabled = true;
      _loc2_.btnTxt.textAutoSize = "shrink";
      _loc2_.btnTxt.verticalAlign = "center";
      _loc2_.onColour = this.onTextColour;
      _loc2_.offColour = this.offTextColour;
      this.itemContainer._y = this.yClosed;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,_loc2_.btnTxt,_loc2_.btnTxt.html);
      this.numItems = this.numItems + 1;
      this.numVisibleItems = this.numVisibleItems + 1;
      this.drawMask();
      return _loc2_;
   }
   function removeAllItems()
   {
      this.itemContainer._y = this.yClosed;
      this.close();
      for(var _loc2_ in this.itemContainer)
      {
         this.itemContainer[_loc2_].removeMovieClip();
      }
      this.numItems = 0;
      this.numVisibleItems = 0;
   }
   function hideItemAt(index)
   {
      var _loc3_ = this.itemContainer.getInstanceAtDepth(index);
      _loc3_._visible = false;
      _loc3_._y = 0;
      this.numVisibleItems = 0;
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.numItems)
      {
         _loc3_ = this.itemContainer.getInstanceAtDepth(_loc2_);
         if(_loc3_._visible)
         {
            _loc3_._y = _loc4_;
            _loc4_ += this.itemSpacing;
            this.numVisibleItems = this.numVisibleItems + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.drawMask();
      this.yClosed = (- this.itemSpacing) * this.numVisibleItems;
      this.itemContainer._y = this.yClosed;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemContainer);
   }
   function showAllItems()
   {
      this.numVisibleItems = this.numItems;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.numItems)
      {
         _loc3_ = this.itemContainer.getInstanceAtDepth(_loc2_);
         _loc3_._visible = true;
         _loc3_.disabled = !this._isOpen;
         _loc3_._y = _loc2_ * this.itemSpacing;
         _loc2_ = _loc2_ + 1;
      }
      this.drawMask();
      this.yClosed = (- this.itemSpacing) * this.numVisibleItems;
      this.itemContainer._y = this.yClosed;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemContainer);
   }
   function open()
   {
      this._isOpen = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.itemContainer,com.rockstargames.gtav.web.vehicleSites.DropDown.OPEN_DURATION,{_y:this.yOpen,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      for(var _loc2_ in this.itemContainer)
      {
         this.itemContainer[_loc2_].disabled = !this.itemContainer[_loc2_]._visible;
      }
      this.container.dropDownHeader.closeIcon._visible = true;
   }
   function close()
   {
      this._isOpen = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.itemContainer,com.rockstargames.gtav.web.vehicleSites.DropDown.OPEN_DURATION,{_y:this.yClosed,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      for(var _loc2_ in this.itemContainer)
      {
         this.itemContainer[_loc2_].disabled = true;
      }
      this.container.dropDownHeader.closeIcon._visible = false;
   }
   function toggleOpen()
   {
      !this._isOpen ? this.open() : this.close();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemContainer);
   }
   function setHeaderText(label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,this.container.dropDownHeader.btnTxt,this.container.dropDownHeader.btnTxt.html);
   }
   function get isOpen()
   {
      return this._isOpen;
   }
   function init(headerOffset, defaultLabel)
   {
      this.container.dropDownHeader.btnTxt.textAutoSize = "shrink";
      this.container.dropDownHeader.btnTxt.verticalAlign = "center";
      this.setHeaderText(defaultLabel);
      this.container.dropDownHeader.onColour = this.onTextColour;
      this.container.dropDownHeader.offColour = this.offTextColour;
      this.container.dropDownHeader.closeIcon._visible = false;
      this.yOpen = this.yClosed = this.container.dropDownHeader._y + headerOffset;
      this.itemContainer = this.container.createEmptyMovieClip("itemContainer",this.container.getNextHighestDepth());
      this.itemContainer._x = this.container.dropDownHeader._x;
      this.itemContainer._y = this.yOpen;
      this.itemContainerMask = this.container.createEmptyMovieClip("itemContainerMask",this.container.getNextHighestDepth());
      this.itemContainerMask._x = this.container.dropDownHeader._x;
      this.itemContainerMask._y = this.yOpen;
      this.itemContainer.setMask(this.itemContainerMask);
      this.numItems = 0;
      this.numVisibleItems = 0;
      this._isOpen = false;
   }
   function drawMask()
   {
      var _loc2_ = Math.max(1,this.numVisibleItems) * this.itemSpacing;
      this.itemContainerMask.clear();
      this.itemContainerMask.beginFill(0,30);
      this.itemContainerMask.lineTo(this.itemContainer._width,0);
      this.itemContainerMask.lineTo(this.itemContainer._width,_loc2_);
      this.itemContainerMask.lineTo(0,_loc2_);
      this.itemContainerMask.lineTo(0,0);
      this.itemContainerMask.endFill();
   }
}
