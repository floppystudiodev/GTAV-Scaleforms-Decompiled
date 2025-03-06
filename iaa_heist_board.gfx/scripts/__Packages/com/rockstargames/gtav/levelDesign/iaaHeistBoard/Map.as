class com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map
{
   var markers;
   var m;
   var mapView;
   var highlightView;
   var highlightBounds;
   var markersView;
   var scaleGoal;
   var xGoal;
   var yGoal;
   var x;
   var y;
   var scale;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   static var MAP_OFFSET_X = 332;
   static var MAP_OFFSET_Y = 449;
   static var MAP_SCALE_MIN = 0.22;
   static var MAP_SCALE_MAX = 2;
   static var MAP_SCALE_RANGE = com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_SCALE_MAX - com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_SCALE_MIN;
   static var MOVEMENT_DAMPING = 0.1;
   static var SCALE_DAMPING = 0.05;
   static var START_X = 350;
   static var START_Y = 2000;
   static var START_ZOOM = 0;
   static var FRAME_DURATION = 0.033;
   function Map()
   {
      this.init();
   }
   function init()
   {
      this.markers = [];
      this.m = new flash.geom.Matrix();
   }
   function setView(view)
   {
      if(this.mapView)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.mapView);
      }
      this.mapView = view.map;
      this.highlightView = view.minimap.highlight;
      this.highlightView._x = 0;
      this.highlightView._y = 0;
      this.highlightBounds = new flash.geom.Rectangle(0,0,view.minimap._width,view.minimap._height);
      this.markersView = view.createEmptyMovieClip("markersView",view.getNextHighestDepth());
      view.cover.swapDepths(view.getNextHighestDepth());
      view.minimap.swapDepths(view.getNextHighestDepth());
      var _loc2_ = 0;
      var _loc3_ = this.markers.length;
      while(_loc2_ < _loc3_)
      {
         this.markers[_loc2_].setView(this.markersView);
         _loc2_ = _loc2_ + 1;
      }
      this.setDisplay(com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_X,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_Y,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_ZOOM,true);
   }
   function reset()
   {
      var _loc2_ = 0;
      var _loc3_ = this.markers.length;
      while(_loc2_ < _loc3_)
      {
         this.markers[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.markers.length = 0;
      this.setDisplay(com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_X,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_Y,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.START_ZOOM,true);
   }
   function setDisplay(px, py, normalisedZoom, cutToPosition)
   {
      this.scaleGoal = normalisedZoom * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_SCALE_RANGE + com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_SCALE_MIN;
      this.xGoal = px * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_ORIGIN_X;
      this.yGoal = (- py) * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_ORIGIN_Y;
      if(cutToPosition)
      {
         this.x = this.xGoal;
         this.y = this.yGoal;
         this.scale = this.scaleGoal;
      }
      this.updateDisplay();
   }
   function updateDisplay()
   {
      if(this.mapView)
      {
         var _loc9_ = com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MOVEMENT_DAMPING * (this.xGoal - this.x);
         var _loc8_ = com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MOVEMENT_DAMPING * (this.yGoal - this.y);
         this.x += _loc9_;
         this.y += _loc8_;
         this.scale += com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.SCALE_DAMPING * (this.scaleGoal - this.scale);
         this.m.identity();
         this.m.translate(- this.x,- this.y);
         this.m.scale(this.scale,this.scale);
         this.m.translate(com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_OFFSET_X,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_OFFSET_Y);
         this.mapView.transform.matrix = this.m;
         var _loc2_ = 0;
         var _loc3_ = this.markers.length;
         while(_loc2_ < _loc3_)
         {
            this.markers[_loc2_].updatePosition(this.mapView._x,this.mapView._y,this.scale);
            _loc2_ = _loc2_ + 1;
         }
         if(this.highlightView)
         {
            var _loc7_ = this.highlightBounds.width * (- this.mapView._x) / this.mapView._width;
            var _loc5_ = this.highlightBounds.height * (- this.mapView._y) / this.mapView._height;
            var _loc4_ = 2 * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_OFFSET_X * this.highlightBounds.width / this.mapView._width;
            var _loc6_ = 2 * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_OFFSET_Y * this.highlightBounds.height / this.mapView._height;
            if(_loc7_ < 0)
            {
               _loc4_ += _loc7_;
               _loc7_ = 0;
            }
            if(_loc5_ < 0)
            {
               _loc6_ += _loc5_;
               _loc5_ = 0;
            }
            if(_loc7_ + _loc4_ > this.highlightBounds.width)
            {
               _loc4_ = this.highlightBounds.width - _loc7_;
            }
            if(_loc5_ + _loc6_ > this.highlightBounds.height)
            {
               _loc6_ = this.highlightBounds.height - _loc5_;
            }
            this.highlightView._x = _loc7_;
            this.highlightView._y = _loc5_;
            this.highlightView.bg._width = _loc4_ - 4;
            this.highlightView.bg._height = _loc6_ - 4;
            this.highlightView.topRight._x = _loc4_;
            this.highlightView.bottomLeft._y = _loc6_;
            this.highlightView.bottomRight._x = _loc4_;
            this.highlightView.bottomRight._y = _loc6_;
         }
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.mapView,com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.FRAME_DURATION,{onCompleteScope:this,onComplete:this.updateDisplay});
   }
   function addMarker(id, x, y, label)
   {
      x = x * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_ORIGIN_X;
      y = (- y) * com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_COORD_SCALE + com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map.MAP_ORIGIN_Y;
      var _loc2_ = this.getMarker(id);
      if(this.markersView)
      {
         _loc2_.setView(this.markersView);
      }
      _loc2_.setPosition(x,y);
      _loc2_.setLabel(("0" + label).substr(-2));
   }
   function removeMarker(id)
   {
      var _loc2_ = 0;
      var _loc4_ = this.markers.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.markers[_loc2_];
         if(_loc3_.getID() == id)
         {
            _loc3_.dispose();
            this.markers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getMarker(id)
   {
      var _loc2_ = 0;
      var _loc3_ = this.markers.length;
      while(_loc2_ < _loc3_)
      {
         if(this.markers[_loc2_].getID() == id)
         {
            return this.markers[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.MapMarker(id);
      this.markers.push(_loc5_);
      return _loc5_;
   }
}
