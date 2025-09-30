class com.rockstargames.gtav.levelDesign.fixerApp.ui.Overlay
{
   var acceptButton;
   var app;
   var buttons;
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
      this.buttons = [];
      this.acceptButton = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton);
      this.cursor.addTarget(this.acceptButton);
      this.buttons.push(this.acceptButton);
      this.cancelButton = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton);
      this.cursor.addTarget(this.cancelButton);
      this.buttons.push(this.cancelButton);
      this.cursor.addListener(com.rockstargames.gtav.levelDesign.FIXER_APP.delegate(this,this.onTargetChange));
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel)
   {
      this.setUpText(this.view.titleText,title);
      this.setUpText(this.view.messageText,message);
      this.setUpText(this.view.acceptButton.label,acceptButtonLabel);
      this.view.acceptButton.dots_left._x = this.view.acceptButton.label._x + this.view.acceptButton.label._width * 0.5 - this.view.acceptButton.label.textWidth * 0.5 - 20;
      this.view.acceptButton.dots_right._x = this.view.acceptButton.label._x + this.view.acceptButton.label._width * 0.5 + this.view.acceptButton.label.textWidth * 0.5 + 10;
      this.setUpText(this.view.highlight1.label,acceptButtonLabel);
      this.view.highlight1.dots_left._x = this.view.highlight1.label._x + this.view.highlight1.label._width * 0.5 - this.view.highlight1.label.textWidth * 0.5 - 20;
      this.view.highlight1.dots_right._x = this.view.highlight1.label._x + this.view.highlight1.label._width * 0.5 + this.view.highlight1.label.textWidth * 0.5 + 10;
      this.acceptButton.setState(true);
      this.acceptButton.enabled = true;
      this.setUpText(this.view.cancelButton.label,cancelButtonLabel);
      this.view.cancelButton.dots_left._x = this.view.cancelButton.label._x + this.view.cancelButton.label._width * 0.5 - this.view.cancelButton.label.textWidth * 0.5 - 20;
      this.view.cancelButton.dots_right._x = this.view.cancelButton.label._x + this.view.cancelButton.label._width * 0.5 + this.view.cancelButton.label.textWidth * 0.5 + 10;
      this.setUpText(this.view.highlight2.label,cancelButtonLabel);
      this.view.highlight2.dots_left._x = this.view.highlight2.label._x + this.view.highlight2.label._width * 0.5 - this.view.highlight2.label.textWidth * 0.5 - 20;
      this.view.highlight2.dots_right._x = this.view.highlight2.label._x + this.view.highlight2.label._width * 0.5 + this.view.highlight2.label.textWidth * 0.5 + 10;
      this.cancelButton.enabled = cancelButtonLabel.length > 0;
      if(this.cancelButton.enabled)
      {
         this.cancelButton.setState(true);
      }
      this.cursor.setTargets(this.buttons);
      this.view._visible = true;
      this.cursor.snapToTargetId(com.rockstargames.gtav.levelDesign.FIXER_APP.ACCEPT);
   }
   function setUpText(textField, label)
   {
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.resizeAsianText(textField);
      }
      com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(textField,label,"left",2);
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
   function onTargetChange(activeTarget)
   {
      this.view.highlight1._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.OVERLAY_ACCEPT;
      this.view.highlight2._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.OVERLAY_CANCEL;
   }
}
