class com.rockstargames.gtav.levelDesign.securoserv.StretchButton extends com.rockstargames.gtav.levelDesign.securoserv.Button
{
   var updateBounds;
   var view;
   function StretchButton(id, view, label, padding, minSize, isStringLiteral)
   {
      super(id,view,label,isStringLiteral);
      if(padding == undefined)
      {
         padding = 30;
      }
      if(minSize == undefined)
      {
         minSize = view.bg._width;
      }
      this.width = Math.max(minSize,view.label.textWidth + padding);
   }
   function set width(w)
   {
      this.view.bg._width = w;
      this.view.label._x = 0.5 * (this.view.bg._width - this.view.label._width);
      this.updateBounds();
   }
   function setState(state)
   {
      if(state == "off")
      {
         this.view.bg.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,0.9,0,0,0,0);
      }
      else
      {
         this.view.bg.transform.colorTransform = new flash.geom.ColorTransform();
      }
   }
}
