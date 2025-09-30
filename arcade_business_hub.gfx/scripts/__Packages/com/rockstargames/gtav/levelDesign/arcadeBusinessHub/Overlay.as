class com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay
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
      this.view.message.verticalAlign = "center";
      this.actionButtons = [];
      this.view._visible = false;
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel, showImmediately)
   {
      this.view.gotoAndStop("normal");
      this.actionButtons.length = 0;
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton));
      this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton));
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.title.label,title,2.8,true,true);
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.message,message,2.8,true,true);
      this.view.leftHeadingDots._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X - 0.5 * this.view.title.label.textWidth - this.view.leftHeadingDots._width - 6;
      this.view.rightHeadingDots._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X + 0.5 * this.view.title.label.textWidth + 6;
      this.view.acceptButton.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.acceptButton.label,acceptButtonLabel,2.8,true,true);
      this.view.cancelButton.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.cancelButton.label,cancelButtonLabel,2.8,true,true);
      var _loc4_ = 10;
      if(cancelButtonLabel.length == 0)
      {
         this.view.acceptButton._x = Math.floor(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X - 0.5 * this.view.acceptButton._width);
         this.view.cancelButton._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X << 1;
      }
      else if(acceptButtonLabel.length == 0)
      {
         this.view.cancelButton._x = Math.floor(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X - 0.5 * this.view.cancelButton._width);
         this.view.acceptButton._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X << 1;
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
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:90,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
      }
      this.view._visible = true;
   }
   function showSpecialCargo(title, message, button1Label, button2Label, button3Label, button4Label, button5Label, showImmediately)
   {
      this.view.gotoAndStop("special");
      this.actionButtons.length = 0;
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.title.label,title,2.8,true,true);
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.message,message,2.8,true,true);
      this.view.leftHeadingDots._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X - 0.5 * this.view.title.label.textWidth - this.view.leftHeadingDots._width - 6;
      this.view.rightHeadingDots._x = com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.CENTRE_X + 0.5 * this.view.title.label.textWidth + 6;
      this.view.optionButton1.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.optionButton1.label,button1Label,2.8,true,true);
      this.view.optionButton2.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.optionButton2.label,button2Label,2.8,true,true);
      this.view.optionButton3.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.optionButton3.label,button3Label,2.8,true,true);
      this.view.optionButton4.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.optionButton4.label,button4Label,2.8,true,true);
      this.view.optionButton5.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.optionButton5.label,button5Label,2.8,true,true);
      var _loc4_ = [362,650,362,650,506];
      var _loc3_ = [305,305,373,373,441];
      var _loc2_ = 0;
      if(button1Label.length > 0)
      {
         this.view.optionButton1._visible = true;
         this.view.optionButton1._x = _loc4_[_loc2_];
         this.view.optionButton1._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_SPECIAL1,this.view.optionButton1));
      }
      else
      {
         this.view.optionButton1._visible = false;
      }
      if(button2Label.length > 0)
      {
         this.view.optionButton2._visible = true;
         this.view.optionButton2._x = _loc4_[_loc2_];
         this.view.optionButton2._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_SPECIAL2,this.view.optionButton2));
      }
      else
      {
         this.view.optionButton2._visible = false;
      }
      if(button3Label.length > 0)
      {
         this.view.optionButton3._visible = true;
         this.view.optionButton3._x = _loc4_[_loc2_];
         this.view.optionButton3._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_SPECIAL3,this.view.optionButton3));
      }
      else
      {
         this.view.optionButton3._visible = false;
      }
      if(button4Label.length > 0)
      {
         this.view.optionButton4._visible = true;
         this.view.optionButton4._x = _loc4_[_loc2_];
         this.view.optionButton4._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_SPECIAL4,this.view.optionButton4));
      }
      else
      {
         this.view.optionButton4._visible = false;
      }
      if(button5Label.length > 0)
      {
         this.view.optionButton5._visible = true;
         this.view.optionButton5._x = _loc4_[_loc2_];
         this.view.optionButton5._y = _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.ButtonIDs.OVERLAY_SPECIAL5,this.view.optionButton5));
      }
      else
      {
         this.view.optionButton5._visible = false;
      }
      if(!showImmediately)
      {
         this.view.screenBG._alpha = 25;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:90,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
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
