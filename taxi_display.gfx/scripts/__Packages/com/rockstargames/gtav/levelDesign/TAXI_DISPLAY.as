class com.rockstargames.gtav.levelDesign.TAXI_DISPLAY extends com.rockstargames.ui.components.GUIController
{
   var pricePanel;
   var CONTENT;
   var destinationPanel;
   var model;
   var cashCharLimit = 4;
   function TAXI_DISPLAY()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.pricePanel = this.CONTENT.attachMovie("pricePanel","pricePanel",this.CONTENT.getNextHighestDepth());
      this.destinationPanel = this.CONTENT.createEmptyMovieClip("destinationPanel",this.CONTENT.getNextHighestDepth());
      this.model = new com.rockstargames.ui.components.GUIModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:0,columnSpacing:0,container:this.destinationPanel,visibleItems:1,selectstyle:2,linkage:["panel"]});
   }
   function ADD_TAXI_DESTINATION(positionInList, blip, r, g, b, destination, addressOne, addressTwo, isAsian)
   {
      if(destination == undefined)
      {
         destination = "";
      }
      if(addressOne == undefined)
      {
         addressOne = "";
      }
      if(addressTwo == undefined)
      {
         addressTwo = "";
      }
      if(isAsian == undefined)
      {
         isAsian = false;
      }
      this.SET_DATA_SLOT(positionInList,blip,r,g,b,destination,addressOne,addressTwo,isAsian);
   }
   function SHOW_TAXI_DESTINATION()
   {
      this.DISPLAY_VIEW(0,1);
   }
   function HIGHLIGHT_DESTINATION(forceDestination)
   {
      this.model.getCurrentView().index = forceDestination;
   }
   function SET_TAXI_PRICE(newPrice, isAsian)
   {
      var _loc2_ = String(newPrice);
      while(_loc2_.length < this.cashCharLimit)
      {
         _loc2_ = "0" + _loc2_;
      }
      this.pricePanel.priceDollar.text = "$";
      this.pricePanel.priceUnits.text = _loc2_.substr(3,1);
      this.pricePanel.priceTens.text = _loc2_.substr(2,1);
      this.pricePanel.priceHundreds.text = _loc2_.substr(1,1);
      this.pricePanel.priceThousands.text = _loc2_.substr(0,1);
      var _loc3_ = this.pricePanel.priceDollar.getTextFormat();
      _loc3_.size = !isAsian ? 14 : 10;
      this.pricePanel.priceDollar.setTextFormat(_loc3_);
      this.pricePanel.priceUnits.setTextFormat(_loc3_);
      this.pricePanel.priceTens.setTextFormat(_loc3_);
      this.pricePanel.priceHundreds.setTextFormat(_loc3_);
      this.pricePanel.priceThousands.setTextFormat(_loc3_);
   }
   function CLEAR_TAXI_DISPLAY()
   {
      this.SET_DATA_SLOT_EMPTY();
   }
   function SET_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      this.model.addDataToView(0,_slotIndex,_loc3_);
   }
   function UPDATE_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      this.model.updateSlot(0,_slotIndex,_loc3_);
   }
   function SET_DATA_SLOT_EMPTY()
   {
      super.SET_DATA_SLOT_EMPTY(0,0);
   }
}
