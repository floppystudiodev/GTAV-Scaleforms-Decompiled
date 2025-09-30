class com.rockstargames.gtav.web.warstock.HackerProgressPanel
{
   var buttons;
   var buttonsPermaDisabled;
   var total;
   var view;
   var website;
   static var TXD = "CANDC_HACKER";
   function HackerProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.buttonsPermaDisabled = [false,false,false,false,false,false];
      this.setLocalisedText(this.view.title,"CANDC_HACKER_TITLE",true);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.HackerProgressPanel.TXD,"THUMBNAIL",this.view.image.txt);
      this.initButton(this.view.HACKERTRUCK_D_TINT,"CANDC_HACKER_TNT");
      this.initButton(this.view.HACKERTRUCK_D_DECAL,"CANDC_HACKER_DEC");
      this.initButton(this.view.HACKERTRUCK_D_TURRET_D_STATION,"CANDC_HACKER_MSL");
      this.initButton(this.view.HACKERTRUCK_D_DRONE_D_STATION,"CANDC_HACKER_DRN");
      this.initButton(this.view.HACKERTRUCK_D_WEAPON_D_WORKSHOP,"CANDC_HACKER_WEP");
      this.initButton(this.view.HACKERTRUCK_D_VEHICLE_D_WORKSHOP,"CANDC_HACKER_WORK");
      this.buttons.push(this.view.HACKERTRUCK_D_SUMMARY.btnTxt);
      this.total = 0;
   }
   function initButton(buttonView, label)
   {
      buttonView.btnTxt.textAutoSize = "shrink";
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
         this.buttons[_loc2_]._parent.disabled = this.buttonsPermaDisabled[_loc2_] === true;
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
      this.view.HACKERTRUCK_D_SUMMARY.disabled = false;
      this.view.HACKERTRUCK_D_SUMMARY._visible = true;
   }
   function hideBuyButton()
   {
      this.view.HACKERTRUCK_D_SUMMARY.disabled = true;
      this.view.HACKERTRUCK_D_SUMMARY._visible = false;
   }
   function setActiveStep(step)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(step != _loc2_ ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateCosts()
   {
      var _loc5_ = this.website.getHackerBasePrice();
      var _loc4_ = this.website.getHackerBaseSalePrice();
      this.total = _loc4_ != -1 ? _loc4_ : _loc5_;
      var _loc3_;
      var _loc2_;
      var _loc8_;
      _loc3_ = this.website.getHackerTintCost(this.website.hackerTint);
      _loc2_ = this.website.getHackerTintSaleCost(this.website.hackerTint);
      this.total += this.updateCostStep(0,_loc3_,_loc2_,this.website.hackerTint,this.website.purchasedHackerTint);
      _loc3_ = this.website.getHackerDecalCost(this.website.hackerDecal);
      _loc2_ = this.website.getHackerDecalSaleCost(this.website.hackerDecal);
      this.total += this.updateCostStep(1,_loc3_,_loc2_,this.website.hackerDecal,this.website.purchasedHackerDecal);
      _loc3_ = this.website.getHackerMissileCost(this.website.hackerMissile);
      _loc2_ = this.website.getHackerMissileSaleCost(this.website.hackerMissile);
      this.total += this.updateCostStep(2,_loc3_,_loc2_,this.website.hackerMissile,this.website.purchasedHackerMissile);
      _loc3_ = this.website.getHackerDroneCost(this.website.hackerDrone);
      _loc2_ = this.website.getHackerDroneSaleCost(this.website.hackerDrone);
      this.total += this.updateCostStep(3,_loc3_,_loc2_,this.website.hackerDrone,this.website.purchasedHackerDrone);
      _loc3_ = this.website.getHackerWeaponCost(this.website.hackerWeapon);
      _loc2_ = this.website.getHackerWeaponSaleCost(this.website.hackerWeapon);
      this.total += this.updateCostStep(4,_loc3_,_loc2_,this.website.hackerWeapon,this.website.purchasedHackerWeapon);
      _loc3_ = this.website.getHackerWorkshopCost(this.website.hackerWorkshop);
      _loc2_ = this.website.getHackerWorkshopSaleCost(this.website.hackerWorkshop);
      this.total += this.updateCostStep(5,_loc3_,_loc2_,this.website.hackerWorkshop,this.website.purchasedHackerWorkshop);
      var _loc7_ = this.website.purchasedHackerTint != -1;
      var _loc6_ = !_loc7_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE";
      this.view.HACKERTRUCK_D_SUMMARY.label.text = this.setLocalisedText(this.view.HACKERTRUCK_D_SUMMARY.label,_loc6_,true) + ": $" + this.website.formatNumber(this.total);
      this.view.stepDot0.tick._visible = false;
      this.view.stepDot1.tick._visible = false;
      this.view.stepDot2.tick._visible = this.website.purchasedHackerMissile > 0;
      this.view.stepDot3.tick._visible = this.website.purchasedHackerDrone > 0;
      this.view.stepDot4.tick._visible = this.website.purchasedHackerWeapon > 0;
      this.view.stepDot5.tick._visible = this.website.purchasedHackerWorkshop > 0;
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
