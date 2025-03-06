class com.rockstargames.gtav.web.WWW_TACO_D_BOMB_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var OnColour;
   var OffColour;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var products;
   var productMcs;
   var productsImagesHolder;
   var currentProduct;
   var mcScope;
   var phrases;
   var phraseMcs;
   var phrasesHolder;
   var currentPhrase;
   var CONTENT;
   var dataTextScope;
   function WWW_TACO_D_BOMB_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "LEARN";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.browser = _level0.TIMELINE;
      this.OnColour = 4879155;
      this.OffColour = 0;
      this.defaultButtonOnColour = 4879155;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function setupProducts()
   {
      if(!this.products)
      {
         this.products = [];
         this.products.push({imageMc:"taco_matador",name:"El Matador Verde Breakfast Burrito",price:"$2.00",desc:"Deliciously deathly. Start your day the right way"});
         this.products.push({imageMc:"taco_flappers",name:"Cheesy Meat Flappers",price:"99&#162;",desc:"Meat on the outside, taco on the inside!"});
         this.products.push({imageMc:"taco_salad",name:"Hot Mess<br>Deep-fried Salad",price:"$1.50",desc:"Putting the purge in splurge. Indulge<br>yourself guilt-free"});
         this.products.push({imageMc:"taco_nachos",name:"Volcanic Mudsplatter Nachos",price:"89&#162;",desc:"Enjoy the crunch now and the hot sauce later"});
         this.products.push({imageMc:"taco_bazooka",name:"2lb Foaming<br>Beef-ish Bazooka",price:"$1.70",desc:"Blast your metabolism to Guadalajara and back!"});
         this.products.push({imageMc:"taco_chiquito",name:"Chimichingado Chiquito",price:"79&#162;",desc:"A week\'s worth of saturated fat to make your bambinos grow big and strong"});
      }
      this.productMcs = [];
      if(this.productsImagesHolder)
      {
         this.productsImagesHolder.removeMovieClip();
         this.productsImagesHolder = null;
      }
      this.currentProduct = 0;
      this.createProduct(this.products[this.currentProduct]);
   }
   function showProduct(prevNext)
   {
      if(prevNext == "prev")
      {
         this.currentProduct = this.currentProduct - 1;
         if(this.currentProduct < 0)
         {
            this.currentProduct = this.products.length - 1;
         }
      }
      else
      {
         this.currentProduct = this.currentProduct + 1;
         if(this.currentProduct >= this.products.length)
         {
            this.currentProduct = 0;
         }
      }
      var _loc4_ = this.createProduct(this.products[this.currentProduct]);
      var _loc3_ = undefined;
      var _loc2_ = 480;
      _loc4_._x = _loc2_ * this.currentProduct;
      _loc3_ = this.currentProduct * _loc2_ * -1 + 82;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.productsImagesHolder,0.5,{_x:_loc3_,ease:3,onComplete:this.cleanUpProduct,onCompleteScope:this});
   }
   function createProduct(prodObject)
   {
      var _loc2_ = this.mcScope.products;
      if(!this.productsImagesHolder)
      {
         this.productsImagesHolder = _loc2_.createEmptyMovieClip("productsImagesHolder",_loc2_.getNextHighestDepth());
         this.productsImagesHolder._x = 82;
         this.productsImagesHolder._y = 112;
         this.productsImagesHolder.setMask(_loc2_.imageMask);
      }
      var _loc4_ = this.productsImagesHolder.attachMovie(prodObject.imageMc,"product_" + this.currentProduct,this.productsImagesHolder.getNextHighestDepth());
      this.productMcs.push(_loc4_);
      _loc2_.productName.htmlText = prodObject.name;
      _loc2_.productDescription.htmlText = prodObject.desc;
      _loc2_.productPrice.htmlText = prodObject.price;
      return _loc4_;
   }
   function cleanUpProduct()
   {
      while(this.productMcs.length > 1)
      {
         var _loc2_ = this.productMcs.shift();
         MovieClip(_loc2_).removeMovieClip();
      }
   }
   function setupPhrases()
   {
      if(!this.phrases)
      {
         this.phrases = [];
         this.phrases.push({buttonId:"TACO_PHRASE1",english:"My taco looks so tasty!",spanish:"Mi taco tiene pinta de vagina podrida"});
         this.phrases.push({buttonId:"TACO_PHRASE2",english:"Where are the toilets?",spanish:"Mi colon est&#225; a punto de explotar"});
         this.phrases.push({buttonId:"TACO_PHRASE3",english:"This burrito is so filling!",spanish:"Necesito una ces&#225;rea de emergencia"});
         this.phrases.push({buttonId:"TACO_PHRASE4",english:"This is such a treat!",spanish:"Mi perro come mejor"});
         this.phrases.push({buttonId:"TACO_PHRASE5",english:"The nachos smell delicious!",spanish:"Los nachos huelen a v&#243;mito de elefante"});
         this.phrases.push({buttonId:"TACO_PHRASE6",english:"What a nutritious meal!",spanish:"Me duele el brazo derecho"});
         this.phrases.push({buttonId:"TACO_PHRASE7",english:"I feel so revived!",spanish:"Mi perineo se est&#225; derritiendo"});
      }
      this.phraseMcs = [];
      if(this.phrasesHolder)
      {
         this.phrasesHolder.removeMovieClip();
         this.phrasesHolder = null;
      }
      this.currentPhrase = 0;
      this.createPhrase(this.phrases[this.currentPhrase]);
   }
   function showPhrase(prevNext)
   {
      if(prevNext == "prev")
      {
         this.currentPhrase = this.currentPhrase - 1;
         if(this.currentPhrase < 0)
         {
            this.currentPhrase = this.phrases.length - 1;
         }
      }
      else
      {
         this.currentPhrase = this.currentPhrase + 1;
         if(this.currentPhrase >= this.phrases.length)
         {
            this.currentPhrase = 0;
         }
      }
      var _loc4_ = this.createPhrase(this.phrases[this.currentPhrase]);
      var _loc3_ = undefined;
      var _loc2_ = 480;
      _loc4_._x = _loc2_ * this.currentPhrase;
      _loc3_ = this.currentPhrase * _loc2_ * -1 + 278;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.phrasesHolder,0.5,{_x:_loc3_,ease:3,onComplete:this.cleanUpPhrase,onCompleteScope:this});
   }
   function createPhrase(phraseObject)
   {
      if(!this.phrasesHolder)
      {
         this.phrasesHolder = this.mcScope.createEmptyMovieClip("phrasesHolder",this.mcScope.getNextHighestDepth());
         this.phrasesHolder._x = 278;
         this.phrasesHolder._y = 581;
         this.phrasesHolder.setMask(this.mcScope.phraseMask);
      }
      var _loc4_ = this.phrasesHolder.attachMovie("learn_text","phrase_" + this.currentPhrase,this.phrasesHolder.getNextHighestDepth());
      this.phraseMcs.push(_loc4_);
      _loc4_.english.htmlText = phraseObject.english;
      _loc4_.spanish.htmlText = phraseObject.spanish;
      var _loc2_ = 0;
      while(_loc2_ < this.phrases.length)
      {
         var _loc3_ = this.phrases[_loc2_];
         var _loc5_ = this.mcScope[_loc3_.buttonId];
         _loc5_._y = -200;
         this.browser.DISABLE_BUTTON(_loc2_,true);
         _loc2_ = _loc2_ + 1;
      }
      _loc5_ = this.mcScope[phraseObject.buttonId];
      _loc5_._y = 713;
      this.browser.DISABLE_BUTTON(this.currentPhrase,false);
      return _loc4_;
   }
   function playPhrase()
   {
      this.mcScope.paco.gotoAndPlay("TALK");
   }
   function cleanUpPhrase()
   {
      while(this.phraseMcs.length > 1)
      {
         var _loc2_ = this.phraseMcs.shift();
         MovieClip(_loc2_).removeMovieClip();
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      switch(_loc2_[0])
      {
         case "product":
            this.showProduct(_loc2_[1]);
            break;
         case "learn":
            this.showPhrase(_loc2_[1]);
            break;
         case "TACO":
            this.playPhrase();
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      switch(pageName)
      {
         case "PAGE1":
            this.dataTextScope = [];
            this.dataTextScope[0] = this.mcScope.product_prev.btnTxt;
            this.dataTextScope[1] = this.mcScope.product_next.btnTxt;
            this.dataTextScope[2] = this.mcScope.LEARN.btnTxt;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.setupProducts();
            break;
         case "LEARN":
            this.dataTextScope = [];
            this.dataTextScope[0] = this.mcScope.TACO_PHRASE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.TACO_PHRASE2.btnTxt;
            this.dataTextScope[2] = this.mcScope.TACO_PHRASE3.btnTxt;
            this.dataTextScope[3] = this.mcScope.TACO_PHRASE4.btnTxt;
            this.dataTextScope[4] = this.mcScope.TACO_PHRASE5.btnTxt;
            this.dataTextScope[5] = this.mcScope.TACO_PHRASE6.btnTxt;
            this.dataTextScope[6] = this.mcScope.TACO_PHRASE7.btnTxt;
            this.dataTextScope[7] = this.mcScope.product_prev.btnTxt;
            this.dataTextScope[8] = this.mcScope.product_next.btnTxt;
            this.dataTextScope[9] = this.mcScope.learn_prev.btnTxt;
            this.dataTextScope[10] = this.mcScope.learn_next.btnTxt;
            this.dataTextScope[11] = this.mcScope.PAGE1.btnTxt;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.setupProducts();
            this.setupPhrases();
      }
   }
}
