class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_SAVE extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var column1;
   var addColumn;
   var setupColumns;
   var columnList;
   var showColumns;
   function PAUSE_MENU_PAGES_SAVE()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("textListFull",1,0);
      this.setupColumns(this.column1);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1];
      this.showColumns();
   }
}
