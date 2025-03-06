class com.rockstargames.gtav.web.foreclosures.EmblemPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var emblems;
   var view;
   var progressPanel;
   var summaryPageName;
   static var TXD = "FORECLOSURES_SIGNAGE";
   static var IMAGES = ["EMBLEM_0","EMBLEM_1","EMBLEM_2","EMBLEM_3","EMBLEM_4","EMBLEM_5","EMBLEM_6","EMBLEM_7","EMBLEM_8"];
   function EmblemPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"emblemPage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.STYLE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NAME_PAGE.name;
      this.emblems = [this.website.crewEmblem].concat(com.rockstargames.gtav.web.foreclosures.EmblemPage.IMAGES);
      this.updateEmblem(this.website.emblem);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.EmblemPage.TXD,"EMBLEM_BG_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural,this.view.emblemBackground);
      this.progressPanel.show();
      this.progressPanel.initProgress(3);
      this.initEmblemSelect();
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_EMBLEM_DESCRIPTION",false);
      this.view.emblemButtons._y = this.view.description._y + this.view.description.textHeight + 20;
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initEmblemSelect()
   {
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         var _loc3_ = this.view.emblemButtons["emblemButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
            break;
         case "emblemButton":
            this.updateEmblem(parseInt(id));
            this.progressPanel.updateCosts();
      }
   }
   function updateEmblem(emblemID)
   {
      if(emblemID == 0 && this.emblems[emblemID] == "")
      {
         var _loc6_ = this.view.emblemButtons.emblemButton_0.message;
         var _loc5_ = _loc6_.txt;
         if(_loc5_)
         {
            _loc5_.verticalAlign = "center";
            com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(_loc5_,"FORECLOSURES_NO_CREW_EMBLEM");
            _loc6_._y = this.view.bg._y - this.view.emblemButtons._y - this.view.emblemButtons.emblemButton_0._y;
            _loc6_._alpha = 100;
         }
      }
      else
      {
         this.website.emblem = emblemID;
      }
      var _loc4_ = this.emblems[this.website.emblem];
      if(this.website.emblem == 0)
      {
         this.view.emblemImage.tf.text = "";
         if(_loc4_ != "")
         {
            this.website.imageManager.addImage(_loc4_,_loc4_,this.view.scEmblem);
         }
      }
      else
      {
         this.view.scEmblem.text = "";
         if(_loc4_ != "")
         {
            this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.EmblemPage.TXD,_loc4_,this.view.emblemImage.tf);
         }
      }
      this.view.emblemBackground._visible = true;
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         var _loc3_ = this.view.emblemButtons["emblemButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.emblem;
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
}
