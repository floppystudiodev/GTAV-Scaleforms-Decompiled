class com.rockstargames.gtav.web.warstock.TruckCabPage extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var currentDescription;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var selectionDropDown;
   var view;
   var website;
   static var CAB_OPTIONS = ["CANDC_TRUCK_CAB_1","CANDC_TRUCK_CAB_2"];
   function TruckCabPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = "PAGE1";
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_1_PAGE;
      this.selectionDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(this.view.dropDown,"truckDropDownItem","CANDC_EMPTY",com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ITEM_SPACING,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_HEADER_OFFSET,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ON_TEXT_COLOUR,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_OFF_TEXT_COLOUR);
      this.buttons.push(this.view.dropDown.dropDownHeader.btnTxt);
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS.length)
      {
         this.buttons.push(this.selectionDropDown.addItem(com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS[_loc3_]).btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.selectOption(com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS[this.website.truckCab]);
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(0);
   }
   function handleClick(id, attribute)
   {
      var _loc2_;
      if(id == "dropDownHeader")
      {
         this.selectionDropDown.toggleOpen();
      }
      else if(id.indexOf("truckDropDownItem") == 0)
      {
         _loc2_ = id + "_" + attribute;
         _loc2_ = _loc2_.substring(_loc2_.indexOf("_") + 1,_loc2_.length);
         this.selectOption(_loc2_);
      }
   }
   function selectOption(option)
   {
      this.selectionDropDown.setHeaderText(option);
      this.selectionDropDown.close();
      this.selectionDropDown.showAllItems();
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS.length)
      {
         if(option == com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS[_loc2_])
         {
            this.selectionDropDown.hideItemAt(_loc2_);
            this.website.truckCab = _loc2_;
            this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,"CAB_" + _loc2_,this.view.image.tf);
            this.currentDescription = com.rockstargames.gtav.web.warstock.TruckCabPage.CAB_OPTIONS[_loc2_] + "_DESC";
            this.setLocalisedText(this.view.description,this.currentDescription,false);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      this.selectionDropDown.dispose();
      this.selectionDropDown = null;
      super.dispose();
   }
}
