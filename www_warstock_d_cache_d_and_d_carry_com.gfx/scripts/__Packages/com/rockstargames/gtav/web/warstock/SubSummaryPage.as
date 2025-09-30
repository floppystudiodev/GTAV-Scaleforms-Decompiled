class com.rockstargames.gtav.web.warstock.SubSummaryPage extends com.rockstargames.gtav.web.warstock.SubPage
{
   var buttons;
   var prevPageName;
   var progressPanel;
   var setLocalisedText;
   var view;
   var website;
   function SubSummaryPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedSubHelicopter != 1 || this.website.purchasedSubMiniSub != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.SUB_VEHICLES_PAGE;
      }
      else if(this.website.purchasedSubWorkshop != 1)
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
      this.progressPanel.updateCosts();
      this.progressPanel.hideBuyButton();
      this.progressPanel.setActiveStep(6);
      this.progressPanel.enable();
      if(this.website.subSonar == 0)
      {
         this.view.sonar._alpha = 50;
      }
      if(this.website.subMissiles == 0)
      {
         this.view.missiles._alpha = 50;
      }
      if(this.website.subWorkshop == 0)
      {
         this.view.workshop._alpha = 50;
      }
      if(this.website.subHelicopter == 0)
      {
         this.view.helicopter._alpha = 50;
      }
      if(this.website.subMiniSub == 0)
      {
         this.view.miniSub._alpha = 50;
      }
      this.website.imageManager.addImage("CANDC_SUB","COLOUR" + this.website.subColour,this.view.colour.tf);
      this.website.imageManager.addImage("CANDC_SUB","FLAG" + this.website.subFlag,this.view.flag.tf);
      this.website.imageManager.addImage("CANDC_SUB","SONAR",this.view.sonar.tf);
      this.website.imageManager.addImage("CANDC_SUB","MISSILES",this.view.missiles.tf);
      this.website.imageManager.addImage("CANDC_SUB","WORKSHOP",this.view.workshop.tf);
      this.website.imageManager.addImage("CANDC_SUB","HELICOPTER",this.view.helicopter.tf);
      this.website.imageManager.addImage("CANDC_SUB","MINISUB",this.view.miniSub.tf);
      var _loc5_ = this.website.purchasedSubColour != -1 ? "CANDC_RENOVATE" : "CANDC_BUY_SUB";
      var _loc4_ = this.view.buyButton;
      _loc4_.label.text = this.setLocalisedText(_loc4_.label,_loc5_,true) + ": $" + this.website.formatNumber(this.progressPanel.total);
      this.buttons.push(_loc4_.btnTxt);
      if(this.website.subColour == this.website.purchasedSubColour && this.website.subFlag == this.website.purchasedSubFlag && this.website.subSonar == this.website.purchasedSubSonar && this.website.subMissiles == this.website.purchasedSubMissiles && this.website.subWorkshop == this.website.purchasedSubWorkshop && this.website.subHelicopter == this.website.purchasedSubHelicopter && this.website.subMiniSub == this.website.purchasedSubMiniSub)
      {
         this.view.buyButton.disabled = true;
         this.view.buyButton._alpha = 50;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.buttons.length)
      {
         trace("[" + _loc3_ + "] " + this.buttons[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(id, attribute)
   {
      if(id == "buyButton")
      {
         this.website.dispatchPlayerSubSelections();
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
