class com.rockstargames.gtav.web.warstock.TruckModule3Page extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var currentDescription;
   var defaultDropDownLabel;
   var modules;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var selectionDropDown;
   var view;
   var website;
   function TruckModule3Page(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_2_PAGE;
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_COLOUR_PAGE;
      this.defaultDropDownLabel = "CANDC_EMPTY";
      this.initModules();
      if(this.modules.length > 0)
      {
         this.buttons.push(this.view.dropDown.dropDownHeader.btnTxt);
      }
      this.selectionDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(this.view.dropDown,"truckDropDownItem",this.defaultDropDownLabel,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ITEM_SPACING,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_HEADER_OFFSET,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ON_TEXT_COLOUR,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_OFF_TEXT_COLOUR);
      var _loc4_ = this.modules[0].label;
      var _loc3_ = 0;
      while(_loc3_ < this.modules.length)
      {
         this.buttons.push(this.selectionDropDown.addItem(this.modules[_loc3_].label).btnTxt);
         if(this.modules[_loc3_].type == this.website.truckModule3)
         {
            _loc4_ = this.modules[_loc3_].label;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.selectOption(_loc4_);
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(3);
   }
   function initModules()
   {
      this.modules = [];
      var _loc2_ = com.rockstargames.gtav.web.warstock.TruckPage.MODULE_DATA;
      var _loc3_ = 4;
      var _loc4_ = 0;
      var _loc6_;
      var _loc5_;
      while(_loc4_ < _loc2_.length)
      {
         if(this.website.truckModule2 == _loc2_[_loc4_].type)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc2_[_loc4_].locations.length)
            {
               _loc5_ = _loc2_[_loc4_].locations[_loc6_];
               if(_loc5_ == (_loc3_ | _loc3_ >> 1))
               {
                  this.setDisabled(_loc2_[_loc4_]);
                  this.website.truckModule3 = com.rockstargames.gtav.web.warstock.TruckPage.VOID_MODULE;
                  return undefined;
               }
               _loc6_ = _loc6_ + 1;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         _loc6_ = 0;
         while(_loc6_ < _loc2_[_loc4_].locations.length)
         {
            _loc5_ = _loc2_[_loc4_].locations[_loc6_];
            if((_loc5_ & _loc3_) != 0)
            {
               if(_loc5_ == _loc3_ || _loc5_ - _loc3_ > _loc3_)
               {
                  if(this.modulePassesUniqueTest(_loc2_[_loc4_]))
                  {
                     this.modules.push(_loc2_[_loc4_]);
                  }
               }
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function modulePassesUniqueTest(module)
   {
      if(module.unique)
      {
         return this.website.truckModule1 != module.type && this.website.truckModule2 != module.type;
      }
      return true;
   }
   function setDisabled(moduleData)
   {
      this.defaultDropDownLabel = moduleData.label;
      this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,"MODULE_" + moduleData.type,this.view.image.tf);
      this.view.dropDown._alpha = 50;
      this.setLocalisedText(this.view.description,"CANDC_TRUCK_LOC_DISABLED_3",false);
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
      if(this.modules.length > 0)
      {
         this.selectionDropDown.setHeaderText(option);
         this.selectionDropDown.close();
         this.selectionDropDown.showAllItems();
      }
      var _loc2_ = 0;
      while(_loc2_ < this.modules.length)
      {
         if(option == this.modules[_loc2_].label)
         {
            this.selectionDropDown.hideItemAt(_loc2_);
            this.website.truckModule3 = this.website.truckModule3Prev = this.modules[_loc2_].type;
            this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,"MODULE_" + this.modules[_loc2_].type,this.view.image.tf);
            this.currentDescription = this.modules[_loc2_].label + "_DESC";
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
      this.modules = null;
      super.dispose();
   }
}
