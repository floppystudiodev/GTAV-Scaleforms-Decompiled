class com.rockstargames.gtav.web.foreclosures.BailOfficeTransporterPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BAIL";
   function BailOfficeTransporterPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bailOfficeTransporterPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.bailOfficeStyle == -1)
      {
         this.website.bailOfficeStyle = 0;
      }
      if(this.website.bailOfficeStaff1 == -1)
      {
         this.website.bailOfficeStaff1 = 0;
      }
      if(this.website.bailOfficeStaff2 == -1)
      {
         this.website.bailOfficeStaff2 = 0;
      }
      if(this.website.bailOfficeQuarters == -1)
      {
         this.website.bailOfficeQuarters = 0;
      }
      if(this.website.bailOfficeGunLocker == -1)
      {
         this.website.bailOfficeGunLocker = 0;
      }
      if(this.website.bailOfficeTransporter == -1)
      {
         this.website.bailOfficeTransporter = 0;
      }
      var _loc2_ = this.website.getSelectedBailOffice();
      if(this.website.purchasedBailOfficeGunLocker != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_GUN_LOCKER_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeQuarters != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_QUARTERS_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeStaff1 != 1 || this.website.purchasedBailOfficeStaff2 != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STAFF_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_TINT_PAGE.name;
      }
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initBailOfficeProgress(5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCBAIL_TRANSP_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BailOfficeTransporterPage.TXD],["transporter"]);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_;
      _loc2_ = this.view.transporterButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCBAIL_TRANSP",false);
      if(!this.website.getSelectedBailOffice().isOwned || this.website.purchasedBailOfficeTransporter == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "transporterButton":
            this.website.bailOfficeTransporter = this.website.bailOfficeTransporter != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.transporterButton.tick._visible = this.website.bailOfficeTransporter == 1;
      this.progressPanel.updateBailOfficeCosts();
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
