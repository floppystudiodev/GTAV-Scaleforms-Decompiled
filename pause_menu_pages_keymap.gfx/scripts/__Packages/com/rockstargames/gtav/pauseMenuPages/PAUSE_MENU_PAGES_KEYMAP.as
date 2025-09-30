class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_KEYMAP extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var addColumn;
   var bindingList;
   var columnList;
   var itemList;
   var setupColMouseNav;
   var setupColScroll;
   var setupColumns;
   var showColumns;
   function PAUSE_MENU_PAGES_KEYMAP()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.itemList = this.addColumn("categoryList",1,0);
      this.bindingList = this.addColumn("configurationList",2,290);
      this.setupColumns(this.itemList,this.bindingList);
      this.setupColScroll([this.itemList,this.bindingList],[true,true]);
      this.setupColMouseNav([this.itemList,this.bindingList],[true,true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.itemList,this.bindingList];
      this.showColumns();
   }
}
