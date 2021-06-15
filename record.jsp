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
    if (name.length() > 20) 
        name = name.substring(20);
    
    String insert = String.format(
        "insert into snake_score values ( '%s', %s );", name, score
		);
    stmt.execute(insert);
    int updateCount = stmt.getUpdateCount();
    if (updateCount > 0) {
    %>
    <div>
        <%= name %>'s score <%= score %> has been recorded.
    </div>
	<table>
		<tr>
			<th>Rank</th>
			<th>Name</th>
			<th>Score</th>
		</tr>
    <% 
	} 
	String ranking =
		"select *, rank() over (order by score desc) from snake_score";
	ResultSet rset = stmt.executeQuery(ranking);
	while (rset.next()) {
	%>
		<tr>
			<td><%=rset.getInt(3)%></td>
			<td><%=rset.getString(1)%></td>
			<td><%=rset.getInt(2)%></td>

		<tr>
	<%
	}
	rset.close();
	stmt.close();
	conn.close();
	%>
	<button onclick="location.href='snakeGame.html'">돌아가기</button>

</body>
</html>