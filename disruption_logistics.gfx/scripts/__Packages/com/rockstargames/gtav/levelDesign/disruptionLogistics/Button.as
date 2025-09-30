class com.rockstargames.gtav.levelDesign.disruptionLogistics.Button
{
   var bottom;
   var depth;
   var id;
   var left;
   var right;
   var top;
   var view;
   static var HIDDEN = 0;
   static var DISABLED = 1;
   static var ACTIVE = 2;
   static var DISABLED_ALPHA = 50;
   static var ACTIVE_ALPHA = 100;
   function Button(id, view, label, isStringLiteral)
   {
      this.id = id;
      this.view = view;
      this.depth = id;
      if(view.label && label)
      {
         if(isStringLiteral === true)
         {
            view.label.text = label;
         }
         else
         {
            view.label.autoSize = "left";
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(view.label,label);
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
   function set state(stateEnum)
   {
      this.view._visible = stateEnum != com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.HIDDEN;
      this.view._alpha = stateEnum != com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.DISABLED ? com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.ACTIVE_ALPHA : com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.DISABLED_ALPHA;
   }
   function get isActive()
   {
      return this.view._visible;
   }
}
