class com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleLeftSpyCam
{
   var view;
   var scanLines;
   var imageMovieClip;
   var frameCounter;
   var currTextureIndex;
   var isShowing;
   var dictionary;
   var textures;
   var numTextures;
   static var NUM_DISPLAY_FRAMES = 210;
   static var NUM_HIDDEN_FRAMES = 30;
   function MiddleLeftSpyCam(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      var _loc2_ = this.view.createEmptyMovieClip("scanLineView",this.view.getNextHighestDepth());
      this.scanLines = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScanLines(_loc2_);
      this.imageMovieClip = this.view.imageA;
      this.imageMovieClip._visible = false;
      this.frameCounter = 0;
      this.currTextureIndex = 0;
      this.isShowing = false;
      this.view.overlay._visible = false;
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
      this.isShowing = false;
      this.frameCounter = 0;
   }
   function update()
   {
      this.scanLines.update();
      if(this.textures.length == 0)
      {
         return undefined;
      }
      if(this.isShowing && this.frameCounter == 0)
      {
         this.imageMovieClip._visible = false;
         this.frameCounter = com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleLeftSpyCam.NUM_HIDDEN_FRAMES;
         this.isShowing = false;
      }
      else if(!this.isShowing && this.frameCounter == 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(this.dictionary,this.textures[this.currTextureIndex],this.imageMovieClip);
         this.currTextureIndex = (this.currTextureIndex + 1) % this.numTextures;
         this.frameCounter = com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleLeftSpyCam.NUM_DISPLAY_FRAMES;
         this.isShowing = true;
      }
      this.frameCounter = this.frameCounter - 1;
   }
}
