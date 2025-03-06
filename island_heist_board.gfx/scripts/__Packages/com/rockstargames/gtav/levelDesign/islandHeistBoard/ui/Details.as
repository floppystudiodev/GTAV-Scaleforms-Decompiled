class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Details
{
   var view;
   var imageManager;
   var colourScheme;
   var firstRun;
   var showImmediately;
   var isHidden;
   var isDeferring;
   var deferredTipText;
   static var TXD = "ISLAND_HEIST_BOARD_IMG";
   function Details(view, imageManager, colourScheme)
   {
      this.view = view;
      this.imageManager = imageManager;
      this.colourScheme = colourScheme;
      this.firstRun = true;
      this.showImmediately = false;
      this.isHidden = false;
      this.isDeferring = false;
      this.deferredTipText = "";
   }
   function deferredPopulate()
   {
      var _loc3_ = Function(arguments.pop());
      if(this.firstRun)
      {
         this.view.gotoAndStop("hidden");
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,1.6,{onCompleteScope:this,onComplete:_loc3_,onCompleteArgs:arguments});
         this.isDeferring = true;
         this.firstRun = false;
      }
      else if(this.showImmediately)
      {
         this.showImmediately = false;
         _loc3_.apply(this,arguments);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         this.view._alpha = Math.min(30,this.view._alpha);
         this.isDeferring = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE,onCompleteScope:this,onComplete:_loc3_,onCompleteArgs:arguments});
      }
   }
   function cancelDeferredPopulate()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function populateImage(heading, texture)
   {
      if(texture.length == 0)
      {
         if(heading.length == 0)
         {
            this.populateHidden();
         }
         else
         {
            this.populateHeading(heading);
         }
         return undefined;
      }
      this.view.gotoAndStop("image");
      this.isHidden = false;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this.imageManager.addImage(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Details.TXD,texture,this.view.texture);
      this.view.heading.tf.verticalAlign = "center";
      this.view.heading.tf.text = heading;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.textureReveal._visible = false;
      this.view.textureReveal.transform.colorTransform = this.colourScheme.dark;
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.description._visible = false;
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function populateHeading(heading)
   {
      this.view.gotoAndStop("heading");
      this.isHidden = false;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this.view.heading.tf.verticalAlign = "center";
      this.view.heading.tf.text = heading;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.description._visible = false;
      this.view.description.label.tf.verticalAlign = "bottom";
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function populateCross(heading)
   {
      this.view.gotoAndStop("cross");
      this.isHidden = false;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this.view.heading.tf.verticalAlign = "center";
      this.view.heading.tf.text = heading;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.description._visible = false;
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function populateWarning(heading, warning)
   {
      this.view.gotoAndStop("warning");
      this.isHidden = false;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this.view.heading.tf.text = heading;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.warning.tf.verticalAlign = "center";
      this.view.warning.tf.text = com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.setLocalisedText(this.view.warning.tf,warning).toUpperCase();
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.warning.tf);
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.warning.transform.colorTransform = this.colourScheme.light;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.description._visible = false;
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function populatePrice(heading, texture, price)
   {
      this.view.gotoAndStop("price");
      this.isHidden = false;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this.imageManager.addImage(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Details.TXD,texture,this.view.texture);
      this.view.heading.tf.verticalAlign = "center";
      this.view.heading.tf.text = heading;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.price.tf.verticalAlign = "center";
      this.view.price.tf.text = "$" + com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.formatNumber(price);
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.price.tf);
      this.view.textureReveal._visible = false;
      this.view.textureReveal.transform.colorTransform = this.colourScheme.dark;
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.price.transform.colorTransform = this.colourScheme.dark;
      this.view.description._visible = false;
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function populateHidden()
   {
      this.view.gotoAndStop("hidden");
      this.isHidden = true;
      this.isDeferring = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._alpha = 100;
      this.showImmediately = true;
      if(this.deferredTipText.length > 0)
      {
         this.showTipText(this.deferredTipText);
      }
   }
   function showTipText(text)
   {
      if(this.isDeferring)
      {
         this.deferredTipText = text;
         return undefined;
      }
      this.deferredTipText = "";
      if(this.isHidden)
      {
         this.view.gotoAndStop("tip");
         this.isHidden = false;
         this.view.heading.transform.colorTransform = this.colourScheme.light;
         this.view.bezel.transform.colorTransform = this.colourScheme.mid;
         this.view.description.label.tf.verticalAlign = "bottom";
      }
      this.view.description.label.tf.htmlText = text;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.description.label.tf,1.1);
      this.view.description.label.transform.colorTransform = this.colourScheme.light;
      this.view.description.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view.description.reveal.gotoAndPlay(1);
      if(this.view.texture)
      {
         var _loc3_ = this.view.texture.getDepth();
         var _loc2_ = this.view.description.getDepth();
         if(_loc3_ < _loc2_)
         {
            this.view.texture.swapDepths(_loc2_);
            this.view.texture._alpha = 30;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.texture,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
         }
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.description);
      this.view.description._alpha = 100;
      this.view.description._visible = true;
   }
   function hideTipText()
   {
      this.deferredTipText = "";
      this.view.description._alpha = 30;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.description,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
      if(this.view.texture)
      {
         var _loc3_ = this.view.texture.getDepth();
         var _loc2_ = this.view.description.getDepth();
         if(_loc3_ > _loc2_)
         {
            this.view.texture.swapDepths(_loc2_);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.texture);
            this.view.texture._alpha = 100;
            if(this.view.textureReveal)
            {
               this.view.textureReveal.gotoAndPlay(1);
            }
         }
      }
   }
   function dispose()
   {
      this.imageManager = null;
      this.colourScheme = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.description);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.texture);
      this.view = null;
   }
}
