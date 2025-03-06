class com.rockstargames.gtav.levelDesign.partyBus.Grid extends com.rockstargames.gtav.levelDesign.partyBus.Animation
{
   var skew;
   var leftGrid;
   var view;
   var rightGrid;
   var beatStep;
   static var BEAT_SCALES = [1.5,0.5];
   static var GRID_WIDTH = 768;
   function Grid(container, width, height)
   {
      super(container,width,height,"gridPair");
      this.init();
   }
   function init()
   {
      this.skew = 0;
      this.leftGrid = this.view.leftGrid;
      this.leftGrid = this.view.leftGrid;
      this.rightGrid = this.view.rightGrid;
   }
   function update()
   {
      var _loc4_ = 0.13 * Math.sin(this.skew);
      var _loc2_ = this.leftGrid.transform.matrix;
      _loc2_.b = _loc4_;
      _loc2_.d = 2 * _loc4_ + 1;
      _loc2_.a += 0.2 * (-1 - _loc2_.a);
      _loc2_.tx = com.rockstargames.gtav.levelDesign.partyBus.Grid.GRID_WIDTH * (- _loc2_.a);
      this.leftGrid.transform.matrix = _loc2_;
      var _loc3_ = this.rightGrid.transform.matrix;
      _loc3_.b = - _loc4_;
      _loc3_.d = 2 * _loc4_ + 1;
      _loc3_.a = 2 + _loc2_.a;
      _loc3_.tx = _loc2_.tx;
      this.rightGrid.transform.matrix = _loc3_;
      this.skew += 0.1;
   }
   function beat()
   {
      var _loc4_ = com.rockstargames.gtav.levelDesign.partyBus.Grid.BEAT_SCALES[this.beatStep % com.rockstargames.gtav.levelDesign.partyBus.Grid.BEAT_SCALES.length];
      var _loc2_ = this.leftGrid.transform.matrix;
      _loc2_.a = - _loc4_;
      _loc2_.tx = com.rockstargames.gtav.levelDesign.partyBus.Grid.GRID_WIDTH * _loc4_;
      this.leftGrid.transform.matrix = _loc2_;
      var _loc3_ = this.rightGrid.transform.matrix;
      _loc3_.a = 2 + _loc2_.a;
      _loc3_.tx = _loc2_.tx;
      this.rightGrid.transform.matrix = _loc3_;
      this.beatStep = this.beatStep + 1;
   }
}
