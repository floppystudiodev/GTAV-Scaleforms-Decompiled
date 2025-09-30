class com.rockstargames.gtav.web.warstock.SubProgressPanel
{
   var buttons;
   var buttonsPermaDisabled;
   var total;
   var view;
   var website;
   static var TXD = "CANDC_SUB";
   function SubProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.buttonsPermaDisabled = [false,false];
      this.setLocalisedText(this.view.title,"CANDC_SUB_TITLE",true);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.SubProgressPanel.TXD,"THUMBNAIL",this.view.image.txt);
      this.initButton(this.view.SUB_D_COLOR,"CANDC_SUB_CLR");
      this.initButton(this.view.SUB_D_FLAG,"CANDC_SUB_FLG");
      this.initButton(this.view.SUB_D_SONAR,"CANDC_SUB_SNR");
      this.initButton(this.view.SUB_D_GUIDED_D_MISSILES,"CANDC_SUB_MSL");
      this.initButton(this.view.SUB_D_WEAPON_D_WORKSHOP,"CANDC_SUB_WRK");
      this.initButton(this.view.SUB_D_VEHICLES,"CANDC_SUB_VEH");
      this.buttons.push(this.view.SUB_D_SUMMARY.btnTxt);
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
      this.view.SUB_D_SUMMARY.disabled = false;
      this.view.SUB_D_SUMMARY._visible = true;
   }
   function hideBuyButton()
   {
      this.view.SUB_D_SUMMARY.disabled = true;
      this.view.SUB_D_SUMMARY._visible = false;
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
      var _loc9_ = this.website.getSubBasePrice();
      var _loc8_ = this.website.getSubBaseSalePrice();
      this.total = _loc8_ != -1 ? _loc8_ : _loc9_;
      var _loc3_;
      var _loc2_;
      var _loc12_;
      _loc3_ = this.website.getSubColourCost(this.website.subColour);
      _loc2_ = this.website.getSubColourSaleCost(this.website.subColour);
      this.total += this.updateCostStep(0,_loc3_,_loc2_,this.website.subColour,this.website.purchasedSubColour);
      _loc3_ = this.website.getSubFlagCost(this.website.subFlag);
      _loc2_ = this.website.getSubFlagSaleCost(this.website.subFlag);
      this.total += this.updateCostStep(1,_loc3_,_loc2_,this.website.subFlag,this.website.purchasedSubFlag);
      _loc3_ = this.website.getSubSonarCost(this.website.subSonar);
      _loc2_ = this.website.getSubSonarSaleCost(this.website.subSonar);
      this.total += this.updateCostStep(2,_loc3_,_loc2_,this.website.subSonar,this.website.purchasedSubSonar);
      _loc3_ = this.website.getSubMissilesCost(this.website.subMissiles);
      _loc2_ = this.website.getSubMissilesSaleCost(this.website.subMissiles);
      this.total += this.updateCostStep(3,_loc3_,_loc2_,this.website.subMissiles,this.website.purchasedSubMissiles);
      _loc3_ = this.website.getSubWorkshopCost(this.website.subWorkshop);
      _loc2_ = this.website.getSubWorkshopSaleCost(this.website.subWorkshop);
      this.total += this.updateCostStep(4,_loc3_,_loc2_,this.website.subWorkshop,this.website.purchasedSubWorkshop);
      var _loc7_ = this.website.getSubHelicopterCost(this.website.subHelicopter);
      var _loc5_ = this.website.getSubHelicopterSaleCost(this.website.subHelicopter);
      var _loc6_ = this.website.getSubMiniSubCost(this.website.subMiniSub);
      var _loc4_ = this.website.getSubMiniSubSaleCost(this.website.subMiniSub);
      if(this.website.purchasedSubHelicopter == 1 && this.website.purchasedSubMiniSub == 1)
      {
         this.total += this.updateCostStep(5,0,0,1,1);
      }
      else if(this.website.purchasedSubHelicopter == 1)
      {
         this.total += this.updateCostStep(5,_loc6_,_loc4_,this.website.subMiniSub,this.website.purchasedSubMiniSub);
      }
      else if(this.website.purchasedSubMiniSub == 1)
      {
         this.total += this.updateCostStep(5,_loc7_,_loc5_,this.website.subHelicopter,this.website.purchasedSubHelicopter);
      }
      else if(this.website.subHelicopter == 1 && this.website.subMiniSub == 1)
      {
         _loc3_ = _loc7_ + _loc6_;
         if(_loc4_ != -1 && _loc5_ == -1)
         {
            _loc2_ = _loc4_ + _loc7_;
         }
         else if(_loc4_ == -1 && _loc5_ != -1)
         {
            _loc2_ = _loc6_ + _loc5_;
         }
         else if(_loc4_ != -1 && _loc5_ != -1)
         {
            _loc2_ = _loc4_ + _loc5_;
         }
         else
         {
            _loc2_ = -1;
         }
         this.total += this.updateCostStep(5,_loc3_,_loc2_,1,0);
      }
      else if(this.website.subHelicopter == 1)
      {
         this.total += this.updateCostStep(5,_loc7_,_loc5_,this.website.subHelicopter,this.website.purchasedSubHelicopter);
      }
      else if(this.website.subMiniSub == 1)
      {
         this.total += this.updateCostStep(5,_loc6_,_loc4_,this.website.subMiniSub,this.website.purchasedSubMiniSub);
      }
      else
      {
         this.total += this.updateCostStep(5,0,0,0,0);
      }
      var _loc11_ = this.website.purchasedSubColour != -1;
      var _loc10_ = !_loc11_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE";
      this.view.SUB_D_SUMMARY.label.text = this.setLocalisedText(this.view.SUB_D_SUMMARY.label,_loc10_,true) + ": $" + this.website.formatNumber(this.total);
      this.view.stepDot0.tick._visible = false;
      this.view.stepDot1.tick._visible = false;
      this.view.stepDot2.tick._visible = this.website.purchasedSubSonar > 0;
      this.view.stepDot3.tick._visible = this.website.purchasedSubMissiles > 0;
      this.view.stepDot4.tick._visible = this.website.purchasedSubWorkshop > 0;
      this.view.stepDot5.tick._visible = this.website.purchasedSubHelicopter > 0 && this.website.purchasedSubMiniSub > 0;
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
