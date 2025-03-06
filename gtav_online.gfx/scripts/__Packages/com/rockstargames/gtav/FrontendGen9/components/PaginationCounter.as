class com.rockstargames.gtav.FrontendGen9.components.PaginationCounter extends MovieClip
{
   var _pipsList;
   var _pipContainer;
   var _spacer = 7;
   var _pipSize = 8;
   var _offStateAlpha = 60;
   function PaginationCounter()
   {
      super();
      this._pipsList = [];
      this._pipContainer = this.createEmptyMovieClip("pipContainer",this.getNextHighestDepth());
   }
   function SET_NUMBER_OF_PIPS(numOfPips)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < numOfPips)
      {
         _loc3_ = this._pipContainer.attachMovie("paginationPip","pip" + _loc2_,this._pipContainer.getNextHighestDepth(),{_alpha:this._offStateAlpha});
         this._pipsList[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.alignPips();
   }
   function CLEAR_PIPS()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._pipsList.length)
      {
         MovieClip(this._pipsList[_loc2_]).removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this._pipsList = [];
   }
   function SET_PIP_STATE(pipID, state, enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._pipsList.length)
      {
         MovieClip(this._pipsList[_loc2_])._alpha = this._offStateAlpha;
         _loc2_ = _loc2_ + 1;
      }
      if(state == 1)
      {
         MovieClip(this._pipsList[pipID])._alpha = 100;
      }
   }
   function alignPips()
   {
      var _loc3_ = this._pipSize + this._spacer;
      var _loc2_ = 0;
      while(_loc2_ < this._pipsList.length)
      {
         this._pipsList[_loc2_]._x = _loc3_ * _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this._pipContainer._x = - this._pipContainer._width / 2;
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
}
