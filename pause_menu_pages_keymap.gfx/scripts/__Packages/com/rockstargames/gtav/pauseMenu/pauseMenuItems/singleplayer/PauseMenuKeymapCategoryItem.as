class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var warningMC;
   var initialIndex;
   function PauseMenuKeymapCategoryItem()
   {
      super();
   }
   function set data(_d)
   {
      super.data = _d;
      this.warningMC._visible = this.initialIndex == 1;
   }
}
