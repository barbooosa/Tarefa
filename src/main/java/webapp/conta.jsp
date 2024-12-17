<%@ page import="com.banco.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Gerenciamento de Contas</title>
</head>
<body>
<main>
    <h2>Gerenciamento de Contas</h2>
    <form action="conta" method="post">
        <input type="hidden" name="action" value="criar">
        <!-- Formulário para criação de contas -->
        <!-- ... -->
    </form>

    <table id="tabela-contas">
        <thead>
        <tr>
            <th>Número</th>
            <th>Tipo</th>
            <th>Saldo</th>
            <th>Limite</th>
        </tr>
        </thead>
        <tbody>
        <% for (Conta conta : (List<Conta>) request.getAttribute("contas")) { %>
            <tr>
                <td><%= conta.getNumero() %></td>
                <td><%= conta instanceof ContaEspecial ? "Especial" : "Normal" %></td>
                <td><%= conta.getSaldo() %></td>
                <td><%= conta instanceof ContaEspecial ? ((ContaEspecial) conta).getLimite() : "-" %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
</main>
</body>
</html>
