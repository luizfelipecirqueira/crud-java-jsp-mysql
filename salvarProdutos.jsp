<%@page import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int codigo;
            String nome, marca;
            double preco;

            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            preco = Double.parseDouble(request.getParameter("preco"));

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "");

                //Inserindo dados
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?, ?, ?, ?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, marca);
                st.setDouble(4, preco);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("Produto Cadastrado com Sucesso");
            } catch (Exception e) {
                String erro = e.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("Este produto já está cadastrado");
                } else {
                    out.print("Mensagem de erro: " + erro);
                }
            }
        %>
    </body>
</html>
