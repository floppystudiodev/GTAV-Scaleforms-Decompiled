class com.rockstargames.gtav.levelDesign.arcadeManagement.screens.DetailsScreen extends com.rockstargames.gtav.levelDesign.arcadeManagement.screens.Screen
{
   var app;
   var view;
   var _buttons;
   var persistentContent;
   var purchaseButton;
   static var TXD = "ARCADE_MGMT";
   static var NAV_BUTTON_LEFT = 671;
   function DetailsScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"detailsScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initNavPanel();
      this.initImages();
      this.initText();
      this.initButton();
      this.app.setArcadeImageVisibility(false);
   }
   function initNavPanel()
   {
      var _loc2_ = this.view.cabinetsButton;
      var _loc3_ = this.view.upgradesButton;
      _loc2_.label.tf.autoSize = "left";
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(_loc2_.label.tf,"AMN_CABINETS",1,true,false);
      _loc3_.label.tf.autoSize = "left";
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(_loc3_.label.tf,"AMN_UPGRADES",1,true,false);
      var _loc7_ = Math.max(_loc2_.label._width,_loc3_.label._width);
      var _loc4_ = 2 * _loc2_.label._x + _loc7_;
      var _loc5_ = _loc4_ - 2 * _loc2_.bgOn.centre._x;
      var _loc6_ = _loc4_ - _loc2_.bgOn.right._width;
      _loc2_.label._x = 0.5 * (_loc4_ - _loc2_.label._width);
      _loc2_.bgOn.centre._width = _loc5_;
      _loc2_.bgOff.centre._width = _loc5_;
      _loc2_.bgOn.right._x = _loc6_;
      _loc2_.bgOff.right._x = _loc6_;
      _loc3_.label._x = 0.5 * (_loc4_ - _loc3_.label._width);
      _loc3_.bgOn.centre._width = _loc5_;
      _loc3_.bgOff.centre._width = _loc5_;
      _loc3_.bgOn.right._x = _loc6_;
      _loc3_.bgOff.right._x = _loc6_;
      _loc3_._x = _loc2_._x + _loc4_ + 10;
      this._buttons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.CABINETS_BUTTON,_loc2_));
      this._buttons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.UPGRADES_BUTTON,_loc3_));
      _loc2_.bgOff._visible = false;
      this.updateNavButtons(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.CABINETS_BUTTON);
   }
   function initImages()
   {
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeManagement.screens.DetailsScreen.TXD,this.app.selectedCabinet.texture + "_SIDE",this.view.cabinetImage);
      if(this.app.selectedCabinet.id == 11 || this.app.selectedCabinet.id == 12 || this.app.selectedCabinet.id == 13 || this.app.selectedCabinet.id == 14)
      {
         this.view.screenImage._visible = false;
      }
      else
      {
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeManagement.screens.DetailsScreen.TXD,this.app.selectedCabinet.texture + "_SCREEN",this.view.screenImage);
      }
      this.persistentContent.setBackgroundImage(this.app.selectedCabinet.texture);
   }
   function initText()
   {
      this.view.title.textAutoSize = "shrink";
      this.view.title.text = this.app.selectedCabinet.name.toUpperCase();
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(this.view.title);
      }
      this.view.description.text = this.app.selectedCabinet.description;
   }
   function initButton()
   {
      if(this.app.selectedCabinet.owned)
      {
         this.view.purchaseButton._visible = false;
      }
      else
      {
         var _loc2_ = this.app.selectedCabinet.salePrice >= 0 && this.app.selectedCabinet.salePrice < this.app.selectedCabinet.price;
         this.updateCentreAlignedCost(this.view.purchaseButton.label,_loc2_,this.app.selectedCabinet.price,this.app.selectedCabinet.salePrice);
         this.purchaseButton = new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.PURCHASE_BUTTON,this.view.purchaseButton);
         this._buttons.push(this.purchaseButton);
      }
   }
   function updateCentreAlignedCost(panel, isOnSale, originalCost, saleCost)
   {
      panel.cost.textAutoSize = "none";
      if(isOnSale)
      {
         var _loc3_ = "$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(originalCost);
         var _loc4_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(panel.cost,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(saleCost);
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc3_ + "  " + _loc4_,3,true,true);
         if(this.app.displayConfig.isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         if(panel.cost.textWidth > panel.cost._width)
         {
            panel.cost.textAutoSize = "shrink";
            panel.strikethrough._x = 0;
            panel.strikethrough._width = panel.cost.getExactCharBoundaries(_loc3_.length - 1).right + 4;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc3_,3,true,true);
            var _loc6_ = panel.cost.textWidth;
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc3_ + _loc4_,3,true,true);
            if(this.app.displayConfig.isAsian)
            {
               com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
            }
            var _loc5_ = panel.cost.textWidth;
            panel.strikethrough._x = 0.5 * (panel.cost._width - _loc5_) + panel.cost._x;
            panel.strikethrough._width = _loc6_ + 4;
         }
         panel.strikethrough._visible = true;
      }
      else if(originalCost <= 0)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,"CLUB_FREE",3,true,false);
         if(this.app.displayConfig.isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         panel.strikethrough._visible = false;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,"$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(originalCost),3,true,true);
         if(this.app.displayConfig.isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         panel.strikethrough._visible = false;
      }
   }
   function update()
   {
      if(this.app.selectedCabinet.owned)
      {
         if(this.purchaseButton)
         {
            this.view.purchaseButton._visible = false;
            this.purchaseButton.enabled = false;
            this.app.updateButtons();
         }
      }
   }
   function updateNavButtons(targetID)
   {
      var _loc2_ = this.view.upgradesButton;
      if(targetID == com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.UPGRADES_BUTTON)
      {
         _loc2_.bgOn._visible = true;
         _loc2_.label.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
      }
      else
      {
         _loc2_.bgOn._visible = false;
         _loc2_.label.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
      }
   }
}
