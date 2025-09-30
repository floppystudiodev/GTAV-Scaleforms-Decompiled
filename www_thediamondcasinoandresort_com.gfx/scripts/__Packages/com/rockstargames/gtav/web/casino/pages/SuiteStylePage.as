class com.rockstargames.gtav.web.casino.pages.SuiteStylePage extends com.rockstargames.gtav.web.casino.Page
{
   var currSlideshowIndex;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var rolloverPoller;
   var slideshow;
   var view;
   var website;
   static var TXD = "CASINO_SUITES";
   function SuiteStylePage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"suiteStylePage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      if(!this.website.suiteIsOwned && this.website.styleOption == -1)
      {
         this.website.styleOption = 0;
      }
      this.rolloverPoller = new com.rockstargames.gtav.web.casino.RolloverPoller(this.view,this.website.browser,com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.delegate(this,this.onRolloverChange));
      this.initNav();
      this.initText();
      this.initSlideshow();
      this.initProgressPanel();
      this.initButtons();
      this.initVerticalLayout();
      this.updateView();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_COLOUR_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUMMARY_PAGE.name;
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_STYLE_HEADING",4,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.nextLabel,"CASWEB_SUMMARY",4,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.nextLabel);
      }
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_STYLE_BODY");
      this.view.bodyBG._height = this.view.body._height + 32;
   }
   function initSlideshow()
   {
      this.currSlideshowIndex = -1;
      this.slideshow = new com.rockstargames.gtav.web.casino.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initProgressPanel()
   {
      this.progressPanel = new com.rockstargames.gtav.web.casino.ProgressPanel(this.view.progressPanel,this.website);
      this.progressPanel.setCurrentStep(3);
   }
   function initButtons()
   {
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.nextButton,"CASWEB_NEXT",3);
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc4_;
      while(_loc3_ < com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_STYLE_OPTIONS)
      {
         _loc2_ = this.view["optionButton_" + _loc3_];
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         this.rolloverPoller.addPollTarget(_loc2_);
         _loc5_ = this.website.getStyleCost(_loc3_,false);
         _loc4_ = this.website.getStyleCost(_loc3_,true);
         if(this.website.suiteIsOwned && _loc3_ == this.website.purchasedStyleOption)
         {
            _loc2_.cost._visible = false;
         }
         else if(_loc4_ >= 0 && _loc4_ < _loc5_)
         {
            _loc2_.cost.gotoAndStop("sale");
            _loc2_.cost.originalCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc5_);
            _loc2_.cost.saleCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc4_);
            _loc2_.cost.strikethrough._width = _loc2_.cost.originalCost.textWidth + 4;
            _loc2_.cost.strikethrough._x = 0.5 * (_loc2_.cost.originalCost._width - _loc2_.cost.originalCost.textWidth);
            if(this.website.displayConfig.isAsian)
            {
               com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(_loc2_.cost.originalCost,0.7);
               com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(_loc2_.cost.saleCost,0.7);
            }
         }
         else
         {
            _loc2_.cost.originalCost.text = "+$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(_loc5_);
            if(this.website.displayConfig.isAsian)
            {
               com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(_loc2_.cost.originalCost,0.7);
            }
         }
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function onRolloverChange(index, target)
   {
      var _loc2_;
      var _loc3_;
      if(index == -1)
      {
         this.view.tooltip._visible = false;
      }
      else
      {
         _loc2_ = target._x + 0.5 * target._width;
         _loc3_ = this.view.optionButton_0._x;
         this.view.tooltip.label.autoSize = "left";
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.tooltip.label,"CASWEB_GRAPHIC_" + (index + 1),4,true,false);
         this.view.tooltip.bg._width = Math.max(74,this.view.tooltip.label._width);
         this.view.tooltip.label._x = 0.5 * (this.view.tooltip.bg._width - this.view.tooltip.label._width);
         this.view.tooltip._x = Math.max(_loc3_,_loc2_ - 0.5 * this.view.tooltip._width);
         this.view.tooltip._visible = true;
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
            this.website.styleOption = parseInt(id);
            this.updateSlideshow(this.website.styleOption + 1);
            this.updateView();
            break;
         case "stepButton":
            this.website.browser.GO_TO_WEBPAGE(this.progressPanel.getStepPageTarget(parseInt(id)));
         default:
            return;
      }
   }
   function updateView()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.NUM_STYLE_OPTIONS)
      {
         _loc3_ = this.view["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.styleOption;
         _loc3_.cost._visible = _loc2_ == this.website.styleOption;
         _loc2_ = _loc2_ + 1;
      }
      this.progressPanel.updateCosts();
      this.updateSlideshow(this.website.styleOption + 1);
   }
   function updateSlideshow(index)
   {
      if(index == this.currSlideshowIndex)
      {
         return undefined;
      }
      this.currSlideshowIndex = index;
      this.slideshow.show(com.rockstargames.gtav.web.casino.pages.SuiteStylePage.TXD,["pattern_" + this.currSlideshowIndex],0);
   }
   function dispose()
   {
      this.slideshow.dispose();
      this.slideshow = null;
      this.rolloverPoller.dispose();
      this.rolloverPoller = null;
      this.progressPanel.dispose();
      this.progressPanel = null;
      super.dispose();
   }
}
