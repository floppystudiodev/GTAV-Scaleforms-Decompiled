class com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var _buttons;
   var app;
   var cursor;
   var delegate;
   var tooltips;
   var upgrade1Button;
   var upgrade2Button;
   var upgrade3Button;
   var view;
   static var FADE_IN_TIME = 0.2;
   static var FADE_OUT_TIME = 0.5;
   static var FADE_IN_ARGS = {_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   static var FADE_OUT_ARGS = {_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT};
   function UpgradesScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"upgradesScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.upgrade1Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.UPGRADE_1,this.view.upgrade1Button);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.upgrade1Button.label,"UA_UPGRADE_1");
      this.upgrade2Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.UPGRADE_2,this.view.upgrade2Button);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.upgrade2Button.label,"UA_UPGRADE_2");
      this.upgrade3Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.UPGRADE_3,this.view.upgrade3Button);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.upgrade3Button.label,"UA_UPGRADE_3");
      this.updateUpgrades();
      this.tooltips = [];
      this.initUpgradeImage(this.view.upgrade1Image,"UA_UPG_1","UA_UPG_1_DESC");
      this.initUpgradeImage(this.view.upgrade2Image,"UA_UPG_2","UA_UPG_2_DESC");
      this.initUpgradeImage(this.view.upgrade3Image,"UA_UPG_3","UA_UPG_3_DESC");
      this._buttons = [this.upgrade1Button,this.upgrade2Button,this.upgrade3Button];
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function initUpgradeImage(imageView, txd, label)
   {
      this.app.imageManager.addImage("UA_GENERIC",txd,imageView.image);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(imageView.tooltip.label,label);
      imageView.tooltip._alpha = 0;
      this.tooltips.push(imageView.tooltip);
   }
   function update()
   {
      super.update();
      this.updateUpgrades();
   }
   function updateState()
   {
   }
   function updateUpgrades()
   {
      var _loc2_ = 1;
      var _loc7_;
      var _loc9_;
      var _loc3_;
      var _loc5_;
      var _loc6_;
      var _loc8_;
      var _loc4_;
      while(_loc2_ <= 3)
      {
         this["upgrade" + _loc2_ + "Button"].state = this.app["upgrade" + _loc2_ + "ButtonState"];
         _loc7_ = this.app["upgrade" + _loc2_ + "Cost"];
         _loc9_ = this.app["upgrade" + _loc2_ + "SaleCost"];
         _loc3_ = this.view["upgrade" + _loc2_ + "Button"];
         _loc5_ = _loc3_.price;
         _loc6_ = _loc3_.originalPrice;
         _loc8_ = _loc3_.salePrice;
         _loc4_ = _loc3_.line;
         if(_loc7_ >= 0)
         {
            if(_loc9_ >= 0)
            {
               _loc6_.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(_loc7_);
               _loc8_.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(_loc9_);
               _loc5_.text = "";
               _loc4_._width = _loc6_.textWidth + 4;
               _loc4_._visible = true;
            }
            else
            {
               _loc6_.text = "";
               _loc8_.text = "";
               _loc5_.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(_loc7_);
               _loc4_._visible = false;
            }
         }
         else
         {
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(_loc5_,"UA_PURCHASED");
            _loc4_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onTargetChange(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         if(id == com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS["UPGRADE_" + (_loc2_ + 1)])
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.tooltips[_loc2_],com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen.FADE_IN_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen.FADE_IN_ARGS);
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.tooltips[_loc2_],com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen.FADE_OUT_TIME,com.rockstargames.gtav.levelDesign.disruptionLogistics.UpgradesScreen.FADE_OUT_ARGS);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.tooltips.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.tooltips[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      super.dispose();
   }
}
