class com.rockstargames.gtav.web.warstock.ChopperSummaryPage extends com.rockstargames.gtav.web.warstock.ChopperPage
{
   var buttons;
   var prevPageName;
   var progressPanel;
   var setLocalisedText;
   var view;
   var website;
   function ChopperSummaryPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      if(this.website.purchasedChopperTerminal != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TERMINAL_PAGE;
      }
      else if(this.website.purchasedChopperWeapon != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_WEAPON_PAGE;
      }
      else if(this.website.purchasedChopperVehicle != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_VEHICLE_PAGE;
      }
      else if(this.website.purchasedChopperTurret != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_TURRET_PAGE;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.CHOPPER_INTERIOR_PAGE;
      }
      this.progressPanel.updateCosts();
      this.progressPanel.hideBuyButton();
      this.progressPanel.setActiveStep(5);
      this.progressPanel.enable();
      if(this.website.chopperTurret == 0)
      {
         this.view.turret._alpha = 50;
      }
      if(this.website.chopperVehicle == 0)
      {
         this.view.vehicle._alpha = 50;
      }
      if(this.website.chopperWeapon == 0)
      {
         this.view.weapon._alpha = 50;
      }
      if(this.website.chopperTerminal == 0)
      {
         this.view.terminal._alpha = 50;
      }
      this.website.imageManager.addImage("CANDC_CHOPPER","interior_" + this.website.chopperInterior,this.view.interior.tf);
      this.website.imageManager.addImage("CANDC_CHOPPER","turret",this.view.turret.tf);
      this.website.imageManager.addImage("CANDC_CHOPPER","vehicle",this.view.vehicle.tf);
      this.website.imageManager.addImage("CANDC_CHOPPER","weapon",this.view.weapon.tf);
      this.website.imageManager.addImage("CANDC_CHOPPER","summary_terminal",this.view.terminal.tf);
      var _loc4_ = this.website.purchasedChopperInterior != -1 ? "CANDC_RENOVATE" : "CANDC_BUY_TRUCK";
      var _loc3_ = this.view.buyButton;
      _loc3_.label.text = this.setLocalisedText(_loc3_.label,_loc4_,true) + ": $" + this.website.formatNumber(this.progressPanel.total);
      this.buttons.push(_loc3_.btnTxt);
      if(this.website.chopperInterior == this.website.purchasedChopperInterior && this.website.chopperTurret == this.website.purchasedChopperTurret && this.website.chopperVehicle == this.website.purchasedChopperVehicle && this.website.chopperWeapon == this.website.purchasedChopperWeapon && this.website.chopperTerminal == this.website.purchasedChopperTerminal)
      {
         this.view.buyButton.disabled = true;
         this.view.buyButton._alpha = 50;
      }
   }
   function handleClick(id, attribute)
   {
      if(id == "buyButton")
      {
         this.website.dispatchPlayerChopperSelections();
      }
   }
   function dispose()
   {
      super.dispose();
   }
}
