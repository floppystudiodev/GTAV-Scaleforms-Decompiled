class com.rockstargames.gtav.levelDesign.importExportWarehouse.CarCollectionTile
{
   var _view;
   var _hasBeenInitialised;
   var _collectionNameToken;
   var _value;
   var _completion;
   var _requiredDrivers;
   var _collectionCarTiles;
   var _exportButton;
   var _selected;
   static var X_OFFSET_FIRST_CAR = -3;
   static var X_OFFSET_BETWEEN_CARS = 6;
   function CarCollectionTile(view)
   {
      this._view = view;
      this._hasBeenInitialised = false;
   }
   function init(vehicleCollection, imageManager)
   {
      if(!this._hasBeenInitialised && vehicleCollection)
      {
         this._collectionNameToken = vehicleCollection.collectionNameToken;
         this._value = vehicleCollection.value;
         this._completion = vehicleCollection.completionPercentage;
         this._requiredDrivers = vehicleCollection.requiredDrivers;
         this._view.collectionBonus.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.collectionBonus,"IEW_EXPORT_LABEL_BONUS",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
         this._view.collectionBonus.text += " $" + com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.formatNumber(this._value);
         this._view.collectionName.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.setLocalisedText(this._view.collectionName,this._collectionNameToken);
         this._collectionCarTiles = [];
         var _loc10_ = this._view.collectionTilesContentArea;
         var _loc6_ = _loc10_.createEmptyMovieClip("collectionTilesContainer",_loc10_.getNextHighestDepth());
         var _loc8_ = vehicleCollection.vehicles.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc8_)
         {
            var _loc5_ = _loc6_.getNextHighestDepth();
            var _loc3_ = _loc6_.attachMovie("singleCarTile","singleCarTile" + _loc5_,_loc5_);
            if(_loc2_ == 0)
            {
               _loc3_._x = com.rockstargames.gtav.levelDesign.importExportWarehouse.CarCollectionTile.X_OFFSET_FIRST_CAR;
            }
            else
            {
               _loc3_._x = _loc2_ * (_loc3_._width + com.rockstargames.gtav.levelDesign.importExportWarehouse.CarCollectionTile.X_OFFSET_BETWEEN_CARS);
            }
            var _loc4_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.SingleCarTile(_loc3_);
            _loc4_.initImageAndName(vehicleCollection.vehicles[_loc2_],imageManager);
            this._collectionCarTiles.push(_loc4_);
            _loc2_ = _loc2_ + 1;
         }
         _loc6_._x = (_loc10_._width - _loc6_._width) * 0.5;
         this._view.exportButton.label.multiline = false;
         this._view.exportButton.label.wordWrap = false;
         this._exportButton = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(vehicleCollection.id,this._view.exportButton,"IEW_EXPORT_COLLECTION_BUTTON",com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG);
         this._hasBeenInitialised = true;
      }
   }
   function filter(filterFlag)
   {
      if(filterFlag == com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE || filterFlag == this._requiredDrivers)
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
   function get view()
   {
      return this._view;
   }
   function get button()
   {
      return this._exportButton;
   }
   function get selected()
   {
      return this._selected;
   }
   function get value()
   {
      return this._value;
   }
   function get translatedName()
   {
      return this._view.collectionName.text;
   }
   function get isVisible()
   {
      return this._view._visible;
   }
   function get completion()
   {
      return this._completion;
   }
   function set selected(value)
   {
      this._selected = value;
      this._exportButton.view.gotoAndStop(!this._selected ? "off" : "on");
      var _loc2_ = 0;
      var _loc3_ = this._collectionCarTiles.length;
      while(_loc2_ < _loc3_)
      {
         if(this._collectionCarTiles[_loc2_])
         {
            this._collectionCarTiles[_loc2_].selected = value;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
