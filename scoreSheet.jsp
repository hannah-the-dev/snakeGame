<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Scores</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	body {
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 1rem;
	  font-weight: 400;
	}
    tr,
    td,
    th {
      border: 1px solid black;
      padding: 5px 10px 5px 10px;
    }

    table {
      border-collapse: collapse;
	  margin: 10px auto;
    }

    div {
      font-size: x-large;
      text-align: center;

    }
	p {
      text-align: center;	
	}
	
	:root {
	  --button-color: #ffffff;
	  --button-bg-color: #0d6efd;
	  --button-hover-bg-color: #025ce2;
	}

	button {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  
	  background: var(--button-bg-color);
	  color: var(--button-color);
	  
	  margin: 0;
	  padding: 0.5rem 1rem;
	  
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 1rem;
	  font-weight: 400;
	  text-align: center;
	  text-decoration: none;
	  
	  border: none;
	  border-radius: 4px;
	  
	  display: inline-block;
	  width: auto;
	  
	  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	  
	  cursor: pointer;
	  
	  transition: 0.5s;
	  --button-color: #212529;
	  --button-bg-color: #ffc107;
	  --button-hover-bg-color: #e0a800;
	}
	
	button:active,
	button:hover,
	button:focus {
	  background: var(--button-hover-bg-color);
      outline: 0;
	}

  </style>
</head>

<body>
  <% Class.forName("com.mysql.cj.jdbc.Driver"); Connection
    conn=DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root" , "kopoctc" ); Statement
    stmt=conn.createStatement(); %>
    <p>
      Thank you for playing!
    </p>
      <div>Who's the Winner? <br>
	<button onclick="location.href='snakeGame.html'">플레이 하러 가기</button>
		</div>
	  <table>
		<tr>
		  <th>Rank</th>
		  <th>Name</th>
		  <th>Score</th>
		</tr>
		<% String ranking="select *, rank() over (order by score desc) from snake_score" ; ResultSet
		rset=stmt.executeQuery(ranking); while (rset.next()) { %>
		<tr>
		  <td>
			<%=rset.getInt(3)%>
		  </td>
		  <td>
			<%=rset.getString(1)%>
		  </td>
		  <td>
			<%=rset.getInt(2)%>
		  </td>
		<tr>
		  <% } rset.close(); stmt.close(); conn.close(); %>
	  </table>
	 
		  

</body>

</html>