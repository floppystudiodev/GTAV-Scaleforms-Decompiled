class com.rockstargames.gtav.FrontendGen9.components.CreatorItem extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var SET_GRID_ITEM_DETAILS;
   var itemHeight;
   var itemWidth;
   var rearrangeContent;
   function CreatorItem()
   {
      super();
      this.itemWidth = 565;
      this.itemHeight = 535;
      this.rearrangeContent();
   }
   function SET_CREATOR_ITEM_DETAILS(titleStr, descStr, mainImgTxd, mainImgTexture, iconTxd, iconTexure, tagTxd, tagTexture)
   {
      this.SET_GRID_ITEM_DETAILS(titleStr,descStr,mainImgTxd,mainImgTexture,iconTxd,iconTexure,tagTxd,tagTexture);
   }
}
