class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_STATS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var addColumn;
   var column1;
   var column2;
   var column3;
   var columnList;
   var footerScrollOverride;
   var setupColFooterScroll;
   var setupColScroll;
   var setupColumns;
   var showColumns;
   function PAUSE_MENU_PAGES_STATS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("statsVerticalMenuList",1,0);
      this.column2 = this.addColumn("statsList",2,290);
      this.column3 = this.addColumn("spPlayerStatsList",3,290);
      this.setupColumns(this.column1,this.column2,this.column3);
      this.setupColScroll([this.column1,this.column2,this.column3],[true,true,false]);
      this.setupColFooterScroll([this.column1,this.column2,this.column3],[-1,this.footerScrollOverride,2]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3];
      this.showColumns();
      this.column3.SHOW_COLUMN(false);
   }
}
