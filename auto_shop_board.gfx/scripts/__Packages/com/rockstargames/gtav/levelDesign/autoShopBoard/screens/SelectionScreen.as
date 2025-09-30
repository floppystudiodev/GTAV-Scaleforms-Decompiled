class com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen extends com.rockstargames.gtav.levelDesign.autoShopBoard.screens.Screen
{
   var app;
   var buttons;
   var cursor;
   var dataObject;
   var view;
   static var TXD = "AUTO_SHOP_BOARD_IMG";
   static var STATE_LOCKED = 0;
   static var STATE_AVAILABLE = 1;
   static var NUM_STYLES = 3;
   static var FULL_OPACITY = 100;
   static var DIM_OPACITY = 60;
   function SelectionScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"selectionScreen",dataObject);
      this.init();
   }
   function init()
   {
      if(this.dataObject.styleId > 0 && this.dataObject.styleId <= com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen.NUM_STYLES)
      {
         this.view.style.gotoAndStop("style_" + this.dataObject.styleId);
      }
      this.view.titleText.autoSize = "left";
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.titleText,"ASB_ROBBERY_CONTRACTS");
      this.view.titleText.verticalAlign = "center";
      this.view.titleUnderline._width = this.view.titleText.textWidth + 41;
      this.view.completedLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.completedLabel,"ASB_ROBBERIES_COMPLETED");
      this.view.completedText.textAutoSize = "shrink";
      this.view.completedText.text = this.dataObject.numCompleted;
      this.view.earningsLabel.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view.earningsLabel,"ASB_ROBBERY_EARNINGS");
      this.view.earningsText.text = "$" + com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.formatNumber(this.dataObject.totalEarnings);
      var _loc2_ = 1;
      while(_loc2_ <= 3)
      {
         this.initRobberySetup(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
      this.buttons = [];
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.ROBBERY_SELECTION_1,this.view.button1,this.dataObject.robbery1Navigable);
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.ROBBERY_SELECTION_2,this.view.button2,this.dataObject.robbery2Navigable);
      this.initButton(com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs.ROBBERY_SELECTION_3,this.view.button3,this.dataObject.robbery3Navigable);
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function initRobberySetup(index)
   {
      this.view["name" + index].text = this.dataObject["name" + index];
      this.view["name" + index].verticalAlign = "center";
      this.view["description" + index].text = this.dataObject["description" + index].toUpperCase();
      com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.setLocalisedText(this.view["rewardLabel" + index],"ASB_REWARD");
      this.view["rewardLabel" + index].autosize = "left";
      this.view["rewardLabel" + index].verticalAlign = "center";
      this.view["paymentStar" + index + "_2"]._x = this.view["rewardLabel" + index]._x + this.view["rewardLabel" + index].textWidth + 10;
      this.view["reward" + index].text = "$" + com.rockstargames.gtav.levelDesign.AUTO_SHOP_BOARD.formatNumber(this.dataObject["reward" + index]);
      this.view["reward" + index].autosize = "left";
      this.view["reward" + index].verticalAlign = "center";
      this.view["reward" + index]._x = this.view["paymentStar" + index + "_2"]._x + this.view["paymentStar" + index + "_2"]._width + 30;
      this.view["paymentLine" + index]._width = this.view["reward" + index]._x + this.view["reward" + index].textWidth - this.view["paymentLine" + index]._x + 50;
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen.TXD,this.dataObject["image" + index],this.view["image" + index]);
      this.view["highlight" + index]._width = this.view["name" + index].textWidth + 130;
      var _loc3_ = this.dataObject["robbery" + index + "Available"] == com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen.STATE_LOCKED;
      this.view["padlock" + index + "_1"]._visible = _loc3_;
      this.view["padlock" + index + "_2"]._visible = _loc3_;
      if(_loc3_)
      {
         this.setOpacity(index,com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen.DIM_OPACITY);
      }
      else
      {
         this.setOpacity(index,com.rockstargames.gtav.levelDesign.autoShopBoard.screens.SelectionScreen.FULL_OPACITY);
      }
   }
   function setOpacity(index, opacity)
   {
      this.view["name" + index]._alpha = opacity;
      this.view["description" + index]._alpha = opacity;
      this.view["rewardLabel" + index]._alpha = opacity;
      this.view["paymentStar" + index + "_1"]._alpha = opacity;
      this.view["paymentStar" + index + "_2"]._alpha = opacity;
      this.view["reward" + index]._alpha = opacity;
      this.view["paymentLine" + index]._alpha = opacity;
      this.view["dash" + index]._alpha = opacity;
   }
   function initButton(id, buttonView, isNavigable)
   {
      var _loc2_;
      if(isNavigable)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.autoShopBoard.ui.Button(id,buttonView);
         this.buttons.push(_loc2_);
         this.cursor.addTarget(_loc2_);
      }
      else
      {
         buttonView._visible = false;
      }
   }
   function onTargetChange(activeTarget)
   {
      var _loc2_ = 1;
      while(_loc2_ <= 3)
      {
         this.view["highlight" + _loc2_]._visible = activeTarget.id == com.rockstargames.gtav.levelDesign.autoShopBoard.ui.ButtonIDs["ROBBERY_SELECTION_" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
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
