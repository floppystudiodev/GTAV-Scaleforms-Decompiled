class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArmoryPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "DYN8_EXEC_AGENCY";
   static var IMAGES = ["ARMORY"];
   function AgencyArmoryPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"agencyArmoryPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.agencyArt == -1)
      {
         this.website.agencyArt = 0;
      }
      if(this.website.agencyWallpaper == -1)
      {
         this.website.agencyWallpaper = 0;
      }
      if(this.website.agencyHighlight == -1)
      {
         this.website.agencyHighlight = 0;
      }
      if(this.website.agencyArmory == -1)
      {
         this.website.agencyArmory = 0;
      }
      var _loc2_ = this.website.getSelectedAgency();
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_HIGHLIGHT_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedAgencyQuarters != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_QUARTERS_PAGE.name;
      }
      else if(!_loc2_.isOwned || this.website.purchasedAgencyVehicle != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_VEHICLE_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_AG_ARMORY_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initAgencyProgress(4);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArmoryPage.TXD,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArmoryPage.IMAGES);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView.offColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(buttonView.btnTxt,"DYN8_EXEC_AG_ARMORY",false);
      if(!this.website.getSelectedAgency().isOwned || this.website.purchasedAgencyArmory == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.agencyArmory = this.website.agencyArmory != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.agencyArmory == 1;
      this.progressPanel.updateAgencyCosts();
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
