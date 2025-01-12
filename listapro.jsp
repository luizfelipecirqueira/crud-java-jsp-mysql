<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
    </head>
    <body>
        <%
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "");

                //Listar dados
                st = conecta.prepareStatement("SELECT * FROM produto");
                ResultSet resultado = st.executeQuery();

        %>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Preço</th>
            </tr>
            <%                    while (resultado.next()) {
            %>
            <tr>
                <td><%= resultado.getString("codigo")%></td>
                <td><%= resultado.getString("nome")%></td>
                <td><%= resultado.getString("marca")%></td>
                <td><%= resultado.getString("preco")%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception e) {
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>
