﻿<!-- #include file="..\..\..\..\c_option.asp" -->
<!-- #include file="..\..\..\..\..\zb_system\function\c_function.asp" -->
<!-- #include file="..\..\..\..\..\zb_system\function\c_system_lib.asp" -->
<!-- #include file="..\..\..\..\..\zb_system\function\c_system_base.asp" -->
<!-- #include file="..\..\..\..\..\zb_system\function\c_system_event.asp" -->
<!-- #include file="..\..\..\..\..\zb_system\function\c_system_plugin.asp" -->
<!-- #include file="..\..\..\p_config.asp" -->
<%
'得到当前的真实路径
Dim uEditor_ASPPath
uEditor_ASPPath=BlogPath

'自动生成文件名
Function RandomFileName(Ext)
	Dim m_strDate,m_lngTime,dtmNow
	dtmNow=Date
	m_strDate = Year(dtmNow)&Right("0"&Month(dtmNow),2)&Right("0"&Day(dtmNow),2)
	m_lngTime = Clng(Timer()*1000)
	m_lngTime=m_lngTime+1
	RandomFileName=m_strDate&Right("00000000"&m_lngTime,8)&"."&ext
End Function

Function Add_Upload(AuthorID,FileSize,FileName)
	dim SQLRs
	Set SQLRs=objConn.Execute("INSERT INTO `blog_UpLoad` ('ul_AuthorID','ul_FileSize','ul_FileName','ul_DirByTime') VALUES (AuthorID,FileSize,FileName,""-1"");")
	if not SQLRs.eof then
		CheckFields = SQLRs("fn_ID")
		else
		CheckFields = 0
	end if
	Set SQLRs = nothing
End Function
%>