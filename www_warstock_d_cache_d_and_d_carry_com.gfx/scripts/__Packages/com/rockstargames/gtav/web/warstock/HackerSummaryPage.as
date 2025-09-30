class com.rockstargames.gtav.web.warstock.HackerSummaryPage extends com.rockstargames.gtav.web.warstock.HackerPage
{
   var buttons;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function HackerSummaryPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedHackerWorkshop != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WORKSHOP_PAGE;
      }
      else if(this.website.purchasedHackerWeapon != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_WEAPON_PAGE;
      }
      else if(this.website.purchasedHackerDrone != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DRONE_PAGE;
      }
      else if(this.website.purchasedHackerMissile != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_MISSILE_PAGE;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.HACKER_DECAL_PAGE;
      }
      this.progressPanel.updateCosts();
      this.progressPanel.hideBuyButton();
      this.progressPanel.setActiveStep(6);
      this.progressPanel.enable();
      if(this.website.hackerMissile == 0)
      {
         this.view.missile._alpha = 50;
      }
      if(this.website.hackerDrone == 0)
      {
         this.view.drone._alpha = 50;
      }
      if(this.website.hackerWeapon == 0)
      {
         this.view.weapon._alpha = 50;
      }
      if(this.website.hackerWorkshop == 0)
      {
         this.view.workshop._alpha = 50;
      }
      this.website.imageManager.addImage("CANDC_HACKER","TINT" + this.website.hackerTint,this.view.tint.tf);
      this.website.imageManager.addImage("CANDC_HACKER","DECAL" + this.website.hackerDecal,this.view.decal.tf);
      this.website.imageManager.addImage("CANDC_HACKER","MISSILE",this.view.missile.tf);
      this.website.imageManager.addImage("CANDC_HACKER","DRONE",this.view.drone.tf);
      this.website.imageManager.addImage("CANDC_HACKER","WEAPON",this.view.weapon.tf);
      this.website.imageManager.addImage("CANDC_HACKER","WORKSHOP",this.view.workshop.tf);
      var _loc4_ = this.website.purchasedHackerTint != -1 ? "CANDC_RENOVATE" : "CANDC_BUY_TRUCK";
      var _loc3_ = this.view.buyButton;
      _loc3_.label.text = this.setLocalisedText(_loc3_.label,_loc4_,true) + ": $" + this.website.formatNumber(this.progressPanel.total);
      this.buttons.push(_loc3_.btnTxt);
      if(this.website.hackerTint == this.website.purchasedHackerTint && this.website.hackerDecal == this.website.purchasedHackerDecal && this.website.hackerMissile == this.website.purchasedHackerMissile && this.website.hackerDrone == this.website.purchasedHackerDrone && this.website.hackerWeapon == this.website.purchasedHackerWeapon && this.website.hackerWorkshop == this.website.purchasedHackerWorkshop)
      {
         this.view.buyButton.disabled = true;
         this.view.buyButton._alpha = 50;
      }
   }
   function handleClick(id, attribute)
   {
      if(id == "buyButton")
      {
         this.website.dispatchPlayerHackerSelections();
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
