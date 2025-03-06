class com.rockstargames.gtav.levelDesign.disruptionLogistics.LoginScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var view;
   var loginButton;
   var app;
   var _buttons;
   static var LOGIN_BUTTON = 999;
   function LoginScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"loginScreen");
      this.init();
   }
   function init()
   {
      this.view._visible = true;
      this.initLogin();
   }
   function initLogin()
   {
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.loginPanel.loginButton.label.txt,"UA_LOGIN");
      this.loginButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.disruptionLogistics.LoginScreen.LOGIN_BUTTON,this.view.loginPanel.loginButton);
      this.app.SET_MOUSE_INPUT(0.59,0.61);
      this.view.loginPanel.loginButton.gotoAndStop("on");
      this._buttons.push(this.loginButton);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.ACCEPT:
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
      }
   }
   function handleAcceptInput(inputID)
   {
      var _loc0_ = null;
      if((_loc0_ = this.app.GET_CURRENT_SELECTION()) === com.rockstargames.gtav.levelDesign.disruptionLogistics.LoginScreen.LOGIN_BUTTON)
      {
         com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Click_Generic");
         this.app.showScreen(this.app.STATS_SCREEN);
      }
   }
   function updateStats()
   {
   }
}
