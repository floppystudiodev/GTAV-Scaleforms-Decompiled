class com.rockstargames.gtav.web.warstock.HackerMissilePage extends com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function HackerMissilePage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE;
      if(this.website.purchasedHackerDrone != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE;
      }
      else if(this.website.purchasedHackerWeapon != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE;
      }
      else if(this.website.purchasedHackerWorkshop != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_SUMMARY_PAGE;
      }
      if(this.website.hackerTint == -1)
      {
         this.website.hackerTint = 0;
      }
      if(this.website.hackerDecal == -1)
      {
         this.website.hackerDecal = 0;
      }
      if(this.website.hackerMissile == -1)
      {
         this.website.hackerMissile = 0;
      }
      this.website.imageManager.addImage("CANDC_HACKER","MISSILE",this.view.image.tf);
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(2);
      this.progressPanel.enable();
      this.view.description.autoSize = "left";
      this.setLocalisedText(this.view.description,"CANDC_HACKER_MSL_DESC");
      var _loc3_ = this.view.selection;
      this.setLocalisedText(_loc3_.btnTxt,"CANDC_HACKER_MSL");
      _loc3_._y = this.view.description._y + this.view.description.textHeight + 20;
      _loc3_.gotoAndStop(this.website.hackerMissile != 1 ? "unselected" : "selected");
      if(this.website.purchasedHackerMissile != 1)
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
         if(this.website.hackerMissile == 1)
         {
            this.website.hackerMissile = 0;
            _loc2_.gotoAndStop("unselected");
         }
         else
         {
            this.website.hackerMissile = 1;
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
