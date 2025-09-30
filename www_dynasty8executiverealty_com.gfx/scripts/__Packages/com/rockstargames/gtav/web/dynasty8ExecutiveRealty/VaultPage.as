class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.VaultPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "DYN8_EXEC_DEFAULT";
   static var IMAGES = ["VAULT_EXEC_RICH","VAULT_EXEC_COOL","VAULT_EXEC_CONTRAST","VAULT_OLDSPICE_WARM","VAULT_OLDSPICE_CLASSICAL","VAULT_OLDSPICE_VINTAGE","VAULT_POWER_ICE","VAULT_POWER_CONSERVATIVE","VAULT_POWER_POLISHED"];
   function VaultPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"vaultPage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.vault == -1)
      {
         this.website.vault = 0;
      }
      var _loc2_ = this.website.getSelectedOffice();
      if(!_loc2_.isOwned || this.website.purchasedGunLocker != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SIGNAGE_PAGE.name;
      }
      if(!_loc2_.isOwned || this.website.purchasedBed != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.BED_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.SUMMARY_PAGE.name;
      }
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_VAULT_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(5);
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
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.VaultPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.VaultPage.IMAGES[this.website.style]]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView.offColour = com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page.DROP_DOWN_GREEN;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(buttonView.btnTxt,"DYN8_EXEC_VAULT",false);
      if(!this.website.getSelectedOffice().isOwned || this.website.purchasedVault == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.vault = this.website.vault != 0 ? 0 : 1;
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
      this.view.optionButton.tick._visible = this.website.vault == 1;
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
