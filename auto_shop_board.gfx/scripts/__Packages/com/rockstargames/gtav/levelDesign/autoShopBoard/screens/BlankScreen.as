class com.rockstargames.gtav.levelDesign.autoShopBoard.screens.BlankScreen extends com.rockstargames.gtav.levelDesign.autoShopBoard.screens.Screen
{
   var dataObject;
   var view;
   static var TXD = "AUTO_SHOP_BOARD_IMG";
   static var NUM_STYLES = 3;
   function BlankScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"blankScreen",dataObject);
      this.init();
   }
   function init()
   {
      if(this.dataObject.styleId > 0 && this.dataObject.styleId <= com.rockstargames.gtav.levelDesign.autoShopBoard.screens.BlankScreen.NUM_STYLES)
      {
         this.view.style.gotoAndStop("style_" + this.dataObject.styleId);
      }
   }
}
