class com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay
{
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
      this.view.title.label.textAutoSize = "shrink";
      this.view.message.autoSize = "left";
      this.actionButtons = [];
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton));
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Button(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton));
      this.view._visible = false;
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel, showImmediately)
   {
      this.view.title.label.text = title;
      this.view.message.htmlText = message;
      this.view.acceptButton.label.text = acceptButtonLabel;
      this.view.cancelButton.label.text = cancelButtonLabel;
      var _loc4_ = 20;
      var _loc5_ = message.length != 0 ? this.view.message._height + _loc4_ : 0;
      this.view.bg._height = _loc4_ + _loc5_ + this.view.acceptButton._height + _loc4_;
      var _loc6_ = this.view.title._height + this.view.bg._height;
      this.view.title._y = 0.5 * (com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.HEIGHT - _loc6_);
      this.view.bg._y = this.view.title._y + this.view.title._height;
      this.view.message._y = this.view.bg._y + _loc4_;
      this.view.cancelButton._y = this.view.acceptButton._y = Math.ceil(this.view.message._y + _loc5_);
      if(cancelButtonLabel.length == 0)
      {
         this.view.acceptButton._x = Math.floor(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.CENTRE_X - 0.5 * this.view.acceptButton._width);
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.CENTRE_X << 1;
      }
      else if(acceptButtonLabel.length == 0)
      {
         this.view.cancelButton._x = Math.floor(com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.CENTRE_X - 0.5 * this.view.cancelButton._width);
         this.view.acceptButton._x = com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.CENTRE_X << 1;
      }
      else
      {
         this.view.cancelButton._x = Math.floor(this.view.bg._x + _loc4_);
         this.view.acceptButton._x = Math.floor(this.view.bg._x + this.view.bg._width - this.view.acceptButton._width - _loc4_);
      }
      var _loc2_ = 0;
      var _loc3_ = this.actionButtons.length;
      while(_loc2_ < _loc3_)
      {
         this.actionButtons[_loc2_].updateBounds();
         _loc2_ = _loc2_ + 1;
      }
      if(!showImmediately)
      {
         this.view.screenBG._alpha = 25;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.casinoHeistBoardSetup.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:90,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
      }
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
   function get buttons()
   {
      return !this.view._visible ? this.noButtons : this.actionButtons;
   }
   function updateSelectedButton(targetID)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.actionButtons.length)
      {
         _loc3_ = this.actionButtons[_loc2_];
         _loc3_.view.gotoAndStop(targetID != _loc3_.id ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
}
