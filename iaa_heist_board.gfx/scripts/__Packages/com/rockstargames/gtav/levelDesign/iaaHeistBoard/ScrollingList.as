class com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingList
{
   var view;
   var items;
   var nextItemY;
   var viewMinY;
   var viewMaxY;
   var scrollMinY;
   var scrollMaxY;
   var scrollGoalY;
   var updateScrollArgs;
   var scrollContainer;
   static var ITEM_SPACING = 17;
   static var DAMPING = 0.35;
   function ScrollingList(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.items = [];
      this.nextItemY = 0;
      this.viewMinY = 0;
      this.viewMaxY = this.view.scrollbar._height;
      this.scrollMinY = 0;
      this.scrollMaxY = 0;
      this.scrollGoalY = 0;
      this.updateScrollArgs = {onCompleteScope:this,onComplete:this.updateScroll};
      this.scrollContainer = this.view.createEmptyMovieClip("scrollContainer",0);
      this.view.maskTop.swapDepths(1);
      this.view.maskBottom.swapDepths(2);
      this.view.scrollbar.swapDepths(3);
   }
   function addItem(description)
   {
      var _loc2_ = this.items.length;
      var _loc5_ = com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs.SCROLL_ITEM_MIN + _loc2_;
      var _loc3_ = this.scrollContainer.attachMovie("scrollItem","item" + _loc2_,_loc2_);
      _loc3_._y = this.nextItemY;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingListItem(_loc3_,_loc2_,_loc5_,description);
      this.nextItemY += _loc4_.height + com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingList.ITEM_SPACING;
      this.items.push(_loc4_);
      this.view.scrollbar.handle._height = this.view.scrollbar.track._height * this.view.scrollbar.track._height / this.scrollContainer._height;
      this.view.scrollbar.handle._visible = this.view.scrollbar.track._visible = this.view.scrollbar.handle._height < this.view.scrollbar.track._height;
      this.scrollMaxY = - this.scrollContainer._height + this.view.scrollbar._height;
   }
   function removeAllItems()
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         this.items[_loc2_].view.removeMovieClip();
         this.items[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.items.length = 0;
      this.nextItemY = 0;
      this.scrollGoalY = 0;
      this.scrollContainer._y = 0;
      this.view.scrollbar.handle._y = 0;
   }
   function appendNavigationElementsTo(list)
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         list.push(this.items[_loc2_].highlight);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setActiveItem(index)
   {
      var _loc2_ = this.items[index];
      if(_loc2_.top < this.viewMinY)
      {
         this.scrollGoalY = this.viewMinY - _loc2_.top + this.scrollContainer._y;
         this.updateScroll();
      }
      else if(_loc2_.bottom > this.viewMaxY)
      {
         this.scrollGoalY = this.viewMaxY - _loc2_.bottom + this.scrollContainer._y;
         this.updateScroll();
      }
   }
   function updateScroll()
   {
      this.scrollContainer._y += com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingList.DAMPING * (this.scrollGoalY - this.scrollContainer._y);
      this.view.scrollbar.handle._y = (this.view.scrollbar.track._height - this.view.scrollbar.handle._height) * (this.scrollContainer._y - this.scrollMinY) / (this.scrollMaxY - this.scrollMinY);
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         this.items[_loc2_].updateHighlightBounds();
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,this.updateScrollArgs);
   }
   function dispose()
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         this.items[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
