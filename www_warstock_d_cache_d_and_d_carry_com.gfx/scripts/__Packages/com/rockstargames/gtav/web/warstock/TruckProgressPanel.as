class com.rockstargames.gtav.web.warstock.TruckProgressPanel
{
   var buttons;
   var total;
   var view;
   var website;
   static var VOID_MODULE = 0;
   static var MODULE_DATA = [{type:1,label:"CANDC_EMPTY",locations:[2,4],costIndexes:[5,5],unique:false},{type:2,label:"CANDC_LIVING_QTRS",locations:[1,2,4],costIndexes:[6,11,11],unique:false},{type:3,label:"CANDC_CMD_CENTRE",locations:[1],costIndexes:[7],unique:true},{type:4,label:"CANDC_ARMORY",locations:[2,4],costIndexes:[8,8],unique:true},{type:5,label:"CANDC_VMOD_ARMORY",locations:[6],costIndexes:[9],unique:false},{type:6,label:"CANDC_VSTORAGE",locations:[4],costIndexes:[10],unique:true}];
   static var TXD = "CANDC_TRUCK";
   function TruckProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.setLocalisedText(this.view.title,"CANDC_TRUCK_TITLE",true);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckProgressPanel.TXD,"THUMBNAIL",this.view.image.txt);
      this.initButton(this.view.TRUCK_D_CAB,"CANDC_TRUCK_CAB");
      this.initButton(this.view.TRUCK_D_MODULE_D_1,"CANDC_MODULE_1");
      this.initButton(this.view.TRUCK_D_MODULE_D_2,"CANDC_MODULE_2");
      this.initButton(this.view.TRUCK_D_MODULE_D_3,"CANDC_MODULE_3");
      this.initButton(this.view.TRUCK_D_COLOR,"CANDC_COLOR");
      this.buttons.push(this.view.TRUCK_D_SUMMARY.btnTxt);
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
   function enable()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_]._parent.disabled = false;
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
      this.view.TRUCK_D_SUMMARY.disabled = false;
      this.view.TRUCK_D_SUMMARY._visible = true;
   }
   function hideBuyButton()
   {
      this.view.TRUCK_D_SUMMARY.disabled = true;
      this.view.TRUCK_D_SUMMARY._visible = false;
   }
   function setActiveStep(step)
   {
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(step != _loc2_ ? "off" : "on");
         this.view["stepDot" + _loc2_].tick._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateCosts()
   {
      var _loc6_ = this.website.getBasePrice();
      var _loc5_ = this.website.getBaseSalePrice();
      this.total = _loc5_ != -1 ? _loc5_ : _loc6_;
      var _loc3_;
      var _loc2_;
      var _loc4_;
      _loc3_ = this.website.getCabCost(this.website.truckCab);
      _loc2_ = this.website.getCabSaleCost(this.website.truckCab);
      this.total += this.updateCostStep(0,_loc3_,_loc2_,this.website.truckCab,this.website.purchasedTruckCab);
      _loc4_ = this.getCostIndex(this.website.truckModule1,1);
      _loc3_ = this.website.getModuleCost(_loc4_);
      _loc2_ = this.website.getModuleSaleCost(_loc4_);
      this.total += this.updateCostStep(1,_loc3_,_loc2_,this.website.truckModule1,this.website.purchasedTruckModule1);
      _loc4_ = this.getCostIndex(this.website.truckModule2,2);
      _loc3_ = this.website.getModuleCost(_loc4_);
      _loc2_ = this.website.getModuleSaleCost(_loc4_);
      this.total += this.updateCostStep(2,_loc3_,_loc2_,this.website.truckModule2,this.website.purchasedTruckModule2);
      _loc4_ = this.getCostIndex(this.website.truckModule3,4);
      _loc3_ = this.website.getModuleCost(_loc4_);
      _loc2_ = this.website.getModuleSaleCost(_loc4_);
      this.total += this.updateCostStep(3,_loc3_,_loc2_,this.website.truckModule3,this.website.purchasedTruckModule3);
      _loc3_ = this.website.getColourCost(this.website.truckColour);
      _loc2_ = this.website.getColourSaleCost(this.website.truckColour);
      this.total += this.updateCostStep(4,_loc3_,_loc2_,this.website.truckColour,this.website.purchasedTruckColour);
      var _loc8_ = this.website.purchasedTruckCab != -1;
      var _loc7_ = !_loc8_ ? "CANDC_BUY_FROM" : "CANDC_RENOVATE";
      this.view.TRUCK_D_SUMMARY.label.text = this.setLocalisedText(this.view.TRUCK_D_SUMMARY.label,_loc7_,true) + ": $" + this.website.formatNumber(this.total);
   }
   function getCostIndex(moduleType, slotNum)
   {
      var _loc3_ = 0;
      var _loc2_;
      var _loc1_;
      while(_loc3_ < com.rockstargames.gtav.web.warstock.TruckProgressPanel.MODULE_DATA.length)
      {
         _loc2_ = com.rockstargames.gtav.web.warstock.TruckProgressPanel.MODULE_DATA[_loc3_];
         if(_loc2_.type == moduleType)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc2_.locations.length)
            {
               if((_loc2_.locations[_loc1_] & slotNum) != 0)
               {
                  return _loc2_.costIndexes[_loc1_];
               }
               _loc1_ = _loc1_ + 1;
            }
            return _loc2_.type;
         }
         _loc3_ = _loc3_ + 1;
      }
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
