class com.rockstargames.gtav.web.warstock.TruckColourPage extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var currColour;
   var currTint;
   var defaultDropDownLabel;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var selectionDropDown;
   var view;
   var website;
   static var COLOURS = [16777215,10066329,0];
   static var TINTS = [14211288,9533775,7567441,6837570,5855577,8239781,7478043,9533775,7567441,3754089,0,7478043,7567441,3754089];
   static var LABELS = ["CANDC_TRUCK_COLOUR_1","CANDC_TRUCK_COLOUR_2","CANDC_TRUCK_COLOUR_3"];
   static var TINT_DISTRIBUTIONS = [4,6,4];
   static var TINT_OFFSETS = [0,4,10];
   function TruckColourPage(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_3_PAGE;
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_SUMMARY_PAGE;
      this.view.description.autoSize = "left";
      this.setLocalisedText(this.view.description,"CANDC_TRUCK_COLOR_DESC",false);
      this.view.subheading.autoSize = "left";
      this.setLocalisedText(this.view.subheading,"CANDC_TRUCK_SEC_COLOUR",false);
      this.currColour = com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS.length - 1;
      while(this.currColour > 0)
      {
         if(this.website.truckColour >= com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS[this.currColour])
         {
            break;
         }
         this.currColour = this.currColour - 1;
      }
      this.currTint = this.website.truckColour - com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS[this.currColour];
      this.buttons.push(this.view.dropDown.dropDownHeader.btnTxt);
      this.defaultDropDownLabel = "CANDC_EMPTY";
      this.selectionDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(this.view.dropDown,"truckDropDownItem",this.defaultDropDownLabel,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ITEM_SPACING,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_HEADER_OFFSET,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ON_TEXT_COLOUR,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_OFF_TEXT_COLOUR);
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.web.warstock.TruckColourPage.LABELS.length)
      {
         this.buttons.push(this.selectionDropDown.addItem(com.rockstargames.gtav.web.warstock.TruckColourPage.LABELS[_loc3_]).btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.initTintButtons();
      this.setActiveTints();
      this.setActiveHighlight();
      this.progressPanel.updateCosts();
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(4);
      var _loc4_ = "COLOR_" + this.website.truckColour + "_" + (this.website.truckModule1 - 2);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,_loc4_,this.view.image.tf);
      this.view.subheading._y = this.view.description._y + this.view.description._height + 10;
      this.view.tintButtons._y = this.view.subheading._y + this.view.subheading._height + 10;
   }
   function initTintButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 6)
      {
         _loc3_ = this.view.tintButtons["tintButton_" + _loc2_];
         this.tintButtonSwatch(_loc3_,com.rockstargames.gtav.web.warstock.TruckColourPage.COLOURS[_loc2_]);
         this.buttons.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleClick(id, attribute)
   {
      var _loc3_;
      var _loc2_;
      if(id == "dropDownHeader")
      {
         this.selectionDropDown.toggleOpen();
      }
      else if(id.indexOf("truckDropDownItem") == 0)
      {
         _loc3_ = id.substring(id.indexOf("_") + 1,id.length) + "_" + attribute;
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.web.warstock.TruckColourPage.LABELS.length)
         {
            if(com.rockstargames.gtav.web.warstock.TruckColourPage.LABELS[_loc2_] == _loc3_)
            {
               this.currColour = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(this.currTint >= com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_DISTRIBUTIONS[this.currColour])
         {
            this.currTint = 0;
         }
         this.selectionDropDown.close();
      }
      else if(id == "tintButton")
      {
         this.currTint = parseInt(attribute);
      }
      this.website.truckColour = com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS[this.currColour] + this.currTint;
      var _loc5_ = "COLOR_" + this.website.truckColour + "_" + (this.website.truckModule1 - 2);
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,_loc5_,this.view.image.tf);
      this.setActiveTints();
      this.setActiveHighlight();
      this.progressPanel.updateCosts();
   }
   function setActiveTints()
   {
      if(!this.selectionDropDown.isOpen)
      {
         this.selectionDropDown.setHeaderText(com.rockstargames.gtav.web.warstock.TruckColourPage.LABELS[this.currColour]);
         this.selectionDropDown.showAllItems();
         this.selectionDropDown.hideItemAt(this.currColour);
      }
      var _loc5_ = com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_DISTRIBUTIONS[this.currColour];
      var _loc4_ = com.rockstargames.gtav.web.warstock.TruckColourPage.TINT_OFFSETS[this.currColour];
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < 6)
      {
         _loc2_ = this.view.tintButtons["tintButton_" + _loc3_];
         if(_loc3_ < _loc5_)
         {
            this.tintButtonSwatch(_loc2_,com.rockstargames.gtav.web.warstock.TruckColourPage.TINTS[_loc4_ + _loc3_]);
            _loc2_.disabled = false;
            _loc2_._visible = true;
         }
         else
         {
            _loc2_.disabled = true;
            _loc2_._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setActiveHighlight()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 6)
      {
         _loc3_ = this.view.tintButtons["tintButton_" + _loc2_];
         _loc3_.highlight._visible = _loc2_ == this.currTint;
         _loc2_ = _loc2_ + 1;
      }
   }
   function tintButtonSwatch(button, colour)
   {
      var _loc3_ = colour >> 16 & 0xFF;
      var _loc4_ = colour >> 8 & 0xFF;
      var _loc2_ = colour & 0xFF;
      button.swatch.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,_loc3_,_loc4_,_loc2_,0);
      button.outline._visible = colour == 0;
   }
   function dispose()
   {
      this.selectionDropDown.dispose();
      this.selectionDropDown = null;
      super.dispose();
   }
}
