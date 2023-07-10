<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@include file="./header.jsp" %>
 <!-- 게시판 -->
 <div id="page-wrapper">
${pageDto }
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header"></h1>
         </div>
         <!-- /.col-lg-12 -->
     </div>
     <!-- /.row -->
     <div class="row">
         <div class="col-lg-12">
             <div class="panel panel-default">
                 <div class="panel-heading">
                    		도서목록
                 </div>
                 <!-- 검색폼 -->

                 <form method="get" action="/book/list">
                 <input type="hidden" value="${pageNo }" name="pageNo">
                    <div class="form-inline text-center">
                    <p></p>
		            <div class="form-group">
		                <select class="form-control" name='searchField'>
		                    <option value='title' ${pageDto.cri.searchField=='title'?'selected':'' }>title</option>
		                    <option value='author' ${pageDto.cri.searchField=='author'?'selected':'' }>author</option>
		                </select>
		            </div>
		
		            <div class="form-group">
		                <input class="form-control" name='searchWord' value="${pageDto.cri.searchWord }">
		            </div>
		              <button type="submit" class="btn btn-default">검색</button>
		            </div>
                 </form>
					

                     <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                         <thead>
                             <tr>
                                 <th> </th>
                                 <th>도서번호</th>
                                 <th>제목</th>
                                 <th>작가</th>
                                 <th>대여여부</th>
                                 <th>조회수</th>
                             </tr>
                         </thead>
                         <tbody>
                             <c:forEach items="${list }" var="vo">
                             <tr class="odd gradeX">
                         		<td class="center">
									<input type="checkbox" name="delNo" value="${vo.no }">
								</td>
                                 <td>${vo.no }</td>
                                 <td><a href="/book/view?no=${vo.no }">${vo.title }</a></td>
                                 <td>${vo.author }</td>
                                 <td>${vo.rentynStr }</td>
                                 <td>${vo.visitcount }</td>
                             </tr>
                             </c:forEach>
                         </tbody>
                     </table>
                     <div class='text-center'>
                     <%@include file="pageNavi.jsp" %></div>

                 </div>
                 <!-- /.panel-body -->
             </div>
             <!-- /.panel -->
         </div>
         <!-- /.col-lg-12 -->
     </div>
     
     
 </div>
 <!-- 게시판 끝-->
 <!-- /#page-wrapper -->
<%@include file="./footer.jsp" %>
    
   