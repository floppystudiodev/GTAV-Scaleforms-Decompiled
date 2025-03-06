class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_GALLERY extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var timelineMC;
   var columnList;
   var column1;
   var addColumn;
   var setupColumns;
   var setupColFooterScroll;
   var footerScrollOverride;
   var showColumns;
   function PAUSE_MENU_PAGES_GALLERY()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.timelineMC = mc;
      this.columnList = new Array();
      this.setupPage();
      this.stateChanged(0);
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("spGallery",1,0);
      this.setupColumns(this.column1);
      this.setupColFooterScroll([this.column1],[this.footerScrollOverride]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1];
      this.showColumns();
   }
   function onPageExit()
   {
      this.column1.ON_DESTROY();
   }
}
