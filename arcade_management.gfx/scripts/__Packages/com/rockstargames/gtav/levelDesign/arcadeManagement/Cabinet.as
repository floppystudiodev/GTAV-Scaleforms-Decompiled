class com.rockstargames.gtav.levelDesign.arcadeManagement.Cabinet
{
   var _id;
   var _texture;
   var textureIsDirty;
   var name;
   var owned;
   var salePrice;
   var price;
   var isDirty;
   static var TXD = "ARCADE_MGMT";
   function Cabinet(_id)
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
   function get texture()
   {
      return this._texture;
   }
   function render(view, imageManager, forceRender, isAsian)
   {
      view.title.verticalAlign = "center";
      view.title.text = this.name.toUpperCase();
      if(this.textureIsDirty || forceRender)
      {
         imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeManagement.Cabinet.TXD,this._texture + "_FRONT",view.image);
         this.textureIsDirty = false;
      }
      if(this.owned)
      {
         view.costButton.label.strikethrough._visible = false;
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(view.costButton.label.cost,"AMN_OWNED",3,true,false);
         if(isAsian)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(view.costButton.label.cost);
         }
      }
      else
      {
         var _loc3_ = this.salePrice >= 0 && this.salePrice < this.price;
         this.updateCentreAlignedCost(view.costButton.label,_loc3_,this.price,this.salePrice,isAsian);
      }
      this.isDirty = false;
   }
   function updateCentreAlignedCost(panel, isOnSale, originalCost, saleCost, isAsian)
   {
      panel.cost.textAutoSize = "none";
      if(isOnSale)
      {
         var _loc2_ = "$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(originalCost);
         var _loc3_ = saleCost <= 0 ? "  " + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(panel.cost,"CLUB_FREE") : "  $" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(saleCost);
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
            var _loc6_ = panel.cost.textWidth;
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(panel.cost,_loc2_ + _loc3_,3,true,true);
            if(isAsian)
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
