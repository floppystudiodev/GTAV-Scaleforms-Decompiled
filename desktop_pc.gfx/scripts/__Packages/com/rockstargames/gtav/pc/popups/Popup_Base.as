class com.rockstargames.gtav.pc.popups.Popup_Base extends MovieClip
{
   var bgMC;
   var centerMC;
   var closeMC;
   var keylineMC;
   var picMC;
   var titleTF;
   var margin = 6;
   function Popup_Base()
   {
      super();
      this.picMC = this.centerMC.alignMC.picMC;
      this.bgMC = this.centerMC.alignMC.bgMC;
      this.closeMC = this.centerMC.alignMC.closeMC;
      this.keylineMC = this.centerMC.alignMC.keylineMC;
      this.titleTF = this.centerMC.alignMC.titleTF;
   }
   function init(id, data)
   {
      this.picMC.gotoAndStop(id + 1);
      var _loc5_ = this.picMC.sizeMC._width;
      var _loc4_ = this.picMC.sizeMC._height;
      this.keylineMC._width = _loc5_;
      this.keylineMC._height = _loc4_;
      var _loc2_ = _loc5_ + 2 * this.margin;
      var _loc3_ = _loc4_ + this.margin + this.picMC._y;
      this.bgMC._width = _loc2_;
      this.bgMC._height = _loc3_;
      if(data[3] != undefined)
      {
         this.titleTF.autoSize = "left";
         this.titleTF.multiline = false;
         this.titleTF.wordWrap = false;
         this.titleTF.text = data[3];
      }
      this.closeMC._x = _loc2_ - this.closeMC._width - this.margin;
      _loc2_ = this.centerMC.alignMC._width / 2;
      _loc3_ = this.centerMC.alignMC._height / 2;
      this.centerMC.alignMC._x = - _loc2_;
      this.centerMC.alignMC._y = - _loc3_;
      this.centerMC._x = _loc2_;
      this.centerMC._y = _loc3_;
      this.centerMC._alpha = 0;
      this.centerMC._xscale = this.centerMC._yscale = 90;
      this._visible = false;
   }
   function openAnim()
   {
      this.centerMC._alpha = 0;
      this._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.centerMC,0.4,{_alpha:100,_xScale:100,_yScale:100});
   }
}
