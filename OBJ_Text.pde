class OBJ_Text extends OBJ { 

  //////PFont font_;
  //////ControlFont cFont_;
  String typedText = "your text here";
  
  PFont font;


  
  
  boolean ponto1 = false;
  boolean linhaFeita = false;
  boolean terminado = false;
  
  
  int x1, y1, x2, y2;
  
  int[] vetor = new int[4];
  int[] OBJ_strokeColor = new int[3];
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Text(int[] _strokeColor)
  {
    this.type="Texto";
    this.isvisible = true;
    
    
/////////font = loadFont("ArialUnicodeMS-14.vlw");
/////////textFont(font, 14);

    
    
    //this.font = createFont("Helvetica", 18); 
    //////this.font_ = createFont("Times New Roman",20,true); // use true/false for smooth/no-smooth
    //////this.font_ = createFont("Helvetica",20,true); // use true/false for smooth/no-smooth
    //////cFont_ = new ControlFont(this.font_,241);
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if ((this.isvisible == true) && (this.terminado == true))
    {
      /////textFont(this.font_,18);
      text(this.typedText, this.vetor[0], this.vetor[1]);
      //////textFont(this.font_,10);

      
      
    /////////font = loadFont("ArialUnicodeMS-14.vlw");
    /////////textFont(font, 14);
    }
  }
  //=================================================================



  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha()
  {
    
//////textFont(this.font_,18);
    if (this.linhaFeita == false )
    {
     

      if(this.ponto1 == false) 
      {
        if (mousePressed && (mouseButton == LEFT))
        {
          this.x1 = mouseX;
          this.y1 = mouseY; 
          
                    this.vetor[0]=this.x1;
          this.vetor[1]=this.y1;
          
          if(mouseX>78) this.ponto1=true;   
        }
      
      }
    
    
      if(this.ponto1==true)
      {
        

        
        ///////////if(mouseX<78)mouseX=78;
        
          ////////////////////////////////////////
   if ((keyPressed) && (key != CODED)) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      typedText += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      typedText += key;
    }
  } 
        /////////////////////////////////////////   


          text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), this.x1, this.y1);
      }
    
      if(this.ponto1==true)
      {
        
        
     
        
        if (mousePressed && (mouseButton == RIGHT))
        {
          this.linhaFeita=true;
          //this.vetor[0]=this.x1;
          //this.vetor[1]=this.y1;

          this.ponto1=false;
          this.linhaFeita=false;
         
          this.terminado = true;
         
          return true;
        }
      }
    }
    return false;
   }   
}   
