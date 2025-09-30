class com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleRightSpyCam
{
   var currTextureIndex;
   var dictionary;
   var frameCounter;
   var imageMovieClips;
   var imagePointer;
   var numTextures;
   var scanLines;
   var textures;
   var view;
   static var NUM_DISPLAY_FRAMES = 360;
   function MiddleRightSpyCam(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      var _loc2_ = this.view.createEmptyMovieClip("scanLineView",this.view.getNextHighestDepth());
      this.scanLines = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines(_loc2_);
      this.imageMovieClips = [this.view.imageA,this.view.imageB];
      this.imagePointer = 1;
      this.currTextureIndex = 0;
      this.frameCounter = 0;
      this.view.overlay._visible = false;
      this.update();
   }
   function setTextures(dictionary, textures)
   {
      var _loc2_ = textures.length - 1;
      while(_loc2_ >= 0)
      {
         if(textures[_loc2_] == undefined || textures[_loc2_].length == 0)
         {
            textures.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ - 1;
      }
      this.dictionary = dictionary;
      this.textures = textures;
      this.numTextures = textures.length;
      this.view.overlay._visible = this.numTextures > 0;
      this.currTextureIndex = 0;
      this.frameCounter = 0;
      this.imageMovieClips[0]._visible = false;
      this.imageMovieClips[1]._visible = false;
   }
   function update()
   {
      this.scanLines.update();
      if(this.textures.length > 0)
      {
         if(this.frameCounter == 0)
         {
            this.showNextImage();
         }
         this.frameCounter = this.frameCounter - 1;
      }
   }
   function showNextImage()
   {
      com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(this.dictionary,this.textures[this.currTextureIndex],this.imageMovieClips[this.imagePointer]);
      this.imageMovieClips[this.imagePointer].swapDepths(this.imageMovieClips[this.imagePointer ^ 1]);
      this.imagePointer ^= 1;
      this.currTextureIndex = (this.currTextureIndex + 1) % this.numTextures;
      this.frameCounter = com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleRightSpyCam.NUM_DISPLAY_FRAMES;
   }
}
