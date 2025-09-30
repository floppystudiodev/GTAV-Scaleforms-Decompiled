class com.rockstargames.gtav.web.warstock.SubFlagPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   static var NUM_FLAG_BUTTONS = 46;
   function SubFlagPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_COLOUR_PAGE;
      if(this.website.purchasedSubSonar != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SONAR_PAGE;
      }
      else if(this.website.purchasedSubMissiles != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_MISSILES_PAGE;
      }
      else if(this.website.purchasedSubWorkshop != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_WORKSHOP_PAGE;
      }
      else if(this.website.purchasedSubHelicopter != 1 || this.website.purchasedSubMiniSub != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_VEHICLES_PAGE;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SUMMARY_PAGE;
      }
      if(this.website.subColour == -1)
      {
         this.website.subColour = 0;
      }
      if(this.website.subFlag == -1)
      {
         this.website.subFlag = 0;
      }
      this.setLocalisedText(this.view.description,"CANDC_SUB_FLG_DESC_" + this.website.subFlag);
      this.website.imageManager.addImage("CANDC_SUB","FLAG" + this.website.subFlag,this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(1);
      this.progressPanel.enable();
      this.initButtons();
      this.view.flagButtons._y = this.view.description._y + this.view.description.textHeight + 40;
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.warstock.SubFlagPage.NUM_FLAG_BUTTONS)
      {
         _loc3_ = this.view.flagButtons["flagButton_" + _loc2_];
         _loc3_.highlight._visible = _loc2_ == this.website.subFlag;
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
      if(id == "flagButton")
      {
         _loc4_ = parseInt(attribute);
         this.website.subFlag = _loc4_;
         this.progressPanel.updateCosts();
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.warstock.SubFlagPage.NUM_FLAG_BUTTONS)
         {
            _loc3_ = this.view.flagButtons["flagButton_" + _loc2_];
            _loc3_.highlight._visible = _loc2_ == this.website.subFlag;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.setLocalisedText(this.view.description,"CANDC_SUB_FLG_DESC_" + this.website.subFlag);
      this.website.imageManager.addImage("CANDC_SUB","FLAG" + this.website.subFlag,this.view.image.tf);
   }
   function dispose()
   {
      super.dispose();
   }
}
