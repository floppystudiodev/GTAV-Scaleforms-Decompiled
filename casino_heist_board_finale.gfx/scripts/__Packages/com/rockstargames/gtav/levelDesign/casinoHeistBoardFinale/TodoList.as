class com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList
{
   var view;
   var nextItemY;
   var items;
   static var ROW_SPACING = -3;
   static var ROW_TOP_OFFSET = 30;
   function TodoList(view, titleLabel)
   {
      this.view = view;
      this.nextItemY = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList.ROW_TOP_OFFSET;
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_FINALE.setLocalisedText(view.title,titleLabel);
      this.items = [];
      view._visible = false;
   }
   function addItem(itemText, isComplete)
   {
      var _loc3_ = this.view.getNextHighestDepth();
      var _loc2_ = this.view.attachMovie("todoListItem","item" + _loc3_,_loc3_);
      _loc2_.label.autoSize = "left";
      _loc2_.label.text = itemText;
      _loc2_.tick._visible = isComplete;
      _loc2_._y = this.nextItemY;
      this.nextItemY += _loc2_._height + com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList.ROW_SPACING;
      this.items.push(_loc2_);
      this.view._visible = true;
   }
   function clear()
   {
      var _loc2_ = 0;
      var _loc3_ = this.items.length;
      while(_loc2_ < _loc3_)
      {
         this.items[_loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.items.length = 0;
      this.nextItemY = com.rockstargames.gtav.levelDesign.casinoHeistBoardFinale.TodoList.ROW_TOP_OFFSET;
      this.view._visible = false;
   }
}
