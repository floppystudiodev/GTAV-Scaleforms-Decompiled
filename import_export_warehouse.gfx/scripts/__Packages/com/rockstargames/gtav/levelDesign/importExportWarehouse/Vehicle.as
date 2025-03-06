class com.rockstargames.gtav.levelDesign.importExportWarehouse.Vehicle
{
   var _id;
   var _texture;
   var _vehicleName;
   var _category;
   var _value;
   var _collectionValue;
   var _selected;
   var _owned;
   var _associatedCollection;
   var _rangeCategory;
   var _actualValue;
   var _warehousePosition;
   static var TYPE_SUPER = 0;
   static var TYPE_MUSCLE = 1;
   static var TYPE_SPORTS = 2;
   static var TYPE_SPORTS_CLASSICS = 3;
   function Vehicle(id, texture, vehicleName, category, value, collectionValue, selected, owned, rangeCategory, actualValue)
   {
      this._id = id;
      this._texture = texture;
      this._vehicleName = vehicleName;
      this._category = category;
      this._value = value;
      this._collectionValue = collectionValue != undefined ? collectionValue : 0;
      this._selected = selected;
      this._owned = owned;
      this._associatedCollection = -1;
      this._rangeCategory = rangeCategory != undefined ? rangeCategory : 0;
      this._actualValue = actualValue != undefined ? actualValue : 0;
   }
   function get id()
   {
      return this._id;
   }
   function get vehicleName()
   {
      return this._vehicleName;
   }
   function get category()
   {
      return this._category;
   }
   function get value()
   {
      return this._value;
   }
   function get collectionValue()
   {
      return this._collectionValue;
   }
   function get texture()
   {
      return this._texture;
   }
   function get selected()
   {
      return this._selected;
   }
   function get owned()
   {
      return this._owned;
   }
   function get associatedCollection()
   {
      return this._associatedCollection;
   }
   function get warehousePosition()
   {
      return this._warehousePosition;
   }
   function get rangeCategory()
   {
      return this._rangeCategory;
   }
   function get actualValue()
   {
      return this._actualValue;
   }
   function set selected(value)
   {
      this._selected = value;
   }
   function set associatedCollection(value)
   {
      this._associatedCollection = value;
   }
}
