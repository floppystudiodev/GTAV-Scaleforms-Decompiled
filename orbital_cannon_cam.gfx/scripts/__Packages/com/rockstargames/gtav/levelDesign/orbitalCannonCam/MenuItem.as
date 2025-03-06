class com.rockstargames.gtav.levelDesign.orbitalCannonCam.MenuItem
{
   var _id;
   var view;
   function MenuItem(container, _id, leftText, rightText, strikethroughText, isActive)
   {
      this._id = _id;
      this.init(container);
      this.update(leftText,rightText,strikethroughText,isActive);
   }
   function init(container)
   {
      this.view = container.attachMovie("menuItem","menuItem" + this._id,container.getNextHighestDepth());
      this.view.highlight._visible = false;
   }
   function get id()
   {
      return this._id;
   }
   function update(leftText, rightText, strikethroughText, isActive)
   {
      this.view.rightLabel.text = rightText;
      var _loc2_ = this.view.rightLabel._x + this.view.rightLabel._width - this.view.rightLabel.textWidth;
      if(strikethroughText == undefined || strikethroughText.length == 0)
      {
         this.view.strikethroughLabel.text = "";
         this.view.strikethrough._visible = false;
      }
      else
      {
         this.view.strikethroughLabel._x = _loc2_ - this.view.strikethroughLabel._width - 10;
         this.view.strikethroughLabel.text = strikethroughText;
         this.view.strikethrough._width = this.view.strikethroughLabel.textWidth + 4;
         this.view.strikethrough._x = _loc2_ - this.view.strikethrough._width - 12;
         this.view.strikethrough._visible = true;
         _loc2_ = this.view.strikethroughLabel._x + this.view.strikethroughLabel._width - this.view.strikethroughLabel.textWidth;
      }
      this.view.leftLabel._width = _loc2_ - this.view.leftLabel._x - 10;
      this.setEllipsis(leftText,this.view.leftLabel);
      this.view.highlight.leftLabel.text = this.view.leftLabel.text;
      this.view.highlight.strikethroughLabel.text = this.view.strikethroughLabel.text;
      this.view.highlight.rightLabel.text = this.view.rightLabel.text;
      this.view.highlight.strikethroughLabel._x = this.view.strikethroughLabel._x;
      this.view.highlight.strikethrough._width = this.view.strikethrough._width;
      this.view.highlight.strikethrough._x = this.view.strikethrough._x;
      this.view.highlight.strikethrough._visible = this.view.strikethrough._visible;
      this.setState(isActive);
   }
   function setState(isActive)
   {
      var _loc3_ = this.view.leftLabel.getTextFormat();
      _loc3_.color = !isActive ? 10263708 : 16777215;
      this.view.leftLabel.setTextFormat(_loc3_);
      _loc3_ = this.view.rightLabel.getTextFormat();
      _loc3_.color = !isActive ? 10263708 : 16777215;
      this.view.rightLabel.setTextFormat(_loc3_);
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.rgb = !isActive ? 10263708 : 16777215;
      this.view.diamond.transform.colorTransform = _loc2_;
   }
   function setHighlight(isVisible)
   {
      this.view.highlight._visible = isVisible;
   }
   function dispose()
   {
      this.view.removeMovieClip();
   }
   function setEllipsis(label, tf)
   {
      tf.text = label;
      if(tf.textWidth > tf._width - 4)
      {
         var _loc1_ = label.length;
         while(_loc1_ > 0)
         {
            tf.text = label.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
}
