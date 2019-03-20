<%-- 
    Document   : PrintFile
    Created on : Mar 19, 2019, 10:51:30 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <table border="0" bgcolor="#808080" align="top" width="100%" style="position: relative; height: 100px">

            <td bgcolor="#000080" align="center">
                <p style="font-size: 38pt; color: #ffffff; font-family: Arial Rounded MT Bold">REPORT LEAVE REQUEST MII</p>
            </td>
            <td align="right" width="180">
                <img src="img/logo.png" style="background-color:white" width="180" height="160" align="right"/>
            </td>
        </tabel>

        <div class="md-form my-5">   
            <input type="hidden" id="id" name="id" class="form-control"/>
        </div>
        <div class="md-form my-5">
            <input type="hidden" id="jumlah" name="jumlah" class="form-control"/>
        </div>
        <div class="md-form my-5">
            <input type="hidden" id="jumlah" name="jumlah" class="form-control"/>
        </div>
        <div class="md-form my-5">
            <input type="hidden" id="jumlah" name="jumlah" class="form-control"/>
        </div>
        <div class="md-form my-5">
            <input type="hidden" id="jumlah" name="jumlah" class="form-control"/>
        </div>


        <table id="" class=" table table-striped" cellspacing='30'  align ='center' border="1" width="100%" style="position: relative; height: 100px">

            <thead>
                <tr>
                    <th>No.</th>
                    <th>Id</th>
                    <th>Jumlah Cuti</th>
                    <th>Karyawan Cuti</th>
                    <th>Request Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
               

            </tbody>
        </table>
</body>
</html>
