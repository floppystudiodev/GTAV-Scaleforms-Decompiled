class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "DYN8_EXEC_AGENCY";
   static var IMAGES = ["HIGHLIGHT0","HIGHLIGHT1","HIGHLIGHT2","HIGHLIGHT3","HIGHLIGHT4","HIGHLIGHT5","HIGHLIGHT6","HIGHLIGHT7","HIGHLIGHT8"];
   static var NUM_HIGHLIGHT_OPTIONS = 9;
   function AgencyHighlightPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"agencyHighlightPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.agencyArt == -1)
      {
         this.website.agencyArt = 0;
      }
      if(this.website.agencyHighlight == -1)
      {
         this.website.agencyHighlight = 0;
      }
      var _loc2_ = this.website.getSelectedAgency();
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_WALLPAPER_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedAgencyArmory != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ARMORY_PAGE.name;
      }
      else if(!_loc2_.isOwned || this.website.purchasedAgencyQuarters != 1)
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
      this.progressPanel.show();
      this.progressPanel.initAgencyProgress(3);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_AG_HI_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.IMAGES[this.website.agencyHighlight]]);
   }
   function initOptionButtons()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.NUM_HIGHLIGHT_OPTIONS)
      {
         _loc2_ = this.view.optionButtons["highlightButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.view.optionButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "highlightButton":
            this.website.agencyHighlight = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerAgencySelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.progressPanel.updateAgencyCosts();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.NUM_HIGHLIGHT_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["highlightButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.agencyHighlight;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyHighlightPage.IMAGES[this.website.agencyHighlight]]);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.label,"DYN8_EXEC_AG_HI_" + this.website.agencyHighlight);
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
