class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_SETTINGS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var addColumn;
   var column1;
   var column2;
   var column3;
   var columnList;
   var setupColScroll;
   var setupColumns;
   var showColumns;
   function PAUSE_MENU_PAGES_SETTINGS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("settingsList",2,290);
      this.column3 = this.addColumn("configurationList",3,290);
      this.setupColumns(this.column1,this.column2,this.column3);
      this.setupColScroll([this.column1,this.column2,this.column3],[true,true,true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3];
      switch(id)
      {
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_CONTROLS:
            this.column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_FACEBOOK:
            this.column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_AUDIO:
            this.column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_MISC_CONTROLS:
         case com.rockstargames.gtav.constants.PauseMenuLUT.MENU_UNIQUE_ID_SETTINGS_FPS:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_DISPLAY:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_CAMERA:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_VIDEO:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_GRAPHICS:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_VOICE_CHAT:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_FEED:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_REPLAY:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_SAVEGAME:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_SIXAXIS:
            this.column2.SET_STATE(0);
      }
      this.showColumns();
   }
}
