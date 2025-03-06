class com.rockstargames.gtav.levelDesign.disruptionLogistics.ResupplyScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var buyButton;
   var view;
   var stealButton;
   var app;
   var _buttons;
   static var TXD = "UA_GENERIC";
   static var IMAGE = "UA_RESUPPLY";
   function ResupplyScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"resupplyScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.buyButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.BUY_SUPPLIES,this.view.buySuppliesButton);
      this.stealButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STEAL_SUPPLIES,this.view.stealSuppliesButton);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.stealSuppliesButton.label,"UA_STEAL");
      this.view.stealSuppliesButton.line._visible = false;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.title,"UA_RESUPPLY_TITLE");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.subtitle,"UA_RESUPPLY_SUB");
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.ResupplyScreen.TXD,com.rockstargames.gtav.levelDesign.disruptionLogistics.ResupplyScreen.IMAGE,this.view.image);
      this._buttons = [this.buyButton,this.stealButton];
      this.update();
   }
   function update()
   {
      super.update();
      this.buyButton.state = this.app.resupplyButtonState;
      this.stealButton.state = this.app.stealButtonState;
      if(this.app.resupplyButtonState == com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.ACTIVE)
      {
         if(this.app.resupplySaleCost >= 0)
         {
            this.view.buySuppliesButton.label.text = "$" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.resupplyCost);
            this.view.buySuppliesButton.line._width = this.view.buySuppliesButton.label.textWidth + 4;
            this.view.buySuppliesButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.buySuppliesButton.label,"UA_BUY") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.resupplyCost);
            var _loc3_ = this.view.buySuppliesButton.label.textWidth;
            this.view.buySuppliesButton.line._x = 0.5 * (this.view.buySuppliesButton._width + _loc3_) - this.view.buySuppliesButton.line._width + 2;
            this.view.buySuppliesButton.label.text += " $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.resupplySaleCost);
            this.view.buySuppliesButton.line._x -= 0.5 * (this.view.buySuppliesButton.label.textWidth - _loc3_);
            this.view.buySuppliesButton.line._visible = true;
         }
         else
         {
            this.view.buySuppliesButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.buySuppliesButton.label,"UA_BUY") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.resupplyCost);
            this.view.buySuppliesButton.line._visible = false;
         }
      }
      else
      {
         this.view.buySuppliesButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.buySuppliesButton.label,"UA_BUY");
         this.view.buySuppliesButton.line._visible = false;
      }
   }
}
