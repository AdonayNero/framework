<%-- 
    Document   : GetRol
    Created on : 31-ago-2018, 16:31:09
    Author     : Manuel Orellana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <jsp:include page="../pages/head_folder.html" />
    <jsp:include page="../pages/nav_folder.html" />
    </head>
    <body>
         <div id="content-wrapper">
            <div class="container-fluid">
                     <div class="card mb-3">
                    <!-- DataTables Example -->
                        <div class="card mb-3">
                          <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Table Example</div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      <thead>
                                        <tr>
                                          <th>Name</th>
                                          <th>Position</th>
                                          <th>Office</th>
                                          <th>Age</th>
                                          <th>Start date</th>
                                          <th>Salary</th>
                                        </tr>
                                      </thead>


                                          <tbody>
                                        <tr>
                                              <td>Tiger Nixon</td>
                                              <td>System Architect</td>
                                              <td>Edinburgh</td>
                                              <td>61</td>
                                              <td>2011/04/25</td>
                                              <td>$320,800</td>
                                            </tr>  

                                            <tr>
                                              <td>Tiger Nixon</td>
                                              <td>System Architect</td>
                                              <td>Edinburgh</td>
                                              <td>61</td>
                                              <td>2011/04/25</td>
                                              <td>$320,800</td>
                                            </tr> 
                                            </tbody>
                                        </table>
                                      </div>

                                </div>
                        </div>
                     </div>
            </div>
        </div>
            
    </body>
     <jsp:include page="../pages/footer_folder.html" />
</html>
