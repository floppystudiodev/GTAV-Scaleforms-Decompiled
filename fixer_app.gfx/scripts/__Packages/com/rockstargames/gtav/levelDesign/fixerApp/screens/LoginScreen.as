class com.rockstargames.gtav.levelDesign.fixerApp.screens.LoginScreen extends com.rockstargames.gtav.levelDesign.fixerApp.screens.Screen
{
   var animationIndex;
   var app;
   var buttons;
   var cursor;
   var dataObject;
   var password;
   var userName;
   var view;
   static var TXD = "FIXER_APP_IMG";
   function LoginScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"loginScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.view.speaker._visible = false;
      this.buttons = [];
      this.view.highlight._visible = false;
      this.view.highlight._alpha = 100;
      this.userName = this.dataObject.gamerTag;
      this.password = "*********";
      if(this.app.displayConfig.isAsian)
      {
         this.password = "******";
      }
      this.view.userNameTypeIn.theText.text = "";
      this.view.userNameTypeIn.theText.verticalAlign = "center";
      this.view.userNameTypeIn.caret._visible = true;
      this.view.passwordTypeIn.theText.text = "";
      this.view.passwordTypeIn.caret._visible = false;
      this.animationIndex = 0;
      this.updateUserName();
      var _loc3_ = this.view.button0._x + 0.75 * this.view.button0._width;
      var _loc2_ = this.view.button0._y + 0.75 * this.view.button0._height;
      this.cursor.snapTo(_loc3_,_loc2_);
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.fixerApp.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function setUpLabel(textField, label)
   {
      textField.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.FIXER_APP.setLocalisedText(textField,label);
      com.rockstargames.gtav.levelDesign.FIXER_APP.truncate(textField,textField.text,"left",2);
   }
   function onTargetChange(activeTarget)
   {
      this.view.highlight._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.LOGIN;
   }
   function setButtonsEnabled(enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].enabled = enabled;
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      var _loc3_ = 0;
      while(_loc3_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.buttons = [];
      super.dispose();
   }
   function updateUserName()
   {
      this.animationIndex = this.animationIndex + 1;
      if(this.animationIndex <= this.userName.length)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.playSound("Key_Hit");
         this.view.userNameTypeIn.theText.text = this.userName.substring(0,this.animationIndex);
         this.view.userNameTypeIn.caret._x = this.view.userNameTypeIn.theText._x + this.view.userNameTypeIn.theText.textWidth + 4;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.1,{onComplete:this.updateUserName,onCompleteScope:this});
      }
      else
      {
         this.view.userNameTypeIn.caret._visible = false;
         this.view.passwordTypeIn.caret._visible = true;
         this.animationIndex = 0;
         this.updatePassword();
      }
   }
   function updatePassword()
   {
      this.animationIndex = this.animationIndex + 1;
      if(this.animationIndex <= this.password.length)
      {
         com.rockstargames.gtav.levelDesign.FIXER_APP.playSound("Key_Hit");
         this.view.passwordTypeIn.theText.text = this.password.substring(0,this.animationIndex);
         this.view.passwordTypeIn.caret._x = this.view.passwordTypeIn.theText._x + this.view.passwordTypeIn.theText.textWidth + 4;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.1,{onComplete:this.updatePassword,onCompleteScope:this});
      }
      else
      {
         this.enableLoginButton();
      }
   }
   function enableLoginButton()
   {
      this.initButton(com.rockstargames.gtav.levelDesign.fixerApp.ui.ButtonIDs.LOGIN,this.view.button0);
   }
}
