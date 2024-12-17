package com.banco.model;
package apresentacao;

abstract public class Conta  implements Comparable<Conta>{

  private String numero;
  private double saldo;

  public Conta(String numero, double saldo) {
      this.numero = numero;
      this.saldo = saldo;
  }

  public String getNumero() { return numero; }
  public double getSaldo() { return saldo; }
  public void setSaldo(double saldo) { this.saldo = saldo; }

  // 
  protected String numero;
  // 
  protected double saldo;
  //
  protected String getNumero (  ) {
    return numero;
  }
  
  protected void setNumero ( String value  ) {
    numero = value;
  }
  
  protected double getSaldo (  ) {
    return saldo;
  }
  
  protected void setSaldo ( double value  ) {
    saldo = value;
  }
  
  abstract void creditar (double valor);
  
  abstract void debitar (double valor);
}
