class Select { 

  int _OBJ_SIZE_;
  int _OBJ_TOLERANCIA_ = 5;
  OBJ[] _OBJ_ = new OBJ[100];
  //=================================================================
  

  // Construtor da class
  //================================================================= 
  Select(OBJ[] _TMP_OBJ_, int _TMP_OBJ_SIZE_) 
  {
    this._OBJ_ = _TMP_OBJ_;
    this._OBJ_SIZE_ = _TMP_OBJ_SIZE_;
  }
  //=================================================================
  

  // Seleciona o circulo
  //================================================================= 
  boolean isCirculo ( float cx1, float cy1, float cx2, float cy2, float cx0, float cy0 )
  {
    float a,b;
    
    a=(abs(cx0)+abs(cy0))/2;
    b=sqrt((cx2-cx1)*(cx2-cx1)+(cy2-cy1)*(cy2-cy1));
    
    if(b<a+this._OBJ_TOLERANCIA_ && b>a-this._OBJ_TOLERANCIA_)
      return true;
    else 
      return false;   
  }

  // Corre os elementos todos para encontrar o seleccionado, se existir
  //================================================================= 
  int search() 
  {
    for (int i=0; i<=_OBJ_SIZE_; i++)
    {
      if (_OBJ_[i] != null) 
      {
        if (_OBJ_[i].getType() == "Linha")
        {
          if (mousePressed == true)
          {
            if (mouseX>_OBJ_[i].OBJ_vetor[0]-this._OBJ_TOLERANCIA_ && mouseX<_OBJ_[i].OBJ_vetor[2]+this._OBJ_TOLERANCIA_ && mouseY<_OBJ_[i].OBJ_vetor[3]+this._OBJ_TOLERANCIA_ && mouseY>_OBJ_[i].OBJ_vetor[1]-this._OBJ_TOLERANCIA_)
            {
              println("VOU SELECT O " + i);
              return i;
            }
          }
        }
        
        
        else if (_OBJ_[i].getType() == "Circulo")
        {
          if (mousePressed == true)
          {
            if(isCirculo (_OBJ_[i].OBJ_vetor[0], _OBJ_[i].OBJ_vetor[1], mouseX, mouseY, _OBJ_[i].OBJ_vetor[2], _OBJ_[i].OBJ_vetor[3] ))
              return i;
          }
        }
        
        
        else if (_OBJ_[i].getType() == "Poli Linha")
        {
          if (mousePressed == true)
          {
            for (int k=0; k<_OBJ_[i].getSizeOBJPoliVetor(); k++)
            {
              if (_OBJ_[i].OBJ_poliVetor[k] != null)
              { 
                if (mouseX>_OBJ_[i].OBJ_poliVetor[k][0]-this._OBJ_TOLERANCIA_ && mouseX<_OBJ_[i].OBJ_poliVetor[k][2]+this._OBJ_TOLERANCIA_ && mouseY<_OBJ_[i].OBJ_poliVetor[k][3]+this._OBJ_TOLERANCIA_ && mouseY>_OBJ_[i].OBJ_poliVetor[k][1]-this._OBJ_TOLERANCIA_)
                {
                  println("VOU SELECT O " + i);
                  return i;
                }
              }
            }
          }
        }
      }
    }
    return -1;
  }
}

