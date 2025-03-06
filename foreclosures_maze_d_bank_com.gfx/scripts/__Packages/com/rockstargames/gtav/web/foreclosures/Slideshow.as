class com.rockstargames.gtav.web.foreclosures.Slideshow
{
   var imageManager;
   var view;
   var txds;
   var imageIDs;
   var index;
   var labels;
   var bgImageIDs;
   var bgTXDs;
   var widths;
   var stopIndex;
   var stopped;
   var defaultWidth;
   static var CROSSFADE_TIME = 0.5;
   static var PAUSE_TIME = 2;
   function Slideshow(imageManager, view)
   {
      this.imageManager = imageManager;
      this.view = view;
      view.imageBack.tf.onDisplayImage = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.delegate(this,this.onImageLoaded);
   }
   function show(txds, imageIDs, startIndex, labels, bgImageIDs, bgTXDs, widths)
   {
      this.txds = txds;
      this.imageIDs = imageIDs;
      this.index = startIndex != undefined ? startIndex : 0;
      this.labels = labels;
      this.bgImageIDs = bgImageIDs;
      this.bgTXDs = bgTXDs;
      this.widths = widths;
      this.stopIndex = -1;
      this.stopped = false;
      this.defaultWidth = this.view.imageFront.tf._width;
      this.showNextSlide();
   }
   function stopOn(index)
   {
      this.stopIndex = index;
   }
   function restart()
   {
      if(this.stopped)
      {
         this.stopIndex = -1;
         this.stopped = false;
         this.showNextSlide();
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.imageFront);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.reveal);
      delete this.view.imageBack.tf.onDisplayImage;
      this.imageManager = null;
      this.imageIDs = null;
   }
   function showNextSlide()
   {
      this.stopped = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.imageFront);
      this.view.imageFront.tf.htmlText = this.view.imageBack.tf.htmlText;
      this.view.imageFront.tf._width = this.view.imageBack.tf._width;
      this.view.imageFront.tf._x = this.view.imageBack.tf._x;
      this.view.imageFront.tf2.htmlText = this.view.imageBack.tf2.htmlText;
      this.view.imageFront.label.htmlText = this.view.imageBack.label.htmlText;
      this.view.imageFront._alpha = 100;
      this.imageManager.addImage(this.txds[this.index],this.imageIDs[this.index],this.view.imageBack.tf);
      if(this.labels != undefined && this.labels[this.index] != undefined)
      {
         this.view.imageBack.label.htmlText = this.labels[this.index];
      }
      else
      {
         this.view.imageBack.label.htmlText = "";
      }
      if(this.bgImageIDs[this.index] && this.bgTXDs[this.index])
      {
         this.imageManager.addImage(this.bgTXDs[this.index],this.bgImageIDs[this.index],this.view.imageBack.tf2);
      }
      else
      {
         this.view.imageBack.tf2.text = "";
      }
      if(this.widths[this.index] != undefined)
      {
         this.view.imageBack.tf._width = this.widths[this.index];
         this.view.imageBack.tf._x = 0.5 * (this.defaultWidth - this.widths[this.index]);
      }
      else
      {
         this.view.imageBack.tf._width = this.defaultWidth;
         this.view.imageBack.tf._x = 0;
      }
   }
   function onImageLoaded()
   {
      if(this.imageIDs.length > 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.foreclosures.Slideshow.CROSSFADE_TIME,{_alpha:0,onCompleteScope:this,onComplete:this.pauseBeforeNextSlide});
      }
      else if(this.view.imageFront._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.foreclosures.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
      if(this.view.reveal._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.reveal,com.rockstargames.gtav.web.foreclosures.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
   }
   function pauseBeforeNextSlide()
   {
      this.index = (this.index + 1) % this.imageIDs.length;
      if(this.index == this.stopIndex)
      {
         this.stopped = true;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.imageFront,com.rockstargames.gtav.web.foreclosures.Slideshow.PAUSE_TIME,{onCompleteScope:this,onComplete:this.showNextSlide});
      }
   }
}
