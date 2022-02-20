/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package adminregister.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import adminregister.db.ConnectionManager;
import adminregister.model.adminregister;


/**
 *
 * @author User
 */
public class adminregisterDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;

	private int adminid,adminphonenum;
	private String adminname,adminusername,adminemail,adminpwd;
        
        
        //add glampingscape
        public void addgadminregister(adminregister bean) {
        adminname = bean.getAdminname();
		adminusername = bean.getAdminusername();
		adminphonenum = bean.getAdminphonenum();
        adminemail = bean.getAdminemail();
        adminpwd = bean.getAdminpwd();
		
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//create statement
			ps = con.prepareStatement("INSERT INTO admin(adminname,adminusername,adminphonenum,adminemail,adminpwd)VALUES(?,?,?,?,?)");
			ps.setString(1, adminname);
			ps.setString(2, adminusername);
			ps.setInt(3, adminphonenum);
            ps.setString(4, adminemail);
            ps.setString(5, adminpwd);
		
			//execute query
			ps.executeUpdate();
			System.out.println("Successfully inserted");
			
			//close connection
			con.close();
			}catch(Exception e)
                        {
                            e.printStackTrace();
			}
        }
        
        //get all glampingscape
	public static List<adminregister> getAlladminregister(){
		List<adminregister> adminregister = new ArrayList<adminregister>();
		
		try {
			con = ConnectionManager.getConnection();
			
			stmt = con.createStatement();
			String sql = "SELECT * FROM admin ORDER BY adminid";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				adminregister a = new adminregister();
				
				a.setAdminid(rs.getInt("adminid"));
				a.setAdminname(rs.getString("adminname"));
                a.setAdminusername(rs.getString("adminusername"));
                a.setAdminphonenum(rs.getInt("adminphonenum"));
                a.setAdminemail(rs.getString("adminemail"));
                a.setAdminpwd(rs.getString("adminpwd"));
                              
				adminregister.add(a);
			}
			
			//close connection
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return adminregister;
		
	}
              
	
	//get all by id
	public static adminregister getadminregisterById(int adminid) {
		
		adminregister a = new adminregister();
		
		try {
		con = ConnectionManager.getConnection();
		
		//create statement
		ps = con.prepareStatement("SELECT * FROM admin where adminid = ?");
		ps.setInt(1, adminid);
		
		
		rs = ps.executeQuery();
		if(rs.next()) {
			a.setAdminid(rs.getInt("adminid"));
			a.setAdminname(rs.getString("adminname"));
            a.setAdminusername(rs.getString("adminusername"));
            a.setAdminphonenum(rs.getInt("adminphonenum"));
            a.setAdminemail(rs.getString("adminemail"));
            a.setAdminpwd(rs.getString("adminpwd"));
		}
		
		//close connection
		con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
		
	}  
        
        //delete glampingscape
	public void deleteadminregister(int adminid) {
		
		try {
			
			con = ConnectionManager.getConnection();
			
			//create statement
			ps = con.prepareStatement("DELETE FROM admin where adminid = ?");
			ps.setInt(1, adminid);
			
			ps.executeUpdate();
			
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//update glampingscape
	public void updateadminregister(adminregister bean) {
		 adminid= bean.getAdminid();
		 adminname = bean.getAdminname();
		 adminusername = bean.getAdminusername();
		 adminphonenum = bean.getAdminphonenum();
	     adminemail = bean.getAdminemail();
	     adminpwd = bean.getAdminpwd();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement("UPDATE admin set adminid=?, adminname=?, adminusername=?, adminphonenum=?,adminemail=?,adminpwd=?");
			
			ps.setInt(1, adminid);
			ps.setString(2, adminname);
			ps.setString(3, adminusername);
			ps.setInt(4, adminphonenum);
            ps.setString(5, adminemail);
            ps.setString(6, adminpwd);
			
			//execute query
			ps.executeUpdate();
			System.out.println("Successfully updated");
			
			//close connection
			con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
        }

}

    
    


   

