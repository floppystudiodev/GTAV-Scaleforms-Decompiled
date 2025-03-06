class com.rockstargames.gtav.levelDesign.covertOps.Button
{
   var id;
   var view;
   var depth;
   var currState;
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
         view.label.autoSize = "left";
         if(isStringLiteral === true)
         {
            view.label.text = label;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(view.label,label);
         }
      }
      this.updateBounds();
   }
   function disable()
   {
      this.view._alpha = 50;
   }
   function enable()
   {
      this.view._alpha = 100;
   }
   function setState(state)
   {
      if(state != this.currState)
      {
         this.view.gotoAndStop(state);
         this.currState = state;
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
