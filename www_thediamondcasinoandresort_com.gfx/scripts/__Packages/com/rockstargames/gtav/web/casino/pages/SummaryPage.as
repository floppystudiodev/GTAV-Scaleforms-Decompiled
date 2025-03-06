class com.rockstargames.gtav.web.casino.pages.SummaryPage extends com.rockstargames.gtav.web.casino.Page
{
   var website;
   var prevPageName;
   var view;
   var progressPanel;
   function SummaryPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"summaryPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      if(this.website.styleOption == -1)
      {
         this.website.styleOption = 0;
      }
      if(this.website.colourOption == -1)
      {
         this.website.colourOption = 0;
      }
      if(this.website.garageOption == -1)
      {
         this.website.garageOption = 0;
      }
      if(this.website.bedroomOption == -1)
      {
         this.website.bedroomOption = 0;
      }
      if(this.website.loungeOption == -1)
      {
         this.website.loungeOption = 0;
      }
      if(this.website.mediaRoomOption == -1)
      {
         this.website.mediaRoomOption = 0;
      }
      if(this.website.barOption == -1)
      {
         this.website.barOption = 0;
      }
      if(this.website.spaOption == -1)
      {
         this.website.spaOption = 0;
      }
      if(this.website.dealerOption == -1)
      {
         this.website.dealerOption = 0;
      }
      if(this.website.officeOption == -1)
      {
         this.website.officeOption = 0;
      }
      this.initNav();
      this.initProgressPanel();
      this.initText();
      this.initButtons();
      this.initOptions();
      this.initVerticalLayout();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_STYLE_PAGE.name;
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.patternLabel,"CASWEB_PATTERN",2,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.colourLabel,"CASWEB_COLOUR",2,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.totalLabel,this.view.progressPanel.total.cost.text,2,true,true);
   }
   function initProgressPanel()
   {
      this.progressPanel = new com.rockstargames.gtav.web.casino.ProgressPanel(this.view.progressPanel,this.website);
      this.progressPanel.setCurrentStep(3);
      this.view.progressPanel.total.bg.gotoAndStop(2);
      this.progressPanel.updateCosts();
   }
   function initButtons()
   {
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.purchaseButton,"CASWEB_BUYNOW");
      if(this.website.suiteIsOwned && this.website.styleOption == this.website.purchasedStyleOption && this.website.colourOption == this.website.purchasedColourOption && this.website.garageOption == this.website.purchasedGarageOption && this.website.bedroomOption == this.website.purchasedBedroomOption && this.website.loungeOption == this.website.purchasedLoungeOption && this.website.mediaRoomOption == this.website.purchasedMediaRoomOption && this.website.barOption == this.website.purchasedBarOption && this.website.spaOption == this.website.purchasedSpaOption && this.website.dealerOption == this.website.purchasedDealerOption && this.website.officeOption == this.website.purchasedOfficeOption)
      {
         this.view.purchaseButton._alpha = 50;
         this.view.purchaseButton.disabled = true;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initOptions()
   {
      this.view.styleSwatch.gotoAndStop(this.website.styleOption + 1);
      this.view.colourSwatch.gotoAndStop(this.website.colourOption + 1);
      this.initOption(this.view.defaultOption,1,10,9,"CASWEB_OPTION_0");
      this.initOption(this.view.garageOption,this.website.garageOption,1,1,"CASWEB_OPTION_1");
      this.initOption(this.view.bedroomOption,this.website.bedroomOption,2,2,"CASWEB_OPTION_2");
      this.initOption(this.view.loungeOption,this.website.loungeOption,3,3,"CASWEB_OPTION_3");
      this.initOption(this.view.mediaRoomOption,this.website.mediaRoomOption,4,4,"CASWEB_OPTION_4");
      this.initOption(this.view.barOption,this.website.barOption <= 0 ? 0 : 1,this.website.barOption != 1 ? 6 : 5,5,"CASWEB_OPTION_5");
      this.initOption(this.view.spaOption,this.website.spaOption,7,6,"CASWEB_OPTION_6");
      this.initOption(this.view.dealerOption,this.website.dealerOption,8,7,"CASWEB_OPTION_7");
      this.initOption(this.view.officeOption,this.website.officeOption,9,8,"CASWEB_OPTION_8");
      this.view.floorplan.garageOff._visible = this.website.garageOption != 1;
      this.view.floorplan.garageOn._visible = this.website.garageOption == 1;
      this.view.floorplan.bedroomOff._visible = this.website.bedroomOption != 1;
      this.view.floorplan.bedroomOn._visible = this.website.bedroomOption == 1;
      this.view.floorplan.loungeOff._visible = this.website.loungeOption != 1;
      this.view.floorplan.loungeOn._visible = this.website.loungeOption == 1;
      this.view.floorplan.mediaRoomOff._visible = this.website.mediaRoomOption != 1;
      this.view.floorplan.mediaRoomOn._visible = this.website.mediaRoomOption == 1;
      this.view.floorplan.barOff._visible = this.website.barOption <= 0;
      this.view.floorplan.barOn._visible = this.website.barOption > 0;
      this.view.floorplan.spaOff._visible = this.website.spaOption != 1;
      this.view.floorplan.spaOn._visible = this.website.spaOption == 1;
      this.view.floorplan.dealerOff._visible = this.website.dealerOption != 1;
      this.view.floorplan.dealerOn._visible = this.website.dealerOption == 1;
      this.view.floorplan.officeOff._visible = this.website.officeOption != 1;
      this.view.floorplan.officeOn._visible = this.website.officeOption == 1;
   }
   function initOption(optionView, optionValue, swatchIndex, iconIndex, label)
   {
      optionView.icon.gotoAndStop(iconIndex);
      optionView.swatch.gotoAndStop(swatchIndex);
      optionView.swatch._alpha = optionValue == 1 ? 100 : 30;
      optionView.padlock._visible = optionValue != 1;
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(optionView.label,label,2,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(optionView.label);
      }
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "logo":
            this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
            break;
         case "purchaseButton":
            this.website.dispatchSuiteSelections();
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.PURCHASE_PENDING_PAGE.name);
            break;
         case "stepButton":
            this.website.browser.GO_TO_WEBPAGE(this.progressPanel.getStepPageTarget(parseInt(id)));
      }
   }
   function dispose()
   {
      this.progressPanel.dispose();
      super.dispose();
   }
}
