class com.rockstargames.gtav.web.warstock.ChopperProgressPanel
{
   var buttons;
   var buttonsPermaDisabled;
   var total;
   var view;
   var website;
   static var TXD = "CANDC_CHOPPER";
   function ChopperProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.buttonsPermaDisabled = [false,false,false,false,false];
      this.setLocalisedText(this.view.title,"CANDC_CHOPPER_TITLE",true);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.ChopperProgressPanel.TXD,"THUMBNAIL",this.view.image.txt);
      this.initButton(this.view.AVENGER_D_INTERIOR,"CANDC_CHOPPER_INT");
      this.initButton(this.view.AVENGER_D_TURRET,"CANDC_CHOPPER_TRT");
      this.initButton(this.view.AVENGER_D_VEHICLE_D_WORKSHOP,"CANDC_CHOPPER_V_MOD");
      this.initButton(this.view.AVENGER_D_WEAPON_D_WORKSHOP,"CANDC_CHOPPER_W_MOD");
      this.initButton(this.view.AVENGER_D_TERMINAL,"CANDC_CHOPPER_TERMINAL");
      this.buttons.push(this.view.AVENGER_D_SUMMARY.btnTxt);
      this.total = 0;
   }
   function initButton(buttonView, label)
   {
      this.setLocalisedText(buttonView.btnTxt,label,true);
      this.buttons.push(buttonView.btnTxt);
   }
   function show()
   {
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
   }
   function permaDisableButton(index)
   {
      this.buttonsPermaDisabled[index] = true;
      this.buttons[index]._parent.disabled = true;
   }
   function enable()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_]._parent.disabled = this.buttonsPermaDisabled[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function disable()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_]._parent.disabled = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function showBuyButton()
   {
      this.view.AVENGER_D_SUMMARY.disabled = false;
      this.view.AVENGER_D_SUMMARY._visible = true;
   }
   function hideBuyButton()
   {
      this.view.AVENGER_D_SUMMARY.disabled = true;
      this.view.AVENGER_D_SUMMARY._visible = false;
   }
   function setActiveStep(step)
   {
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(step != _loc2_ ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateCosts()
   {
      var _loc5_ = this.website.getChopperBasePrice();
      var _loc4_ = this.website.getChopperBaseSalePrice();
      this.total = _loc4_ != -1 ? _loc4_ : _loc5_;
      var _loc3_;
      var _loc2_;
      var _loc8_;
      _loc3_ = this.website.getChopperInteriorCost(this.website.chopperInterior);
      _loc2_ = this.website.getChopperInteriorSaleCost(this.website.chopperInterior);
      this.total += this.updateCostStep(0,_loc3_,_loc2_,this.website.chopperInterior,this.website.purchasedChopperInterior);
      _loc3_ = this.website.getChopperTurretCost(this.website.chopperTurret);
      _loc2_ = this.website.getChopperTurretSaleCost(this.website.chopperTurret);
      this.total += this.updateCostStep(1,_loc3_,_loc2_,this.website.chopperTurret,this.website.purchasedChopperTurret);
      _loc3_ = this.website.getChopperVehicleCost(this.website.chopperVehicle);
      _loc2_ = this.website.getChopperVehicleSaleCost(this.website.chopperVehicle);
      this.total += this.updateCostStep(2,_loc3_,_loc2_,this.website.chopperVehicle,this.website.purchasedChopperVehicle);
      _loc3_ = this.website.getChopperWeaponCost(this.website.chopperWeapon);
      _loc2_ = this.website.getChopperWeaponSaleCost(this.website.chopperWeapon);
      this.total += this.updateCostStep(3,_loc3_,_loc2_,this.website.chopperWeapon,this.website.purchasedChopperWeapon);
      _loc3_ = this.website.getChopperTerminalCost(this.website.chopperTerminal);
      _loc2_ = this.website.getChopperTerminalSaleCost(this.website.chopperTerminal);
      this.total += this.updateCostStep(4,_loc3_,_loc2_,this.website.chopperTerminal,this.website.purchasedChopperTerminal);
      var _loc7_ = this.website.purchasedChopperInterior != -1;
      var _loc6_ = !_loc7_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE";
      this.view.AVENGER_D_SUMMARY.label.text = this.setLocalisedText(this.view.AVENGER_D_SUMMARY.label,_loc6_,true) + ": $" + this.website.formatNumber(this.total);
      this.view.stepDot0.tick._visible = false;
      this.view.stepDot1.tick._visible = this.website.purchasedChopperTurret > 0;
      this.view.stepDot2.tick._visible = this.website.purchasedChopperVehicle > 0;
      this.view.stepDot3.tick._visible = this.website.purchasedChopperWeapon > 0;
      this.view.stepDot4.tick._visible = this.website.purchasedChopperTerminal > 0;
   }
   function updateCostStep(step, normalPrice, salePrice, currentSelection, purchasedSelection)
   {
      var _loc5_ = currentSelection == purchasedSelection || salePrice == -1 && normalPrice <= 0 || salePrice == undefined && normalPrice == undefined;
      if(_loc5_)
      {
         this.view["cost" + step].text = "";
         this.view["saleCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
         this.view["originalCost" + step].text = "";
         return 0;
      }
      if(salePrice == -1)
      {
         this.view["cost" + step].text = "$" + this.website.formatNumber(normalPrice);
         this.view["saleCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
         this.view["originalCost" + step].text = "";
         return normalPrice;
      }
      this.view["cost" + step].text = "";
      this.view["saleCost" + step].text = "$" + this.website.formatNumber(salePrice);
      this.view["strikethrough" + step]._visible = true;
      this.view["originalCost" + step].text = "$" + this.website.formatNumber(normalPrice);
      this.view["strikethrough" + step]._width = this.view["originalCost" + step].textWidth + 6;
      return salePrice;
   }
   function setLocalisedText(tf, label, forceUpperCase)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      if(forceUpperCase)
      {
         tf.text = tf.text.toUpperCase();
      }
      return tf.text;
   }
   function dispose()
   {
      this.website = null;
      this.buttons = null;
      this.view = null;
   }
}
