class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var _highlighted;
   var bgMC;
   var itemTextLeft;
   function PauseMenuTextListItem()
   {
      super();
   }
   function set data(_d)
   {
      super.data = _d;
      this.snapBGGrid(this.bgMC);
      this.bgMC._visible = false;
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
   }
}
