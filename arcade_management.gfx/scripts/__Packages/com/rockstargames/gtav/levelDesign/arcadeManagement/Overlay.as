class com.rockstargames.gtav.levelDesign.arcadeManagement.Overlay
{
   var view;
   var actionButtons;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   var noButtons = [];
   function Overlay(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.view.message.verticalAlign = "bottom";
      this.actionButtons = [];
      this.view._visible = false;
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel, showImmediately, isAsianText)
   {
      this.actionButtons.length = 0;
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(this.view.title,title,0.4,true,true);
      this.view.message.htmlText = message;
      if(acceptButtonLabel.length == 0)
      {
         this.view.gotoAndStop("single");
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(this.view.button.label.tf,cancelButtonLabel,2.5,true,true);
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.OVERLAY_CANCEL,this.view.button));
         if(isAsianText)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(this.view.button.label.tf);
         }
      }
      else if(cancelButtonLabel.length == 0)
      {
         this.view.gotoAndStop("single");
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(this.view.button.label.tf,acceptButtonLabel,2.5,true,true);
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.OVERLAY_ACCEPT,this.view.button));
         if(isAsianText)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(this.view.button.label.tf);
         }
      }
      else
      {
         this.view.gotoAndStop("double");
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(this.view.acceptButton.label.tf,acceptButtonLabel,2.5,true,true);
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(this.view.cancelButton.label.tf,cancelButtonLabel,2.5,true,true);
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton));
         this.actionButtons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton));
         if(isAsianText)
         {
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(this.view.acceptButton.label.tf);
            com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(this.view.cancelButton.label.tf);
         }
      }
      if(!showImmediately)
      {
         this.view.screenBG._alpha = 25;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.screenBG,com.rockstargames.gtav.levelDesign.arcadeManagement.Overlay.ELEMENT_FADE_IN_DURATION,{_alpha:90,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
      }
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
      this.actionButtons.length = 0;
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
