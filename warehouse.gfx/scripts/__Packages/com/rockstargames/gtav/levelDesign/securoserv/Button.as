class com.rockstargames.gtav.levelDesign.securoserv.Button
{
   var bottom;
   var currState;
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
         view.label.autoSize = "left";
         if(isStringLiteral === true)
         {
            view.label.text = label;
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,view.label,view.label.html);
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
