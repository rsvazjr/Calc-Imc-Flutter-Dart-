import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pessoa{

  static const _homem = 1;
  static const _mulher = 2;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  int genero; // (1) Homem | (2) Mulher

  Color color;
  String imcText;
  String imcSituationText;

  Pessoa(){
    weightController.text = '';
    heightController.text = '';
    imcText = '-';
    imcSituationText = 'Informe seus dados';
    color = Colors.black;
    genero = null;
  }

  void calculateImc() {

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100.0;
    double imc = weight / (height * height);
    imcText = "IMC = ${imc.toStringAsPrecision(2)}\n";

    if(genero == _homem){
      imcHomem(imc);
    }
    else if(genero == _mulher){
      imcMulher(imc);
    }
    else{ // Buscar como validar corretamente o radio btn!!
      imcText = '-';
      imcSituationText = "Ops! Genero Não definido";
    }
  }

  void imcHomem(double imc){

    if (imc < 20.7){
      color = Colors.blue[300];
      imcSituationText = "Frango";
    }
    else if (imc <= 26.4){
      color = Colors.green[300];
      imcSituationText = "Quase Monstro";
    }
    else if (imc <= 27.8){
      color = Colors.orange[300];
      imcSituationText = "Pesadinho";
    }
    else if (imc <= 31.1){
      color = Colors.orange[800];
      imcSituationText = "Pesado";
    }
  else{
      color = Colors.red[300];
      imcSituationText = "Gordo"; 
    }
  }

  void imcMulher(double imc){
    if (imc < 19.1){
      color = Colors.blue[300];
      imcSituationText = "Seca";
    }
    else if (imc <= 25.8){
      color = Colors.green[300];
      imcSituationText = "Boa";
    }
    else if (imc <= 27.3)
    {
      color = Colors.orange[300];
      imcSituationText = "GG";
    }
    else if (imc <= 32.3){
      color = Colors.orange[800];
      imcSituationText = "Gorda";
    }
    else{
      color = Colors.red[300];
      imcSituationText = "Gordona";
    }
  }
}