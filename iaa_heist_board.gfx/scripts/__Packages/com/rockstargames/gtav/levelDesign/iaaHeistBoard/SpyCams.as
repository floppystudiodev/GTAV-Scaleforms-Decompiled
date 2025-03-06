class com.rockstargames.gtav.levelDesign.iaaHeistBoard.SpyCams
{
   var leftTextures;
   var rightTextures;
   var view;
   var topSpyCam;
   var middleLeftSpyCam;
   var middleRightSpyCam;
   var bottomSpyCam;
   var dictionary;
   var topTexture;
   var bottomTexture;
   function SpyCams()
   {
      this.leftTextures = [];
      this.rightTextures = [];
   }
   function setView(view)
   {
      this.view = view;
      this.topSpyCam = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.TopSpyCam(view.topSpyCam);
      this.middleLeftSpyCam = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleLeftSpyCam(view.middleLeftSpyCam);
      this.middleRightSpyCam = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.MiddleRightSpyCam(view.middleRightSpyCam);
      this.bottomSpyCam = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.BottomSpyCam(view.bottomSpyCam);
      this.topSpyCam.setTexture(this.dictionary,this.topTexture);
      this.bottomSpyCam.setTexture(this.dictionary,this.bottomTexture);
      this.middleLeftSpyCam.setTextures(this.dictionary,this.leftTextures);
      this.middleRightSpyCam.setTextures(this.dictionary,this.rightTextures);
      this.update();
   }
   function setTextures(dictionary, topTexture, bottomTexture, leftTexture1, leftTexture2, leftTexture3, leftTexture4, leftTexture5, rightTexture1, rightTexture2, rightTexture3)
   {
      var _loc8_ = topTexture != this.topTexture;
      var _loc5_ = bottomTexture != this.bottomTexture;
      var _loc3_ = this.leftTextures[0] != leftTexture1 || this.leftTextures[1] != leftTexture2 || this.leftTextures[2] != leftTexture3 || this.leftTextures[3] != leftTexture4 || this.leftTextures[4] != leftTexture5;
      var _loc4_ = this.rightTextures[0] != rightTexture1 || this.rightTextures[1] != rightTexture2 || this.rightTextures[2] != rightTexture3;
      this.dictionary = dictionary;
      this.topTexture = topTexture;
      this.bottomTexture = bottomTexture;
      this.leftTextures = [leftTexture1,leftTexture2,leftTexture3,leftTexture4,leftTexture5];
      this.rightTextures = [rightTexture1,rightTexture2,rightTexture3];
      if(this.view)
      {
         if(_loc8_)
         {
            this.topSpyCam.setTexture(dictionary,topTexture);
         }
         if(_loc5_)
         {
            this.bottomSpyCam.setTexture(dictionary,bottomTexture);
         }
         if(_loc3_)
         {
            this.middleLeftSpyCam.setTextures(dictionary,this.leftTextures);
         }
         if(_loc4_)
         {
            this.middleRightSpyCam.setTextures(dictionary,this.rightTextures);
         }
      }
   }
   function reset()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.view = null;
   }
   function update()
   {
      this.topSpyCam.update();
      this.middleLeftSpyCam.update();
      this.middleRightSpyCam.update();
      this.bottomSpyCam.update();
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.03,{onCompleteScope:this,onComplete:this.update});
   }
}
