[General]
SyntaxVersion=2
MacroID=98a18cc8-d3d8-4a70-89d5-95bda22e587a
[Comment]

[Script]

//源码来源：https://bbs.anjian.com/showtopic-702425-1.aspx

//请在下面写上您的子程序或函数
//写完保存后，在任一命令库上点击右键并选择“刷新”即可
Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function GetPrivateProfileSection Lib "kernel32" Alias "GetPrivateProfileSectionA" (ByVal lpApplicationName As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function GetPrivateProfileSectionNames Lib "kernel32" Alias "GetPrivateProfileSectionNamesA" (ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As String, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileSection Lib "kernel32" Alias "WritePrivateProfileSectionA" (ByVal lpApplicationName As String, ByVal lpString As String, ByVal lpFileName As String) As Long

/*Dim Section, Key, Value, FilePath
Section = "section"
Key = "key"
Value = "value"
FilePath = "D:\test.ini"
TracePrint "写入结果：" & WriteIni(Section, Key, Value, FilePath)
TracePrint "覆盖写入结果：" & OverwriteIni(Section, "key=123|abc=456", FilePath)
TracePrint "读取结果：" & ReadIni(Section, Key, FilePath)
TracePrint "枚举小节结果：" & EnumIniSection(FilePath)
TracePrint "枚举键结果：" & EnumIniKey(Section, FilePath)
TracePrint "枚举键和值结果：" & EnumIniKeyEx(Section, FilePath)
TracePrint "删除键结果：" & DeleteIni(Section, Key, FilePath)
TracePrint "删除所有键结果：" & DeleteIni(Section, "", FilePath)*/

Function ReadIni(Section, Key, FilePath) '从配置文件中获取指定小节指定键的值
	str = space(32767)
	Dim ret
	ret = GetPrivateProfileString(Section, Key, "", str, Len(str), FilePath)
	If ret = 0 Then
		ReadIni = ""
	Else
		ReadIni = Left(str, ret)
	End If
End Function

Function WriteIni(Section, Key, Value, FilePath) '向配置文件中指定小节写入键及其值
	WriteIni = WritePrivateProfileString(Section, Key, Value, FilePath)
End Function

Function OverwriteIni(Section, Key, FilePath) '向配置文件中指定小节覆盖写入键及其值
	Key = Replace(Key, "|", Chr(0))
	Key = Key & Chr(0)
	OverwriteIni = WritePrivateProfileSection(Section, Key, FilePath)
End Function

Function EnumIniSection(FilePath) '从配置文件中获取所有小节
	str = space(32767)
	Dim ret
	ret = GetPrivateProfileSectionNames(str, Len(str), FilePath)
	If ret = 0 Then
		EnumIniSection = ""
	Else
		str = Replace(Left(str, InStr(str, Chr(0) & Chr(0))), Chr(0), "|")
		EnumIniSection = Left(str, Len(str) - 1)
	End If
End Function

Function EnumIniKey(Section, FilePath) '从配置文件中获取指定小节所有键
	str = space(32767)
	Dim ret
	ret = GetPrivateProfileString(Section, vbNullString, "", str, Len(str), FilePath)
	If ret = 0 Then
		EnumIniKey = ""
	Else
		str = Replace(Left(str, InStr(str, Chr(0) & Chr(0))), Chr(0), "|")
		EnumIniKey = Left(str, Len(str) - 1)
	End If
End Function

Function EnumIniKeyEx(Section, FilePath) '从配置文件中获取指定小节所有键及其值
	str = space(32767)
	Dim ret
	ret = GetPrivateProfileSection(Section, str, Len(str), FilePath)
	If ret = 0 Then
		EnumIniKeyEx = ""
	Else
		str = Replace(Left(str, InStr(str, Chr(0) & Chr(0))), Chr(0), "|")
		EnumIniKeyEx = Left(str, Len(str) - 1)
	End If
End Function

Function DeleteIni(Section, Key, FilePath) '从配置文件中删除指定小节的键及其值
	If Key = "" Then
		DeleteIni = WritePrivateProfileString(Section, vbNullString, vbNullString, FilePath)
	Else
		DeleteIni = WritePrivateProfileString(Section, Key, vbNullString, FilePath)
	End If
End Function