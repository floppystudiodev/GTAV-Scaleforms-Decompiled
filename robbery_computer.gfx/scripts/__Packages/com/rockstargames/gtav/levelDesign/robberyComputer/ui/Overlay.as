class com.rockstargames.gtav.levelDesign.robberyComputer.ui.Overlay
{
   var acceptButton;
   var app;
   var cancelButton;
   var cursor;
   var view;
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
      this.acceptButton = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton);
      this.cursor.addTarget(this.acceptButton);
      this.cancelButton = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton);
      this.cursor.addTarget(this.cancelButton);
      this.cursor.addListener(com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.delegate(this,this.onTargetChange));
   }
   function show(title, message, leftButtonText, showCancelButton, rightButtonText, cost, isCompleted)
   {
      this.view.gotoAndStop(cost <= 0 ? "single" : "double");
      this.view.title.verticalAlign = "center";
      this.view.message.verticalAlign = "center";
      this.view.acceptButton.label.verticalAlign = "center";
      this.view.cancelButton.label.verticalAlign = "center";
      if(cost > 0)
      {
         this.view.costLabel.verticalAlign = "center";
         this.view.cost.verticalAlign = "center";
         com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(this.view.costLabel,!isCompleted ? "ROBBERY_CMP_CST" : "ROBBERY_CMP_ERD");
      }
      this.view.title.text = title;
      this.view.message.htmlText = message;
      this.view.cost.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(cost);
      this.view.acceptButton.label.text = leftButtonText;
      this.view.cancelButton.label.text = rightButtonText;
      this.view.acceptButton._x = !showCancelButton ? 750 : 530;
      this.view.acceptButton._y = cost <= 0 ? 539 : 609;
      this.acceptButton.updatePosition();
      this.acceptButton.enabled = true;
      this.cancelButton.updatePosition();
      this.cancelButton.enabled = showCancelButton;
      this.view.cancelButton._visible = showCancelButton;
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
         this.view.acceptButton.background.gotoAndStop("on");
         this.acceptButton.setState(true);
      }
      else
      {
         this.view.acceptButton.label.textColor = 2699063;
         this.view.acceptButton.background.gotoAndStop("off");
         this.acceptButton.setState(false);
      }
      if(target == this.cancelButton)
      {
         this.view.cancelButton.label.textColor = 16777215;
         this.view.cancelButton.background.gotoAndStop("on");
         this.cancelButton.setState(true);
      }
      else
      {
         this.view.cancelButton.label.textColor = 2699063;
         this.view.cancelButton.background.gotoAndStop("off");
         this.cancelButton.setState(false);
      }
   }
}
