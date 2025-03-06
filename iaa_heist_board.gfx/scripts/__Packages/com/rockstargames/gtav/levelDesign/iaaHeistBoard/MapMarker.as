class com.rockstargames.gtav.levelDesign.iaaHeistBoard.MapMarker
{
   var id;
   var view;
   var x;
   var y;
   var label;
   function MapMarker(id)
   {
      this.id = id;
   }
   function setView(container)
   {
      if(this.view == undefined)
      {
         this.view = container.attachMovie("markerCross","marker" + this.id,container.getNextHighestDepth());
      }
   }
   function setPosition(x, y)
   {
      this.x = x;
      this.y = y;
   }
   function updatePosition(xOrigin, yOrigin, scale)
   {
      if(this.view)
      {
         this.view._x = xOrigin + this.x * scale;
         this.view._y = yOrigin + this.y * scale;
      }
   }
   function setLabel(label)
   {
      this.label = label;
      if(this.view && this.view.label)
      {
         this.view.label.text = label;
      }
   }
   function getID()
   {
      return this.id;
   }
   function dispose()
   {
      if(this.view)
      {
         this.view.removeMovieClip();
         this.view = null;
      }
   }
}
