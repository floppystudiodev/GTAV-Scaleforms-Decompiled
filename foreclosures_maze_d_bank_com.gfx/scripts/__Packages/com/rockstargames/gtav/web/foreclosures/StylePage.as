class com.rockstargames.gtav.web.foreclosures.StylePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_STYLE";
   function StylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"stylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MURAL_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.EMBLEM_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_STYLE_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(2);
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.initButtons();
      this.updateSelectedItems();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initButtons()
   {
      this.initButton(this.view.interiorButtons.wallButton_0,"FC_WALL_0");
      this.initButton(this.view.interiorButtons.wallButton_1,"FC_WALL_1");
      this.initButton(this.view.interiorButtons.hangingButton_0,"FC_HANGING_0");
      this.initButton(this.view.interiorButtons.hangingButton_1,"FC_HANGING_1");
      this.initButton(this.view.interiorButtons.furnitureButton_0,"FC_FURNITURE_0");
      this.initButton(this.view.interiorButtons.furnitureButton_1,"FC_FURNITURE_1");
      this.view.interiorButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initButton(button, label)
   {
      button.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      button.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(button.btnTxt,label);
      this.website.dataTextScope.push(button.btnTxt);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "wallButton":
            this.website.wall = parseInt(id);
            this.updateSelectedItems();
            break;
         case "hangingButton":
            this.website.hanging = parseInt(id);
            this.updateSelectedItems();
            break;
         case "furnitureButton":
            this.website.furniture = parseInt(id);
            this.updateSelectedItems();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItems()
   {
      this.view.interiorButtons.wallButton_0.tick._visible = this.website.wall == 0;
      this.view.interiorButtons.wallButton_1.tick._visible = this.website.wall == 1;
      this.view.interiorButtons.hangingButton_0.tick._visible = this.website.hanging == 0;
      this.view.interiorButtons.hangingButton_1.tick._visible = this.website.hanging == 1;
      this.view.interiorButtons.furnitureButton_0.tick._visible = this.website.furniture == 0;
      this.view.interiorButtons.furnitureButton_1.tick._visible = this.website.furniture == 1;
      this.progressPanel.updateCosts();
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.StylePage.TXD],["STYLE_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural + "_" + this.website.wall + "_" + this.website.hanging + "_" + this.website.furniture]);
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
