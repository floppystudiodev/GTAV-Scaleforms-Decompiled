class com.rockstargames.gtav.levelDesign.hangarCargo.Overlay
{
   var view;
   var actionButtons;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var HEIGHT = 720;
   static var CENTRE_X = 640;
   static var CENTRE_X_LEFT = 485;
   static var CENTRE_X_RIGHT = 645;
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
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERLAY_CANCEL,this.view.cancelButton,"HC_CANCEL"));
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERLAY_ACCEPT_AIR,this.view.acceptAirButton,"HC_ACCEPT_AIR"));
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERLAY_ACCEPT_LAND,this.view.acceptLandButton,"HC_ACCEPT_LAND"));
      this.view._visible = false;
   }
   function show(title, message, acceptAirButtonLabel, acceptLandButtonLabel, cancelButtonLabel, showImmediately)
   {
      this.view.title.label.text = title;
      this.view.message.htmlText = message;
      this.view.acceptAirButton.label.text = acceptAirButtonLabel;
      this.view.acceptLandButton.label.text = acceptLandButtonLabel;
      this.view.cancelButton.label.text = cancelButtonLabel;
      var _loc5_ = 18;
      var _loc7_ = message.length != 0 ? this.view.message._height + _loc5_ : 0;
      this.view.bg._height = _loc5_ + _loc7_ + this.view.acceptAirButton._height + _loc5_;
      var _loc8_ = this.view.title._height + this.view.bg._height;
      this.view.title._y = 0.5 * (com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.HEIGHT - _loc8_);
      this.view.bg._y = this.view.title._y + this.view.title._height;
      this.view.message._y = this.view.bg._y + _loc5_;
      this.view.cancelButton._y = this.view.acceptAirButton._y = this.view.acceptLandButton._y = this.view.message._y + _loc7_;
      if(cancelButtonLabel.length == 0)
      {
         if(acceptAirButtonLabel.length == 0 && acceptLandButtonLabel.length == 0)
         {
            this.view.cancelButton.label.text = "CANCEL";
            this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X - 0.5 * this.view.cancelButton._width;
            this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
            this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         }
         else if(acceptAirButtonLabel.length == 0 || acceptLandButtonLabel.length == 0)
         {
            if(acceptAirButtonLabel.length == 0)
            {
               this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X - 0.5 * this.view.acceptLandButton._width;
               this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
            }
            else
            {
               this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X - 0.5 * this.view.acceptAirButton._width;
               this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
            }
            this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         }
         else
         {
            this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X_LEFT;
            this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X_RIGHT;
            this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         }
      }
      else if(acceptAirButtonLabel.length == 0 && acceptLandButtonLabel.length == 0)
      {
         this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X - 0.5 * this.view.cancelButton._width;
      }
      else if(acceptAirButtonLabel.length == 0 || acceptLandButtonLabel.length == 0)
      {
         if(acceptAirButtonLabel.length == 0)
         {
            this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X_RIGHT;
            this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         }
         else
         {
            this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X_RIGHT;
            this.view.acceptLandButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X << 1;
         }
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X_LEFT;
      }
      else
      {
         this.view.acceptAirButton._x = com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.CENTRE_X - 0.5 * this.view.acceptAirButton._width;
         this.view.acceptLandButton._x = this.view.message._x + this.view.message._width - this.view.acceptLandButton._width;
         this.view.cancelButton._x = this.view.message._x;
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
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.hangarCargo.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
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
      while(_loc2_ < this.actionButtons.length)
      {
         var _loc3_ = this.actionButtons[_loc2_];
         _loc3_.view.gotoAndStop(targetID != _loc3_.id ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
   }
}
