class com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingListItem
{
   var view;
   var highlight;
   static var FADE_IN_SPEED = 0.3;
   static var FADE_IN_OFFSET = 0.1;
   function ScrollingListItem(view, index, id, description)
   {
      this.view = view;
      this.init(index,id,description);
   }
   function init(index, id, description)
   {
      this.view.description.autoSize = "left";
      this.view.description.htmlText = description;
      this.view.marker.label.text = ("0" + (index + 1)).substr(-2);
      var _loc2_ = new flash.geom.Rectangle(30,30,200,80);
      this.view.bg.scale9Grid = _loc2_;
      this.view.highlight.scale9Grid = _loc2_;
      var _loc3_ = Math.max(this.view.description.textHeight + 40,80);
      this.view.bg._height = _loc3_;
      this.view.highlight._height = _loc3_;
      this.highlight = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.highlight,id);
      this.highlight.enabled = true;
      this.view._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingListItem.FADE_IN_SPEED,{delay:index * com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingListItem.FADE_IN_OFFSET,_alpha:100});
   }
   function updateHighlightBounds()
   {
      this.highlight.updateBounds();
   }
   function get height()
   {
      return this.view._height;
   }
   function get top()
   {
      return this.view._y + this.view._parent._y;
   }
   function get bottom()
   {
      return this.view._y + this.view._parent._y + this.view._height;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
