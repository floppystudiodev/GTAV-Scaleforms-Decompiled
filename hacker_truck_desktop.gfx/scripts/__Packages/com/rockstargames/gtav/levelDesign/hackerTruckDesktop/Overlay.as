class com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay
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
      this.view.acceptButton.label.verticalAlign = "center";
      this.view.cancelButton.label.verticalAlign = "center";
      this.actionButtons = [];
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Button(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton));
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Button(com.rockstargames.gtav.levelDesign.hackerTruckDesktop.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton));
      this.view._visible = false;
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel, showImmediately)
   {
      this.view.title.label.text = title;
      this.view.message.htmlText = message;
      this.view.acceptButton.label.text = acceptButtonLabel;
      this.view.cancelButton.label.text = cancelButtonLabel;
      if(cancelButtonLabel.length == 0)
      {
         this.view.acceptButton._x = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay.CENTRE_X - 0.5 * this.view.acceptButton._width;
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay.CENTRE_X << 1;
      }
      else if(acceptButtonLabel.length == 0)
      {
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay.CENTRE_X - 0.5 * this.view.cancelButton._width;
         this.view.acceptButton._x = com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay.CENTRE_X << 1;
      }
      else
      {
         this.view.cancelButton._x = this.view.message._x;
         this.view.acceptButton._x = this.view.message._x + this.view.message._width - this.view.acceptButton._width;
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
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.hackerTruckDesktop.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
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
