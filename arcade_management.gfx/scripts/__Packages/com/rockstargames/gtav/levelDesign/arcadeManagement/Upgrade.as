class com.rockstargames.gtav.levelDesign.arcadeManagement.Upgrade
{
   var _id;
   var _texture;
   var description;
   var isDirty;
   var owned;
   var price;
   var salePrice;
   var textureIsDirty;
   var title;
   static var TXD = "ARCADE_MGMT";
   function Upgrade(_id)
   {
      this._id = _id;
   }
   function get id()
   {
      return this._id;
   }
   function set texture(_texture)
   {
      if(_texture != this._texture)
      {
         this._texture = _texture;
         this.textureIsDirty = true;
      }
   }
   function render(view, imageManager, forceRender, isAsian)
   {
      view.title.text = this.title.toUpperCase();
      view.description.text = this.description;
      if(this.textureIsDirty || forceRender)
      {
         imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeManagement.Upgrade.TXD,this._texture,view.image);
         this.textureIsDirty = false;
      }
      var _loc3_;
      if(this.owned)
      {
         view.purchaseButton._visible = false;
      }
      else
      {
         _loc3_ = this.salePrice >= 0 && this.salePrice < this.price;
         this.updateCentreAlignedCost(view.purchaseButton.label,_loc3_,this.price,this.salePrice,isAsian);
      }
      this.isDirty = false;
   }
   function updateCentreAlignedCost(panel, isOnSale, originalCost, saleCost, isAsian)
   {
      panel.cost.textAutoSize = "none";
      var _loc2_;
      var _loc3_;
      var _loc6_;
      var _loc5_;
      if(isOnSale)
      {
         _loc2_ = "$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(originalCost);
         _loc3_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(panel.cost,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(saleCost);
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc2_ + "  " + _loc3_,3,true,true);
         if(isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         if(panel.cost.textWidth > panel.cost._width)
         {
            panel.cost.textAutoSize = "shrink";
            panel.strikethrough._x = 0;
            panel.strikethrough._width = panel.cost.getExactCharBoundaries(_loc2_.length - 1).right + 4;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc2_,3,true,true);
            _loc6_ = panel.cost.textWidth;
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc2_ + _loc3_,3,true,true);
            if(isAsian)
            {
               com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
            }
            _loc5_ = panel.cost.textWidth;
            panel.strikethrough._x = 0.5 * (panel.cost._width - _loc5_) + panel.cost._x;
            panel.strikethrough._width = _loc6_ + 4;
         }
         panel.strikethrough._visible = true;
      }
      else if(originalCost <= 0)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,"CLUB_FREE",3,true,false);
         if(isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         panel.strikethrough._visible = false;
      }
      else
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,"$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(originalCost),3,true,true);
         if(isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(panel.cost);
         }
         panel.strikethrough._visible = false;
      }
   }
}
