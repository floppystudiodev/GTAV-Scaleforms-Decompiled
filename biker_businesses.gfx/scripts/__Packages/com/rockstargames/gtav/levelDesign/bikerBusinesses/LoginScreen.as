class com.rockstargames.gtav.levelDesign.bikerBusinesses.LoginScreen extends com.rockstargames.gtav.levelDesign.bikerBusinesses.Screen
{
   var controls;
   var keyClickIndex;
   var view;
   var cursor;
   var app;
   var loginButton;
   static var LOGIN_BUTTON = 999;
   static var KEY_CLICK_FRAMES = [10,14,18,23,28,33,38,42];
   function LoginScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"loginScreen");
      this.init();
   }
   function init()
   {
      this.controls = [];
      this.keyClickIndex = 0;
      this.view._visible = true;
      this.cursor.setTargetRects(this.controls);
      this.initLogin();
   }
   function initLogin()
   {
      this.view.connecting.text = "";
      this.view.version.text = "";
      this.view.bar._visible = false;
      this.view.track._visible = false;
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loginPanel.welcome,"BIKEBIZ_WELCOME");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loginPanel.message,"BIKEBIZ_LOGIN_MSG");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loginPanel.userNameLabel,"BIKEBIZ_USER");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loginPanel.passwordLabel,"BIKEBIZ_PASS");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.loginPanel.loginButton.label.txt,"BIKEBIZ_LOGIN");
      this.view.logo.gotoAndStop("admin");
      com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.setLocalisedText(this.view.logo.adminTools,"BIKEBIZ_ADMIN");
      this.view.loginPanel.userName.textAutoSize = "shrink";
      this.view.loginPanel.userName.text = this.app.userName;
      this.loginButton = new com.rockstargames.gtav.levelDesign.bikerBusinesses.Button(com.rockstargames.gtav.levelDesign.bikerBusinesses.LoginScreen.LOGIN_BUTTON,this.view.loginPanel.loginButton);
      this.view.loginPanel.loginButton.gotoAndStop("off");
      this.view.loginPanel.gotoAndPlay(2);
      this.app.SET_MOUSE_INPUT(0.559,0.683);
      this.view.onEnterFrame = this.delegate(this,this.updateLogin);
   }
   function updateLogin()
   {
      if(this.app.businesses.length == 1 && this.app.businesses[0].isOwned)
      {
         this.app.selectedBusinessID = this.app.businesses[0].id;
      }
      if(this.view.loginPanel._currentframe == com.rockstargames.gtav.levelDesign.bikerBusinesses.LoginScreen.KEY_CLICK_FRAMES[this.keyClickIndex])
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Keyboard");
         this.keyClickIndex = this.keyClickIndex + 1;
      }
      if(this.view.loginPanel._currentframe == this.view.loginPanel._totalframes)
      {
         this.view.loginPanel.loginButton.gotoAndStop("on");
         this.loginButton.updateBounds();
         this.controls.push(this.loginButton);
         this.cursor.setTargetRects(this.controls);
         delete this.view.onEnterFrame;
      }
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.ACCEPT:
         case com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
      }
   }
   function handleAcceptInput(inputID)
   {
      var _loc0_ = null;
      if((_loc0_ = this.app.GET_CURRENT_SELECTION()) === com.rockstargames.gtav.levelDesign.bikerBusinesses.LoginScreen.LOGIN_BUTTON)
      {
         com.rockstargames.gtav.levelDesign.BIKER_BUSINESSES.playSound("Click_Generic");
         this.app.showScreen(this.app.MANAGEMENT_SCREEN);
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.logo);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.loginPanel);
      this.cursor.setChangeListener(null);
      delete this.view.onEnterFrame;
      super.dispose();
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
