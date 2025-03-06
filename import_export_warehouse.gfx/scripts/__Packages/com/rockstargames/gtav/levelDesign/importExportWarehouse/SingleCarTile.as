class com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile extends com.rockstargames.gtav.levelDesign.importExportWarehouse.Button
{
   var _view;
   var _hasBeenInitialised;
   var _greenOutline;
   var _blueOverlay;
   var _vehicleNameToken;
   var _type;
   var _value;
   var _rangeCategory;
   var _button;
   var _warehousePosition;
   var id;
   var _owned;
   var _imageManager;
   var _currentLabel;
   var _selected;
   static var IMAGE_ONLY = "imageOnly";
   static var IMAGE_AND_NAME = "imageAndName";
   static var FULL_TILE = "fullTile";
   static var CAR_BUTTON_ID_OFFSET = 10000;
   static var COLLECTION_BUTTON_ID_OFFSET = 18000;
   static var VEHICLE_POSITION_COUNTER = 0;
   var _vehicleTypeLocTokens = ["IEW_VEHICLE_CLASS_SUPER","IEW_VEHICLE_CLASS_SPORT","IEW_VEHICLE_CLASS_SPORT_CLASSIC","IEW_VEHICLE_CLASS_MUSCLE"];
   var _vehicleRangeLocTokens = ["IEW_RANGE_STANDARD","IEW_RANGE_MID","IEW_RANGE_TOP"];
   function SingleCarTile(view)
   {
      super(-1,view);
      this._view = view;
      this._hasBeenInitialised = false;
      this._greenOutline = this._view.greenOutline;
      this._greenOutline._visible = false;
      this._blueOverlay = this._view.blueOverlay;
      this._blueOverlay._visible = false;
   }
   function initFull(vehicle, imageManager)
   {
      if(!this._hasBeenInitialised && vehicle)
      {
         this.setViewTo(com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.FULL_TILE);
         this._vehicleNameToken = vehicle.vehicleName;
         this._type = vehicle.category;
         this._value = vehicle.value;
         this._rangeCategory = vehicle.rangeCategory;
         if(this._view.labelType)
         {
            this._view.labelType.textAutoSize = "shrink";
            com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.labelType,this._vehicleTypeLocTokens[this._type]);
         }
         if(this._view.labelValue)
         {
            this._view.labelValue.textAutoSize = "shrink";
            var _loc3_ = "$" + com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(this._value);
            this._view.labelValue.text = _loc3_;
         }
         if(this._view.labelRange)
         {
            this._view.labelRange.textAutoSize = "shrink";
            com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.labelRange,this._vehicleRangeLocTokens[this._rangeCategory]);
         }
         this._view.labelName.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.labelName,this._vehicleNameToken);
         this._button = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(vehicle.id,this._view.exportButton,"IEW_EXPORT_BUTTON",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
         this._warehousePosition = com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.VEHICLE_POSITION_COUNTER;
         com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.VEHICLE_POSITION_COUNTER = com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.VEHICLE_POSITION_COUNTER + 1;
         this.generalInit(vehicle,imageManager);
         this._hasBeenInitialised = true;
      }
   }
   function initImageOnly(vehicle, imageManager, isInCollectionTab)
   {
      if(!this._hasBeenInitialised && vehicle)
      {
         this.setViewTo(com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.IMAGE_ONLY);
         var _loc2_ = -1;
         if(isInCollectionTab)
         {
            _loc2_ = vehicle.associatedCollection + com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.COLLECTION_BUTTON_ID_OFFSET;
         }
         else
         {
            _loc2_ = vehicle.id + com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.CAR_BUTTON_ID_OFFSET;
         }
         this.id = _loc2_;
         this._button = this;
         this.generalInit(vehicle,imageManager);
         this._hasBeenInitialised = true;
      }
   }
   function initImageAndName(vehicle, imageManager)
   {
      if(!this._hasBeenInitialised && vehicle)
      {
         this.setViewTo(com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.IMAGE_AND_NAME);
         this._vehicleNameToken = vehicle.vehicleName;
         this._view.labelName.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.labelName,this._vehicleNameToken);
         this._owned = vehicle.owned;
         this.generalInit(vehicle,imageManager);
         this._hasBeenInitialised = true;
      }
   }
   function dispose()
   {
      removeMovieClip(this._view);
   }
   function reset()
   {
      if(this._hasBeenInitialised)
      {
         this._hasBeenInitialised = false;
         this._view.carTileImage.label.text = "";
         if(this._greenOutline)
         {
            this._greenOutline._visible = false;
         }
      }
   }
   function filter(filterFlag)
   {
      if(filterFlag == com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE || this._rangeCategory == filterFlag)
      {
         this._view._visible = true;
      }
      else
      {
         this._view._visible = false;
         this._view._x = 0;
         this._view._y = 0;
      }
   }
   function generalInit(vehicle, imageManager)
   {
      this._imageManager = imageManager;
      this._imageManager.addImage(com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.TXD,vehicle.texture,this._view.carTileImage.label);
      if(this._blueOverlay)
      {
         if(this._currentLabel == com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile.IMAGE_AND_NAME)
         {
            this._blueOverlay._visible = !this._owned;
         }
         else
         {
            this._blueOverlay._visible = false;
         }
      }
      this.selected = vehicle.selected;
   }
   function setViewTo(label)
   {
      this._view.gotoAndStop(label);
      this._currentLabel = label;
   }
   function get button()
   {
      return this._button;
   }
   function get view()
   {
      return this._view;
   }
   function get value()
   {
      return this._value;
   }
   function get translatedName()
   {
      return this._view.labelName.text;
   }
   function get warehousePosition()
   {
      return this._warehousePosition;
   }
   function get selected()
   {
      return this._selected;
   }
   function get isVisible()
   {
      return this._view._visible;
   }
   function set selected(value)
   {
      if(value != undefined)
      {
         this._selected = value;
         if(this._greenOutline)
         {
            this._greenOutline._visible = this._selected;
         }
         if(this._button)
         {
            this._button.view.gotoAndStop(!this._selected ? "off" : "on");
         }
      }
   }
}
