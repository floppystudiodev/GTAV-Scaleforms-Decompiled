class com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam
{
   var view;
   var scanLineses;
   var imageX;
   var imageY;
   var imageWidth;
   var imageHeight;
   var matrix;
   var noise;
   var noiseStep;
   var sequenceStep;
   var zoomEnd;
   var zoomStart;
   var sequenceCurr;
   var sequenceDuration;
   static var ZOOM_SEQUENCE = [1,1.44,1.44,1,1,0.86,0.86,1];
   static var DURATION_SEQUENCE_MIN = [90,210,90,210,90,210,90,210];
   static var DURATION_SEQUENCE_MAX = [240,420,240,420,240,420,240,420];
   function BottomSpyCam(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.scanLineses = [];
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view.createEmptyMovieClip("scanLineView",this.view.getNextHighestDepth());
         _loc3_._x = !(_loc2_ % 2) ? 0 : 333;
         _loc3_._y = _loc2_ <= 1 ? 0 : 180;
         this.scanLineses.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines(_loc3_));
         _loc2_ = _loc2_ + 1;
      }
      this.view.overlay._visible = false;
      this.imageX = this.view.wrapper._x;
      this.imageY = this.view.wrapper._y;
      this.imageWidth = this.view.wrapper._width;
      this.imageHeight = this.view.wrapper._height;
      this.matrix = new flash.geom.Matrix();
      this.noise = new com.rockstargames.ui.utils.Perlin1D();
      this.noiseStep = 0;
      this.sequenceStep = -1;
      this.nextZoomStep();
      this.update();
   }
   function setTexture(dictionary, texture)
   {
      if(dictionary != undefined && dictionary.length > 0 && texture != undefined && texture.length > 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(dictionary,texture,this.view.wrapper.image);
         this.view.overlay._visible = true;
      }
   }
   function update()
   {
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         this.scanLineses[_loc2_].update();
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = 40 * this.noise.getValue(this.noiseStep);
      var _loc4_ = 40 * this.noise.getValue(this.noiseStep + 5);
      var _loc3_ = (this.zoomEnd - this.zoomStart) * this.sequenceCurr / this.sequenceDuration + this.zoomStart;
      this.matrix.identity();
      this.matrix.translate(-0.5 * this.imageWidth,-0.5 * this.imageHeight);
      this.matrix.scale(_loc3_,_loc3_);
      this.matrix.translate(0.5 * this.imageWidth,0.5 * this.imageHeight);
      this.matrix.translate(_loc5_,_loc4_);
      this.matrix.translate(this.imageX,this.imageY);
      this.view.wrapper.transform.matrix = this.matrix;
      this.noiseStep += 0.005;
      if(this.sequenceCurr == this.sequenceDuration)
      {
         this.nextZoomStep();
      }
      else
      {
         this.sequenceCurr = this.sequenceCurr + 1;
      }
   }
   function nextZoomStep()
   {
      this.sequenceStep = (this.sequenceStep + 1) % com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.ZOOM_SEQUENCE.length;
      this.sequenceCurr = 0;
      this.sequenceDuration = int(Math.random() * (com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.DURATION_SEQUENCE_MAX[this.sequenceStep] - com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.DURATION_SEQUENCE_MIN[this.sequenceStep]) + com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.DURATION_SEQUENCE_MIN[this.sequenceStep]);
      this.zoomStart = com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.ZOOM_SEQUENCE[this.sequenceStep];
      this.zoomEnd = com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.ZOOM_SEQUENCE[(this.sequenceStep + 1) % com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam.ZOOM_SEQUENCE.length];
   }
}
