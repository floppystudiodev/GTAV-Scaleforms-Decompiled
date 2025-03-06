class com.rockstargames.gtav.web.arena.pages.UnderConstructionPage extends com.rockstargames.gtav.web.arena.Page
{
   var progressPanel;
   var view;
   var website;
   function UnderConstructionPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"underConstructionPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      this.progressPanel.hide();
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.message,"MBA_UNDER_CONST",false);
      this.website.setPageHeight(com.rockstargames.gtav.web.arena.Page.BASE_PAGE_HEIGHT);
   }
}
