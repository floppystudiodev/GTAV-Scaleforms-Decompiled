class com.rockstargames.gtav.web.foreclosures.BaseQuartersPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BASE";
   function BaseQuartersPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"baseQuartersPage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.baseQuarters == -1)
      {
         this.website.baseQuarters = 0;
      }
      if(this.website.baseWindow == -1)
      {
         this.website.baseWindow = 0;
      }
      var _loc2_ = this.website.getSelectedBase();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_LOUNGE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BASE_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCBASE_QRT_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initBaseProgress(6);
      this.initSlideshow();
      this.initSelectionButton(this.view.selectionButton);
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initSelectionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCBASE_QRT",false);
      if(!this.website.getSelectedBase().isOwned || this.website.purchasedBaseQuarters == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initOptionButtons()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < 3)
      {
         _loc2_ = this.view["optionButton_" + _loc3_];
         _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_._y = this.view.selectionButton._y + this.view.selectionButton._height + 20;
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCBASE_QRT" + (_loc3_ + 1),false);
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "selectionButton":
            this.website.baseQuarters = this.website.baseQuarters != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "optionButton":
            this.website.baseQuarters = parseInt(id) + 1;
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
      this.view.selectionButton.tick._visible = this.website.baseQuarters != 0;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.view["optionButton_" + _loc2_];
         _loc3_._visible = this.website.baseQuarters != 0;
         _loc3_.disabled = this.website.baseQuarters == 0;
         _loc3_.selected._visible = _loc2_ == this.website.baseQuarters - 1;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = Math.max(1,this.website.baseQuarters);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BaseQuartersPage.TXD],["quarters" + _loc4_]);
      this.progressPanel.updateBaseCosts();
   }
   function setDisabledButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.view["optionButton_" + _loc2_];
         _loc3_.disabled = this.website.baseQuarters == 0;
         _loc2_ = _loc2_ + 1;
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
