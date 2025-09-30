class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Button
{
   var bottom;
   var depth;
   var enabled;
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
            com.rockstargames.gtav.levelDesign.HACKER_TRUCK_DESKTOP.setLocalisedText(this.view.label,label);
         }
      }
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
