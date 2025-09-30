class com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow
{
   var imageIDs;
   var imageManager;
   var index;
   var labels;
   var stopIndex;
   var stopped;
   var txds;
   var view;
   static var CROSSFADE_TIME = 0.5;
   static var PAUSE_TIME = 2;
   function Slideshow(imageManager, view)
   {
      this.imageManager = imageManager;
      this.view = view;
      view.imageBack.tf.onDisplayImage = this.delegate(this,this.onImageLoaded);
   }
   function show(txds, imageIDs, startIndex, labels, preDelay)
   {
      this.txds = txds;
      this.imageIDs = imageIDs;
      this.index = startIndex != undefined ? startIndex : 0;
      preDelay = preDelay != undefined ? preDelay : 0;
      this.labels = labels;
      this.stopIndex = -1;
      this.stopped = false;
      if(preDelay == 0)
      {
         this.showNextSlide();
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.imageFront,preDelay,{onCompleteScope:this,onComplete:this.showNextSlide});
      }
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
      this.view.imageFront.label.htmlText = this.view.imageBack.label.htmlText;
      this.view.imageFront._alpha = 100;
      this.imageManager.addImage(this.txds[this.index % this.txds.length],this.imageIDs[this.index % this.imageIDs.length],this.view.imageBack.tf);
      if(this.labels != undefined && this.labels[this.index] != undefined)
      {
         this.view.imageBack.label.htmlText = this.labels[this.index];
      }
      else
      {
         this.view.imageBack.label.htmlText = "";
      }
   }
   function onImageLoaded()
   {
      if(this.imageIDs.length > 1)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow.CROSSFADE_TIME,{_alpha:0,onCompleteScope:this,onComplete:this.pauseBeforeNextSlide});
      }
      else if(this.view.imageFront._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
      if(this.view.reveal._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.reveal,com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow.CROSSFADE_TIME,{_alpha:0});
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
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.imageFront,com.rockstargames.gtav.levelDesign.bikerBusinesses.Slideshow.PAUSE_TIME,{onCompleteScope:this,onComplete:this.showNextSlide});
      }
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
