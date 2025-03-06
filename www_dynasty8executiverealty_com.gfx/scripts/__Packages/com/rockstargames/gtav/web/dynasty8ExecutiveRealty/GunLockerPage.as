class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GunLockerPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   static var TXD = "DYN8_EXEC_DEFAULT";
   static var IMAGES = ["GUNLOCKER_EXEC_RICH","GUNLOCKER_EXEC_COOL","GUNLOCKER_EXEC_CONTRAST","GUNLOCKER_OLDSPICE_WARM","GUNLOCKER_OLDSPICE_CLASSICAL","GUNLOCKER_OLDSPICE_VINTAGE","GUNLOCKER_POWER_ICE","GUNLOCKER_POWER_CONSERVATIVE","GUNLOCKER_POWER_POLISHED"];
   function GunLockerPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"gunLockerPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.style == -1)
      {
         this.website.style = 0;
      }
      if(this.website.personnel == -1)
      {
         this.website.personnel = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.colour == -1)
      {
         this.website.colour = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      var _loc2_ = this.website.getSelectedOffice();
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SIGNAGE_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedVault != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.VAULT_PAGE.name;
      }
      else if(this.website.purchasedBed != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      }
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_GUN_LOCKER_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(4);
      if(this.website.styleWhenLastOnSignagePage != -1 && this.website.styleWhenLastOnSignagePage != this.website.style)
      {
         this.progressPanel.showSignageExclamation();
      }
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GunLockerPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.GunLockerPage.IMAGES[this.website.style]]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView.offColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(buttonView.btnTxt,"DYN8_EXEC_GUN_LOCKER",false);
      if(!this.website.getSelectedOffice().isOwned || this.website.purchasedGunLocker == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.gunLocker = this.website.gunLocker != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.gunLocker == 1;
      this.progressPanel.updateCosts();
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
