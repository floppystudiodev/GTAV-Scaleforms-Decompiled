class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "DYN8_EXEC_AGENCY";
   static var IMAGES = [["ART0_0","ART0_1"],["ART1_0","ART1_1"],["ART2_0","ART2_1"]];
   static var NUM_ART_OPTIONS = 3;
   function AgencyArtPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"agencyArtPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.agencyArt == -1)
      {
         this.website.agencyArt = 0;
      }
      var _loc2_ = this.website.getSelectedAgency();
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_WALLPAPER_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAgencyProgress(1);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_AG_ART_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.TXD,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.IMAGES[this.website.agencyArt]);
   }
   function initOptionButtons()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.NUM_ART_OPTIONS)
      {
         _loc2_ = this.view.optionButtons["artButton_" + _loc3_];
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
         case "artButton":
            this.website.agencyArt = parseInt(id);
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
      while(_loc2_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.NUM_ART_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["artButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.agencyArt;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.TXD,com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyArtPage.IMAGES[this.website.agencyArt]);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.label,"DYN8_EXEC_AG_ART_" + this.website.agencyArt);
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
