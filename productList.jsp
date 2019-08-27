<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/productList.css">
<link rel="stylesheet" href="./css/message.css">
<link rel="stylesheet" href="./css/title.css">
<link rel="stylesheet" href="./css/header.css">
<title>商品一覧</title>
</head>

<body>
	<jsp:include page="header.jsp" />

	<div id="contents">
		<h1>商品一覧画面</h1>
		<!-- 検索エラーメッセージの表示 -->
		<s:if
			test="keywordsErrorMessage!=null && keywordsErrorMessage.size()>0">
			<div class="errorMessage">
				<s:iterator value="keywordsErrorMessage">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</s:if>
		<!-- 商品一覧の表示 -->
		<s:elseif
			test="productInfoDTOList!=null && productInfoDTOList.size()>0">
			<table class="productList">
				<s:iterator value="productInfoDTOList" status="st">
					<!-- 	１行3商品ずつ表示させたい。以下のように書くと早い。 -->
					<!-- indexは現在のループのインデックス番号（ゼロから開始） -->
					<s:if test="#st.index%3 == 0"><tr></s:if>
						<td>
							<a href='<s:url action="ProductDetailsAction">
								<s:param name="productId" value="%{productId}"/></s:url>'>
								<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'class="image-file-200" />
								<br>
								<s:property value="productName" /><br> <s:property value="productNameKana" /><br> <s:property value="price" />円
							</a>
						</td>
					<s:if test="#st.index%3 == 2"></tr></s:if>
				</s:iterator>
			</table>
		</s:elseif>
		<s:else>
			<div class="info">検索結果がありません。</div>
		</s:else>
	</div>

</body>
</html>