class com.rockstargames.gtav.web.warstock.Slideshow
{
   var imageIDs;
   var imageManager;
   var index;
   var labels;
   var phaseShift;
   var txd;
   var view;
   static var CROSSFADE_TIME = 0.5;
   static var PAUSE_TIME = 2;
   function Slideshow(imageManager, view)
   {
      this.imageManager = imageManager;
      this.view = view;
      view.imageBack.tf.onDisplayImage = this.delegate(this,this.onImageLoaded);
   }
   function show(txd, imageIDs, startIndex, labels, phaseShift)
   {
      this.txd = txd;
      this.imageIDs = imageIDs;
      this.index = startIndex != undefined ? startIndex : 0;
      this.labels = labels;
      this.phaseShift = phaseShift != undefined ? phaseShift : 0;
      this.showNextSlide();
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
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.imageFront);
      this.view.imageFront.tf.htmlText = this.view.imageBack.tf.htmlText;
      this.view.imageFront.label.htmlText = this.view.imageBack.label.htmlText;
      this.view.imageFront._alpha = 100;
      this.imageManager.addImage(this.txd,this.imageIDs[this.index],this.view.imageBack.tf);
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
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.warstock.Slideshow.CROSSFADE_TIME,{_alpha:0,onCompleteScope:this,onComplete:this.pauseBeforeNextSlide});
      }
      else if(this.view.imageFront._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.imageFront,com.rockstargames.gtav.web.warstock.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
      if(this.view.reveal._alpha == 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.reveal,com.rockstargames.gtav.web.warstock.Slideshow.CROSSFADE_TIME,{_alpha:0});
      }
   }
   function pauseBeforeNextSlide()
   {
      this.index = (this.index + 1) % this.imageIDs.length;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.imageFront,com.rockstargames.gtav.web.warstock.Slideshow.PAUSE_TIME * (1 + this.phaseShift),{onCompleteScope:this,onComplete:this.showNextSlide});
      this.phaseShift = 0;
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
