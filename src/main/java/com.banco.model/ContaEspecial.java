package apresentacao;
package com.banco.model;

public class ContaEspecial extends Conta {
    private double limite;

    public ContaEspecial(String numero, double saldo, double limite) {
        super(numero, saldo);
        this.limite = limite;
    }

      public double getLimite() { return limite; }
      public void setLimite(double limite) { this.limite = limite; }
        protected double limite;
    
    protected void setLimite ( double value  ) {
      limite = value;
    }
    
    protected double getLimite () {
      return limite;
    }
    
    public void creditar ( double valor) {
      saldo = saldo + valor;
    }
}


