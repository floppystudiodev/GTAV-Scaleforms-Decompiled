class com.rockstargames.gtav.web.casino.pages.SuitesPage extends com.rockstargames.gtav.web.casino.Page
{
   var currPanel;
   var currPollerTarget;
   var currStyle;
   var prevPageName;
   var rolloverPoller;
   var view;
   var website;
   static var PANEL_SHOW_Y = 144;
   static var PANEL_HIDE_Y = 482;
   static var PANEL_TWEEN_DURATION = 0.2;
   function SuitesPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"suitesPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initNav();
      this.initText();
      this.initRolloverPoller();
      this.initButtons();
      this.initPanels();
      this.initVerticalLayout();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SPLASH_PAGE.name;
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_SUITES_HEADING",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
      this.initSubHeading(this.view.subHeading,"CASWEB_SUITES_SUBHEADING",true);
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_SUITES_BODY");
   }
   function initRolloverPoller()
   {
      this.rolloverPoller = new com.rockstargames.gtav.web.casino.RolloverPoller(this.view,this.website.browser,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.delegate(this,this.onRolloverChange));
      this.rolloverPoller.addPollTarget(this.view.optionButtonDefault);
   }
   function initButtons()
   {
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.customiseButton,"CASWEB_SUITES_BUTTON",3);
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 4)
      {
         _loc3_ = this.view["panel" + _loc2_];
         this.website.dataTextScope.push(_loc3_.purchaseButton.btnTxt);
         _loc3_.purchaseButton.disabled = true;
         this.initLabelButton(_loc3_.showButton,"CASWEB_STYLE_" + _loc2_,4);
         if(_loc2_ == 1 || !this.website["preset" + (_loc2_ - 1) + "Disabled"])
         {
            _loc3_.padlock._visible = false;
            this.rolloverPoller.addPollTarget(_loc3_.showButton);
         }
         _loc3_.showButton._name = "showButton_" + _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.initTopNav(this.view.topNav.suitesButton);
      this.initBottomNav(this.view.footer.suitesButton);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initPanels()
   {
      var _loc2_ = true;
      _loc2_ = this.initPanel(this.view.panel1,1) && _loc2_;
      _loc2_ = this.initPanel(this.view.panel2,2) && _loc2_;
      _loc2_ = this.initPanel(this.view.panel3,3) && _loc2_;
      _loc2_ = this.initPanel(this.view.panel4,4) && _loc2_;
      if(_loc2_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         this.setPreset(1);
         this.showPanel(this.view.panel1,true);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.033,{onCompleteScope:this,onComplete:this.initPanels});
      }
   }
   function initPanel(panel, index)
   {
      this.setPreset(index);
      var _loc3_ = this.getTotalCost();
      if(isNaN(_loc3_.actual) || isNaN(_loc3_.original))
      {
         return false;
      }
      if(_loc3_.actual < _loc3_.original && _loc3_.actual >= 0)
      {
         panel.gotoAndStop("sale");
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(panel.originalCost);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(panel.saleCost);
         }
         panel.originalCost.text = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc3_.original);
         panel.saleCost.text = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc3_.actual);
         panel.strikethrough._x = 0.5 * (panel.originalCost._width - panel.originalCost.textWidth) + panel.originalCost._x;
         panel.strikethrough._width = panel.originalCost.textWidth;
      }
      else
      {
         panel.gotoAndStop("normal");
         panel.cost.text = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc3_.actual);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(panel.cost);
         }
      }
      panel.thumbnail.gotoAndStop(index);
      panel.purchaseButton.label.verticalAlign = "center";
      if(this.currStyle == 1)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(panel.purchaseButton.label,"CASWEB_START",3,true,false);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(panel.purchaseButton.label,"CASWEB_FLOORPLAN",3,true,false);
      }
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(panel.body,"CASWEB_STYLE_DESC_" + this.currStyle);
      return true;
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function showPanel(panel, animate)
   {
      this.currPanel.purchaseButton.disabled = true;
      if(animate)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.currPanel,com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_TWEEN_DURATION,{_y:com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_HIDE_Y});
      }
      else
      {
         this.currPanel._y = com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_HIDE_Y;
      }
      this.currPanel = panel;
      this.currPanel.purchaseButton.disabled = false;
      if(animate)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.currPanel,com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_TWEEN_DURATION,{_y:com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_SHOW_Y,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
      }
      else
      {
         this.currPanel._y = com.rockstargames.gtav.web.casino.pages.SuitesPage.PANEL_SHOW_Y;
      }
      return true;
   }
   function setPreset(currStyle)
   {
      var _loc2_;
      this.currStyle = currStyle;
      if(currStyle == 1)
      {
         _loc2_ = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
      }
      else
      {
         _loc2_ = this.website.getPresetData(currStyle - 1);
      }
      this.website.colourOption = _loc2_[0];
      this.website.styleOption = _loc2_[1];
      this.website.loungeOption = _loc2_[2];
      this.website.barOption = _loc2_[3];
      this.website.dealerOption = _loc2_[4];
      this.website.bedroomOption = _loc2_[5];
      this.website.mediaRoomOption = _loc2_[6];
      this.website.spaOption = _loc2_[7];
      this.website.officeOption = _loc2_[8];
      this.website.garageOption = _loc2_[9];
   }
   function getTotalCost()
   {
      var _loc4_ = this.website.getSuiteBaseCost(true);
      var _loc3_ = this.website.getSuiteBaseCost(false);
      var _loc2_ = {};
      this.resetCostSums(_loc2_);
      this.website.getColourCosts(_loc2_);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      this.resetCostSums(_loc2_);
      this.website.getStyleCosts(_loc2_);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      this.resetCostSums(_loc2_);
      this.website.getGarageCosts(_loc2_);
      this.website.getBedroomCosts(_loc2_);
      this.website.getLoungeCosts(_loc2_);
      this.website.getMediaRoomCosts(_loc2_);
      this.website.getBarCosts(_loc2_);
      this.website.getSpaCosts(_loc2_);
      this.website.getDealerCosts(_loc2_);
      this.website.getOfficeCosts(_loc2_);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      _loc2_.actual = _loc4_;
      _loc2_.original = _loc3_;
      return _loc2_;
   }
   function resetCostSums(costSums)
   {
      costSums.original = 0;
      costSums.actual = 0;
      costSums.hasPurchase = false;
   }
   function onRolloverChange(index, target)
   {
      this.currPollerTarget.gotoAndStop("rollOff");
      this.currPollerTarget = target;
      this.currPollerTarget.gotoAndStop("rollOn");
   }
   function handleClick(type, id)
   {
      var _loc2_;
      switch(type)
      {
         case "logo":
         case "homeButton":
            this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
            break;
         case "casinoButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.CASINO_PAGE.name);
            break;
         case "suitesButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITES_PAGE.name);
            break;
         case "purchaseButton":
            this.handlePurchaseButtonClick();
            break;
         case "customiseButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_OPTIONS_PAGE.name);
            break;
         case "showButton":
            _loc2_ = parseInt(id);
            if(!this.website["preset" + (_loc2_ - 1) + "Disabled"])
            {
               this.setPreset(_loc2_);
               this.showPanel(this.view["panel" + id],true);
            }
         default:
            return;
      }
   }
   function handlePurchaseButtonClick()
   {
      if(this.currStyle == 1)
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_OPTIONS_PAGE.name);
      }
      else
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUMMARY_PAGE.name);
      }
   }
   function dispose()
   {
      this.currPollerTarget = null;
      this.rolloverPoller.dispose();
      this.rolloverPoller = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.panel1);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.panel2);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.panel3);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.panel4);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      super.dispose();
   }
}
