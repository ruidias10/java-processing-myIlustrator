class OBJ_PoliLine extends OBJ { 

  boolean ponto1 = false;
  boolean linhaFeita = false;
  
  double distancia;

  int x3, y3, tempx, tempy, segmentosIni, x4, y4, _OBJ_SIZE_; 
  int defaultStrokeWeight, pointSelect, OBJ_strokeWeight; 


  int OBJ_r, OBJ_g, OBJ_b;
  int OBJ_bgr, OBJ_bgg, OBJ_bgb;
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_PoliLine(int[] _bgColor, int[] _strokeColor, int _strokeWeight, int _defaultStrokeWeight)
  {
    this._OBJ_SIZE_ = 0;
    this.type="Poli Linha";
    this.pointSelect = -1;
    this.isvisible = true;
    this.OBJ_poliVetor = new int[30][4];
    
    this.OBJ_bgr = _bgColor[0];
    this.OBJ_bgg = _bgColor[1];
    this.OBJ_bgb = _bgColor[2];
    
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
      for (int i=0; i<=this._OBJ_SIZE_; i++)
      {
        if (OBJ_poliVetor[i] != null) {
         line(this.OBJ_poliVetor[i][0],this.OBJ_poliVetor[i][1],this.OBJ_poliVetor[i][2],this.OBJ_poliVetor[i][3]);
        }
      }    
      fill(this.OBJ_bgr, this.OBJ_bgg, this.OBJ_bgb);
      strokeWeight(this.defaultStrokeWeight);
    } 
  }

 
 
    boolean desenha(boolean snap, int gridX, int gridY)
    {
      if(this.linhaFeita==false)
      {
        if((mousePressed && (mouseButton == LEFT)) && this.ponto1==false)
        {
          this.x3 = mouseX;
          this.y3 = mouseY;
          
          if (this.isValidatePosition() == true)
          {
            this.ponto1=true;
            mousePressed=false;
            this.tempx=x3;
            this.tempy=y3;
          } 
        }
     
     
        if( this.ponto1==true )
        {
          //if(mouseX<78)mouseX=78;
          this.validatePosition();
          line(this.x3,this.y3,mouseX,mouseY);

          if(this.segmentosIni>1)
          {
            this.distancia = sqrt((mouseX-this.tempx)*(mouseX-this.tempx)+(mouseY-this.tempy)*(mouseY-this.tempy));
            if (this.distancia<20)
             { 
              fill(255, 255, 255);
              stroke(79, 128, 255);
              rect(this.tempx-4, this.tempy-4, 8, 8);
              stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
             }
          }
        }
    
        if ((mousePressed && (mouseButton == LEFT)) && this.ponto1==true && segmentosIni<2)
        {
          if(mouseX>78)
          {
            this.x4 = mouseX;
            this.y4 = mouseY;
            line(this.x3,this.y3,this.x4,this.y4);
            this.segmentosIni++;
            this.OBJ_poliVetor[this._OBJ_SIZE_][0]=this.x3;
            this.OBJ_poliVetor[this._OBJ_SIZE_][1]=this.y3;
            this.OBJ_poliVetor[this._OBJ_SIZE_][2]=this.x4;
            this.OBJ_poliVetor[this._OBJ_SIZE_][3]=this.y4;
            this._OBJ_SIZE_++;
 
            this.x3=this.x4;
            this.y3=this.y4;
            this.x4=0;
            this.y4=0;
            mousePressed=false;
          }  
        }
     
        if ((mousePressed && (mouseButton == LEFT)) && this.ponto1==true && this.segmentosIni>1)
        {
          if(mouseX>78 && mouseY>0)
          {
            this.x4 = mouseX;
            this.y4 = mouseY;
            this.distancia = sqrt((this.x4-this.tempx)*(this.x4-this.tempx)+(this.y4-this.tempy)*(this.y4-this.tempy));
            
            if (this.distancia <= 10)
            {
              line(this.x3,this.y3,this.tempx,this.tempy);
              this.OBJ_poliVetor[this._OBJ_SIZE_][0]=this.x3;
              this.OBJ_poliVetor[this._OBJ_SIZE_][1]=this.y3;
              this.OBJ_poliVetor[this._OBJ_SIZE_][2]=this.tempx;
              this.OBJ_poliVetor[this._OBJ_SIZE_][3]=this.tempy;
              this._OBJ_SIZE_++;

              this.x3=0;
              this.y3=0;
              this.x4=0;
              this.y4=0;
              this.linhaFeita=false;
              this.ponto1=false;
              this.segmentosIni=0;               
              mousePressed=false;


              return true;
            }
            else 
            { 
              line(this.x3,this.y3,this.x4,this.y4);
              this.OBJ_poliVetor[this._OBJ_SIZE_][0]=this.x3;
              this.OBJ_poliVetor[this._OBJ_SIZE_][1]=this.y3;
              this.OBJ_poliVetor[this._OBJ_SIZE_][2]=this.x4;
              this.OBJ_poliVetor[this._OBJ_SIZE_][3]=this.y4;
              this._OBJ_SIZE_++;
              //  manda para array 
              //OBJ_poliVetor = new float[4];
              this.x3=this.x4;
              this.y3=this.y4;
              this.x4=0;
              this.y4=0;
              mousePressed=false;
              
              //return true;
            }
          }
         
          //return true;         
         
        }
        //return true;   
        //return true;  
      }
      
      
    return false;
   } 
  //=================================================================


  //  Inicia o processo de desenhar
  //================================================================= 
  boolean edita()
  {
     for (int i = 0; i< this.getSizeOBJPoliVetor(); i++)
     {
       this.elementToEdit(this.OBJ_poliVetor[i][0],this.OBJ_poliVetor[i][1]);
     }
     
     if (mousePressed && (mouseButton == LEFT))
     {
       for (int i = 0; i< this.getSizeOBJPoliVetor(); i++)
       {
         if (mouseX>this.OBJ_poliVetor[i][0]-20 && mouseX<this.OBJ_poliVetor[i][0]+20 && mouseY<this.OBJ_poliVetor[i][1]+20 && mouseY>this.OBJ_poliVetor[i][1]-20)
         {
           this.pointSelect = i;
         }
       }
     }
     else
     {
       this.pointSelect = -1;
     }
     
     if (this.pointSelect > -1){
        this.OBJ_poliVetor[this.pointSelect][0] = mouseX;
        this.OBJ_poliVetor[this.pointSelect][1] = mouseY;
        
        int ptChange = this.pointSelect;
        if (this.pointSelect == 0){
          ptChange = (this._OBJ_SIZE_) -1;
        }
        else{
          ptChange = this.pointSelect-1;
        }
        this.OBJ_poliVetor[ptChange][2] = mouseX;
        this.OBJ_poliVetor[ptChange][3] = mouseY;
     }
     
     if (mouseButton == RIGHT){
       return true;
     }
     
/*
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
*/
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





