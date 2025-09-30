class com.rockstargames.gtav.web.warstock.SubColourPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var setLocalisedText;
   var view;
   var website;
   static var NUM_COLOUR_BUTTONS = 16;
   function SubColourPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = "PAGE1";
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_FLAG_PAGE;
      if(this.website.subColour == -1)
      {
         this.website.subColour = 0;
      }
      this.setLocalisedText(this.view.description,"CANDC_SUB_CLR_DESC");
      this.website.imageManager.addImage("CANDC_SUB","COLOUR" + this.website.subColour,this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(0);
      this.progressPanel.enable();
      this.initButtons();
      this.view.colourButtons._y = this.view.description._y + this.view.description.textHeight + 40;
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.warstock.SubColourPage.NUM_COLOUR_BUTTONS)
      {
         _loc3_ = this.view.colourButtons["colourButton_" + _loc2_];
         _loc3_.highlight._visible = _loc2_ == this.website.subColour;
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         this.buttons.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(id, attribute)
   {
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(id == "colourButton")
      {
         _loc4_ = parseInt(attribute);
         this.website.subColour = _loc4_;
         this.progressPanel.updateCosts();
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.warstock.SubColourPage.NUM_COLOUR_BUTTONS)
         {
            _loc3_ = this.view.colourButtons["colourButton_" + _loc2_];
            _loc3_.highlight._visible = _loc2_ == this.website.subColour;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.website.imageManager.addImage("CANDC_SUB","COLOUR" + this.website.subColour,this.view.image.tf);
   }
   function dispose()
   {
      super.dispose();
   }
}
