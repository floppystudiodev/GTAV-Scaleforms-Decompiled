class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_GAME extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var addColumn;
   var column1;
   var column2;
   var column3;
   var column4;
   var columnList;
   var setupColMouseNav;
   var setupColScroll;
   var setupColumns;
   var showColumns;
   function PAUSE_MENU_PAGES_GAME()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("replayMenuList",1,0);
      this.column2 = this.addColumn("settingsList",2,290);
      this.column3 = this.addColumn("replayMenuList",3,290);
      this.column4 = this.addColumn("missionReplayCard",4,580);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4],[true,true,true,true]);
      this.setupColMouseNav([this.column1,this.column2,this.column3,this.column4],[true,true,true,false]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      switch(id)
      {
         case com.rockstargames.gtav.constants.PauseMenuLUT.GAME:
         case com.rockstargames.gtav.constants.PauseMenuLUT.NEW_GAME:
            this.columnList = [this.column1];
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.LOAD_GAME:
         case com.rockstargames.gtav.constants.PauseMenuLUT.SAVE_GAME_LIST:
         case com.rockstargames.gtav.constants.PauseMenuLUT.PROCESS_SAVEGAME:
         case com.rockstargames.gtav.constants.PauseMenuLUT.PROCESS_SAVEGAME_LIST:
            this.columnList = [this.column1,this.column2];
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_RANDOM:
         case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION:
         case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION_LIST:
         case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION_ACTIVITY:
         default:
            this.columnList = [this.column1,this.column3,this.column4];
      }
      this.showColumns();
   }
}
