<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  --%>

<html>
<head>
    <jsp:include page="layout/_head.jsp"/>
</head>
<body>
<jsp:include page="layout/_header.jsp"/>

<div class="container-fluid">
    <h2>View Log File:
        <span class="path label label-primary">
            ${dir}/${logName}
        </span>
        <span class="path pull-right">
            [${host}]
        </span>
    </h2>
    <hr/>

    <div id="html-data">
        <c:choose>
            <c:when test="${summary!=null}">
                <div class="col-md-8 col-md-offset-2 alert alert-warning" role="alert">
                    <strong>Ooops!</strong> ${summary}
                </div>
            </c:when>
            <c:otherwise>
            <pre class="view-plain">${log}</pre>
            </c:otherwise>
        </c:choose>
    </div>
    <hr/>


    <ul class="pagination">
        <c:forEach var="page" items="${pages}">
            <li class="${page.status}">
                <a href="${page.url}">
                    <span>${page.text}</span>
                </a>
            </li>
        </c:forEach>
    </ul>

</div>

<jsp:include page="layout/_footer.jsp"/>
<script src="assets/js/hilitor.js"></script>
<script>
    var myHilitor; // global variable
    document.addEventListener("DOMContentLoaded", function () {
        myHilitor = new Hilitor("html-data");
        myHilitor.apply("error exception");
    }, false);
</script>
</body>
</html>