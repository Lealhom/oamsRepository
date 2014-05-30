

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static Connection getConn(){
		String driverclass="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/oams?useUnicode=true&characterEncoding=utf-8";//���������ַ����룬������뵽���ݿ�����������
		String username="root";
		String password="mysql";
		try{ 
			Class.forName(driverclass).newInstance(); 
			Connection conn=DriverManager.getConnection(url,username,password); //�������  
			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;

	}
	public static void main(String args[]){
		Connection conn = getConn();
System.out.println(conn.toString());
	}
}
