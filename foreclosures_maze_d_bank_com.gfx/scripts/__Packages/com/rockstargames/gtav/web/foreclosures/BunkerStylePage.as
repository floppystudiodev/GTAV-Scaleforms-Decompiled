class com.rockstargames.gtav.web.foreclosures.BunkerStylePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BUNKER";
   function BunkerStylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bunkerStylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.bunkerStyle == -1)
      {
         this.website.bunkerStyle = 0;
      }
      var _loc2_ = this.website.getSelectedBunker();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedQuarters != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_QUARTERS_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_FIRING_RANGE_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BUNKER_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_BUNKER_STYLE_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initBunkerProgress(1);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton_0,0);
      this.initOptionButton(this.view.optionButton_1,1);
      this.initOptionButton(this.view.optionButton_2,2);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc2_ = Math.max(1,this.website.bunkerStyle + 1);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BunkerStylePage.TXD],["STYLE_" + _loc2_ + "B"]);
   }
   function initOptionButton(buttonView, index)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FORECLOSURES_BUNKER_STYLE_" + (index + 1),false);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.BunkerStylePage.TXD,"STYLE_" + (index + 1),buttonView.image);
      this.website.dataTextScope.push(buttonView.btnTxt);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.bunkerStyle = parseInt(id);
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
      this.view.optionButton_0.highlight._visible = this.website.bunkerStyle == 0;
      this.view.optionButton_1.highlight._visible = this.website.bunkerStyle == 1;
      this.view.optionButton_2.highlight._visible = this.website.bunkerStyle == 2;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BunkerStylePage.TXD],["STYLE_" + (this.website.bunkerStyle + 1) + "B"]);
      this.progressPanel.updateBunkerCosts();
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
