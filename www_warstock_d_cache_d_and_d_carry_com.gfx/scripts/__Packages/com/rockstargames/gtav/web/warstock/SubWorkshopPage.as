class com.rockstargames.gtav.web.warstock.SubWorkshopPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function SubWorkshopPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedSubMissiles != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_MISSILES_PAGE;
      }
      else if(this.website.purchasedSubSonar != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SONAR_PAGE;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_FLAG_PAGE;
      }
      if(this.website.purchasedSubHelicopter != 1 || this.website.purchasedSubMiniSub != 1)
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
      if(this.website.subSonar == -1)
      {
         this.website.subSonar = 0;
      }
      if(this.website.subMissiles == -1)
      {
         this.website.subMissiles = 0;
      }
      if(this.website.subWorkshop == -1)
      {
         this.website.subWorkshop = 0;
      }
      this.website.imageManager.addImage("CANDC_SUB","WORKSHOP",this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(4);
      this.progressPanel.enable();
      this.view.description.autoSize = "left";
      this.setLocalisedText(this.view.description,"CANDC_SUB_WRK_DESC");
      var _loc3_ = this.view.selection;
      this.setLocalisedText(_loc3_.btnTxt,"CANDC_SUB_WRK");
      _loc3_._y = this.view.description._y + this.view.description.textHeight + 20;
      _loc3_.gotoAndStop(this.website.subWorkshop != 1 ? "unselected" : "selected");
      if(this.website.purchasedSubWorkshop != 1)
      {
         this.buttons.push(_loc3_.btnTxt);
      }
   }
   function handleClick(id, attribute)
   {
      var _loc2_;
      if(id == "selection")
      {
         _loc2_ = this.view.selection;
         if(this.website.subWorkshop == 1)
         {
            this.website.subWorkshop = 0;
            _loc2_.gotoAndStop("unselected");
         }
         else
         {
            this.website.subWorkshop = 1;
            _loc2_.gotoAndStop("selected");
         }
         this.progressPanel.updateCosts();
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
