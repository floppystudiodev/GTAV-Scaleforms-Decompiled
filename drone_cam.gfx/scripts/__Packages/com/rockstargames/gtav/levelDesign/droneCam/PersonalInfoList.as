class com.rockstargames.gtav.levelDesign.droneCam.PersonalInfoList
{
   var line;
   var view;
   function PersonalInfoList(view, visible, line)
   {
      this.view = view;
      this.line = line;
      this.visible = visible;
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.title,"DRONE_INFO_TITLE");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item1.label,"DRONE_INFO_0");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item2.label,"DRONE_INFO_1");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item3.label,"DRONE_INFO_2");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item4.label,"DRONE_INFO_3");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item5.label,"DRONE_INFO_4");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item6.label,"DRONE_INFO_6");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item7.label,"DRONE_INFO_8");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item8.label,"DRONE_INFO_5");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item9.label,"DRONE_INFO_7");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item10.label,"DRONE_INFO_9");
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(this.view.item11.label,"DRONE_INFO_10");
      var _loc4_ = this.view.item1.value._x + this.view.item1.value._width;
      var _loc3_ = 1;
      var _loc2_;
      while(_loc3_ <= 10)
      {
         _loc2_ = this.view["item" + _loc3_];
         _loc2_.value._x = _loc2_.label._x + _loc2_.label.textWidth + 10;
         _loc2_.value._width = _loc4_ - _loc2_.value._x;
         _loc3_ = _loc3_ + 1;
      }
   }
   function set visible(isVisible)
   {
      this.line._visible = isVisible;
      this.view._visible = isVisible;
   }
   function setData(rank, earnings, kills, deaths, vehicle, accuracy, radioStation, weapon, privateDances, numHoes, gamertag)
   {
      this.view.item1.value.text = gamertag != undefined ? gamertag : "";
      this.view.item2.value.text = this.formatNumber(rank);
      this.view.item3.value.text = "$" + this.formatNumber(earnings);
      this.view.item4.value.text = this.formatNumber(kills);
      this.view.item5.value.text = this.formatNumber(deaths);
      this.view.item6.value.text = Math.round(accuracy) + "%";
      this.view.item7.value.text = weapon;
      this.view.item8.value.text = vehicle;
      this.view.item9.value.text = radioStation;
      this.view.item10.value.text = !isNaN(privateDances) ? this.formatNumber(privateDances) : "0";
      this.view.item11.value.text = this.formatNumber(numHoes);
      var _loc2_ = 1;
      while(_loc2_ <= 10)
      {
         this.addEllipsis(this.view["item" + _loc2_].value);
         _loc2_ = _loc2_ + 1;
      }
   }
   function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   function addEllipsis(tf)
   {
      var _loc3_ = tf.text;
      var _loc1_;
      if(tf.textWidth > tf._width - 4)
      {
         _loc1_ = _loc3_.length;
         while(_loc1_ > 0)
         {
            tf.text = _loc3_.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
}
