class com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList
{
   var items;
   var nextItemY;
   var view;
   static var ROW_SPACING = -3;
   static var ROW_TOP_OFFSET = 30;
   function TodoList(view, titleLabel)
   {
      this.view = view;
      this.nextItemY = com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList.ROW_TOP_OFFSET;
      com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_SETUP.setLocalisedText(view.title,titleLabel);
      view.magnet._x = view.title._x + 0.5 * (view.title._width - view.title.textWidth) - view.magnet._width - 4;
      this.items = [];
   }
   function addItem(itemText, isComplete)
   {
      var _loc3_ = this.view.getNextHighestDepth();
      var _loc2_ = this.view.attachMovie("todoListItem","item" + _loc3_,_loc3_);
      _loc2_.label.autoSize = "left";
      _loc2_.label.text = itemText;
      _loc2_.tick._visible = isComplete;
      _loc2_._y = this.nextItemY;
      this.nextItemY += _loc2_._height + com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList.ROW_SPACING;
      this.items.push(_loc2_);
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
      this.nextItemY = com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.TodoList.ROW_TOP_OFFSET;
   }
}
