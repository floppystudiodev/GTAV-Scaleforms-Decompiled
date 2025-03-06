class com.rockstargames.gtav.levelDesign.nightclub.LineGraph
{
   var view;
   var points;
   var isAnimating;
   var fillContainer;
   var lineContainer;
   var baseX;
   var baseY;
   var endX;
   var tweenArgs;
   var updateArgs;
   static var TWEEN_DURATION = 3;
   static var FRAME_DURATION = 0.03333333333333333;
   static var LINE_COLOUR = 4792421;
   static var LINE_THICKNESS = 2;
   static var FILL_COLOUR = 16777215;
   static var FILL_ALPHA = 10;
   function LineGraph(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.points = [];
      this.isAnimating = false;
      this.fillContainer = this.view.createEmptyMovieClip("fillContainer",this.view.getNextHighestDepth());
      this.lineContainer = this.view.createEmptyMovieClip("lineContainer",this.view.getNextHighestDepth());
      this.view.fill._visible = false;
      var _loc3_ = 0;
      while(_loc3_ < 7)
      {
         var _loc2_ = this.view["point" + _loc3_];
         this.points.push(_loc2_);
         _loc2_.track._visible = false;
         _loc2_.marker._y = _loc2_.track._height;
         _loc2_.swapDepths(this.view.getNextHighestDepth());
         _loc3_ = _loc3_ + 1;
      }
      this.baseX = 0;
      this.baseY = this.view._height;
      this.endX = this.view._width;
      this.tweenArgs = {_y:0,onCompleteScope:this,onComplete:this.tweenComplete,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT};
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.title,"CLUB_DAYINCOME");
   }
   function setValues(values, max)
   {
      this.isAnimating = true;
      var _loc2_ = 0;
      var _loc4_ = values.length;
      while(_loc2_ < _loc4_)
      {
         if(_loc2_ == this.points.length)
         {
            break;
         }
         var _loc3_ = this.points[_loc2_];
         this.tweenArgs._y = (1 - values[_loc2_] / max) * _loc3_.track._height;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_.marker,com.rockstargames.gtav.levelDesign.nightclub.LineGraph.TWEEN_DURATION,this.tweenArgs);
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.nightclub.LineGraph.FRAME_DURATION,this.updateArgs);
   }
   function tweenComplete()
   {
      this.isAnimating = false;
   }
   function update()
   {
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = this.points[0].marker._x + this.points[0]._x;
      var _loc6_ = this.points[0].marker._y + this.points[0]._y;
      this.fillContainer.clear();
      this.fillContainer.beginFill(com.rockstargames.gtav.levelDesign.nightclub.LineGraph.FILL_COLOUR,com.rockstargames.gtav.levelDesign.nightclub.LineGraph.FILL_ALPHA);
      this.fillContainer.moveTo(this.baseX,this.baseY);
      this.fillContainer.lineTo(this.baseX,_loc6_);
      var _loc2_ = 0;
      var _loc5_ = this.points.length;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = this.points[_loc2_].marker._x + this.points[_loc2_]._x;
         _loc3_ = this.points[_loc2_].marker._y + this.points[_loc2_]._y;
         this.fillContainer.lineTo(_loc4_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.fillContainer.lineTo(this.endX,_loc3_);
      this.fillContainer.lineTo(this.endX,this.baseY);
      this.fillContainer.lineTo(this.baseX,this.baseY);
      this.fillContainer.endFill();
      this.view.fill.setMask(this.fillContainer);
      this.view.fill._visible = true;
      this.lineContainer.clear();
      this.lineContainer.lineStyle(com.rockstargames.gtav.levelDesign.nightclub.LineGraph.LINE_THICKNESS,com.rockstargames.gtav.levelDesign.nightclub.LineGraph.LINE_COLOUR,100);
      this.lineContainer.moveTo(_loc7_,_loc6_);
      _loc2_ = 1;
      _loc5_ = this.points.length;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = this.points[_loc2_].marker._x + this.points[_loc2_]._x;
         _loc3_ = this.points[_loc2_].marker._y + this.points[_loc2_]._y;
         this.lineContainer.lineTo(_loc4_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      if(this.isAnimating)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,com.rockstargames.gtav.levelDesign.nightclub.LineGraph.FRAME_DURATION,this.updateArgs);
      }
   }
   function dispose()
   {
      var _loc2_ = 0;
      var _loc3_ = this.points.length;
      while(_loc2_ < _loc3_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.points[_loc2_].marker);
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
