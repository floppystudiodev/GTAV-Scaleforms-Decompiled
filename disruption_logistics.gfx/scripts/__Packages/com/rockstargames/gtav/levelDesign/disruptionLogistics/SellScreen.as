class com.rockstargames.gtav.levelDesign.disruptionLogistics.SellScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var _buttons;
   var app;
   var sellBCButton;
   var sellLSButton;
   var view;
   static var TXD = "UA_GENERIC";
   static var IMAGE = "UA_SELL_STOCK";
   function SellScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"sellScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.sellLSButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.SELL_STOCK_LS,this.view.sellLSButton);
      this.sellBCButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.SELL_STOCK_BC,this.view.sellBCButton);
      this.view.sellLSButton.line._visible = false;
      this.view.sellBCButton.line._visible = false;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.title,"UA_SELL_TITLE");
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.subtitle,"UA_SELL_SUB");
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.SellScreen.TXD,com.rockstargames.gtav.levelDesign.disruptionLogistics.SellScreen.IMAGE,this.view.image);
      this._buttons = [this.sellBCButton,this.sellLSButton];
      this.update();
   }
   function update()
   {
      this.view.sellLSButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.sellLSButton.label,"UA_SELL_LS") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.sellLSValue);
      this.view.sellBCButton.label.text = com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.sellBCButton.label,"UA_SELL_BC") + ": $" + com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.formatNumber(this.app.sellBCValue);
   }
}
