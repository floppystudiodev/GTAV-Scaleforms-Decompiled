class com.rockstargames.gtav.web.foreclosures.BaseLoungePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var view;
   var progressPanel;
   var slideshow;
   static var TXD = "FORECLOSURES_BASE";
   function BaseLoungePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"baseLoungePage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.baseSecurity == -1)
      {
         this.website.baseSecurity = 0;
      }
      if(this.website.baseLounge == -1)
      {
         this.website.baseLounge = 0;
      }
      if(this.website.baseWindow == -1)
      {
         this.website.baseWindow = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SECURITY_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_QUARTERS_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCBASE_LNG_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initBaseProgress(5);
      this.initSlideshow();
      this.initWindowButton(this.view.windowButton);
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initWindowButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCBASE_WIND",false);
      if(!this.website.getSelectedBase().isOwned || this.website.purchasedBaseWindow == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initOptionButtons()
   {
      var _loc3_ = 0;
      while(_loc3_ < 3)
      {
         var _loc2_ = this.view["optionButton_" + _loc3_];
         _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_._y = this.view.windowButton._y + this.view.windowButton._height + 10;
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCBASE_LNG" + (_loc3_ + 1),false);
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "windowButton":
            this.website.baseWindow = this.website.baseWindow != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "optionButton":
            this.website.baseLounge = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.view.windowButton.tick._visible = this.website.baseWindow != 0;
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         var _loc3_ = this.view["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.baseLounge;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = this.website.baseLounge + 1;
      if(this.website.baseWindow != 0)
      {
         _loc4_ += this.website.numBaseLounges;
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BaseLoungePage.TXD],["lounge" + _loc4_]);
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
