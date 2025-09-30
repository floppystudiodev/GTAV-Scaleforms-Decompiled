class com.rockstargames.gtav.web.warstock.SubVehiclesPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function SubVehiclesPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedSubWorkshop != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_WORKSHOP_PAGE;
      }
      else if(this.website.purchasedSubMissiles != 1)
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
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_SUMMARY_PAGE;
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
      if(this.website.subHelicopter == -1)
      {
         this.website.subHelicopter = 0;
      }
      if(this.website.subMiniSub == -1)
      {
         this.website.subMiniSub = 0;
      }
      this.website.imageManager.addImage("CANDC_SUB","HELICOPTER",this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(5);
      this.progressPanel.enable();
      this.view.helicopterDescription.autoSize = "left";
      this.setLocalisedText(this.view.helicopterDescription,"CANDC_SUB_HELI_DESC");
      var _loc3_ = this.view.helicopterSelection;
      this.setLocalisedText(_loc3_.btnTxt,"CANDC_SUB_HELI");
      _loc3_._y = this.view.helicopterDescription._y + this.view.helicopterDescription.textHeight + 10;
      _loc3_.gotoAndStop(this.website.subHelicopter != 1 ? "unselected" : "selected");
      if(this.website.purchasedSubHelicopter != 1)
      {
         this.buttons.push(_loc3_.btnTxt);
      }
      this.view.miniSubDescription.autoSize = "left";
      this.view.miniSubDescription._y = _loc3_._y + _loc3_._height + 20;
      this.setLocalisedText(this.view.miniSubDescription,"CANDC_SUB_MINISUB_DESC");
      _loc3_ = this.view.miniSubSelection;
      this.setLocalisedText(_loc3_.btnTxt,"CANDC_SUB_MINISUB");
      _loc3_._y = this.view.miniSubDescription._y + this.view.miniSubDescription.textHeight + 10;
      _loc3_.gotoAndStop(this.website.subMiniSub != 1 ? "unselected" : "selected");
      if(this.website.purchasedSubMiniSub != 1)
      {
         this.buttons.push(_loc3_.btnTxt);
      }
   }
   function handleClick(id, attribute)
   {
      var _loc2_;
      if(id == "helicopterSelection")
      {
         _loc2_ = this.view.helicopterSelection;
         if(this.website.subHelicopter == 1)
         {
            this.website.subHelicopter = 0;
            _loc2_.gotoAndStop("unselected");
         }
         else
         {
            this.website.subHelicopter = 1;
            _loc2_.gotoAndStop("selected");
         }
         this.progressPanel.updateCosts();
         this.website.imageManager.addImage("CANDC_SUB","HELICOPTER",this.view.image.tf);
      }
      else if(id == "miniSubSelection")
      {
         _loc2_ = this.view.miniSubSelection;
         if(this.website.subMiniSub == 1)
         {
            this.website.subMiniSub = 0;
            _loc2_.gotoAndStop("unselected");
         }
         else
         {
            this.website.subMiniSub = 1;
            _loc2_.gotoAndStop("selected");
         }
         this.progressPanel.updateCosts();
         this.website.imageManager.addImage("CANDC_SUB","MINISUB",this.view.image.tf);
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
