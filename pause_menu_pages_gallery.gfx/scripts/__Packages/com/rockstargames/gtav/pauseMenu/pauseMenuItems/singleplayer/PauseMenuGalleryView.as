class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView extends com.rockstargames.ui.components.GUIView
{
   var container;
   var document;
   var textContainerMC;
   var viewLinkageList;
   var viewContainer;
   var rowSpacing;
   var columnSpacing;
   var itemList;
   var itemY;
   var index;
   var __get__index;
   var __set__index;
   var dataList;
   var highlightedItem;
   var maxGalleryItems = 1;
   var batchW = 0;
   var batchH = 106;
   var batchCols = 3;
   var batchRows = 2;
   function PauseMenuGalleryView()
   {
      super();
      _global.gfxExtensions = true;
   }
   function set params(_p)
   {
      super.params = _p;
      this.container = _p.container;
      this.document = _p.document;
      this.batchCols = _p.batchCols;
      this.batchRows = _p.batchRows;
      this.batchW = _p.batchW;
      this.textContainerMC = this.container.textContainerMC;
      this.textContainerMC.trackValueTF.textAutoSize = "shrink";
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc5_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc5_,"g" + i + "MC",i);
      var _loc7_ = i % this.batchCols * (this.batchW + this.rowSpacing);
      var _loc6_ = Math.floor(i / this.batchCols) * (this.batchH + this.columnSpacing);
      _loc2_._x = _loc7_;
      _loc2_._y = _loc6_;
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem(_loc2_);
      _loc4_.data = _dataArray;
      this.itemList[i] = _loc4_;
      this.itemY += _loc2_.bgMC._height + this.rowSpacing;
   }
   function moveHorz(dir)
   {
      this.index += dir;
      this.setDescription();
   }
   function moveVert(dir)
   {
      var _loc2_ = this.index + dir * this.batchCols;
      if(_loc2_ < 0)
      {
         _loc2_ += this.batchCols * this.batchRows;
      }
      if(_loc2_ >= this.batchCols * this.batchRows)
      {
         _loc2_ -= this.batchCols * this.batchRows;
      }
      this.index = _loc2_;
      this.setDescription();
   }
   function setDescription()
   {
      var _loc3_ = this.dataList[this.index].slice(6);
      var _loc4_ = _loc3_[4];
      com.rockstargames.ui.utils.UIText.setSizedText(this.textContainerMC.titleTF.txtString,_loc3_[0] == undefined ? "" : _loc3_[0]);
      com.rockstargames.ui.utils.UIText.setSizedText(this.textContainerMC.dateValueTF,_loc3_[1] == undefined ? "" : _loc3_[1]);
      com.rockstargames.ui.utils.UIText.setSizedText(this.textContainerMC.locationValueTF,_loc3_[6] == undefined ? "" : _loc3_[6]);
      com.rockstargames.ui.utils.UIText.setSizedText(this.textContainerMC.trackValueTF,_loc3_[7] == undefined ? "" : _loc3_[7]);
      var _loc2_ = 1;
      while(_loc2_ <= 5)
      {
         this.container.ratingMC["star" + _loc2_]._alpha = _loc4_ >= _loc2_ ? 100 : 50;
         _loc2_ = _loc2_ + 1;
      }
   }
   function clearDescription()
   {
      this.textContainerMC.dateTF.text = "";
      this.textContainerMC.locationTF.text = "";
      this.textContainerMC.trackTF.text = "";
      this.textContainerMC.titleTF.txtString.text = "";
      this.textContainerMC.dateValueTF.text = "";
      this.textContainerMC.locationValueTF.text = "";
      this.textContainerMC.trackValueTF.text = "";
   }
   function focusHighlightStyle(targetIndex)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc3_ = this.itemList[_loc2_];
         _loc3_.highlighted = _loc2_ == targetIndex;
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
}
