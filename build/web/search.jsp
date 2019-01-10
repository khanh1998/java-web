<%-- 
    Document   : search
    Created on : Dec 6, 2018, 3:27:21 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <script type="text/javascript">
            function changeTable(table) {
                if (table === 'all') {
                    document.getElementById('all-account-table').style = 'display: block;';
                    document.getElementById('admin-account-table').style = 'display: none;';
                    document.getElementById('subscriber-account-table').style = 'display: none;';
                } else if (table === 'admin') {
                    document.getElementById('admin-account-table').style = 'display: block;';
                    document.getElementById('all-account-table').style = 'display: none;';
                    document.getElementById('subscriber-account-table').style = 'display: none;';
                } else if (table === 'subscriber') {
                    document.getElementById('subscriber-account-table').style = 'display: block;';
                    document.getElementById('all-account-table').style = 'display: none;';
                    document.getElementById('admin-account-table').style = 'display: none;';
                }
            }
            
            function selectAll(checkbox) {
                if (checkbox.checked === true) {
                    let td = document.getElementsByClassName('userID');
                    for (let i = 0; i < td.length; i++) {
                        td[i].checked = true;
                    }
                }
                if (checkbox.checked === false) {
                    let td = document.getElementsByClassName('userID');
                    for (let i = 0; i < td.length; i++) {
                        td[i].checked = false;
                    }
                }
            }
        </script>

    </head>
    <body>
        <s:if test="#session.userId != null">
            <p style="color: blueviolet">Welcome <s:property value="#session.userId"/></p> | 
            <p style="color: tomato"><a href="logout">Log out</a></p>
            <s:if test="#session.role == 1">
                <p style="color: brown"><a href="signup">Register</a></p>
            </s:if>
            <h1>Search Account</h1>
            <form action="search">
                <input placeholder="Type search value into here" type="text" name="searchValue" value="" />
                <br>
                <input type="submit" value="Search" />
            </form>

            <s:set name="ADMIN" value="1"/>
            <s:set name="SUBSCRIBER" value="0"/>
            <s:if test="!resultList.isEmpty()">
                <s:if test="#session.role == #ADMIN">
                    <!--The role which has value is 1 is administration role-->
                    <s:a onclick="changeTable('all')" href="#">All(<s:property value="%{quantityOfAdmin+quantityOfSubs}"/>) | </s:a>
                    <s:a onclick="changeTable('admin')" href="#">Administration(<s:property value="quantityOfAdmin"/>) | </s:a>
                    <s:a onclick="changeTable('subscriber')" href="#">Subscriber(<s:property value="quantityOfSubs"/>)</s:a>
                        <!--show all account-->
                    <s:form action="changeRole" theme="simple" id="all-account-table" style="display: block;">
                            <select name="typeOfChange">
                                <option value="adminToSubs">administration to subscriber</option>
                                <option value="subsToAdmin">Subscriber to administration</option>
                            </select>
                            <input type="submit" value="Change"/>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>
                                            <input type="checkbox" onclick="selectAll(this)">
                                            Username
                                        </th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <s:iterator value="resultList" status="counter">
                                        <tr>
                                            <td><s:property value="#counter.count"/></td>
                                            <td>
                                                <s:property value="userID"/>
                                                <input type="checkbox" class="userID" name="userIDs" value="${userID}" />
                                            </td>
                                            <td><s:property value="firstName"/><s:property value="lastName"/></td>
                                            <td><s:property value="email"/></td>
                                            <td>
                                                <s:if test="role == 1">
                                                    Administration
                                                </s:if>
                                                <s:if test="role == 0">
                                                    Subscriber
                                                </s:if>
                                            </td>

                                        </tr>
                                    </s:iterator>


                                </tbody>
                            </table>
                    </s:form>
                    <!--show administration account-->
                    <s:form action="changeRole" theme="simple" id="admin-account-table" style="display: none;">
                        <select name="typeOfChange">
                            <option value="adminToSubs">administration to subscriber</option>
                        </select>
                        <input type="submit" value="Change"/>
                        <table border="1" >
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>

                                <s:iterator value="resultList" status="counter">
                                    <s:if test="role == 1">
                                        <tr>
                                            <td><s:property value="#counter.count"/></td>
                                            <td>
                                                <s:property value="userID"/>
                                                <input type="checkbox" name="userIDs" value="${userID}" />
                                            </td>
                                            <td><s:property value="firstName"/><s:property value="lastName"/></td>
                                            <td><s:property value="email"/></td>
                                            <td>
                                                Administration
                                            </td>
                                        </tr>
                                    </s:if>
                                </s:iterator>


                            </tbody>
                        </table>
                    </s:form>
                    <!--show subscribe account-->
                    <s:form action="changeRole" theme="simple" id="subscriber-account-table" style="display: none;">
                        <select name="typeOfChange">
                            <option value="subsToAdmin">Subscriber to administration</option>
                        </select>
                        <input type="submit" value="Change"/>
                        <table border="1" >
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>

                                <s:iterator value="resultList" status="counter">
                                    <s:if test="role == #SUBSCRIBER">
                                        <tr>
                                            <td><s:property value="#counter.count"/></td>
                                            <td>
                                                <s:property value="userID"/>
                                                <input type="checkbox" name="userIDs" value="${userID}" />
                                            </td>
                                            <td><s:property value="firstName"/><s:property value="lastName"/></td>
                                            <td><s:property value="email"/></td>
                                            <td>
                                                Subscriber
                                            </td>
                                        </tr>
                                    </s:if>
                                </s:iterator>
                            </tbody>
                        </table>
                    </s:form>
                </s:if>
                <s:else>
                    <!--The role which has value is 0 is subscribe role-->
                    <s:a href="">Your information</s:a>

                        <!--show subscribe account-->
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Username</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>
                            <s:iterator value="resultList" status="counter">
                                <s:if test="role == #SUBSCRIBER && userID == #session.userId">
                                    <tr>
                                        <td><s:property value="#counter.count"/></td>
                                        <td>
                                            <s:property value="userID"/>
                                        </td>
                                        <td><s:property value="firstName"/><s:property value="lastName"/></td>
                                        <td><s:property value="email"/></td>
                                        <td>
                                            Subscriber
                                        </td>
                                    </tr>
                                </s:if>
                            </s:iterator>
                        </tbody>
                    </table>
                </s:else>


            </s:if>
            <s:else>
                <p style="color: red">No account is match</p>
            </s:else>
        </s:if>

        <s:if test="#session.userId == null">
            <p style="color: red">You must log in to access this page</p>
            <a href="try">Log in</a>
        </s:if>
    </body>
</html>
