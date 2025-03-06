class com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen
{
   var app;
   var cursor;
   var overlay;
   var controls;
   var view;
   var specialItemTXD;
   static var SELL_BUTTON_0 = 1;
   static var SELL_BUTTON_1 = 2;
   static var SELL_BUTTON_2 = 3;
   static var SELL_BUTTON_3 = 4;
   static var OVERLAY_ACCEPT = 5;
   static var OVERLAY_CANCEL = 6;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.STAGE_HEIGHT;
   static var CRATE_TXD = "AH_SELL_CRT_1";
   static var EMPTY_TXD = "AH_SELL_CRT_0";
   function WarehouseScreen(app, viewContainer, cursor)
   {
      this.app = app;
      this.cursor = cursor;
      this.init(viewContainer);
   }
   function showOverlay(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
      this.cursor.setTargetRects(this.overlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.cursor.setTargetRects(this.controls);
   }
   function init(viewContainer)
   {
      this.view = viewContainer.attachMovie("warehouseScreen","warehouseScreen",viewContainer.getNextHighestDepth());
      this.view.sellerPanel._visible = false;
      this.view.stockPanel._visible = false;
      this.view.buyerPanel._visible = false;
      this.initOverlay();
      this.controls = [];
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function activate(warehouse)
   {
      this.initHeader();
      this.initSellerPanel(warehouse);
      this.initStockPanel(warehouse);
      this.initBuyerPanel(warehouse);
      this.specialItemTXD = warehouse.txd;
      this.view.sellerPanel._visible = true;
      this.view.stockPanel._visible = true;
      this.view.buyerPanel._visible = true;
      this.cursor.setTargetRects(this.controls);
   }
   function initHeader()
   {
      var _loc2_ = this.view.header;
      _loc2_.brand.location.text = "Los Santos";
      _loc2_.gamerTag.htmlText = com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(_loc2_.gamerTag,"WAREHOUSE_GREETING") + " <font face=\'$Font2_cond\' size=\'19\'>" + this.app.gamerTag + "</font>";
   }
   function initSellerPanel(warehouse)
   {
      var _loc2_ = this.view.sellerPanel;
      var _loc3_ = 0.5;
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(_loc2_.heading,"WAREHOUSE_SELLER_HEADING");
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label1,"WAREHOUSE_USERNAME",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label2,"WAREHOUSE_RATING",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label3,"WAREHOUSE_ORGANIZATION",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label4,"WAREHOUSE_SALES_MADE",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label5,"WAREHOUSE_EARNINGS",_loc3_,false);
      var _loc4_ = _loc2_.item1.getTextFormat();
      _loc4_.font = "$Font2_cond";
      _loc4_.size = 19;
      _loc2_.item1.setNewTextFormat(_loc4_);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item1,this.app.gamerTag,_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item2,this.app.sellerRating + "%",_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item3,this.app.organizationName,_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item4,this.app.numSales.toString(),_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item5,"$" + com.rockstargames.gtav.levelDesign.WAREHOUSE.formatNumber(this.app.totalEarnings),_loc3_,true);
      this.setupTextFieldPair(_loc2_.label1,_loc2_.item1);
      this.setupTextFieldPair(_loc2_.label2,_loc2_.item2);
      this.setupTextFieldPair(_loc2_.label3,_loc2_.item3);
      this.setupTextFieldPair(_loc2_.label4,_loc2_.item4);
      this.setupTextFieldPair(_loc2_.label5,_loc2_.item5);
   }
   function initStockPanel(warehouse)
   {
      var _loc2_ = this.view.stockPanel;
      var _loc3_ = 0.5;
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(_loc2_.heading,"WAREHOUSE_STOCK_HEADING");
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label1,"WAREHOUSE_OUTLET",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label2,"WAREHOUSE_LOCATION",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label3,"WAREHOUSE_SIZE",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label4,"WAREHOUSE_STOCK",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.label5,"WAREHOUSE_SPECIAL_ITEMS",_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item1,warehouse.name,_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item2,warehouse.location,_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item3,"SECUROSERV_SIZE_" + warehouse.size,_loc3_,false);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item4,warehouse.amountStored + "/" + warehouse.capacity,_loc3_,true);
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc2_.item5,warehouse.specialItems.toString(),_loc3_,true);
      this.setupTextFieldPair(_loc2_.label1,_loc2_.item1);
      this.setupTextFieldPair(_loc2_.label2,_loc2_.item2);
      this.setupTextFieldPair(_loc2_.label3,_loc2_.item3);
      this.setupTextFieldPair(_loc2_.label4,_loc2_.item4);
      this.setupTextFieldPair(_loc2_.label5,_loc2_.item5);
   }
   function initBuyerPanel(warehouse)
   {
      var _loc4_ = this.view.buyerPanel;
      com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(_loc4_.heading,"WAREHOUSE_BUYER_HEADING");
      var _loc6_ = -1;
      var _loc9_ = true;
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = _loc4_["sellButton_" + _loc2_];
         var _loc7_ = new com.rockstargames.gtav.levelDesign.securoserv.Button(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen["SELL_BUTTON_" + _loc2_],_loc3_);
         var _loc5_ = com.rockstargames.gtav.levelDesign.WAREHOUSE.setLocalisedText(_loc3_.label,"WAREHOUSE_SELL") + " $" + com.rockstargames.gtav.levelDesign.WAREHOUSE.formatNumber(this.app.offerPrices[_loc2_]);
         _loc3_.label.verticalAlign = "center";
         if(warehouse.sellCooldown > getTimer())
         {
            _loc3_._alpha = 50;
            this.updateCooldown(_loc3_,warehouse.sellCooldown,_loc5_);
         }
         else
         {
            com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc3_.label,_loc5_,1,true);
         }
         if(isNaN(this.app.offerPrices[_loc2_]) || this.app.offerPrices[_loc2_] < 0)
         {
            _loc3_._visible = false;
            _loc4_["business" + _loc2_].text = "";
            _loc4_["amount" + _loc2_].text = "";
            if(_loc6_ == -1)
            {
               _loc6_ = _loc2_;
            }
         }
         else
         {
            _loc4_["business" + _loc2_].text = this.app.buyerOrganizations[_loc2_];
            _loc4_["amount" + _loc2_].text = this.app.buyerAmounts[_loc2_];
            this.controls.push(_loc7_);
            _loc9_ = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ != -1)
      {
         _loc4_.sellButton_3._y = _loc4_["sellButton_" + _loc6_]._y;
         _loc4_.business3._y = _loc4_["business" + _loc6_]._y;
         _loc4_.amount3._y = _loc4_["amount" + _loc6_]._y;
         this.controls[this.controls.length - 1].updateBounds();
      }
      if(_loc9_)
      {
         _loc4_.message.verticalAlign = "center";
         com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(_loc4_.message,"WAREHOUSE_NO_STOCK",1);
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.EMPTY_TXD,com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.EMPTY_TXD,_loc4_.image);
      }
      else
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.CRATE_TXD,com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.CRATE_TXD,_loc4_.image);
      }
   }
   function updateCooldown(button, cooldown, finalLabel)
   {
      var _loc2_ = Math.ceil(0.001 * (cooldown - getTimer()));
      if(_loc2_ <= 0)
      {
         button._alpha = 100;
         com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(button.label,finalLabel,1,true);
      }
      else
      {
         var _loc3_ = _loc2_ % 60;
         var _loc5_ = Math.floor((_loc2_ - _loc3_) / 60) % 60;
         var _loc9_ = Math.floor((_loc2_ - _loc3_ - _loc5_ * 60) / 3600);
         var _loc7_ = ("0" + _loc9_).substr(-2);
         var _loc6_ = ("0" + _loc5_).substr(-2);
         var _loc8_ = ("0" + _loc3_).substr(-2);
         com.rockstargames.gtav.levelDesign.WAREHOUSE.setSpacedTextField(button.label,_loc7_ + ":" + _loc6_ + ":" + _loc8_,1,true);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(button,0.25,{onCompleteScope:this,onComplete:this.updateCooldown,onCompleteArgs:[button,cooldown,finalLabel]});
      }
   }
   function setupTextFieldPair(leftTF, rightTF)
   {
      leftTF.autoSize = "left";
      rightTF.autoSize = "right";
      var _loc6_ = leftTF._x;
      var _loc4_ = rightTF._x + rightTF._width;
      var _loc7_ = leftTF._width;
      var _loc8_ = rightTF._width;
      if(_loc7_ + _loc8_ > _loc4_ - _loc6_)
      {
         var _loc5_ = _loc4_ - _loc6_ - _loc7_;
         var _loc3_ = rightTF.text;
         var _loc1_ = _loc3_.length;
         while(_loc1_ > 0)
         {
            rightTF.text = _loc3_.substring(0,_loc1_) + "...";
            if(rightTF._width <= _loc5_)
            {
               rightTF._x = _loc4_ - rightTF._width;
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.securoserv.WarehouseOverlay(this.view.overlay);
      this.overlay.hide();
   }
   function handleButtonInput(inputID)
   {
   }
   function handleButtonInputRelease(inputID)
   {
   }
   function handleJoystickInput(isLeftStick, x, y)
   {
   }
   function handleMouseInput(x, y)
   {
   }
   function onTargetChange(targetID)
   {
      if(targetID == com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.SELL_BUTTON_3)
      {
         this.app.imageManager.addImage(this.specialItemTXD,this.specialItemTXD,this.view.buyerPanel.image);
      }
      else
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.CRATE_TXD,com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.CRATE_TXD,this.view.buyerPanel.image);
      }
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.buyerPanel.sellButton);
      this.cursor.setChangeListener(null);
      this.controls = null;
   }
}
