class com.rockstargames.gtav.web.foreclosures.UnderConstructionPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var view;
   function UnderConstructionPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"underConstructionPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.message,"FORECLOSURES_UNDER_CONSTRUCTION",false);
   }
}
