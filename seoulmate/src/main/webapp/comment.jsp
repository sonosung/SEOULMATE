<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="seoulmate.boardcomment.CommentDTO"%>
<%@ page import="java.util.List"%>

<%
List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("commentList");
%>

<div class="container">
   <div class="row">
      <% if (commentList != null && !commentList.isEmpty()) { %>
         <% for (CommentDTO comment : commentList) { %>
            <div class="col-lg-12">
               <div class="media mb-4">
                  <div class="media-body">
                     <h5 class="mt-0"><%= comment.getWriter() %></h5>
                     <p><%= comment.getContent() %></p>
                     <p><%= comment.getCreatedAt() %></p>
                  </div>
               </div>
            </div>
         <% } %>
      <% } else { %>
         <div class="col-lg-12">
            <p>댓글이 없습니다.</p>
         </div>
      <% } %>
   </div>
</div>
