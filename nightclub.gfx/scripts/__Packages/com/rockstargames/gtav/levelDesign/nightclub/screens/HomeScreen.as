class com.rockstargames.gtav.levelDesign.nightclub.screens.HomeScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var persistentContent;
   var stockMeters;
   var view;
   var totalStockMeter;
   var app;
   var overlay;
   function HomeScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"homeScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(0);
      this.persistentContent.updatePopularityMeter();
      this.persistentContent.setPopularityMeterVisible(true);
      this.stockMeters = [];
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         this.stockMeters.push(new com.rockstargames.gtav.levelDesign.nightclub.BarMeter(this.view["stockMeter" + _loc3_],"CLUB_STOCK" + _loc3_,true,0.1 * _loc3_));
         _loc3_ = _loc3_ + 1;
      }
      this.totalStockMeter = new com.rockstargames.gtav.levelDesign.nightclub.TotalStockMeter(this.view.totalStock,0.8);
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this.view.totalStock["column" + _loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      this.view.totalEarnings.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.jobsCompletedLabel,"CLUB_JOBSCOMPLETED");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.nightclubEarningsLabel,"CLUB_CLUBEARN");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.salesCompletedLabel,"CLUB_SALESCOMPLETED");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.warehouseEarningsLabel,"CLUB_WHOUSEEARN");
      this.update();
   }
   function update()
   {
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         var _loc3_ = this.app.stock[_loc2_].currLevel;
         _loc5_ += _loc3_;
         var _loc4_ = this.app.stock[_loc2_].maxLevel;
         _loc6_ += _loc4_;
         this.stockMeters[_loc2_].setValue(_loc3_,0,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      this.totalStockMeter.setValue(_loc5_,_loc6_,"$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.totalStockValue));
      this.view.jobsCompleted.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.jobsCompleted);
      this.view.nightclubEarnings.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.nightclubEarnings);
      this.view.salesCompleted.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.salesCompleted);
      this.view.warehouseEarnings.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.warehouseEarnings);
      this.view.totalEarnings.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.totalEarnings,"CLUB_TOTALEARN") + ": $" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.totalEarnings);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.UPGRADES_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.NIGHTCLUB_SCREEN);
            }
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         this.stockMeters[_loc3_].dispose();
         _loc3_ = _loc3_ + 1;
      }
      this.stockMeters = null;
      this.totalStockMeter.dispose();
      this.totalStockMeter = null;
      super.dispose();
   }
}
