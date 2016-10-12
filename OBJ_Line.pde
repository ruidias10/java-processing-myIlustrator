class OBJ_Line extends OBJ { 

  boolean ponto1 = false;
  boolean linhaFeita = false;
  
  int x1, y1, x2, y2;
  int defaultStrokeWeight, pointSelect;
  
  int OBJ_strokeWeight;
  int OBJ_r, OBJ_g, OBJ_b;
  
  //int[] OBJ_vetor = new int[4];
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Line(int[] _strokeColor, int _strokeWeight, int _defaultStrokeWeight)
  {
    this.type="Linha";
    this.pointSelect = 0;
    this.isvisible = true;
    this.OBJ_vetor = new int[4];
    
    this.OBJ_r = _strokeColor[0];
    this.OBJ_g = _strokeColor[1];
    this.OBJ_b = _strokeColor[2];
    
    this.OBJ_strokeWeight = _strokeWeight;
    this.defaultStrokeWeight = _defaultStrokeWeight;
    
    stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if (this.isvisible == true)
    {
      strokeWeight(this.OBJ_strokeWeight);
      stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
      line(this.OBJ_vetor[0],this.OBJ_vetor[1],this.OBJ_vetor[2],this.OBJ_vetor[3]);
      strokeWeight(this.defaultStrokeWeight);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha(boolean snap, int gridX, int gridY)
  {
    if (this.linhaFeita==false )
    {
      if(this.ponto1==false) 
      {
        if (mousePressed && (mouseButton == LEFT))
        {
          if (snap == true)
          {
            this.x1 = (int)mouseX/gridX;
            this.y1 = (int)mouseY/gridY; 
            
            this.x1 = this.x1*gridX+5;
            this.y1 = this.y1*gridY+2;
          }
          else
          {
            this.x1 = mouseX;
            this.y1 = mouseY; 
          }

          if (this.isValidatePosition() == true)
            this.ponto1=true;
        }
      }
    
      if(this.ponto1==true && this.linhaFeita==false)
      {
        this.validatePosition();
        
        // faz a linha exata
        if (keyPressed && (int(key) == 65535))
        {
          if ((this.x1 - mouseX) > (this.y1 - mouseY))
            line(this.x1,this.y1,this.x1,mouseY);
          else
            line(this.x1,this.y1,mouseX,this.y1);
        }
         else
          line(this.x1,this.y1,mouseX,mouseY);
      }
    
      if(this.ponto1==true)
      {
        if (mousePressed==false)
        {
          if (snap == true)
          {
            this.x2 = (int)mouseX/gridX;
            this.y2 = (int)mouseY/gridY; 
            
            this.x2 = this.x2*gridX+5;
            this.y2 = this.y2*gridY+2;
          }
          else
          {
            this.x2 = mouseX;
            this.y2 = mouseY;
          }  
    
          line(this.x1,this.y1,this.x2,this.y2);

          this.OBJ_vetor[0]=this.x1;
          this.OBJ_vetor[1]=this.y1;
          this.OBJ_vetor[2]=this.x2;
          this.OBJ_vetor[3]=this.y2;
          
          return true;
        }
      }
    }
    return false;
   } 
  //=================================================================


  //  Inicia o processo de editar
  //================================================================= 
  boolean edita()
  {
     this.elementToEdit(this.OBJ_vetor[0],this.OBJ_vetor[1]);
     this.elementToEdit(this.OBJ_vetor[2],this.OBJ_vetor[3]);
     
     if (mousePressed && (mouseButton == LEFT))
     {
       if (mouseX>this.OBJ_vetor[0]-20 && mouseX<this.OBJ_vetor[0]+20 && mouseY<this.OBJ_vetor[1]+20 && mouseY>this.OBJ_vetor[1]-20){
         this.pointSelect = 1;
       }
       
       else if (mouseX>this.OBJ_vetor[2]-20 && mouseX<this.OBJ_vetor[2]+20 && mouseY<this.OBJ_vetor[3]+20 && mouseY>this.OBJ_vetor[3]-20){
         this.pointSelect = 2;
       }
     }
     else {
       this.pointSelect = 0;
     }
     
     if (this.pointSelect == 1){
        this.OBJ_vetor[0] = mouseX;
        this.OBJ_vetor[1] = mouseY;
     }
     else if (this.pointSelect == 2){
        this.OBJ_vetor[2] = mouseX;
        this.OBJ_vetor[3] = mouseY; 
     }

     if (mouseButton == RIGHT)
     {
       return true;
     }
      
     return false;
  }
  //=================================================================


  // Desenha quadrados nos pontos para depois editar
  //=================================================================
  void elementToEdit(float px,float py)
  {
    stroke(79, 128, 255);
    fill(255, 255, 255);
    rect(px-3, py-3, 6,6);
    noFill();
    stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);      
  }
}   
