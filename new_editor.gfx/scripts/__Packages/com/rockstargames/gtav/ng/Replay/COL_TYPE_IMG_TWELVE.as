class com.rockstargames.gtav.ng.Replay.COL_TYPE_IMG_TWELVE extends com.rockstargames.gtav.ng.Replay.ReplayBaseItemIMG
{
   var APP_DATA;
   var __get__highlighted;
   var _name;
   var bgMC;
   var clearIfUndefinied;
   var imgContainer;
   var labelMC;
   var pictureFrame;
   var row;
   var position = -1;
   var textureLoaded = "";
   var txdLoaded = "";
   var hasTexture = false;
   function COL_TYPE_IMG_TWELVE()
   {
      super();
      var _loc3_ = this._name;
      var _loc5_ = _loc3_.split("COL_TYPE_IMG_TWELVE");
      var _loc7_ = 1;
      var _loc6_ = 1;
      _loc3_ = String(_loc5_[1]).split("MC")[0];
      this.position = Number(_loc3_) + 1;
      var _loc4_ = this.position % 4;
      this.row = Math.floor(this.position / 4);
      if(_loc4_ == 0)
      {
         _loc4_ = 4;
      }
      else
      {
         this.row = this.row + 1;
      }
      this.imgContainer._x = 0 + (this.imgContainer._width + 2) * _loc4_ - (this.imgContainer._width + 2);
      this.pictureFrame._x = this.imgContainer._x;
      this.imgContainer._y = 0 + (this.imgContainer._height + 2) * this.row - (this.imgContainer._height + 2);
      this.pictureFrame._y = this.imgContainer._y;
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      if(!this.hasTexture)
      {
         this.loadComponent(_d[1],_d[2]);
      }
      this.clearIfUndefinied(this.labelMC.row_1_col_1_TF,_d[3]);
      this.clearIfUndefinied(this.labelMC.row_1_col_2_TF,_d[4]);
      this.clearIfUndefinied(this.labelMC.row_2_col_1_TF,_d[5]);
      this.clearIfUndefinied(this.labelMC.row_2_col_2_TF,_d[6]);
      this.clearIfUndefinied(this.labelMC.row_3_col_1_TF,_d[7]);
      this.clearIfUndefinied(this.labelMC.row_3_col_2_TF,_d[8]);
      this.highlighted(false);
   }
   function loadCompleted()
   {
      this.hasTexture = true;
   }
   function set highlighted(_h)
   {
      this.labelMC._visible = _h;
      this.bgMC._visible = _h;
      this.pictureFrame._visible = _h;
   }
}
