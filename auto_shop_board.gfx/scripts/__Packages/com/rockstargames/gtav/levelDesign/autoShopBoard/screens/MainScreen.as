class com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen extends com.rockstargames.gtav.levelDesign.autoShopBoard.screens.Screen
{
   var dataObject;
   var view;
   var app;
   var buttons;
   var cursor;
   static var TXD = "AUTO_SHOP_BOARD_IMG";
   static var STATE_LOCKED = 0;
   static var STATE_AVAILABLE = 1;
   static var STATE_COMPLETE = 2;
   static var NUM_STYLES = 3;
   static var FULL_OPACITY = 100;
   static var DIM_OPACITY = 60;
   function MainScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"mainScreen",dataObject);
      this.init();
   }
   function init()
   {
      if(this.dataObject.styleId > 0 && this.dataObject.styleId <= com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.NUM_STYLES)
      {
         this.view.style.gotoAndStop("style_" + this.dataObject.styleId);
      }
      this.view.titleText.autoSize = "left";
      this.view.titleText.text = this.dataObject.name;
      this.view.titleText.verticalAlign = "center";
      this.view.titleUnderline._width = this.view.titleText.textWidth + 41;
      this.view.rewardLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.rewardLabel,"ASB_REWARD");
      this.view.rewardText.text = "$" + com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.formatNumber(this.dataObject.reward);
      this.view.rewardText.verticalAlign = "center";
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.resizeAsianText(this.view.rewardText);
      }
      this.view.prep1Title.text = this.dataObject.prep1Name;
      this.view.prep1Title.textAutoSize = "shrink";
      this.view.prep1Title.verticalAlign = "center";
      this.view.prep1Description.textAutoSize = "shrink";
      this.view.prep1Description.text = this.dataObject.prep1Description.toUpperCase();
      this.initStrikethrough(this.view.prep1Strikethrough,this.view.prep1Description,this.dataObject.prep1State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_COMPLETE);
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.TXD,this.dataObject.prep1Image,this.view.prep1Image);
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.prep1Complete.label,"ASB_COMPLETE");
      this.view.prep1Complete._visible = this.dataObject.prep1State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_COMPLETE;
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.prep1Padlock_2.label,"ASB_LOCKED");
      this.view.prep1Padlock_1._visible = this.dataObject.prep1State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.prep1Padlock_2._visible = this.dataObject.prep1State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.prep1Padlock_2.label.verticalAlign = "bottom";
      this.view.prep1Highlight._width = this.view.prep1Title.textWidth + 130;
      if(this.dataObject.prep1State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED)
      {
         this.view.prep1Title._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.prep1Description._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.prep1dash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
      }
      else
      {
         this.view.prep1Title._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.prep1Description._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.prep1dash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
      }
      this.view.prep2Title.text = this.dataObject.prep2Name;
      this.view.prep2Title.textAutoSize = "shrink";
      this.view.prep2Title.verticalAlign = "center";
      this.view.prep2Description.textAutoSize = "shrink";
      this.view.prep2Description.text = this.dataObject.prep2Description.toUpperCase();
      this.initStrikethrough(this.view.prep2Strikethrough,this.view.prep2Description,this.dataObject.prep2State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_COMPLETE);
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.TXD,this.dataObject.prep2Image,this.view.prep2Image);
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.prep2Complete.label,"ASB_COMPLETE");
      this.view.prep2Complete.label.verticalAlign = "center";
      this.view.prep2Complete._visible = this.dataObject.prep2State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_COMPLETE;
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.prep2Padlock_2.label,"ASB_LOCKED");
      this.view.prep2Padlock_1._visible = this.dataObject.prep2State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.prep2Padlock_2._visible = this.dataObject.prep2State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.prep2Padlock_2.label.verticalAlign = "bottom";
      this.view.prep2Highlight._width = this.view.prep2Title.textWidth + 130;
      if(this.dataObject.prep2State == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED)
      {
         this.view.prep2Title._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.prep2Description._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.prep2dash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
      }
      else
      {
         this.view.prep2Title._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.prep2Description._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.prep2dash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
      }
      this.view.finaleTitle.text = this.dataObject.finaleName;
      this.view.finaleTitle.textAutoSize = "shrink";
      this.view.finaleTitle.verticalAlign = "center";
      this.view.finaleDescription.textAutoSize = "shrink";
      this.view.finaleDescription.text = this.dataObject.finaleDescription.toUpperCase();
      this.initStrikethrough(this.view.finaleStrikethrough,this.view.finaleDescription,this.dataObject.finaleState == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_COMPLETE);
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.TXD,this.dataObject.finaleImage,this.view.finaleImage);
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.finalePadlock_2.label,"ASB_LOCKED");
      this.view.finalePadlock_1._visible = this.dataObject.finaleState == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.finalePadlock_2._visible = this.dataObject.finaleState == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED;
      this.view.finalePadlock_2.label.verticalAlign = "center";
      this.view.prep2Padlock_2.label.verticalAlign = "bottom";
      this.view.finaleHighlight._width = this.view.finaleTitle.textWidth + 130;
      if(this.dataObject.finaleState == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.STATE_LOCKED)
      {
         this.view.finaleTitle._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.finaleDescription._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
         this.view.finaledash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.DIM_OPACITY;
      }
      else
      {
         this.view.finaleTitle._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.finaleDescription._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
         this.view.finaledash._alpha = com.rockstargames.gtav.levelDesign.autoShopBoard.screens.MainScreen.FULL_OPACITY;
      }
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.PREP_1,this.view.prep1Button,this.dataObject.prep1Navigable);
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.PREP_2,this.view.prep2Button,this.dataObject.prep2Navigable);
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.FINALE,this.view.finaleButton,this.dataObject.finaleNavigable);
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function initButton(id, buttonView, isNavigable)
   {
      if(isNavigable)
      {
         var _loc2_ = new com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Button(id,buttonView);
         this.buttons.push(_loc2_);
         this.cursor.addTarget(_loc2_);
      }
      else
      {
         buttonView._visible = false;
      }
   }
   function initStrikethrough(strikethrough, tf, isVisible)
   {
      if(isVisible && tf.length > 0)
      {
         var _loc4_ = tf.bottomScroll;
         var _loc1_ = 1;
         while(_loc1_ <= 3)
         {
            var _loc2_ = strikethrough["line" + _loc1_];
            _loc2_._visible = _loc1_ <= _loc4_;
            _loc2_._width = tf.getLineMetrics(_loc1_ - 1).width + 10;
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         strikethrough._visible = false;
      }
   }
   function onTargetChange(activeTarget)
   {
      this.view.prep1Highlight._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.PREP_1;
      this.view.prep2Highlight._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.PREP_2;
      this.view.finaleHighlight._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.FINALE;
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
      var _loc3_ = 0;
      while(_loc3_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.buttons = [];
      super.dispose();
   }
}
