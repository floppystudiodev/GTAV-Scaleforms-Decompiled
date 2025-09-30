class com.rockstargames.gtav.levelDesign.importExportWarehouse.Button
{
   var _cachedText;
   var bottom;
   var depth;
   var id;
   var left;
   var right;
   var top;
   var view;
   function Button(id, view, label, isStringLiteral)
   {
      this.id = id;
      this.view = view;
      this.depth = id;
      if(view.label && label)
      {
         if(isStringLiteral === true)
         {
            this._cachedText = view.label.text = label;
         }
         else
         {
            view.label.textAutoSize = "shrink";
            this._cachedText = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(view.label,label);
         }
      }
      this.updateBounds();
   }
   function updateBounds()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
   }
   function setTextFromCache()
   {
      this.view.label.text = this._cachedText;
   }
   function setLabel(label, isStringLiteral)
   {
      if(this.view.label && label)
      {
         if(isStringLiteral === true)
         {
            this._cachedText = this.view.label.text = label;
         }
         else
         {
            this.view.label.textAutoSize = "shrink";
            this._cachedText = com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this.view.label,label);
         }
      }
   }
   function setId(id)
   {
      this.id = id;
      this.depth = id;
   }
   function setAvailable(available)
   {
      if(this.view.background)
      {
         MovieClip(this.view.background).gotoAndStop(!available ? "off" : "on");
      }
   }
}
