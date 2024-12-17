<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Bancário</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Sistema Bancário</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#gerenciamento">Gerenciamento de Contas</a></li>
                <li><a href="#exportar">Exportar Dados</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <!-- Home Section -->
        <section id="home">
            <h2>Bem-vindo ao Sistema Bancário</h2>
            <p>Gerencie suas contas de forma simples e rápida!</p>
        </section>

        <!-- Gerenciamento de Contas Section -->
        <section id="gerenciamento">
            <h2>Gerenciamento de Contas</h2>
            <form id="criar-conta-form" action="CriarContaServlet" method="post">
                <h3>Criar Conta</h3>
                <label for="tipo-conta">Tipo de Conta:</label>
                <select id="tipo-conta" name="tipoConta" required>
                    <option value="normal">Normal</option>
                    <option value="especial">Especial</option>
                </select>
                <label for="numero-conta">Número da Conta:</label>
                <input type="text" id="numero-conta" name="numeroConta" required>
                <label for="saldo-inicial">Saldo Inicial:</label>
                <input type="number" id="saldo-inicial" name="saldoInicial" required>
                <div id="limite-container" style="display: none;">
                    <label for="limite-conta">Limite:</label>
                    <input type="number" id="limite-conta" name="limiteConta">
                </div>
                <button type="submit">Criar Conta</button>
            </form>

            <table id="tabela-contas">
                <thead>
                    <tr>
                        <th>Número</th>
                        <th>Tipo</th>
                        <th>Saldo</th>
                        <th>Limite</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Exemplo de código para carregar dados de contas do backend
                        List<Conta> contas = (List<Conta>) request.getAttribute("contas");
                        if (contas != null) {
                            for (Conta conta : contas) {
                    %>
                        <tr>
                            <td><%= conta.getNumeroConta() %></td>
                            <td><%= conta.getTipoConta() %></td>
                            <td><%= conta.getSaldo() %></td>
                            <td><%= conta.getLimite() %></td>
                            <td>
                                <form action="ExcluirContaServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="numeroConta" value="<%= conta.getNumeroConta() %>">
                                    <button type="submit">Excluir</button>
                                </form>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </section>

        <!-- Exportar Dados Section -->
        <section id="exportar">
            <h2>Exportar Dados</h2>
            <form action="ExportarDadosServlet" method="post" style="display:inline;">
                <button type="submit" name="formato" value="xml">Exportar como XML</button>
            </form>
            <form action="ExportarDadosServlet" method="post" style="display:inline;">
                <button type="submit" name="formato" value="pdf">Exportar como PDF</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema Bancário. Todos os direitos reservados.</p>
    </footer>
</body>
</html>
