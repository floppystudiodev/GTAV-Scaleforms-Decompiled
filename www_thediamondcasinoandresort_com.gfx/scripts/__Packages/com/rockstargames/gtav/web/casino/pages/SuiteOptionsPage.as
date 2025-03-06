class com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage extends com.rockstargames.gtav.web.casino.Page
{
   var rolloverPoller;
   var view;
   var website;
   var prevPageName;
   var nextPageName;
   var slideshow;
   var progressPanel;
   var currPollerTarget;
   var optionsUnlocked;
   static var TXD = "CASINO_SUITES";
   static var SLIDESHOW_IMAGES = ["garage","bedroom","lounge","media_room","bar","spa","dealer","office"];
   function SuiteOptionsPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"suiteOptionsPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initRolloverPoller();
      this.initNav();
      this.initText();
      this.initSlideshow();
      this.initProgressPanel();
      this.initArcadePanel();
      this.initButtons();
      this.initVerticalLayout();
      this.setLockVisible();
      this.updateView();
   }
   function initRolloverPoller()
   {
      this.rolloverPoller = new com.rockstargames.gtav.web.casino.RolloverPoller(this.view,this.website.browser,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.delegate(this,this.onRolloverChange));
      this.rolloverPoller.addPollTarget(this.view.optionButtonDefault);
   }
   function initNav()
   {
      this.prevPageName = !this.website.suiteIsOwned ? com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITES_PAGE.name : com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.RENOVATE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_COLOUR_PAGE.name;
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_OPTIONS_HEADING",4,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.nextLabel,"CASWEB_COLOURS",4,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.nextLabel);
      }
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_OPTIONS_BODY");
      this.view.bodyBG._height = this.view.body._height + 32;
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.lock.label,"CASWEB_LOCK");
      this.view.lock.padlock._x = 0.5 * (this.view.lock.label._width - this.view.lock.label.textWidth) - 20;
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.casino.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.TXD,["master_suite"],0);
   }
   function initProgressPanel()
   {
      this.progressPanel = new com.rockstargames.gtav.web.casino.ProgressPanel(this.view.progressPanel,this.website);
      this.progressPanel.setCurrentStep(1);
      this.view.progressPanel.total.bg.outline._visible = false;
   }
   function initArcadePanel()
   {
      this.view.arcadePanel.arcadeButton_2.swatch.gotoAndStop(2);
      if(this.website.barOption > 0)
      {
         this.showArcadePanel();
      }
      else
      {
         this.hideArcadePanel();
      }
   }
   function initButtons()
   {
      this.view.optionButtonDefault.selected._visible = true;
      this.view.optionButtonDefault.swatch.gotoAndStop(9);
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.nextButton,"CASWEB_NEXT",3);
      var _loc2_ = {original:0,actual:0};
      this.website.getBarCosts(_loc2_);
      this.view.optionButtonDefault.padlock._visible = false;
      this.initOptionButton(0,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.GARAGE_COST_OFFSET,this.website.purchasedGarageOption == 1,false);
      this.initOptionButton(1,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BEDROOM_COST_OFFSET,this.website.purchasedBedroomOption == 1,false);
      this.initOptionButton(2,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.LOUNGE_COST_OFFSET,this.website.purchasedLoungeOption == 1,false);
      this.initOptionButton(3,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.MEDIA_ROOM_COST_OFFSET,this.website.purchasedMediaRoomOption == 1,false);
      this.initOptionButton(4,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BAR_COST_OFFSET,this.website.purchasedBarOption > 0,false);
      this.initOptionButton(5,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.SPA_COST_OFFSET,this.website.purchasedSpaOption == 1,false);
      this.initOptionButton(6,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.DEALER_COST_OFFSET,this.website.purchasedDealerOption == 1,this.website.privateDealerDisabled);
      this.initOptionButton(7,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.OFFICE_COST_OFFSET,this.website.purchasedOfficeOption == 1,false);
      this.website.dataTextScope.push(this.view.arcadePanel.arcadeButton_1.btnTxt);
      this.rolloverPoller.addPollTarget(this.view.arcadePanel.arcadeButton_1);
      this.website.dataTextScope.push(this.view.arcadePanel.arcadeButton_2.btnTxt);
      this.rolloverPoller.addPollTarget(this.view.arcadePanel.arcadeButton_2);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initOptionButton(index, costIndexOffset, optionAlreadyPurchased, isPadlocked)
   {
      var _loc2_ = this.view["optionButton_" + index];
      _loc2_.swatch.gotoAndStop(index + 1);
      _loc2_.padlock._visible = isPadlocked;
      this.rolloverPoller.addPollTarget(_loc2_);
      this.initOptionButtonCost(optionAlreadyPurchased,costIndexOffset,_loc2_);
      this.website.dataTextScope.push(_loc2_.btnTxt);
   }
   function initOptionButtonCost(optionAlreadyPurchased, costIndexOffset, buttonView)
   {
      var _loc4_ = this.website.getRawCost(costIndexOffset,false);
      var _loc3_ = this.website.getRawCost(costIndexOffset,true);
      if(optionAlreadyPurchased)
      {
         buttonView.cost.originalCost._visible = false;
      }
      else if(_loc3_ >= 0 && _loc3_ < _loc4_)
      {
         buttonView.cost.gotoAndStop("sale");
         buttonView.cost.originalCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc4_);
         buttonView.cost.saleCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc3_);
         buttonView.cost.strikethrough._width = buttonView.cost.originalCost.textWidth + 4;
         buttonView.cost.strikethrough._x = 0.5 * (buttonView.cost.originalCost._width - buttonView.cost.originalCost.textWidth);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(buttonView.cost.originalCost,0.7);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(buttonView.cost.saleCost,0.7);
         }
      }
      else
      {
         buttonView.cost.originalCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc4_);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(buttonView.cost.originalCost,0.7);
         }
      }
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function onRolloverChange(index, target)
   {
      if(index == 9 || index == 10)
      {
         if(!this.view.arcadePanel._visible)
         {
            index = -1;
         }
      }
      if(this.currPollerTarget)
      {
         this.currPollerTarget.gotoAndStop("off");
      }
      this.currPollerTarget = target;
      if(index >= 0 && index <= 3 || index >= 4 && this.optionsUnlocked)
      {
         this.currPollerTarget.gotoAndStop("pollOn");
      }
      if(index == -1)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_OPTIONS_HEADING",4,true,false);
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_OPTIONS_BODY");
         this.view.bodyBG._height = this.view.body._height + 32;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_OPTION_" + index,4,true,false);
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,index != 0 ? "CASWEB_OPT_DESC_" + index : "CASWEB_OPTIONS_BODY");
         this.view.bodyBG._height = this.view.body._height + 32;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "logo":
            this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
            break;
         case "nextButton":
            this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
            break;
         case "optionButton":
            this.toggleOption(parseInt(id));
            this.updateView();
            this.updateSlideshow(parseInt(id));
            break;
         case "stepButton":
            this.website.browser.GO_TO_WEBPAGE(this.progressPanel.getStepPageTarget(parseInt(id)));
            break;
         case "arcadeButton":
            this.website.barOption = parseInt(id);
            this.updateView();
            this.updateSlideshow(4);
      }
   }
   function updateSlideshow(index)
   {
      if(!this.optionsUnlocked)
      {
         if(index >= 3 && index <= 7)
         {
            return undefined;
         }
      }
      if(index == 6 && this.website.privateDealerDisabled)
      {
         return undefined;
      }
      var _loc2_ = 0;
      switch(index)
      {
         case 0:
            _loc2_ = this.website.garageOption;
            break;
         case 1:
            _loc2_ = this.website.bedroomOption;
            break;
         case 2:
            _loc2_ = this.website.loungeOption;
            break;
         case 3:
            _loc2_ = this.website.mediaRoomOption;
            break;
         case 4:
            _loc2_ = this.website.barOption;
            break;
         case 5:
            _loc2_ = this.website.spaOption;
            break;
         case 6:
            _loc2_ = this.website.dealerOption;
            break;
         case 7:
            _loc2_ = this.website.officeOption;
      }
      if(_loc2_ <= 0)
      {
         this.slideshow.show(com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.TXD,["master_suite"],0);
      }
      else if(index >= 0 && index < com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.SLIDESHOW_IMAGES.length)
      {
         if(index == 4)
         {
            var _loc4_ = this.website.barOption != 2 ? 1 : 2;
            this.slideshow.show(com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.TXD,[com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.SLIDESHOW_IMAGES[index] + "_" + _loc4_],0);
         }
         else
         {
            this.slideshow.show(com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.TXD,[com.rockstargames.gtav.web.casino.pages.SuiteOptionsPage.SLIDESHOW_IMAGES[index]],0);
         }
      }
   }
   function toggleOption(index)
   {
      switch(index)
      {
         case 0:
            this.website.garageOption = this.website.garageOption != 1 ? 1 : 0;
            break;
         case 1:
            this.website.bedroomOption = this.website.bedroomOption != 1 ? 1 : 0;
            break;
         case 2:
            this.website.loungeOption = this.website.loungeOption != 1 ? 1 : 0;
            if(this.website.loungeOption == 0)
            {
               this.website.mediaRoomOption = 0;
               this.website.barOption = 0;
               this.website.spaOption = 0;
               this.website.dealerOption = 0;
               this.website.officeOption = 0;
            }
            this.setLockVisible();
            break;
         case 3:
            if(this.optionsUnlocked)
            {
               this.website.mediaRoomOption = this.website.mediaRoomOption != 1 ? 1 : 0;
            }
            break;
         case 4:
            if(this.optionsUnlocked)
            {
               this.website.barOption = this.website.barOption <= 0 ? 1 : 0;
            }
            if(this.website.barOption > 0)
            {
               this.showArcadePanel();
            }
            else
            {
               this.hideArcadePanel();
            }
            break;
         case 5:
            if(this.optionsUnlocked)
            {
               this.website.spaOption = this.website.spaOption != 1 ? 1 : 0;
            }
            break;
         case 6:
            if(this.website.privateDealerDisabled)
            {
               return undefined;
            }
            if(this.optionsUnlocked)
            {
               this.website.dealerOption = this.website.dealerOption != 1 ? 1 : 0;
            }
            break;
         case 7:
            if(this.optionsUnlocked)
            {
               this.website.officeOption = this.website.officeOption != 1 ? 1 : 0;
            }
      }
   }
   function hideArcadePanel()
   {
      this.view.arcadePanel._visible = false;
      this.view.arcadePanel.arcadeButton_1.disabled = true;
      this.view.arcadePanel.arcadeButton_2.disabled = true;
   }
   function showArcadePanel()
   {
      this.view.arcadePanel._visible = true;
      this.view.arcadePanel.arcadeButton_1.tick._visible = this.website.barOption == 1;
      this.view.arcadePanel.arcadeButton_2.tick._visible = this.website.barOption == 2;
      this.view.arcadePanel.arcadeButton_1.disabled = false;
      this.view.arcadePanel.arcadeButton_2.disabled = false;
   }
   function setLockVisible()
   {
      this.optionsUnlocked = this.website.loungeOption == 1;
      var _loc2_ = 3;
      while(_loc2_ <= 7)
      {
         this.view["optionButton_" + _loc2_].bg._visible = this.optionsUnlocked;
         _loc2_ = _loc2_ + 1;
      }
      this.view.lock._visible = !this.optionsUnlocked;
   }
   function updateView()
   {
      this.view.optionButton_0.selected._visible = this.view.optionButton_0.cost._visible = this.website.garageOption == 1;
      this.view.optionButton_0.disabled = this.website.suiteIsOwned && this.website.purchasedGarageOption == 1;
      this.view.optionButton_1.selected._visible = this.view.optionButton_1.cost._visible = this.website.bedroomOption == 1;
      this.view.optionButton_1.disabled = this.website.suiteIsOwned && this.website.purchasedBedroomOption == 1;
      this.view.optionButton_2.selected._visible = this.view.optionButton_2.cost._visible = this.website.loungeOption == 1;
      this.view.optionButton_2.disabled = this.website.suiteIsOwned && this.website.purchasedLoungeOption == 1;
      this.view.optionButton_3.selected._visible = this.view.optionButton_3.cost._visible = this.website.mediaRoomOption == 1;
      this.view.optionButton_3.disabled = this.website.suiteIsOwned && this.website.purchasedMediaRoomOption == 1;
      this.view.optionButton_4.selected._visible = this.view.optionButton_4.cost._visible = this.website.barOption > 0;
      this.view.optionButton_4.disabled = this.website.suiteIsOwned && this.website.purchasedBarOption > 0;
      this.view.optionButton_5.selected._visible = this.view.optionButton_5.cost._visible = this.website.spaOption == 1;
      this.view.optionButton_5.disabled = this.website.suiteIsOwned && this.website.purchasedSpaOption == 1;
      this.view.optionButton_6.selected._visible = this.view.optionButton_6.cost._visible = this.website.dealerOption == 1;
      this.view.optionButton_6.disabled = this.website.suiteIsOwned && this.website.purchasedDealerOption == 1;
      this.view.optionButton_7.selected._visible = this.view.optionButton_7.cost._visible = this.website.officeOption == 1;
      this.view.optionButton_7.disabled = this.website.suiteIsOwned && this.website.purchasedOfficeOption == 1;
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
      if(this.website.barOption > 0)
      {
         this.showArcadePanel();
      }
      else
      {
         this.hideArcadePanel();
      }
      this.progressPanel.updateCosts();
      this.initOptionButtonCost(false,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.BAR_COST_OFFSET + this.website.barOption - 1,this.view.optionButton_4);
   }
   function dispose()
   {
      this.currPollerTarget = null;
      this.slideshow.dispose();
      this.slideshow = null;
      this.rolloverPoller.dispose();
      this.rolloverPoller = null;
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
