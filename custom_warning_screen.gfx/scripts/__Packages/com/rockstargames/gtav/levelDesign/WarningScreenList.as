class com.rockstargames.gtav.levelDesign.WarningScreenList extends MovieClip
{
   var CurrentIndex;
   var ItemCounter;
   var Elements = [];
   function WarningScreenList()
   {
      super();
      this.CurrentIndex = 0;
      this.ItemCounter = 0;
   }
   function setItem(text)
   {
      if(text != "")
      {
         var _loc2_ = this.attachMovie("WarningScreenListItem","Option" + this.ItemCounter + "MC",this.getNextHighestDepth());
         this.Elements[this.ItemCounter] = _loc2_;
         _loc2_.setText(text);
         _loc2_._y = this.ItemCounter * (_loc2_._height + 2);
         this.ItemCounter = this.ItemCounter + 1;
      }
   }
   function setSelectedItem(selectedItem)
   {
      var _loc2_ = this.Elements[this.CurrentIndex];
      _loc2_.setActive(false);
      this.CurrentIndex = selectedItem;
      _loc2_ = this.Elements[this.CurrentIndex];
      _loc2_.setActive(true);
   }
   function reset()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.ItemCounter)
      {
         this.Elements[_loc2_].removeMovieClip();
         this.Elements[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
      this.Elements = [];
      this.CurrentIndex = 0;
      this.ItemCounter = 0;
   }
   function debug()
   {
      this.ItemCounter = 6;
   }
}
