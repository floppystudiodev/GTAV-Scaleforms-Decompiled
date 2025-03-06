class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var bgMC;
   var itemTextLeft;
   function PauseMenuTitleItem()
   {
      super();
   }
   function set data(_d)
   {
      super.data = _d;
      this.snapBGGrid(this.bgMC);
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function highlightTitle(_h)
   {
      super.highlighted = _h;
   }
}
