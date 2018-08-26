<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Books</title>
    <%@ include file="common/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>Books' List</h2>
        </div>
        <form name="firstForm" action="<%= request.getContextPath()%>/books/search" method="post">
            <div class="panel-heading ">
                <table class="table table-bookName">
                    <thead>
                    <tr>
                        <th width="90" align="lift">Book Title:</th>
                        <th width="150" align="lift">
                            <input type="text" name="name" class="allInput" value="${ name }"
                                   placeholder="more than 10,000 books..."/>
                        </th>
                        <th>
                            <input type="submit" id="tabSub" value="Search"/>
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
        </form>

        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Title</th>
                    <th>Store Numbers</th>
                    <th>Detail</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ list }" var="sk">
                    <tr>
                        <td style="font-family: CamingoCode,serif">${ sk.bookId }</td>
                        <td style="font-family: CamingoCode,serif; font-weight: bold">${ sk.name }</td>
                        <td style="font-family: CamingoCode,serif">${ sk.number }</td>
                        <td>
                            <a class="btn btn-info" href="/books/${ sk.bookId }/detail"
                               target="_blank">
                                More Details
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>