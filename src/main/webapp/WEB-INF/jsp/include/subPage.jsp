<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="../js/jquery11.js"></script>
<script type="text/javascript">
	$(function() {
		//alert("ok");
		$("#subPage_searche_btn").click(
				function() {
					var value = $("#subPage_searche_txt").val();
					var p = /^[1-9][0-9]*$/;
					if (p.test(value)) {
						if (value > 0 && value <= parseInt("${pageInfo.pageCount}")) {
							$("#hidden_currentPage").val(value);
							$("#form_search").submit();
						} else {
							alert("页号不在有效范围内");
							$("#subPage_searche_txt").val("");
						}
					} else {
						alert("非法页号");
						$("#subPage_searche_txt").val("");
					}
				});
		
		$("#btn_search_first").click(function(){
			$("#hidden_currentPage").val("1");
			$("#form_search").submit();
		});
		$("#btn_search_pre").click(function(){
			$("#hidden_currentPage").val("${pageInfo.currentPage-1}");
			$("#form_search").submit();
		});
		
		$("#btn_search_next").click(function(){
			$("#hidden_currentPage").val("${pageInfo.currentPage+1}");
			$("#form_search").submit();
		});
		$("#btn_search_last").click(function(){
			$("#hidden_currentPage").val("${pageInfo.pageCount}");
			$("#form_search").submit();
		});

	});
</script>

<form id="form_search" method="post" action="${pageInfo.action}">
	<c:forEach items="${pageInfo.requestMap}" var="map">
		<input type="hidden" name="${map.key}" value="${map.value}">
	</c:forEach>
	<input type="hidden" id="hidden_currentPage" name="currentPage" value="1">
</form>

<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0" style="border-style: none; border-width: 0px;">
	<tr>
		<td height="6" style="border-width: 0px;"><img
			src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td height="33" style="border-width: 0px;"><table width="100%"
				border="0" align="center" cellpadding="0" cellspacing="0"
				class="right-font08">
				<tr>
					<td width="50%" style="border-width: 0px;">共 <span
						class="right-text09">${pageInfo.recordCount }</span> 条 |每页 <span
						class="right-text09">${pageInfo.pageSize }</span> 条 |共 <span
						class="right-text09">${pageInfo.pageCount }</span> 页 | 第 <span
						class="right-text09">${pageInfo.currentPage }</span> 页
					</td>
					<td width="49%" align="right" style="border-width: 0px;">[<a
						href="javascript:void(0)" class="right-font08"
						id="btn_search_first">首页</a> | <c:if
							test="${pageInfo.currentPage>1 }">
							<a
								href="javascript:void(0)" id="btn_search_pre"
								class="right-font08">上一页</a> |
                </c:if> <c:if
							test="${pageInfo.currentPage<pageInfo.pageCount }">
							<a
								href="javascript:void(0)" id="btn_search_next"
								class="right-font08">下一页</a> |
                </c:if> <a
						href="javascript:void(0)" id="btn_search_last"
						class="right-font08">末页</a>] 转至：
					</td>
					<td width="1%"><table width="20" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td width="1%"><input name="textfield3"
									id="subPage_searche_txt" type="text" class="right-textfield03"
									size="1" /></td>
								<td width="87%"><input name="Submit23222" type="button"
									id="subPage_searche_btn" class="right-button06" value=" " /></td>
							</tr>
						</table></td>
				</tr>
			</table></td>
	</tr>
</table>