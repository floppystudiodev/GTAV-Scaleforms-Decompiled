class com.rockstargames.gtav.levelDesign.bountyComputer.ui.Overlay
{
   var acceptButton;
   var app;
   var cancelButton;
   var cursor;
   var view;
   var CENTRE = 960;
   function Overlay(app, view, cursor)
   {
      this.app = app;
      this.view = view;
      this.cursor = cursor;
      this.init();
      this.hide();
   }
   function init()
   {
      this.acceptButton = new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton);
      this.cursor.addTarget(this.acceptButton);
      this.cancelButton = new com.rockstargames.gtav.levelDesign.bountyComputer.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.bountyComputer.navigation.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton);
      this.cursor.addTarget(this.cancelButton);
      this.view.backgroundWarn._visible = false;
      this.cursor.addListener(com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.delegate(this,this.onTargetChange));
      this.view.acceptButton.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(this.view.acceptButton.label,"SVT_CONFIRM");
      this.view.acceptButton.background._width = this.view.acceptButton.label._width + 50;
      this.view.acceptButton._x = this.CENTRE - 12.5 - this.view.acceptButton._width;
      this.view.cancelButton.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(this.view.cancelButton.label,"SVT_CANCEL");
      this.view.cancelButton.background._width = this.view.cancelButton.label._width + 50;
      this.view.cancelButton._x = this.CENTRE + 12.5;
   }
   function show(message, showCancelButton, isWarning, leftButtonText, rightButtonText)
   {
      this.view.message.htmlText = message;
      this.view.message._y = this.view.message.textHeight >= 80 ? 463 : 493;
      if(leftButtonText == undefined)
      {
         com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(this.view.acceptButton.label,!showCancelButton ? "SVT_OK" : "SVT_CONFIRM");
      }
      else
      {
         this.view.acceptButton.label.text = leftButtonText;
      }
      this.view.acceptButton.background._width = this.view.acceptButton.label._width + 50;
      if(rightButtonText == undefined)
      {
         com.rockstargames.gtav.levelDesign.BOUNTY_COMPUTER.setLocalisedText(this.view.cancelButton.label,"SVT_CANCEL");
      }
      else
      {
         this.view.cancelButton.label.text = rightButtonText;
      }
      this.view.cancelButton.background._width = this.view.cancelButton.label._width + 50;
      var _loc3_;
      if(showCancelButton)
      {
         _loc3_ = this.view.acceptButton._width + this.view.cancelButton._width + 25;
      }
      else
      {
         _loc3_ = this.view.acceptButton._width;
      }
      this.view.acceptButton._x = this.CENTRE - 0.5 * _loc3_;
      this.view.cancelButton._x = this.view.acceptButton._X + this.view.acceptButton._width + 25;
      this.cancelButton.updatePosition();
      this.acceptButton.updatePosition();
      this.acceptButton.enabled = true;
      this.cancelButton.enabled = showCancelButton;
      this.view.cancelButton._visible = showCancelButton;
      this.view.backgroundWarn._visible = isWarning;
      this.view.background._visible = !isWarning;
      this.onTargetChange(null);
      this.view._visible = true;
   }
   function hide()
   {
      this.acceptButton.enabled = false;
      this.cancelButton.enabled = false;
      this.view._visible = false;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
   function onTargetChange(target)
   {
      if(target == this.acceptButton)
      {
         this.view.acceptButton.label.textColor = 16777215;
         this.acceptButton.setState(true);
      }
      else
      {
         this.view.acceptButton.label.textColor = 2572167;
         this.acceptButton.setState(false);
      }
      if(target == this.cancelButton)
      {
         this.view.cancelButton.label.textColor = 16777215;
         this.cancelButton.setState(true);
      }
      else
      {
         this.view.cancelButton.label.textColor = 2572167;
         this.cancelButton.setState(false);
      }
   }
}
