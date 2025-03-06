class com.rockstargames.gtav.web.arena.pages.ExpansionFloorB2Page extends com.rockstargames.gtav.web.arena.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   function ExpansionFloorB2Page(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"expansionFloorPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(!this.website.propertyIsOwned && this.website.expansionFloorB2Option == -1)
      {
         this.website.expansionFloorB2Option = 0;
      }
      this.initNav();
      this.initTitle();
      this.initDescription();
      this.initProgress();
      this.initButtons();
      this.initVerticalLayout();
      this.updateView();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B1_PAGE.name;
      if(this.website.purchasedMechanicA != 1 || this.website.purchasedMechanicB != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.MECHANIC_PAGE.name;
      }
      else if(this.website.purchasedPersonalQuarters != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PERSONAL_QUARTERS_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SUMMARY_PAGE.name;
      }
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_FLOOR_B2").toUpperCase();
      this.view.titleGradient._width = this.view.title._width;
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
   }
   function initDescription()
   {
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,this.website.expansionFloorB1Option <= 0 ? "MBA_FLOOR_B2_BLOCKED" : "MBA_FLOOR_B2_DESC");
   }
   function initProgress()
   {
      this.progressPanel.show(true);
      this.progressPanel.setProgress(5);
      this.progressPanel.setExclamation(4,false);
   }
   function initButtons()
   {
      if(this.website.expansionFloorB1Option > 0)
      {
         var _loc3_ = this.view.buttons.selectionButton;
         _loc3_.onColour = 16777215;
         _loc3_.offColour = 16777215;
         _loc3_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc3_.btnTxt,"MBA_FLOOR_B2").toUpperCase();
         this.website.dataTextScope.push(this.view.buttons.selectionButton.btnTxt);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc3_.btnTxt);
         }
         var _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_EXPANSION_OPTIONS)
         {
            _loc3_ = this.view.buttons["optionButton_" + _loc2_];
            _loc3_.swatch.gotoAndStop(_loc2_ + 1);
            this.website.dataTextScope.push(_loc3_.btnTxt);
            _loc2_ = _loc2_ + 1;
         }
         this.view.message.text = "";
         this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      }
      else
      {
         this.view.buttons.selectionButton._visible = false;
         this.view.buttons.cross._visible = false;
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_EXPANSION_OPTIONS)
         {
            this.view.buttons["optionButton_" + _loc2_]._visible = false;
            _loc2_ = _loc2_ + 1;
         }
      }
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
      if(type == "selectionButton")
      {
         if(this.website.expansionFloorB2Option == 0)
         {
            this.website.expansionFloorB2Option = 1;
         }
         else
         {
            this.website.expansionFloorB2Option = 0;
         }
         this.updateView();
      }
      else if(type == "optionButton")
      {
         this.website.expansionFloorB2Option = parseInt(id) + 1;
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
      if(this.website.expansionFloorB1Option > 0)
      {
         var _loc3_ = this.view.buttons.selectionButton;
         _loc3_.selected._visible = this.website.expansionFloorB2Option > 0;
         _loc3_.disabled = this.website.purchasedExpansionFloorB2Option > 0;
         this.view.buttons.cross._visible = this.website.expansionFloorB2Option > 0;
         var _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_EXPANSION_OPTIONS)
         {
            _loc3_ = this.view.buttons["optionButton_" + _loc2_];
            _loc3_.disabled = this.website.expansionFloorB2Option == 0;
            _loc3_._visible = this.website.expansionFloorB2Option > 0;
            _loc3_.selected._visible = this.website.expansionFloorB2Option == _loc2_ + 1;
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc4_ = Math.max(1,this.website.expansionFloorB2Option);
      this.website.imageManager.addImage("MBA_GARAGE","GARAGE" + _loc4_,this.view.image.wrapper,true);
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image.wrapper);
      super.dispose();
   }
}
