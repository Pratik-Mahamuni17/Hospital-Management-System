<%@ page import="java.util.List"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor List</title>
    <%@include file="../component/allcss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background-color: #f4f7fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .paint-card {
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
        }

        .paint-card:hover {
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
        }

        .fs-3 {
            font-weight: 600;
            color: #0d6efd;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .table th {
            background-color: #e3f2fd;
            color: #0d6efd;
            vertical-align: middle;
        }

        .table td, .table th {
            text-align: center;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-sm {
            padding: 4px 10px;
            font-size: 14px;
        }

        .icon {
            margin-right: 5px;
        }

        .badge-number {
            background-color: #0d6efd;
            color: white;
            border-radius: 50%;
            padding: 6px 10px;
            font-size: 14px;
        }

        @media screen and (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container-fluid py-4">
        <div class="row justify-content-center">
            <div class="col-lg-11 col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center"><i class="fas fa-user-md"></i> Doctor Details</p>

                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">${errorMsg}</div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success text-center">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped align-middle">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Full Name</th>
                                        <th>DOB</th>
                                        <th>Qualification</th>
                                        <th>Specialist</th>
                                        <th>Email</th>
                                        <th>Mobile No</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                        List<Doctor> list2 = dao2.getAllDoctor();
                                        int i = 1;
                                        for (Doctor d : list2) {
                                    %>
                                    <tr>
                                        <td><span class="badge-number"><%=i%></span></td>
                                        <td><%=d.getFullName()%></td>
                                        <td><%=d.getDob()%></td>
                                        <td><%=d.getQualification()%></td>
                                        <td><%=d.getSpecialist()%></td>
                                        <td><%=d.getEmail()%></td>
                                        <td><%=d.getMobNo()%></td>
                                        <td>
                                            <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-outline-primary" title="Edit">
                                                <i class="fas fa-pen icon"></i>Edit
                                            </a>
                                            <a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-outline-danger" title="Delete"
                                               onclick="return confirm('Are you sure you want to delete this doctor?');">
                                                <i class="fas fa-trash icon"></i>Delete
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                            i++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
