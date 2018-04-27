/*
  ProjetDrago
    By Yann FORNER v1
*/

int menu=0;
boolean isEauChaudePleine=false;
boolean isEauChaude=false;
int yRect=-1;

PImage fond1;
PImage buttonStart;
PImage schema;

PImage fond2;



void setup(){
  size(750,600);
  frameRate(60);
  
  fond1=loadImage("fond1.png");
  buttonStart=loadImage("buttonStart.png");
  
  fond2=loadImage("fond2.png");
  schema=loadImage("schema.png");
}

void draw(){
  if (menu==0){
    image(fond1,0,0);
    image(buttonStart,275,250);
  }//menu
  if (menu==1){
    image(fond2,0,0);
    if(isEauChaude==true){
      rect(516,515,161,yRect);
      fill(43,152,245,125);
      noStroke();
      if(yRect>=-180){
        yRect=yRect-5;
      }
      
    }
    image(schema,200,80);
  }//animation
  if (menu==2){
  }//Graphique
  if (menu==3){
  }//Tableau
 
}
void RemplissageEau(){

}

void mousePressed(){
  if (menu==0){
    if(mouseX<=475 && mouseX>=275 && mouseY>=250 && mouseY<=350){
      menu=1;
    }//buttonStart
  }//menu
  if (menu==1){
    if(mouseX<=108 && mouseX>=25 && mouseY>=213 && mouseY<=252){
      isEauChaude=true;
    }//buttonEauChaude
  }//Schema
}
