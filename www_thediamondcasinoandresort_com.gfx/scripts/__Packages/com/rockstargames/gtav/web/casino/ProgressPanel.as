class com.rockstargames.gtav.web.casino.ProgressPanel
{
   var view;
   var website;
   var stepPageTargets;
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function init()
   {
      this.website.dataTextScope.push(this.view.stepButton_1.btnTxt);
      this.website.dataTextScope.push(this.view.stepButton_2.btnTxt);
      this.website.dataTextScope.push(this.view.stepButton_3.btnTxt);
      this.stepPageTargets = [];
      this.stepPageTargets[1] = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_OPTIONS_PAGE.name;
      this.stepPageTargets[2] = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_COLOUR_PAGE.name;
      this.stepPageTargets[3] = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_STYLE_PAGE.name;
      this.view.stepButton_1.label.verticalAlign = "center";
      this.view.stepButton_2.label.verticalAlign = "center";
      this.view.stepButton_3.label.verticalAlign = "center";
      this.view.total.cost.verticalAlign = "center";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.stepButton_1.label,"CASWEB_FLOORPLAN",4,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.stepButton_2.label,"CASWEB_COLOURS",4,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.stepButton_3.label,"CASWEB_PATTERNS",4,true,false);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.total.cost,"CASWEB_TOTAL",4,true,false);
      this.view.cost1._visible = this.website.hasMadeOptionChoice;
      this.view.cost2._visible = this.website.hasMadeColourChoice;
      this.view.cost3._visible = this.website.hasMadeStyleChoice;
   }
   function setCurrentStep(currStep)
   {
      var _loc2_ = 1;
      while(_loc2_ <= currStep)
      {
         this.view["stepButton_" + _loc2_].bg.gotoAndStop("on");
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = this.view["stepButton_" + (currStep + 2)];
      if(_loc4_)
      {
         _loc4_.bg.outline._visible = false;
      }
   }
   function getStepPageTarget(step)
   {
      return this.stepPageTargets[step];
   }
   function updateCosts()
   {
      var _loc4_ = this.website.getSuiteBaseCost(true);
      var _loc3_ = this.website.getSuiteBaseCost(false);
      var _loc2_ = {};
      this.resetCostSums(_loc2_);
      this.website.getGarageCosts(_loc2_);
      this.website.getBedroomCosts(_loc2_);
      this.website.getLoungeCosts(_loc2_);
      this.website.getMediaRoomCosts(_loc2_);
      this.website.getBarCosts(_loc2_);
      this.website.getSpaCosts(_loc2_);
      this.website.getDealerCosts(_loc2_);
      this.website.getOfficeCosts(_loc2_);
      this.updateCostStep(_loc2_,this.view.cost1);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      this.resetCostSums(_loc2_);
      this.website.getColourCosts(_loc2_);
      this.updateCostStep(_loc2_,this.view.cost2);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      this.resetCostSums(_loc2_);
      this.website.getStyleCosts(_loc2_);
      this.updateCostStep(_loc2_,this.view.cost3);
      _loc4_ += _loc2_.actual;
      _loc3_ += _loc2_.original;
      this.updateTotal(_loc4_,_loc3_);
   }
   function logCostSums(costSums, step)
   {
      trace("************************************************************");
      trace("COST [" + step + "] original: " + costSums.original + ", actual: " + costSums.actual + ", hasPurchase: " + costSums.hasPurchase);
      trace("************************************************************");
   }
   function resetCostSums(costSums)
   {
      costSums.original = 0;
      costSums.actual = 0;
      costSums.hasPurchase = false;
   }
   function updateCostStep(costSums, stepView)
   {
      if(!costSums.hasPurchase)
      {
         stepView.gotoAndStop("normal");
         stepView.cost.text = "";
         stepView.originalCost.text = "";
         stepView.strikethrough._visible = false;
         stepView._visible = false;
      }
      else
      {
         if(costSums.actual == 0)
         {
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(stepView.cost,"CASWEB_FREE",4,true,false);
         }
         else
         {
            var _loc3_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(costSums.actual);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(stepView.cost,_loc3_,4,false,true);
         }
         if(costSums.actual < costSums.original)
         {
            stepView.gotoAndStop("sale");
            _loc3_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(costSums.original);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(stepView.originalCost,_loc3_,4,false,true);
            _loc3_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(costSums.actual);
            com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(stepView.cost,_loc3_,4,false,true);
            stepView.strikethrough._width = stepView.originalCost.textWidth + 4;
            stepView.strikethrough._x = 0.5 * (stepView.originalCost._width - stepView.strikethrough._width) + stepView.originalCost._x;
            stepView.strikethrough._visible = true;
         }
         else
         {
            stepView.gotoAndStop("normal");
            stepView.originalCost.text = "";
            stepView.strikethrough._visible = false;
         }
         stepView._visible = true;
      }
   }
   function updateTotal(actualTotal, originalTotal)
   {
      var _loc2_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(actualTotal);
      var _loc4_ = "$" + com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.formatNumber(originalTotal);
      var _loc3_ = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.total.cost,"CASWEB_TOTAL");
      if(actualTotal < originalTotal)
      {
         this.view.total.gotoAndStop("sale");
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.total.cost,_loc3_ + " " + _loc2_,4,false,true);
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.total.originalCost,_loc4_,4,false,true);
         this.view.total.strikethrough._width = this.view.total.originalCost.textWidth + 4;
         this.view.total.strikethrough._x = 0.5 * (this.view.total.originalCost._width - this.view.total.strikethrough._width) + this.view.total.originalCost._x;
         this.view.total.strikethrough._visible = true;
      }
      else
      {
         this.view.total.gotoAndStop("normal");
         this.view.total.cost.verticalAlign = "center";
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.total.cost,_loc3_ + " " + _loc2_,4,false,true);
      }
   }
   function getFormattedStepCost(step)
   {
      return this.view["cost" + step].cost.text;
   }
   function getFormattedStepOriginalCost(step)
   {
      return this.view["cost" + step].originalCost.text;
   }
   function dispose()
   {
      this.website = null;
      this.stepPageTargets = null;
   }
}
