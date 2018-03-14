package Database;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.Twilio.SendSms;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
public class Access_Database {
	public void connect(String number)
	{
		SendSms vary=new SendSms();
		Connection con;
		Statement st,st1;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/BE_PROJECT","root","");
			st=(Statement)con.createStatement();
			ResultSet rst=st.executeQuery("select * from client where RFID_No='"+number+"'");
			if(rst.next())
			{
				String phone_number="+91"+rst.getString(5);
				String username=rst.getString(3);
				Boolean license=false,insurance=false;
				st1=(Statement)con.createStatement();
				ResultSet rst1=st1.executeQuery("select * from vehicle_details where RFID_No='"+number+"'");
				if(rst1.next())
				{
					if(rst1.getString(4).equals("yes"))
						license=true;
					if(rst1.getString(5).equals("yes"))
						insurance=true;
				}
				System.out.println(license);
				System.out.println(insurance);
				System.out.println(phone_number);
				vary.sms(phone_number,username,license,insurance);
			}
			else
			{
				System.out.println("Row update failed");
			}	
		
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
