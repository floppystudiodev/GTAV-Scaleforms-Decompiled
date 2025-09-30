class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Overlay
{
   var _isShowing;
   var actionButtons;
   var view;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var HEIGHT = 720;
   static var CENTRE_X = 640;
   var noButtons = [];
   function Overlay(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.view.heading.tf.verticalAlign = "center";
      this.actionButtons = [];
      this._isShowing = false;
      this.view._visible = false;
   }
   function show(heading, message, acceptButtonLabel, cancelButtonLabel, colourScheme)
   {
      this.view.reveal.transform.colorTransform = colourScheme.dark;
      this.view.heading.transform.colorTransform = colourScheme.dark;
      this.view.message.transform.colorTransform = colourScheme.light;
      this.view.bezel.transform.colorTransform = colourScheme.mid;
      this.view.panelBackground.transform.colorTransform = colourScheme.dark;
      this.view.background.transform.colorTransform = colourScheme.dark;
      this.actionButtons.length = 0;
      var _loc4_;
      if(cancelButtonLabel.length == 0)
      {
         this.view.gotoAndStop("single");
      }
      else
      {
         this.view.gotoAndStop("double");
         _loc4_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button(com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton,colourScheme);
         _loc4_.setLabel(cancelButtonLabel.toUpperCase(),true);
         _loc4_.setState(false);
         this.actionButtons.push(_loc4_);
      }
      var _loc3_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button(com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton,colourScheme);
      _loc3_.setLabel(acceptButtonLabel.toUpperCase(),true);
      _loc3_.setState(false);
      this.actionButtons.push(_loc3_);
      this.view.heading.tf.text = heading.toUpperCase();
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.tf);
      this.view.message.tf.htmlText = message;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.message.tf);
      this.view.background._alpha = 70;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.background,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:100});
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view._visible = true;
      this.view._alpha = 100;
      this.view.reveal.gotoAndPlay(1);
      this._isShowing = true;
   }
   function hide()
   {
      if(this._isShowing)
      {
         this._isShowing = false;
         this.view._alpha = 30;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE,onCompleteScope:this,onComplete:this.finishHide});
      }
   }
   function finishHide()
   {
      if(!this._isShowing)
      {
         this.view._visible = false;
      }
   }
   function get isShowing()
   {
      return this._isShowing;
   }
   function get buttons()
   {
      return !this._isShowing ? this.noButtons : this.actionButtons;
   }
   function updateSelectedButton(targetID)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.actionButtons.length)
      {
         _loc3_ = this.actionButtons[_loc2_];
         _loc3_.setState(targetID == _loc3_.id);
         _loc2_ = _loc2_ + 1;
      }
   }
}
