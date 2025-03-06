class com.rockstargames.gtav.minigames.spinthewheel.Wheel
{
   var view;
   var segments;
   function Wheel(container, numSegments, x, y, viewLinkage)
   {
      this.view = container.attachMovie(viewLinkage,"wheel",container.getNextHighestDepth());
      this.view._x = x;
      this.view._y = y;
      this.segments = new Array(numSegments);
   }
   function setSegment(index, type, value)
   {
      if(index >= 0 && index < this.segments.length)
      {
         if(this.segments[index])
         {
            this.segments[index].removeMovieClip();
         }
         this.segments[index] = this.addSegment(index,type,value);
      }
   }
   function setLabelText(text, isRedText)
   {
      var _loc2_ = this.view.label;
      var _loc3_ = new flash.filters.GlowFilter(0,100,30,30,1.4,3,false,false);
      if(isRedText)
      {
         _loc2_.textColor = 14692914;
         _loc3_.color = 16731938;
      }
      else
      {
         _loc2_.textColor = 14155263;
         _loc3_.color = 6088959;
      }
      _loc2_.text = text;
      _loc2_.filters = [_loc3_];
   }
   function dispose()
   {
      if(this.view)
      {
         this.view.removeMovieClip();
      }
      this.segments = null;
   }
   function spin(targetSegment, numFullSpins, totalDuration, winPauseDuration)
   {
   }
   function addSegment(index, type, value)
   {
      return null;
   }
}
