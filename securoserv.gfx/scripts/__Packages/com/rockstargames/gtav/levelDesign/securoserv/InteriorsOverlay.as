class com.rockstargames.gtav.levelDesign.securoserv.InteriorsOverlay
{
   var view;
   var purchaseButtonID;
   var cancelButtonID;
   var interior0ButtonID;
   var interior1ButtonID;
   var interior2ButtonID;
   var _controls;
   var prices;
   var salePrices;
   function InteriorsOverlay(view, interior0ButtonID, interior1ButtonID, interior2ButtonID, purchaseButtonID, cancelButtonID, imageManager)
   {
      this.view = view;
      this.purchaseButtonID = purchaseButtonID;
      this.cancelButtonID = cancelButtonID;
      this.interior0ButtonID = interior0ButtonID;
      this.interior1ButtonID = interior1ButtonID;
      this.interior2ButtonID = interior2ButtonID;
      this.init(imageManager);
   }
   function init(imageManager)
   {
      this._controls = [];
      this.prices = [];
      this.salePrices = [];
      this.view.message.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.SECUROSERV.setSpacedTextField(this.view.message,"SECUROSERV_SELECT_INTERIOR");
      var _loc5_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(this.cancelButtonID,this.view.cancelButton,"WHOUSE_CANC",undefined,undefined,false);
      this.view.cancelButton._x = this.view.messageBG._x + 20;
      this._controls.push(_loc5_);
      _loc5_.updateBounds();
      var _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(this.purchaseButtonID,this.view.purchaseButton,"WHOUSE_CONF",undefined,undefined,false);
      this.view.purchaseButton._x = this.view.messageBG._x + this.view.messageBG._width - 20 - this.view.purchaseButton._width;
      this._controls.push(_loc4_);
      _loc4_.updateBounds();
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         this.initInteriorButton(_loc2_,imageManager);
         _loc2_ = _loc2_ + 1;
      }
   }
   function initInteriorButton(index, imageManager)
   {
      var _loc4_ = this["interior" + index + "ButtonID"];
      var _loc2_ = this.view["interior" + index + "Button"];
      var _loc5_ = "SECUROSERV_INT_" + index;
      var _loc6_ = new com.rockstargames.gtav.levelDesign.securoserv.Button(_loc4_,_loc2_,_loc5_,false);
      this._controls.push(_loc6_);
      _loc2_.label.shadowStrength = 3;
      _loc2_.label.shadowColor = 0;
      _loc2_.label.shadowDistance = 2;
      _loc2_.label.shadowBlurX = 0;
      _loc2_.label.shadowBlurY = 0;
      _loc2_.label.shadowAlpha = 1;
      imageManager.addImage("DYN_MPWH_GENERIC","GARAGE_INTERIOR_" + index,_loc2_.image);
   }
   function show(interior0Price, interior0SalePrice, interior1Price, interior1SalePrice, interior2Price, interior2SalePrice, purchasedInterior)
   {
      this.prices[0] = interior0Price;
      this.prices[1] = interior1Price;
      this.prices[2] = interior2Price;
      this.salePrices[0] = interior0SalePrice;
      this.salePrices[1] = interior1SalePrice;
      this.salePrices[2] = interior2SalePrice;
      this.showPrice(this.view.interior0Button,interior0Price,interior0SalePrice,purchasedInterior == 0);
      this.showPrice(this.view.interior1Button,interior1Price,interior1SalePrice,purchasedInterior == 1);
      this.showPrice(this.view.interior2Button,interior2Price,interior2SalePrice,purchasedInterior == 2);
      this.selectButton(purchasedInterior != -1 ? purchasedInterior : 0);
      this.view._visible = true;
   }
   function showPrice(view, price, salePrice, isOwned)
   {
      if(isOwned)
      {
         com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(view.price,"SECUROSERV_INT_OWNED");
         view.originalPrice.text = "";
         view.strikethrough._visible = false;
      }
      else if(salePrice == -1)
      {
         view.price.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(price);
         view.originalPrice.text = "";
         view.strikethrough._visible = false;
      }
      else
      {
         view.price.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(salePrice);
         view.originalPrice.text = "$" + com.rockstargames.gtav.levelDesign.SECUROSERV.formatNumber(price);
         view.originalPrice._x = view.price._x + view.price._width - view.price.textWidth - view.originalPrice.textWidth - 15;
         view.strikethrough._width = view.originalPrice.textWidth + 6;
         view.strikethrough._x = view.originalPrice._x - 2;
         view.strikethrough._visible = true;
      }
   }
   function hide()
   {
      this.view._visible = false;
   }
   function get controls()
   {
      return this._controls;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
   function selectButton(index)
   {
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         this.view["interior" + _loc2_ + "Button"].gotoAndStop(index != _loc2_ ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
}
