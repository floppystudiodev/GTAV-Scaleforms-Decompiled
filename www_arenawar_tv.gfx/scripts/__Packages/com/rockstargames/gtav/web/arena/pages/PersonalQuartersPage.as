class com.rockstargames.gtav.web.arena.pages.PersonalQuartersPage extends com.rockstargames.gtav.web.arena.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function PersonalQuartersPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"personalQuartersPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(!this.website.propertyIsOwned && this.website.personalQuarters == -1)
      {
         this.website.personalQuarters = 0;
      }
      this.initNav();
      this.initTitle();
      this.initDescription();
      this.initProgress();
      this.initImage();
      this.initButtons();
      this.initVerticalLayout();
      this.updateView();
   }
   function initNav()
   {
      if(this.website.purchasedMechanicA != 1 || this.website.purchasedMechanicB != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.MECHANIC_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B1_PAGE.name;
      }
      this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SUMMARY_PAGE.name;
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_QUARTERS").toUpperCase();
      this.view.titleGradient._width = this.view.title._width;
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
   }
   function initDescription()
   {
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,"MBA_QUARTERS_DESC");
   }
   function initProgress()
   {
      this.progressPanel.show(true);
      this.progressPanel.setProgress(7);
   }
   function initImage()
   {
      this.website.imageManager.addImage("MBA_GARAGE","QUARTERS",this.view.image.wrapper);
   }
   function initButtons()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_PERSONAL_QUARTERS_OPTIONS)
      {
         _loc2_ = this.view.buttons["optionButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 13421772;
         _loc2_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.btnTxt,"MBA_QUARTERS").toUpperCase();
         this.website.dataTextScope.push(_loc2_.btnTxt);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc2_.btnTxt);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      if(this.website.displayConfig.isAsian)
      {
         this.view.description._y += 15;
      }
      this.view.buttons._y = this.view.description._y + this.view.description.textHeight + 30;
      var _loc2_ = this.view.buttons._y + this.view.buttons._height;
      this.view.footer._y = _loc2_ > 600 ? _loc2_ + 30 : 612;
      this.view.background._height = this.view.footer._y + 14;
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      if(type == "optionButton")
      {
         this.website.personalQuarters = this.website.personalQuarters != 1 ? 1 : 0;
         this.updateView();
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
   function updateView()
   {
      this.view.buttons.optionButton_0.selected._visible = this.view.buttons.cross0._visible = this.website.personalQuarters == 1;
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image.wrapper);
      super.dispose();
   }
}
