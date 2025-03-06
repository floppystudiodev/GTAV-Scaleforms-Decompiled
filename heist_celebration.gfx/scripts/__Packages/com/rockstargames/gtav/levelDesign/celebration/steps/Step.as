class com.rockstargames.gtav.levelDesign.celebration.steps.Step
{
   var sequence;
   var height;
   var _type;
   var initialised;
   var started;
   var finished;
   var id;
   var view;
   static var PRICEDOWN_ASCENDER = 0.16;
   static var PRICEDOWN_BODY = 0.61;
   static var PRICEDOWN_DESCENDER = 0.18;
   static var PRICEDOWN_LEADING = 0.05;
   static var idCount = 0;
   function Step(sequence, height, _type)
   {
      this.sequence = sequence;
      this.height = height;
      this._type = _type;
      this.initialised = false;
      this.started = false;
      this.finished = false;
      this.id = "step" + com.rockstargames.gtav.levelDesign.celebration.steps.Step.idCount++;
   }
   function init(container, y)
   {
      var _loc2_ = container.getNextHighestDepth();
      this.view = container.createEmptyMovieClip("step" + _loc2_,_loc2_);
      this.view._y = y;
      this.initialised = true;
   }
   function start()
   {
      this.started = true;
   }
   function finish()
   {
      if(this.finished)
      {
         return undefined;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view.removeMovieClip();
      this.view = null;
      this.sequence = null;
      this.finished = true;
   }
   function get type()
   {
      return this._type;
   }
}
