class com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_BAIL";
   function BailOfficeStaffPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bailOfficeStaffPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedBailOffice();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_STYLE_PAGE.name;
      if(this.website.purchasedBailOfficeQuarters != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_QUARTERS_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeGunLocker != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_GUN_LOCKER_PAGE.name;
      }
      else if(this.website.purchasedBailOfficeTransporter != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_TRANSPORTER_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BAIL_OFFICE_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initBailOfficeProgress(2);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCBAIL_STAFF_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc3_ = this.website.getSelectedBailOffice();
      var _loc2_ = undefined;
      _loc2_ = this.view.staff1Button;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCBAIL_STAFF_1",false);
      if(!_loc3_.isOwned || this.website.purchasedBailOfficeStaff1 != 1)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
      _loc2_ = this.view.staff2Button;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.staff1Button._y + this.view.staff1Button._height + 10;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCBAIL_STAFF_2",false);
      if(!_loc3_.isOwned || this.website.purchasedBailOfficeStaff2 != 1)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "staff1Button":
            this.website.bailOfficeStaff1 = this.website.bailOfficeStaff1 != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "staff2Button":
            this.website.bailOfficeStaff2 = this.website.bailOfficeStaff2 != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.staff1Button.tick._visible = this.website.bailOfficeStaff1 == 1;
      this.view.staff2Button.tick._visible = this.website.bailOfficeStaff2 == 1;
      this.progressPanel.updateBailOfficeCosts();
      if(this.website.bailOfficeStaff1 == 1 && this.website.bailOfficeStaff2 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage.TXD],["staff_1_2"]);
      }
      else if(this.website.bailOfficeStaff1 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage.TXD],["staff_1"]);
      }
      else if(this.website.bailOfficeStaff2 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage.TXD],["staff_2"]);
      }
      else
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BailOfficeStaffPage.TXD],["staff_1_2"]);
      }
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
