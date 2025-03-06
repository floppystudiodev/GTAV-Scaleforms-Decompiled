class com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup
{
   var view;
   var itemLinkage;
   var numCols;
   var colWidth;
   var rowHeight;
   var xOffset;
   var yOffset;
   var randomX;
   var randomY;
   var randomR;
   var items;
   var numItems;
   static var BLUE = 2516626;
   static var BLACK = 0;
   static var BLUE_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,38,102,146,0);
   static var BLACK_TRANSFORM = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
   function ApproachGroup(view, itemLinkage, numCols, colWidth, rowHeight, xOffset, yOffset, randomX, randomY, randomR)
   {
      this.view = view;
      this.itemLinkage = itemLinkage;
      this.numCols = numCols;
      this.colWidth = colWidth;
      this.rowHeight = rowHeight;
      this.xOffset = xOffset;
      this.yOffset = yOffset;
      this.randomX = randomX;
      this.randomY = randomY;
      this.randomR = randomR;
      this.items = [];
      this.numItems = 0;
   }
   function addItem(imageID, title, isTicked, isRequired, tapeLabel)
   {
      var _loc3_ = this.view.getNextHighestDepth();
      var _loc2_ = this.view.attachMovie(this.itemLinkage,"item" + _loc3_,_loc3_);
      _loc2_.padlock._visible = false;
      _loc2_.arrows._visible = false;
      _loc2_.poster._visible = false;
      _loc2_.label.autoSize = "left";
      _loc2_.tape.label.textAutoSize = "fit";
      _loc2_.tape.gotoAndStop(random(_loc2_.tape._totalframes));
      this.items.push(_loc2_);
      this.numItems = this.numItems + 1;
      this.updateItem(_loc2_,imageID,title,isTicked,isRequired,tapeLabel);
      this.updateLayout();
      return _loc2_;
   }
   function updateItem(itemView, imageID, title, isTicked, isRequired, tapeLabel)
   {
      itemView.label.autoSize = "left";
      itemView.label.textAutoSize = "none";
      itemView.image.gotoAndStop(imageID);
      itemView.label.text = title;
      itemView.tick._visible = isTicked;
      itemView.star._visible = isRequired;
      if(tapeLabel.length == 0 || tapeLabel == undefined)
      {
         itemView.magnet._visible = true;
         itemView.tape._visible = false;
      }
      else
      {
         itemView.magnet._visible = false;
         itemView.tape._visible = true;
         itemView.tape.label.text = tapeLabel;
      }
      if(isRequired)
      {
         itemView.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK_TRANSFORM;
         itemView.tick.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK_TRANSFORM;
         itemView.box.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK_TRANSFORM;
         itemView.arrows.left.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK_TRANSFORM;
         itemView.arrows.right.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK_TRANSFORM;
         itemView.label.textColor = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLACK;
      }
      else
      {
         itemView.bg.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE_TRANSFORM;
         itemView.tick.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE_TRANSFORM;
         itemView.box.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE_TRANSFORM;
         itemView.arrows.left.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE_TRANSFORM;
         itemView.arrows.right.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE_TRANSFORM;
         itemView.label.textColor = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.ApproachGroup.BLUE;
      }
      if(itemView.label._width > 110)
      {
         itemView.label.autoSize = "none";
         itemView.label._width = 110;
         itemView.label.textAutoSize = "shrink";
      }
      this.centreTickboxAndLabel(itemView);
   }
   function removeItem(itemView)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.numItems)
      {
         if(this.items[_loc2_] == itemView)
         {
            itemView.removeMovieClip();
            this.items.splice(_loc2_,1);
            this.numItems = this.numItems - 1;
            this.updateLayout();
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function centreTickboxAndLabel(view)
   {
      var _loc5_ = -6;
      var _loc3_ = 4;
      var _loc4_ = view.image._x + 0.5 * view.image._width;
      var _loc6_ = view.box._width + _loc3_ + view.label.textWidth;
      var _loc2_ = _loc4_ - 0.5 * _loc6_ + _loc5_;
      view.box._x = _loc2_;
      view.tick._x = _loc2_;
      view.label._x = _loc2_ + view.box._width + _loc3_;
   }
   function updateLayout()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.numItems)
      {
         var _loc3_ = this.items[_loc2_];
         var _loc5_ = _loc2_ % this.numCols * this.colWidth + this.xOffset;
         _loc3_._x = _loc5_;
         var _loc4_ = Math.floor(_loc2_ / this.numCols) * this.rowHeight + this.yOffset;
         _loc3_._y = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
   }
}
