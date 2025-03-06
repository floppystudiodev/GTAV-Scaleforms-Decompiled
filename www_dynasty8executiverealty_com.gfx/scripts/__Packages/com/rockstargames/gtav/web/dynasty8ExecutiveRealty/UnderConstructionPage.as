class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.UnderConstructionPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var view;
   function UnderConstructionPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"underConstructionPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.message,"DYN8_EXEC_UNDER_CONSTRUCTION",false);
   }
}
