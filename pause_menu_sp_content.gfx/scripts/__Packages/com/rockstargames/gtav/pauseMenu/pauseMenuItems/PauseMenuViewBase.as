class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase extends com.rockstargames.ui.components.GUIView
{
   var maxVisibleItems = 16;
   function PauseMenuViewBase()
   {
      super();
   }
   function set params(_p)
   {
      super.params = _p;
      this.maxVisibleItems = this.visibleItems;
   }
   function displayView()
   {
      this.visibleItems = this.maxVisibleItems;
      super.displayView();
   }
}
