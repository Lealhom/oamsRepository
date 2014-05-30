

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static Connection getConn(){
		String driverclass="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/oams?useUnicode=true&characterEncoding=utf-8";//必须设置字符编码，否则插入到数据库里面是乱码
		String username="root";
		String password="mysql";
		try{ 
			Class.forName(driverclass).newInstance(); 
			Connection conn=DriverManager.getConnection(url,username,password); //获得连接  
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
