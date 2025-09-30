class com.rockstargames.gtav.web.warstock.TruckModule1Page extends com.rockstargames.gtav.web.warstock.TruckPage
{
   var buttons;
   var currentDescription;
   var modules;
   var nextPageName;
   var pendingModule;
   var prevPageName;
   var progressPanel;
   var selectionDropDown;
   var view;
   var website;
   function TruckModule1Page(view, website, progressPanel)
   {
      super(view,website,progressPanel);
   }
   function init()
   {
      super.init();
      this.prevPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_CAB_PAGE;
      this.nextPageName = com.rockstargames.gtav.web.WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM.TRUCK_MODULE_2_PAGE;
      this.initModules();
      this.selectionDropDown = new com.rockstargames.gtav.web.vehicleSites.DropDown(this.view.dropDown,"truckDropDownItem","CANDC_EMPTY",com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ITEM_SPACING,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_HEADER_OFFSET,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_ON_TEXT_COLOUR,com.rockstargames.gtav.web.warstock.TruckPage.DROPDOWN_OFF_TEXT_COLOUR);
      this.buttons.push(this.view.dropDown.dropDownHeader.btnTxt);
      var _loc4_ = this.modules[0].label;
      var _loc3_ = 0;
      while(_loc3_ < this.modules.length)
      {
         this.buttons.push(this.selectionDropDown.addItem(this.modules[_loc3_].label).btnTxt);
         if(this.modules[_loc3_].type == this.website.truckModule1)
         {
            _loc4_ = this.modules[_loc3_].label;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.selectOption(_loc4_,false);
      this.progressPanel.showBuyButton();
      this.progressPanel.setActiveStep(1);
   }
   function initModules()
   {
      this.modules = [];
      var _loc4_ = com.rockstargames.gtav.web.warstock.TruckPage.MODULE_DATA;
      var _loc6_ = 1;
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = 0;
         while(_loc3_ < _loc4_[_loc2_].locations.length)
         {
            _loc5_ = _loc4_[_loc2_].locations[_loc3_];
            if((_loc5_ & _loc6_) != 0)
            {
               if(this.modulePassesUniqueTest(_loc4_[_loc2_]))
               {
                  this.modules.push(_loc4_[_loc2_]);
               }
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function modulePassesUniqueTest(module)
   {
      if(module.unique)
      {
         return this.website.truckModule2 != module.type && this.website.truckModule3 != module.type;
      }
      return true;
   }
   function handleClick(id, attribute)
   {
      var _loc2_;
      if(id == "okButton")
      {
         this.website.hideTruckPopup();
         this.website.truckModule2 = com.rockstargames.gtav.web.warstock.TruckPage.VOID_MODULE;
         this.progressPanel.updateCosts();
      }
      else if(id == "cancelButton")
      {
         this.website.hideTruckPopup();
         if(this.pendingModule != undefined)
         {
            this.selectOption(this.pendingModule,false);
         }
      }
      else if(id == "dropDownHeader")
      {
         this.selectionDropDown.toggleOpen();
      }
      else if(id.indexOf("truckDropDownItem") == 0)
      {
         _loc2_ = id + "_" + attribute;
         _loc2_ = _loc2_.substring(_loc2_.indexOf("_") + 1,_loc2_.length);
         this.selectOption(_loc2_,true);
      }
   }
   function selectOption(option, showWarning)
   {
      this.selectionDropDown.setHeaderText(option);
      this.selectionDropDown.close();
      this.selectionDropDown.showAllItems();
      var _loc2_ = 0;
      while(_loc2_ < this.modules.length)
      {
         if(this.modules[_loc2_].type == this.website.truckModule2Prev)
         {
            this.pendingModule = this.modules[_loc2_].label;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < this.modules.length)
      {
         if(option == this.modules[_loc2_].label)
         {
            this.selectionDropDown.hideItemAt(_loc2_);
            this.website.truckModule1 = this.modules[_loc2_].type;
            this.website.imageManager.addImage(com.rockstargames.gtav.web.warstock.TruckPage.TXD,"MODULE_" + this.modules[_loc2_].type,this.view.image.tf);
            this.currentDescription = this.modules[_loc2_].label + "_DESC";
            this.setLocalisedText(this.view.description,this.currentDescription,false);
            if(this.website.truckModule2 == com.rockstargames.gtav.web.warstock.TruckPage.VOID_MODULE)
            {
               this.website.truckModule2 = this.website.truckModule2Prev;
            }
            _loc5_ = 1;
            _loc3_ = 0;
            while(_loc3_ < this.modules[_loc2_].locations.length)
            {
               _loc4_ = this.modules[_loc2_].locations[_loc3_];
               if((_loc4_ & _loc5_) != 0 && _loc4_ != _loc5_)
               {
                  if(showWarning)
                  {
                     this.website.showTruckPopup("CANDC_VOID_WARN_2");
                     break;
                  }
                  this.website.truckModule2 = com.rockstargames.gtav.web.warstock.TruckPage.VOID_MODULE;
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
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
