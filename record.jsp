<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<style>
        tr, td, th {
			border: 1px solid black;
			padding: 5px 10px 5px 10px;
		}
		table {
			border-collapse: collapse;
		}
	</style>
</head>
<body>
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
    Statement stmt = conn.createStatement();
    
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    int score = Integer.parseInt(request.getParameter("score"));
    if (name.length() > 20) {
        name = name.substring(20);
    }
    
    String insert = String.format(
        "insert into snake_score values ( '%s', %s );", name, score
		);
    stmt.execute(insert);
	stmt.close();
	conn.close();
	%>
<script>
location.href='scoreSheet.jsp'
</script
</body>
</html>