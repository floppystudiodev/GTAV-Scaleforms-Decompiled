class com.rockstargames.gtav.levelDesign.hangarCargo.Button
{
   var id;
   var view;
   var depth;
   var left;
   var right;
   var top;
   var bottom;
   function Button(id, view, label, isStringLiteral)
   {
      this.id = id;
      this.view = view;
      this.depth = id;
      if(view.label && label)
      {
         view.label.textAutoSize = "shrink";
         if(isStringLiteral === true)
         {
            view.label.text = label;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(view.label,label);
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
}
