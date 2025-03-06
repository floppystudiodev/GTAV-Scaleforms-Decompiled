class com.rockstargames.gtav.levelDesign.arcadeManagement.Button
{
   var id;
   var view;
   var depth;
   var extents;
   var enabled;
   var left;
   var right;
   var top;
   var bottom;
   function Button(id, view, label, isStringLiteral)
   {
      this.id = id;
      this.view = view;
      this.depth = id;
      this.extents = {xMin:-1.7976931348623157e+308,xMax:1.7976931348623157e+308,yMin:-1.7976931348623157e+308,yMax:1.7976931348623157e+308};
      this.setLabel(label,isStringLiteral);
      this.updateBounds();
      this.enabled = true;
   }
   function setLabel(label, isStringLiteral)
   {
      if(this.view.label && label)
      {
         this.view.label.textAutoSize = "shrink";
         if(isStringLiteral === true)
         {
            this.view.label.text = label;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(this.view.label,label);
         }
      }
   }
   function setBoundsExtents(extents)
   {
      this.extents.xMin = extents.xMin;
      this.extents.xMax = extents.xMax;
      this.extents.yMin = extents.yMin;
      this.extents.yMax = extents.yMax;
   }
   function updateBounds()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = Math.max(_loc3_.xMin,this.extents.xMin);
      this.right = Math.min(_loc3_.xMax,this.extents.xMax);
      this.top = Math.max(_loc3_.yMin,this.extents.yMin);
      this.bottom = Math.min(_loc3_.yMax,this.extents.yMax);
   }
}
