class com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform
{
   var leftEdge;
   var leftOverlay;
   var rightEdge;
   var rightOverlay;
   var view;
   static var GREEN = new flash.geom.ColorTransform(0,0,0,1,100,225,113,0);
   static var WHITE = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   static var PLAYBACK_SPEED = -2.5;
   static var MIN_X_SCALE = 100;
   static var MAX_X_SCALE = 150;
   static var MIN_Y_SCALE = 60;
   static var MAX_Y_SCALE = 130;
   static var MIN_EDIT_DELAY = 0.1;
   static var MAX_EDIT_DELAY = 6;
   static var MIN_SCRUB_DURATION = 0.7;
   static var MAX_SCRUB_DURATION = 3.5;
   static var MIN_ZOOM_DURATION = 0.3;
   static var MAX_ZOOM_DURATION = 0.75;
   static var MIN_OVERLAY_DURATION = 0.5;
   static var MAX_OVERLAY_DURATION = 1;
   static var MIN_OVERLAY_WIDTH = 100;
   static var MAX_OVERLAY_WIDTH = 400;
   static var RIGHT_OVERLAY_OFFSET = 14;
   function Waveform(view, leftOverlay, rightOverlay)
   {
      this.view = view;
      this.leftOverlay = leftOverlay;
      this.rightOverlay = rightOverlay;
      this.leftEdge = view._x;
      this.rightEdge = view._x + 0.5 * view._width;
      view.transform.colorTransform = com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.GREEN;
      leftOverlay._visible = false;
      rightOverlay._visible = false;
   }
   function updatePlayback()
   {
      this.view._x += com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.PLAYBACK_SPEED;
      this.view._xscale += 0.1 * (100 - this.view._xscale);
      this.view._yscale += 0.1 * (100 - this.view._yscale);
      this.clampView();
   }
   function startEdit()
   {
      var _loc2_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_OVERLAY_WIDTH - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_WIDTH) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_WIDTH;
      this.leftOverlay._width = _loc2_;
      this.rightOverlay._width = _loc2_ + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.RIGHT_OVERLAY_OFFSET;
      this.leftOverlay._visible = true;
      this.rightOverlay._visible = true;
      this.nextEditStep();
   }
   function updateEdit()
   {
      this.clampView();
   }
   function stopEdit()
   {
      this.leftOverlay._visible = false;
      this.rightOverlay._visible = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.leftOverlay);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.rightOverlay);
   }
   function nextEditStep()
   {
      var _loc16_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_EDIT_DELAY - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_EDIT_DELAY) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_EDIT_DELAY;
      var _loc3_ = Math.floor(Math.random() * 3);
      var _loc4_;
      var _loc8_;
      var _loc9_;
      var _loc2_;
      var _loc7_;
      var _loc6_;
      var _loc5_;
      if(_loc3_ == 0)
      {
         _loc4_ = this.rightEdge - this.view._width;
         _loc8_ = this.leftEdge;
         _loc9_ = Math.random() * (_loc8_ - _loc4_) + _loc4_;
         _loc2_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_SCRUB_DURATION - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_SCRUB_DURATION) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_SCRUB_DURATION;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,_loc2_,{delay:_loc16_,_x:_loc9_,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,onCompleteScope:this,onComplete:this.nextEditStep});
      }
      else if(_loc3_ == 1)
      {
         _loc7_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_X_SCALE - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_X_SCALE) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_X_SCALE;
         _loc6_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_Y_SCALE - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_Y_SCALE) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_Y_SCALE;
         _loc2_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_ZOOM_DURATION - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_ZOOM_DURATION) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_ZOOM_DURATION;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,_loc2_,{delay:_loc16_,_xscale:_loc7_,_yscale:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onCompleteScope:this,onComplete:this.nextEditStep});
      }
      else
      {
         _loc5_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_OVERLAY_WIDTH - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_WIDTH) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_WIDTH;
         _loc2_ = Math.random() * (com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MAX_OVERLAY_DURATION - com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_DURATION) + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.MIN_OVERLAY_DURATION;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.leftOverlay,_loc2_,{delay:_loc16_,_width:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onCompleteScope:this,onComplete:this.nextEditStep});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightOverlay,_loc2_,{delay:_loc16_,_width:_loc5_ + com.rockstargames.gtav.levelDesign.musicStudioMonitor.Waveform.RIGHT_OVERLAY_OFFSET,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
      }
   }
   function clampView()
   {
      if(this.view._x > this.leftEdge)
      {
         this.view._x -= 0.5 * this.view._width;
      }
      else if(this.view._x + this.view._width < this.rightEdge)
      {
         this.view._x += 0.5 * this.view._width;
      }
   }
}
