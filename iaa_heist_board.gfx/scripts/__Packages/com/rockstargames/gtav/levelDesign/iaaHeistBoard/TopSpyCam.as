class com.rockstargames.gtav.levelDesign.iaaHeistBoard.TopSpyCam
{
   var imageX;
   var imageY;
   var noise;
   var noiseStep;
   var scanLineses;
   var view;
   function TopSpyCam(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.scanLineses = [];
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 4)
      {
         _loc3_ = this.view.createEmptyMovieClip("scanLineView",this.view.getNextHighestDepth());
         _loc3_._x = !(_loc2_ % 2) ? 0 : 333;
         _loc3_._y = _loc2_ <= 1 ? 0 : 180;
         this.scanLineses.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines(_loc3_));
         _loc2_ = _loc2_ + 1;
      }
      this.noise = new com.rockstargames.ui.utils.Perlin1D();
      this.noiseStep = 0;
      this.imageX = this.view.image._x;
      this.imageY = this.view.image._y;
      this.update();
   }
   function setTexture(dictionary, texture)
   {
      if(dictionary != undefined && dictionary.length > 0 && texture != undefined && texture.length > 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(dictionary,texture,this.view.image);
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
      var _loc4_ = 10 * this.noise.getValue(this.noiseStep);
      var _loc3_ = 10 * this.noise.getValue(this.noiseStep + 5);
      this.noiseStep += 0.015;
      this.view.image._x = this.imageX + _loc4_;
      this.view.image._y = this.imageY + _loc3_;
   }
}
