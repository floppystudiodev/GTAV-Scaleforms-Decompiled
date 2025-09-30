class com.rockstargames.gtav.web.foreclosures.FiringRangePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BUNKER";
   function FiringRangePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bunkerFiringRangePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.bunkerStyle == -1)
      {
         this.website.bunkerStyle = 0;
      }
      if(this.website.quarters == -1)
      {
         this.website.quarters = 0;
      }
      if(this.website.firingRange == -1)
      {
         this.website.firingRange = 0;
      }
      var _loc2_ = this.website.getSelectedBunker();
      if(!_loc2_.isOwned || this.website.purchasedQuarters != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_QUARTERS_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_STYLE_PAGE.name;
      }
      if(!_loc2_.isOwned || this.website.purchasedBunkerGunLocker != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_GUN_LOCKER_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_TRANSPORTATION_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_SUMMARY_PAGE.name;
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_FIRING_RANGE_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initBunkerProgress(3);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.initSelectionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc2_ = this.website.firingRange != 0 ? this.website.firingRange : 1;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.FiringRangePage.TXD],["SHOOTINGB_" + _loc2_]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FORECLOSURES_FIRING_RANGE",false);
      if(!this.website.getSelectedBunker().isOwned || this.website.purchasedFiringRange == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function initSelectionButtons()
   {
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.selectionButton_1.btnTxt,"FORECLOSURES_SHOOTING_1",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.selectionButton_2.btnTxt,"FORECLOSURES_SHOOTING_2",false);
      this.view.selectionButton_1._y = this.view.optionButton._y + this.view.optionButton._height + 10;
      this.view.selectionButton_2._y = this.view.optionButton._y + this.view.optionButton._height + 10;
      this.website.dataTextScope.push(this.view.selectionButton_1.btnTxt);
      this.website.dataTextScope.push(this.view.selectionButton_2.btnTxt);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.FiringRangePage.TXD,"SHOOTING_1",this.view.selectionButton_1.image);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.FiringRangePage.TXD,"SHOOTING_2",this.view.selectionButton_2.image);
   }
   function handleClick(type, id)
   {
      var _loc2_;
      switch(type)
      {
         case "optionButton":
            this.website.firingRange = this.website.firingRange != 0 ? 0 : 1;
            _loc2_ = this.website.firingRange != 0 ? this.website.firingRange : 1;
            this.slideshow.show([com.rockstargames.gtav.web.foreclosures.FiringRangePage.TXD],["SHOOTINGB_" + _loc2_]);
            this.updateSelectedItem();
            break;
         case "selectionButton":
            this.website.firingRange = parseInt(id);
            this.slideshow.show([com.rockstargames.gtav.web.foreclosures.FiringRangePage.TXD],["SHOOTINGB_" + this.website.firingRange]);
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
      this.view.optionButton.tick._visible = this.website.firingRange != 0;
      this.view.selectionButton_1.disabled = this.website.firingRange == 0;
      this.view.selectionButton_2.disabled = this.website.firingRange == 0;
      this.view.selectionButton_1._visible = this.website.firingRange != 0;
      this.view.selectionButton_2._visible = this.website.firingRange != 0;
      this.view.selectionButton_1.highlight._visible = this.website.firingRange == 1;
      this.view.selectionButton_2.highlight._visible = this.website.firingRange == 2;
      this.progressPanel.updateBunkerCosts();
   }
   function setDisabledButtons()
   {
      this.view.selectionButton_1.disabled = this.website.firingRange == 0;
      this.view.selectionButton_2.disabled = this.website.firingRange == 0;
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
