class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_FRIENDS_MP extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var addColumn;
   var column1;
   var column2;
   var column3;
   var column4;
   var column5;
   var columnList;
   var setupColumns;
   var showColumns;
   function PAUSE_MENU_PAGES_FRIENDS_MP()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("mpFriendsList",1,0);
      this.column2 = this.addColumn("mpPlayerModel",2,290);
      this.column3 = this.addColumn("mpPlayerCard",3,580);
      this.column4 = this.addColumn("playerComparisonCard",4,580);
      this.column5 = this.addColumn("playerComparisonCard",5,725);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3,this.column4,this.column5];
      this.showColumns();
      this.column3.SHOW_COLUMN(false);
      this.column4.SHOW_COLUMN(false);
      this.column5.SHOW_COLUMN(false);
   }
}
