class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.ProgressPanel
{
   var agency;
   var bottom;
   var currImageId;
   var displayConfig;
   var left;
   var office;
   var right;
   var top;
   var view;
   var website;
   function ProgressPanel(view, website)
   {
      this.view = view;
      this.website = website;
      this.init();
   }
   function dispose()
   {
      this.website = null;
      this.office = null;
      this.agency = null;
      this.displayConfig = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image);
      delete this.view.image.txt.onDisplayImage;
   }
   function init()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
      this.displayConfig = this.website.browser.getConfig();
      this.view.image.txt.onDisplayImage = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.delegate(this,this.onDisplayImage);
      this.hide();
   }
   function initOverview()
   {
      this.view.gotoAndStop("overview");
      this.view.nextButton.onColour = 16777215;
      this.view.nextButton.offColour = 16777215;
      this.view.nextButton.disabled = true;
      this.website.dataTextScope.push(this.view.nextButton.btnTxt);
      this.hide();
   }
   function showOverview(office, showImmediately)
   {
      this.office = office;
      this.agency = null;
      this.view.starterPack._visible = office.isInStarterPack;
      this.truncate(this.view.officeName,office.name,this.view.officeName._width - 5);
      var _loc11_ = !office.isOwned ? "DYN8_EXEC_BUY_FROM" : "DYN8_EXEC_RENOVATE";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc11_,false);
      var _loc8_;
      if(!office.isOwned)
      {
         _loc8_ = office.getBaseBestCost();
         if(_loc8_ == 0)
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,"DYN8_EXEC_FREE");
         }
         else
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc8_),true);
         }
      }
      var _loc10_ = 0;
      var _loc6_;
      var _loc3_;
      var _loc2_;
      var _loc5_;
      if(office.isOwned)
      {
         _loc6_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_ORGANIZATION_NAME");
         _loc3_ = "<font color=\'#000000\'>" + _loc6_ + ":</font> <font color=\'#333333\'>" + this.website.purchasedSignage + "</font>";
         this.view.description.htmlText = _loc3_;
         if(this.view.description.bottomScroll > 1)
         {
            _loc2_ = this.website.purchasedSignage.length;
            while(_loc2_ >= 0)
            {
               _loc3_ = "<font color=\'#000000\'>" + _loc6_ + ":</font> <font color=\'#333333\'>" + this.website.purchasedSignage.substring(0,_loc2_) + "...</font>";
               this.view.description.htmlText = _loc3_;
               if(this.view.description.bottomScroll == 1)
               {
                  break;
               }
               _loc2_ = _loc2_ - 1;
            }
         }
         _loc5_ = "";
         _loc5_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_STYLE") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_STYLE_" + this.website.purchasedStyle) + "</font><br>";
         _loc5_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_PERSONNEL") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_PERSONNEL_" + this.website.purchasedPersonnel) + "</font><br>";
         _loc5_ += _loc3_ + "<br>";
         _loc5_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_GUN_LOCKER") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedGunLocker ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
         _loc5_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_VAULT") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedVault ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
         _loc5_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_ACCOMMODATION") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedBed ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font>";
         this.view.description.htmlText = _loc5_;
         _loc10_ = 8;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.description,true);
      }
      var _loc9_ = this.view.description.getTextFormat();
      _loc9_.leading = _loc10_;
      this.view.description.setTextFormat(_loc9_);
      var _loc7_ = this.view.description._y + this.view.description.textHeight + 10;
      if(office.getBaseCost() != office.getBaseBestCost() && !office.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(office.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc7_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc7_ + 12;
         _loc7_ += 25;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc7_ += 15;
      }
      this.view.nextButton._y = _loc7_;
      this.view.nextButton.disabled = false;
      this.view.nextButton._visible = true;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showImage("");
      this.view.marker.gotoAndStop(!office.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function showGarageOverview(office, showImmediately)
   {
      this.showImage("");
      this.agency = null;
      this.view.starterPack._visible = false;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      if(office.isOwned)
      {
         _loc5_ = !office.garageIsOwned ? "DYN8_EXEC_BUY_FROM" : "DYN8_EXEC_RENOVATE";
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc5_,false);
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.garageDescription,true);
         this.view.nextButton._visible = true;
         this.view.nextButton.disabled = false;
         _loc3_ = this.view.description._y + this.view.description.textHeight + 10;
         if(office.getBaseGarageCost() != office.getBaseGarageBestCost())
         {
            this.view.originalCost.autoSize = "left";
            _loc4_ = office.getBaseGarageCost();
            if(_loc4_ == 0)
            {
               com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"DYN8_EXEC_FREE");
            }
            else
            {
               com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc4_),true);
            }
            if(!office.garageIsOwned)
            {
               _loc4_ = office.getBaseGarageBestCost();
               if(_loc4_ == 0)
               {
                  com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,"DYN8_EXEC_FREE");
               }
               else
               {
                  com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc4_),true);
               }
            }
            this.view.strikethrough._visible = true;
            this.view.originalCost._y = _loc3_;
            this.view.strikethrough._width = this.view.originalCost._width;
            this.view.strikethrough._y = _loc3_ + 12;
            _loc3_ += 25;
         }
         else
         {
            if(!office.garageIsOwned)
            {
               _loc4_ = office.getBaseGarageBestCost();
               if(_loc4_ == 0)
               {
                  com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"DYN8_EXEC_FREE");
               }
               else
               {
                  com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc4_),true);
               }
            }
            this.view.originalCost.text = "";
            this.view.strikethrough._visible = false;
            _loc3_ += 15;
         }
         this.view.nextButton._y = _loc3_;
         this.view.nextButton.disabled = false;
         this.view.nextButton._visible = true;
         this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
         this.bottom = this.top + this.view.bg._height;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,office.garageDescription,true);
         this.view.nextButton._visible = false;
         this.view.nextButton.disabled = true;
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         this.view.bg._height = this.view.description._y + this.view.description.textHeight + 25;
         this.bottom = this.top + this.view.bg._height;
      }
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function initProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("progress");
      this.agency = null;
      this.office = this.website.getSelectedOffice();
      this.view.starterPack._visible = this.office.isInStarterPack;
      this.showImage("");
      this.showPurchaseButton();
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY",false);
      if(!this.office.isOwned)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(this.office.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.officeName,this.office.name,this.view.officeName._width - 5);
      this.website.dataTextScope.push(this.view.DECOR.btnTxt);
      this.website.dataTextScope.push(this.view.PERSONNEL.btnTxt);
      this.website.dataTextScope.push(this.view.ORGANIZATION_D_NAME.btnTxt);
      this.website.dataTextScope.push(this.view.GUN_D_LOCKER.btnTxt);
      this.website.dataTextScope.push(this.view.SAFE.btnTxt);
      this.website.dataTextScope.push(this.view.ACCOMMODATION.btnTxt);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.DECOR.btnTxt,"DYN8_EXEC_STYLE",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.PERSONNEL.btnTxt,"DYN8_EXEC_PERSONNEL",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.ORGANIZATION_D_NAME.btnTxt,"DYN8_EXEC_ORGANIZATION_NAME",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GUN_D_LOCKER.btnTxt,"DYN8_EXEC_GUN_LOCKER",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.SAFE.btnTxt,"DYN8_EXEC_VAULT",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.ACCOMMODATION.btnTxt,"DYN8_EXEC_ACCOMMODATION",false);
      this.setProgressDots(numCompleteSteps);
      if(this.office.isOwned && this.website.purchasedGunLocker == 1)
      {
         this.view.GUN_D_LOCKER.disabled = true;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.GUN_D_LOCKER.disabled = false;
         this.view.GUN_D_LOCKER.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.office.isOwned && this.website.purchasedVault == 1)
      {
         this.view.SAFE.disabled = true;
         this.view.SAFE.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.SAFE.disabled = false;
         this.view.SAFE.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.office.isOwned && this.website.purchasedBed == 1)
      {
         this.view.ACCOMMODATION.disabled = true;
         this.view.ACCOMMODATION.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.ACCOMMODATION.disabled = false;
         this.view.ACCOMMODATION.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateCosts();
      this.view.bg._yscale = 100;
   }
   function initGarageProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("garageProgress");
      this.agency = null;
      this.office = this.website.getSelectedOffice();
      this.view.starterPack._visible = false;
      this.showImage("");
      this.showPurchaseButton();
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY",false);
      if(!this.office.isOwned)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(this.office.getBaseGarageBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.officeName,this.office.name,this.view.officeName._width - 5);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_1.btnTxt);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_2.btnTxt);
      this.website.dataTextScope.push(this.view.GARAGE_D_LEVEL_D_3.btnTxt);
      this.website.dataTextScope.push(this.view.MOD_D_SHOP.btnTxt);
      if(numCompleteSteps == 1)
      {
         this.view.GARAGE_D_LEVEL_D_1.disabled = true;
      }
      else if(numCompleteSteps == 2)
      {
         this.view.GARAGE_D_LEVEL_D_2.disabled = true;
      }
      else if(numCompleteSteps == 3)
      {
         this.view.GARAGE_D_LEVEL_D_3.disabled = true;
      }
      else if(numCompleteSteps == 4)
      {
         this.view.MOD_D_SHOP.disabled = true;
      }
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_1.btnTxt,"DYN8_EXEC_FLOOR_1",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_2.btnTxt,"DYN8_EXEC_FLOOR_2",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.GARAGE_D_LEVEL_D_3.btnTxt,"DYN8_EXEC_FLOOR_3",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.MOD_D_SHOP.btnTxt,"DYN8_EXEC_MOD_SHOP",false);
      this.setProgressDots(numCompleteSteps);
      this.updateGarageCosts();
      this.view.bg._height = this.view.purchaseButton._y + this.view.purchaseButton._height + 20;
   }
   function setProgressDots(numCompleteSteps)
   {
      var _loc2_ = 0;
      while(_loc2_ < 7)
      {
         this.view["stepDot" + _loc2_].gotoAndStop(_loc2_ >= numCompleteSteps ? "incomplete" : "complete");
         this.view["stepDot" + _loc2_].tick._visible = false;
         this.view["stepDot" + _loc2_].exclamation._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function hide()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._visible = false;
      this.view.nextButton.disabled = true;
   }
   function show()
   {
      this.view._visible = true;
      this.view.nextButton.disabled = false;
   }
   function hidePurchaseButton()
   {
      this.view.purchaseButton._visible = false;
      this.view.purchaseButton.disabled = true;
   }
   function showPurchaseButton()
   {
      this.view.purchaseButton._visible = true;
      this.view.purchaseButton.disabled = false;
   }
   function hideSignageExclamation()
   {
      this.view.stepDot2.exclamation._visible = false;
   }
   function showSignageExclamation()
   {
      this.view.stepDot2.exclamation._visible = true;
   }
   function hideGarage3Exclamation()
   {
      this.view.stepDot2.exclamation._visible = false;
   }
   function showGarage3Exclamation()
   {
      this.view.stepDot2.exclamation._visible = true;
   }
   function get isHidden()
   {
      return !this.view._visible;
   }
   function truncate(tf, text, availableWidth)
   {
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(tf,text,true);
      var _loc4_ = tf.getTextFormat();
      tf.letterSpacing = 1;
      var _loc1_;
      if(tf.textWidth > availableWidth)
      {
         _loc1_ = text.length;
         while(_loc1_ > 0)
         {
            tf.text = text.substring(0,_loc1_) + "...";
            tf.setTextFormat(_loc4_);
            if(tf.textWidth <= availableWidth)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateCosts()
   {
      var _loc3_ = !this.office.isOwned ? this.office.getBaseBestCost() : 0;
      var _loc4_;
      var _loc5_;
      var _loc2_;
      if(this.website.style == -1)
      {
         this.clearCostStep(0);
      }
      else
      {
         _loc4_ = this.office.getStyleBestCost(this.website.style,this.website.purchasedStyle);
         _loc5_ = this.office.getStyleCost(this.website.style,this.website.purchasedStyle);
         _loc2_ = this.office.getStyleSaleCost(this.website.style,this.website.purchasedStyle);
         _loc3_ += this.updateCostStep(0,_loc4_,_loc5_,_loc2_,"+");
      }
      if(this.website.personnel == -1)
      {
         this.clearCostStep(1);
      }
      else
      {
         _loc4_ = this.office.getPersonnelBestCost(this.website.personnel,this.website.purchasedPersonnel);
         _loc5_ = this.office.getPersonnelCost(this.website.personnel,this.website.purchasedPersonnel);
         _loc2_ = this.office.getPersonnelSaleCost(this.website.personnel,this.website.purchasedPersonnel);
         _loc3_ += this.updateCostStep(1,_loc4_,_loc5_,_loc2_,"+");
      }
      var _loc14_ = this.office.getFontBestCost(this.website.font,this.website.purchasedFont);
      var _loc9_ = this.office.getFontCost(this.website.font,this.website.purchasedFont);
      var _loc6_ = this.office.getFontSaleCost(this.website.font,this.website.purchasedFont);
      var _loc12_ = this.office.getSignageBestCost(this.website.signage,this.website.purchasedSignage);
      var _loc8_ = this.office.getSignageCost(this.website.signage,this.website.purchasedSignage);
      var _loc7_ = this.office.getSignageSaleCost(this.website.signage,this.website.purchasedSignage);
      var _loc11_ = this.website.font != this.website.purchasedFont;
      var _loc13_ = this.website.signage.length > 0 && this.website.signage != this.website.purchasedSignage;
      if(this.website.font == -1)
      {
         this.clearCostStep(2);
      }
      else if(_loc11_ && _loc13_)
      {
         _loc4_ = _loc14_ + _loc12_;
         _loc5_ = Math.max(_loc9_,0) + Math.max(_loc8_,0);
         if(_loc6_ == -1 && _loc7_ != -1)
         {
            _loc2_ = _loc9_ + _loc7_;
         }
         else if(_loc6_ != -1 && _loc7_ == -1)
         {
            _loc2_ = _loc6_ + _loc8_;
         }
         else
         {
            _loc2_ = _loc6_ + _loc7_;
         }
         _loc3_ += this.updateCostStep(2,_loc4_,_loc5_,_loc2_,"+");
      }
      else if(_loc11_)
      {
         _loc3_ += this.updateCostStep(2,_loc14_,_loc9_,_loc6_,"+");
      }
      else if(_loc13_)
      {
         _loc3_ += this.updateCostStep(2,_loc12_,_loc8_,_loc7_,"+");
      }
      else
      {
         _loc3_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.gunLocker == -1)
      {
         this.clearCostStep(3);
      }
      else
      {
         _loc4_ = this.office.getGunLockerBestCost(this.website.gunLocker,this.website.purchasedGunLocker);
         _loc5_ = this.office.getGunLockerCost(this.website.gunLocker,this.website.purchasedGunLocker);
         _loc2_ = this.office.getGunLockerSaleCost(this.website.gunLocker,this.website.purchasedGunLocker);
         _loc3_ += this.updateCostStep(3,_loc4_,_loc5_,_loc2_,"+");
      }
      if(this.website.vault == -1)
      {
         this.clearCostStep(4);
      }
      else
      {
         _loc4_ = this.office.getVaultBestCost(this.website.vault,this.website.purchasedVault);
         _loc5_ = this.office.getVaultCost(this.website.vault,this.website.purchasedVault);
         _loc2_ = this.office.getVaultSaleCost(this.website.vault,this.website.purchasedVault);
         _loc3_ += this.updateCostStep(4,_loc4_,_loc5_,_loc2_,"+");
      }
      if(this.website.bed == -1)
      {
         this.clearCostStep(5);
      }
      else
      {
         _loc4_ = this.office.getBedBestCost(this.website.bed,this.website.purchasedBed);
         _loc5_ = this.office.getBedCost(this.website.bed,this.website.purchasedBed);
         _loc2_ = this.office.getBedSaleCost(this.website.bed,this.website.purchasedBed);
         _loc3_ += this.updateCostStep(5,_loc4_,_loc5_,_loc2_,"+");
      }
      var _loc15_ = !this.office.isOwned ? "DYN8_EXEC_BUY" : "DYN8_EXEC_RENOVATE";
      var _loc10_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc15_);
      if(_loc3_ > 0)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc10_ + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc3_),true);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc10_,true);
      }
   }
   function updateGarageCosts()
   {
      var _loc3_ = 0;
      var _loc11_;
      var _loc4_;
      var _loc2_;
      var _loc18_;
      var _loc12_;
      var _loc13_;
      var _loc14_;
      var _loc9_;
      var _loc5_;
      var _loc8_;
      var _loc10_;
      var _loc6_;
      var _loc7_;
      if(this.website.garage1Equipped)
      {
         _loc12_ = this.office.getGarage1StyleBestCost(this.website.garage1Style,this.website.purchasedGarage1Style);
         _loc9_ = this.office.getGarage1StyleCost(this.website.garage1Style,this.website.purchasedGarage1Style);
         _loc10_ = this.office.getGarage1StyleRawSaleCost(this.website.garage1Style);
         _loc13_ = this.office.getGarage1LightingBestCost(this.website.garage1Lighting,this.website.purchasedGarage1Lighting);
         _loc5_ = this.office.getGarage1LightingCost(this.website.garage1Lighting,this.website.purchasedGarage1Lighting);
         _loc6_ = this.office.getGarage1LightingRawSaleCost(this.website.garage1Lighting);
         _loc14_ = this.office.getGarage1NumberBestCost(this.website.garage1Number,this.website.purchasedGarage1Number);
         _loc8_ = this.office.getGarage1NumberCost(this.website.garage1Number,this.website.purchasedGarage1Number);
         _loc7_ = this.office.getGarage1NumberRawSaleCost(this.website.garage1Number);
         _loc11_ = _loc12_ + _loc13_ + _loc14_;
         _loc4_ = _loc9_ + _loc5_ + _loc8_;
         _loc2_ = 0;
         if(this.website.garage1Style != -1 && this.website.garage1Style != this.website.purchasedGarage1Style)
         {
            _loc2_ += _loc10_ != -1 ? _loc10_ : _loc9_;
         }
         if(this.website.garage1Lighting != -1 && this.website.garage1Lighting != this.website.purchasedGarage1Lighting)
         {
            _loc2_ += _loc6_ != -1 ? _loc6_ : _loc5_;
         }
         if(this.website.garage1Number != -1 && this.website.garage1Number != this.website.purchasedGarage1Number)
         {
            _loc2_ += _loc7_ != -1 ? _loc7_ : _loc8_;
         }
         if(_loc2_ == _loc4_)
         {
            _loc2_ = -1;
         }
         _loc3_ += this.updateCostStep(0,_loc11_,_loc4_,_loc2_,"+");
      }
      else
      {
         _loc3_ += this.updateCostStep(0,0,0,0,"+");
      }
      if(this.website.garage2Equipped)
      {
         _loc12_ = this.office.getGarage2StyleBestCost(this.website.garage2Style,this.website.purchasedGarage2Style);
         _loc9_ = this.office.getGarage2StyleCost(this.website.garage2Style,this.website.purchasedGarage2Style);
         _loc10_ = this.office.getGarage2StyleRawSaleCost(this.website.garage2Style);
         _loc13_ = this.office.getGarage2LightingBestCost(this.website.garage2Lighting,this.website.purchasedGarage2Lighting);
         _loc5_ = this.office.getGarage2LightingCost(this.website.garage2Lighting,this.website.purchasedGarage2Lighting);
         _loc6_ = this.office.getGarage2LightingRawSaleCost(this.website.garage2Lighting);
         _loc14_ = this.office.getGarage2NumberBestCost(this.website.garage2Number,this.website.purchasedGarage2Number);
         _loc8_ = this.office.getGarage2NumberCost(this.website.garage2Number,this.website.purchasedGarage2Number);
         _loc7_ = this.office.getGarage2NumberRawSaleCost(this.website.garage2Number);
         _loc11_ = _loc12_ + _loc13_ + _loc14_;
         _loc4_ = _loc9_ + _loc5_ + _loc8_;
         _loc2_ = 0;
         if(this.website.garage2Style != -1 && this.website.garage2Style != this.website.purchasedGarage2Style)
         {
            _loc2_ += _loc10_ != -1 ? _loc10_ : _loc9_;
         }
         if(this.website.garage2Lighting != -1 && this.website.garage2Lighting != this.website.purchasedGarage2Lighting)
         {
            _loc2_ += _loc6_ != -1 ? _loc6_ : _loc5_;
         }
         if(this.website.garage2Number != -1 && this.website.garage2Number != this.website.purchasedGarage2Number)
         {
            _loc2_ += _loc7_ != -1 ? _loc7_ : _loc8_;
         }
         if(_loc2_ == _loc4_)
         {
            _loc2_ = -1;
         }
         _loc3_ += this.updateCostStep(1,_loc11_,_loc4_,_loc2_,"+");
      }
      else
      {
         _loc3_ += this.updateCostStep(1,0,0,0,"+");
      }
      if(this.website.garage3Equipped)
      {
         _loc12_ = this.office.getGarage3StyleBestCost(this.website.garage3Style,this.website.purchasedGarage3Style);
         _loc9_ = this.office.getGarage3StyleCost(this.website.garage3Style,this.website.purchasedGarage3Style);
         _loc10_ = this.office.getGarage3StyleRawSaleCost(this.website.garage3Style);
         _loc13_ = this.office.getGarage3LightingBestCost(this.website.garage3Lighting,this.website.purchasedGarage3Lighting);
         _loc5_ = this.office.getGarage3LightingCost(this.website.garage3Lighting,this.website.purchasedGarage3Lighting);
         _loc6_ = this.office.getGarage3LightingRawSaleCost(this.website.garage3Lighting);
         _loc14_ = this.office.getGarage3NumberBestCost(this.website.garage3Number,this.website.purchasedGarage3Number);
         _loc8_ = this.office.getGarage3NumberCost(this.website.garage3Number,this.website.purchasedGarage3Number);
         _loc7_ = this.office.getGarage3NumberRawSaleCost(this.website.garage3Number);
         _loc11_ = _loc12_ + _loc13_ + _loc14_;
         _loc4_ = _loc9_ + _loc5_ + _loc8_;
         _loc2_ = 0;
         if(this.website.garage3Style != -1 && this.website.garage3Style != this.website.purchasedGarage3Style)
         {
            _loc2_ += _loc10_ != -1 ? _loc10_ : _loc9_;
         }
         if(this.website.garage3Lighting != -1 && this.website.garage3Lighting != this.website.purchasedGarage3Lighting)
         {
            _loc2_ += _loc6_ != -1 ? _loc6_ : _loc5_;
         }
         if(this.website.garage3Number != -1 && this.website.garage3Number != this.website.purchasedGarage3Number)
         {
            _loc2_ += _loc7_ != -1 ? _loc7_ : _loc8_;
         }
         if(_loc2_ == _loc4_)
         {
            _loc2_ = -1;
         }
         _loc3_ += this.updateCostStep(2,_loc11_,_loc4_,_loc2_,"+");
      }
      else
      {
         _loc3_ += this.updateCostStep(2,0,0,0,"+");
      }
      if(this.website.modShopEquipped == 1)
      {
         _loc11_ = this.office.getModShopBestCost(this.website.modShop,this.website.purchasedModShop);
         _loc4_ = this.office.getModShopCost(this.website.modShop,this.website.purchasedModShop);
         _loc2_ = this.office.getModShopRawSaleCost(this.website.modShop);
         _loc3_ += this.updateCostStep(3,_loc11_,_loc4_,_loc2_,"+");
      }
      else
      {
         _loc3_ += this.updateCostStep(3,0,0,0,"+");
      }
      var _loc17_ = !this.office.garageIsOwned ? "DYN8_EXEC_BUY" : "DYN8_EXEC_RENOVATE";
      var _loc16_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc17_);
      if(_loc3_ > 0)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc16_ + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc3_),true);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc16_,true);
      }
      var _loc15_ = 0;
      if(this.website.purchasedGarage1Equipped || this.website.garage1Equipped)
      {
         _loc15_ += 20;
      }
      if(this.website.purchasedGarage2Equipped || this.website.garage2Equipped)
      {
         _loc15_ += 20;
      }
      if(this.website.purchasedGarage3Equipped || this.website.garage3Equipped)
      {
         _loc15_ += 20;
      }
      this.view.garageCounter.text = _loc15_.toString();
   }
   function clearCostStep(step)
   {
      this.view["cost" + step].text = "";
      this.view["saleCost" + step].text = "";
      this.view["originalCost" + step].text = "";
      this.view["strikethrough" + step]._visible = false;
   }
   function updateCostStep(step, actualPrice, normalPrice, salePrice, prefix, saleSumCost)
   {
      if(salePrice >= 0)
      {
         this.view["cost" + step].text = "";
         if(saleSumCost != undefined)
         {
            if(normalPrice == 0)
            {
               this.view["saleCost" + step].text = "";
            }
            else if(saleSumCost == 0)
            {
               com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view["saleCost" + step],"DYN8_EXEC_FREE",false);
            }
            else
            {
               this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(salePrice);
            }
         }
         else if(normalPrice == 0)
         {
            this.view["saleCost" + step].text = "";
         }
         else if(salePrice == 0)
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view["saleCost" + step],"DYN8_EXEC_FREE",false);
         }
         else
         {
            this.view["saleCost" + step].text = "$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(salePrice);
         }
         this.view["originalCost" + step].autoSize = "left";
         if(normalPrice == 0)
         {
            this.view["originalCost" + step].text = "";
            this.view["strikethrough" + step]._visible = false;
         }
         else
         {
            this.view["originalCost" + step].text = prefix + " $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(normalPrice);
            this.view["strikethrough" + step]._width = this.view["originalCost" + step]._width;
            this.view["strikethrough" + step]._visible = true;
         }
      }
      else
      {
         this.view["cost" + step].text = normalPrice <= 0 ? "" : prefix + " $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(normalPrice);
         this.view["saleCost" + step].text = "";
         this.view["originalCost" + step].text = "";
         this.view["strikethrough" + step]._visible = false;
      }
      var _loc3_;
      if(this.displayConfig.isAsian)
      {
         _loc3_ = this.view["saleCost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["saleCost" + step].setNewTextFormat(_loc3_);
         _loc3_ = this.view["cost" + step].getNewTextFormat();
         _loc3_.size = 14;
         this.view["cost" + step].setNewTextFormat(_loc3_);
      }
      return actualPrice;
   }
   function showImage(suffix)
   {
      var _loc2_;
      var _loc3_;
      if(this.office != null)
      {
         _loc2_ = this.office.txd + suffix;
         _loc3_ = this.office.txd;
      }
      else
      {
         _loc2_ = this.agency.txd + suffix;
         _loc3_ = this.agency.txd;
      }
      if(this.currImageId != _loc2_)
      {
         this.currImageId = _loc2_;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image);
         this.view.image._alpha = 0;
         this.website.imageManager.addImage(_loc3_,_loc2_,this.view.image.txt);
      }
   }
   function onDisplayImage()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.image,0.25,{_alpha:100});
   }
   function showAgencyOverview(agency, showImmediately)
   {
      this.office = null;
      this.agency = agency;
      this.view.starterPack._visible = false;
      this.truncate(this.view.officeName,agency.name,this.view.officeName._width - 5);
      var _loc8_ = !agency.isOwned ? "DYN8_EXEC_BUY_FROM" : "DYN8_EXEC_RENOVATE";
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,_loc8_,false);
      var _loc5_;
      if(!agency.isOwned)
      {
         _loc5_ = agency.getBaseBestCost();
         if(_loc5_ == 0)
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,"DYN8_EXEC_FREE");
         }
         else
         {
            com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.nextButton.btnTxt,this.view.nextButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc5_),true);
         }
      }
      var _loc7_ = 0;
      var _loc3_;
      if(agency.isOwned)
      {
         _loc3_ = "";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_ART") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_ART_" + this.website.purchasedAgencyArt) + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_WP") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_WP_" + this.website.purchasedAgencyWallpaper) + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_HI") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_HI_" + this.website.purchasedAgencyHighlight) + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_ARMORY") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedAgencyArmory ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_QUARTERS") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedAgencyQuarters ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font><br>";
         _loc3_ += "<font color=\'#000000\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,"DYN8_EXEC_AG_WORKSHOP") + ":</font> <font color=\'#333333\'>" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.description,!this.website.purchasedAgencyVehicle ? "DYN8_EXEC_NO" : "DYN8_EXEC_YES") + "</font>";
         this.view.description.htmlText = _loc3_;
         _loc7_ = 8;
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,agency.description,true);
      }
      var _loc6_ = this.view.description.getTextFormat();
      _loc6_.leading = _loc7_;
      this.view.description.setTextFormat(_loc6_);
      var _loc4_ = this.view.description._y + this.view.description.textHeight + 10;
      if(agency.getBaseCost() != agency.getBaseBestCost() && !agency.isOwned)
      {
         this.view.originalCost.autoSize = "left";
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.originalCost,"$" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(agency.getBaseCost()),true);
         this.view.strikethrough._visible = true;
         this.view.originalCost._y = _loc4_;
         this.view.strikethrough._width = this.view.originalCost._width;
         this.view.strikethrough._y = _loc4_ + 12;
         _loc4_ += 25;
      }
      else
      {
         this.view.originalCost.text = "";
         this.view.strikethrough._visible = false;
         _loc4_ += 15;
      }
      this.view.nextButton._y = _loc4_;
      this.view.nextButton.disabled = false;
      this.view.nextButton._visible = true;
      this.view.bg._height = this.view.nextButton._y + this.view.nextButton._height + 20;
      this.bottom = this.top + this.view.bg._height;
      this.showImage("");
      this.view.marker.gotoAndStop(!agency.isOwned ? "unownedInactive" : "ownedInactive");
      if(showImmediately)
      {
         this.view._alpha = 100;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      }
      else if(!this.view._visible)
      {
         this.view._alpha = 0;
         this.view._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,0.25,{_alpha:100});
      }
   }
   function initAgencyProgress(numCompleteSteps)
   {
      this.view.gotoAndStop("agencyProgress");
      this.agency = this.website.getSelectedAgency();
      this.office = null;
      this.showImage("");
      this.showPurchaseButton();
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,"DYN8_EXEC_BUY",false);
      if(!this.agency.isOwned)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,this.view.purchaseButton.btnTxt.text + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(this.agency.getBaseBestCost()),true);
      }
      this.view.purchaseButton.onColour = 16777215;
      this.view.purchaseButton.offColour = 16777215;
      this.website.dataTextScope.push(this.view.purchaseButton.btnTxt);
      this.truncate(this.view.officeName,this.agency.name,this.view.officeName._width - 5);
      this.website.dataTextScope.push(this.view.AGENCY_D_ART.btnTxt);
      this.website.dataTextScope.push(this.view.AGENCY_D_WALLPAPER.btnTxt);
      this.website.dataTextScope.push(this.view.AGENCY_D_HIGHLIGHT.btnTxt);
      this.website.dataTextScope.push(this.view.AGENCY_D_ARMORY.btnTxt);
      this.website.dataTextScope.push(this.view.AGENCY_D_PERSONAL_D_QUARTERS.btnTxt);
      this.website.dataTextScope.push(this.view.AGENCY_D_VEHICLE_D_WORKSHOP.btnTxt);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_ART.btnTxt,"DYN8_EXEC_AG_ART",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_WALLPAPER.btnTxt,"DYN8_EXEC_AG_WP",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_HIGHLIGHT.btnTxt,"DYN8_EXEC_AG_HI",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_ARMORY.btnTxt,"DYN8_EXEC_AG_ARMORY",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_PERSONAL_D_QUARTERS.btnTxt,"DYN8_EXEC_AG_QUARTERS",false);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.AGENCY_D_VEHICLE_D_WORKSHOP.btnTxt,"DYN8_EXEC_AG_WORKSHOP",false);
      this.setProgressDots(numCompleteSteps);
      if(this.agency.isOwned && this.website.purchasedAgencyArmory == 1)
      {
         this.view.AGENCY_D_ARMORY.disabled = true;
         this.view.AGENCY_D_ARMORY.btnTxt._alpha = 30;
         this.view.stepDot3.tick._visible = true;
      }
      else
      {
         this.view.AGENCY_D_ARMORY.disabled = false;
         this.view.AGENCY_D_ARMORY.btnTxt._alpha = 100;
         this.view.stepDot3.tick._visible = false;
      }
      if(this.agency.isOwned && this.website.purchasedAgencyQuarters == 1)
      {
         this.view.AGENCY_D_PERSONAL_D_QUARTERS.disabled = true;
         this.view.AGENCY_D_PERSONAL_D_QUARTERS.btnTxt._alpha = 30;
         this.view.stepDot4.tick._visible = true;
      }
      else
      {
         this.view.AGENCY_D_PERSONAL_D_QUARTERS.disabled = false;
         this.view.AGENCY_D_PERSONAL_D_QUARTERS.btnTxt._alpha = 100;
         this.view.stepDot4.tick._visible = false;
      }
      if(this.agency.isOwned && this.website.purchasedAgencyVehicle == 1)
      {
         this.view.AGENCY_D_VEHICLE_D_WORKSHOP.disabled = true;
         this.view.AGENCY_D_VEHICLE_D_WORKSHOP.btnTxt._alpha = 30;
         this.view.stepDot5.tick._visible = true;
      }
      else
      {
         this.view.AGENCY_D_VEHICLE_D_WORKSHOP.disabled = false;
         this.view.AGENCY_D_VEHICLE_D_WORKSHOP.btnTxt._alpha = 100;
         this.view.stepDot5.tick._visible = false;
      }
      this.updateAgencyCosts();
      this.view.bg._height = this.view.purchaseButton._y + this.view.purchaseButton._height + 20;
   }
   function updateAgencyCosts()
   {
      var _loc5_ = !this.agency.isOwned ? this.agency.getBaseBestCost() : 0;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      _loc2_ = this.agency.getArtBestCost(this.website.agencyArt,this.website.purchasedAgencyArt);
      _loc4_ = this.agency.getArtCost(this.website.agencyArt,this.website.purchasedAgencyArt);
      _loc3_ = this.agency.getArtSaleCost(this.website.agencyArt,this.website.purchasedAgencyArt);
      _loc5_ += this.updateCostStep(0,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.agency.getWallpaperBestCost(this.website.agencyWallpaper,this.website.purchasedAgencyWallpaper);
      _loc4_ = this.agency.getWallpaperCost(this.website.agencyWallpaper,this.website.purchasedAgencyWallpaper);
      _loc3_ = this.agency.getWallpaperSaleCost(this.website.agencyWallpaper,this.website.purchasedAgencyWallpaper);
      _loc5_ += this.updateCostStep(1,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.agency.getHighlightBestCost(this.website.agencyHighlight,this.website.purchasedAgencyHighlight);
      _loc4_ = this.agency.getHighlightCost(this.website.agencyHighlight,this.website.purchasedAgencyHighlight);
      _loc3_ = this.agency.getHighlightSaleCost(this.website.agencyHighlight,this.website.purchasedAgencyHighlight);
      _loc5_ += this.updateCostStep(2,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.agency.getArmoryBestCost(this.website.agencyArmory,this.website.purchasedAgencyArmory);
      _loc4_ = this.agency.getArmoryCost(this.website.agencyArmory,this.website.purchasedAgencyArmory);
      _loc3_ = this.agency.getArmorySaleCost(this.website.agencyArmory,this.website.purchasedAgencyArmory);
      _loc5_ += this.updateCostStep(3,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.agency.getQuartersBestCost(this.website.agencyQuarters,this.website.purchasedAgencyQuarters);
      _loc4_ = this.agency.getQuartersCost(this.website.agencyQuarters,this.website.purchasedAgencyQuarters);
      _loc3_ = this.agency.getQuartersSaleCost(this.website.agencyQuarters,this.website.purchasedAgencyQuarters);
      _loc5_ += this.updateCostStep(4,_loc2_,_loc4_,_loc3_,"+");
      _loc2_ = this.agency.getVehicleBestCost(this.website.agencyVehicle,this.website.purchasedAgencyVehicle);
      _loc4_ = this.agency.getVehicleCost(this.website.agencyVehicle,this.website.purchasedAgencyVehicle);
      _loc3_ = this.agency.getVehicleSaleCost(this.website.agencyVehicle,this.website.purchasedAgencyVehicle);
      _loc5_ += this.updateCostStep(5,_loc2_,_loc4_,_loc3_,"+");
      var _loc7_ = !this.agency.isOwned ? "DYN8_EXEC_BUY" : "DYN8_EXEC_RENOVATE";
      var _loc6_ = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setLocalisedText(this.view.purchaseButton.btnTxt,_loc7_);
      if(_loc5_ > 0)
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_ + ": $" + com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.formatNumber(_loc5_),true);
      }
      else
      {
         com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.purchaseButton.btnTxt,_loc6_,true);
      }
   }
}
