package com.banco.controller;

import com.banco.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ContaServlet extends HttpServlet {
    private Banco banco = new Banco();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("criar".equals(action)) {
            String tipo = request.getParameter("tipo-conta");
            String numero = request.getParameter("numero-conta");
            double saldo = Double.parseDouble(request.getParameter("saldo-inicial"));
            Conta conta;

            if ("especial".equals(tipo)) {
                double limite = Double.parseDouble(request.getParameter("limite-conta"));
                conta = new ContaEspecial(numero, saldo, limite);
            } else {
                conta = new Conta(numero, saldo);
            }

            banco.adicionarConta(conta);
        } else if ("remover".equals(action)) {
            String numero = request.getParameter("numero-conta");
            banco.removerConta(numero);
        }

        request.setAttribute("contas", banco.getContas());
        request.getRequestDispatcher("/conta.jsp").forward(request, response);
    }
}
