class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_WEAPONS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var column1;
   var addColumn;
   var setupColumns;
   var setupColMouseNav;
   var columnList;
   var showColumns;
   function PAUSE_MENU_PAGES_WEAPONS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("mpWeapons",1,0);
      this.setupColumns(this.column1);
      this.setupColMouseNav([this.column1],[true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1];
      this.showColumns();
   }
}
