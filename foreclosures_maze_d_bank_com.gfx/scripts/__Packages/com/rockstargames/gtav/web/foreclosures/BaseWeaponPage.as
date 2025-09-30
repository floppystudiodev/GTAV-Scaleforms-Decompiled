class com.rockstargames.gtav.web.foreclosures.BaseWeaponPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BASE";
   function BaseWeaponPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"baseWeaponPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.baseStyle == -1)
      {
         this.website.baseStyle = 0;
      }
      if(this.website.baseGraphics == -1)
      {
         this.website.baseGraphics = 0;
      }
      if(this.website.baseWeapon == -1)
      {
         this.website.baseWeapon = 0;
      }
      var _loc2_ = this.website.getSelectedBase();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_GRAPHICS_PAGE.name;
      if(this.website.purchasedBaseSecurity != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SECURITY_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_LOUNGE_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCBASE_WEA_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initBaseProgress(3);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BaseWeaponPage.TXD],["weapon"]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCBASE_WEA",false);
      if(!this.website.getSelectedBase().isOwned || this.website.purchasedBaseWeapon == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.baseWeapon = this.website.baseWeapon != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.baseWeapon != 0;
      this.progressPanel.updateBaseCosts();
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
